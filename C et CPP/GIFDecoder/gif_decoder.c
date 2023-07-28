// gif decoder
// https://commandlinefanatic.com/cgi-bin/showarticle.cgi?article=art011

#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>

#define EXTENSION_INTRODUCER 0x21
#define IMAGE_DESCRIPTOR 0x2C
#define TRAILER 0x3B

#define GRAPHIC_CONTROL 0xF9
#define APPLICATION_EXTENSION 0xFF
#define COMMENT_EXTENSION 0xFE
#define PLAINTEXT_EXTENSION 0x01

typedef struct
{
    unsigned short width;
    unsigned short height;
    unsigned char fields;
    unsigned char background_color_index;
    unsigned char pixel_aspect_ratio;
} screen_descriptor_t;

typedef struct
{
    unsigned char r;
    unsigned char g;
    unsigned char b;
} rgb;

typedef struct
{
    unsigned short image_left_position;
    unsigned short image_top_position;
    unsigned short image_width;
    unsigned short image_height;
    unsigned char fields;
} image_descriptor_t;

typedef struct
{
    unsigned char byte;
    int prev;
    int len;
} dictionary_entry_t;

typedef struct
{
    unsigned char extension_code;
    unsigned char block_size;
} extension_t;

typedef struct
{
    unsigned char fields;
    unsigned short delay_time;
    unsigned char transparent_color_index;
} graphic_control_extension_t;

typedef struct
{
    unsigned char application_id[8];
    unsigned char version[3];
} application_extension_t;

typedef struct
{
    unsigned short left;
    unsigned short top;
    unsigned short width;
    unsigned short height;
    unsigned char cell_width;
    unsigned char cell_height;
    unsigned char foreground_color;
    unsigned char background_color;
} plaintext_extension_t;

int uncompress(int code_length,
               const unsigned char *input,
               int input_length,
               unsigned char *out)
{
    int maxbits;
    int i, bit;
    int code, prev = -1;
    dictionary_entry_t *dictionary;
    int dictionary_ind;
    unsigned int mask = 0x01;
    int reset_code_length;
    int clear_code; // This varies depending on code_length
    int stop_code;  // one more than clear code
    int match_len;

    clear_code = 1 << (code_length);
    stop_code = clear_code + 1;
    // To handle clear codes
    reset_code_length = code_length;

    // Create a dictionary large enough to hold "code_length" entries.
    // Once the dictionary overflows, code_length increases
    dictionary = (dictionary_entry_t *)
        malloc(sizeof(dictionary_entry_t) * (1 << (code_length + 1)));

    // Initialize the first 2^code_len entries of the dictionary with their
    // indices.  The rest of the entries will be built up dynamically.

    // Technically, it shouldn't be necessary to initialize the
    // dictionary.  The spec says that the encoder "should output a
    // clear code as the first code in the image data stream".  It doesn't
    // say must, though...
    for (dictionary_ind = 0;
         dictionary_ind < (1 << code_length);
         dictionary_ind++)
    {
        dictionary[dictionary_ind].byte = dictionary_ind;
        // XXX this only works because prev is a 32-bit int (> 12 bits)
        dictionary[dictionary_ind].prev = -1;
        dictionary[dictionary_ind].len = 1;
    }

    // 2^code_len + 1 is the special "end" code; don't give it an entry here
    dictionary_ind++;
    dictionary_ind++;

    // TODO verify that the very last byte is clear_code + 1
    while (input_length)
    {
        code = 0x0;
        // Always read one more bit than the code length
        for (i = 0; i < (code_length + 1); i++)
        {
            // This is different than in the file read example; that
            // was a call to "next_bit"
            bit = (*input & mask) ? 1 : 0;
            mask <<= 1;

            if (mask == 0x100)
            {
                mask = 0x01;
                input++;
                input_length--;
            }

            code = code | (bit << i);
        }

        if (code == clear_code)
        {
            code_length = reset_code_length;
            dictionary = (dictionary_entry_t *)realloc(dictionary,
                                                       sizeof(dictionary_entry_t) * (1 << (code_length + 1)));

            for (dictionary_ind = 0;
                 dictionary_ind < (1 << code_length);
                 dictionary_ind++)
            {
                dictionary[dictionary_ind].byte = dictionary_ind;
                // XXX this only works because prev is a 32-bit int (> 12 bits)
                dictionary[dictionary_ind].prev = -1;
                dictionary[dictionary_ind].len = 1;
            }
            dictionary_ind++;
            dictionary_ind++;
            prev = -1;
            continue;
        }
        else if (code == stop_code)
        {
            if (input_length > 1)
            {
                fprintf(stderr, "Malformed GIF (early stop code)\n");
                exit(0);
            }
            break;
        }

        // Update the dictionary with this character plus the _entry_
        // (character or string) that came before it
        if ((prev > -1) && (code_length < 12))
        {
            if (code > dictionary_ind)
            {
                fprintf(stderr, "code = %.02x, but dictionary_ind = %.02x\n",
                        code, dictionary_ind);
                exit(0);
            }

            // Special handling for KwKwK
            if (code == dictionary_ind)
            {
                int ptr = prev;

                while (dictionary[ptr].prev != -1)
                {
                    ptr = dictionary[ptr].prev;
                }
                dictionary[dictionary_ind].byte = dictionary[ptr].byte;
            }
            else
            {
                int ptr = code;
                while (dictionary[ptr].prev != -1)
                {
                    ptr = dictionary[ptr].prev;
                }
                dictionary[dictionary_ind].byte = dictionary[ptr].byte;
            }

            dictionary[dictionary_ind].prev = prev;

            dictionary[dictionary_ind].len = dictionary[prev].len + 1;

            dictionary_ind++;

            // GIF89a mandates that this stops at 12 bits
            if ((dictionary_ind == (1 << (code_length + 1))) &&
                (code_length < 11))
            {
                code_length++;

                dictionary = (dictionary_entry_t *)realloc(dictionary,
                                                           sizeof(dictionary_entry_t) * (1 << (code_length + 1)));
            }
        }

        prev = code;

        // Now copy the dictionary entry backwards into "out"
        match_len = dictionary[code].len;
        while (code != -1)
        {
            out[dictionary[code].len - 1] = dictionary[code].byte;
            if (dictionary[code].prev == code)
            {
                fprintf(stderr, "Internal error; self-reference.");
                exit(0);
            }
            code = dictionary[code].prev;
        }

        out += match_len;
    }
}

static int read_sub_blocks(int gif_file, unsigned char **data)
{
    int data_length;
    int index;
    unsigned char block_size;

    // Everything following are data sub-blocks, until a 0-sized block is
    // encountered.
    data_length = 0;
    *data = NULL;
    index = 0;

    while (1)
    {
        if (read(gif_file, &block_size, 1) < 1)
        {
            perror("Invalid GIF file (too short): ");
            return -1;
        }

        if (block_size == 0) // end of sub-blocks
        {
            break;
        }

        data_length += block_size;
        *data = realloc(*data, data_length);

        // TODO this could be split across block size boundaries
        if (read(gif_file, *data + index, block_size) <
            block_size)
        {
            perror("Invalid GIF file (too short): ");
            return -1;
        }

        index += block_size;
    }

    return data_length;
}

static int process_image_descriptor(int gif_file,
                                    rgb *gct,
                                    int gct_size,
                                    int resolution_bits)
{
    image_descriptor_t image_descriptor;
    int disposition;
    int compressed_data_length;
    unsigned char *compressed_data = NULL;
    unsigned char lzw_code_size;
    int uncompressed_data_length = 0;
    unsigned char *uncompressed_data = NULL;

    // TODO there could actually be lots of these
    if (read(gif_file, &image_descriptor, 9) < 9)
    {
        perror("Invalid GIF file (too short)");
        disposition = 0;
        goto done;
    }

    // TODO if LCT = true, read the LCT

    disposition = 1;

    if (read(gif_file, &lzw_code_size, 1) < 1)
    {
        perror("Invalid GIF file (too short): ");
        disposition = 0;
        goto done;
    }

    compressed_data_length = read_sub_blocks(gif_file, &compressed_data);

    uncompressed_data_length = image_descriptor.image_width *
                               image_descriptor.image_height;
    uncompressed_data = malloc(uncompressed_data_length);

    uncompress(lzw_code_size, compressed_data, compressed_data_length,
               uncompressed_data);

done:
    if (compressed_data)
        free(compressed_data);

    if (uncompressed_data)
        free(uncompressed_data);

    return disposition;
}

static int process_extension(int gif_file)
{
    extension_t extension;
    graphic_control_extension_t gce;
    application_extension_t application;
    plaintext_extension_t plaintext;
    unsigned char *extension_data = NULL;
    int extension_data_length;

    if (read(gif_file, &extension, 2) < 2)
    {
        perror("Invalid GIF file (too short): ");
        return 0;
    }

    switch (extension.extension_code)
    {
    case GRAPHIC_CONTROL:
        if (read(gif_file, &gce, 4) < 4)
        {
            perror("Invalid GIF file (too short): ");
            return 0;
        }

        break;
    case APPLICATION_EXTENSION:
        if (read(gif_file, &application, 11) < 11)
        {
            perror("Invalid GIF file (too short): ");
            return 0;
        }
        break;
    case 0xFE:
        // comment extension; do nothing - all the data is in the
        // sub-blocks that follow.
        break;
    case 0x01:
        if (read(gif_file, &plaintext, 12) < 12)
        {
            perror("Invalid GIF file (too short): ");
            return 0;
        }
        break;
    default:
        fprintf(stderr, "Unrecognized extension code.\n");
        exit(0);
    }

    // All extensions are followed by data sub-blocks; even if it's
    // just a single data sub-block of length 0
    extension_data_length = read_sub_blocks(gif_file, &extension_data);

    if (extension_data != NULL)
        free(extension_data);

    return 1;
}

/**
 * @param gif_file the file descriptor of a file containing a
 *  GIF-encoded file.  This should point to the first byte in
 *  the file when invoked.
 */
static void process_gif_stream(int gif_file)
{
    unsigned char header[7];
    screen_descriptor_t screen_descriptor;
    int color_resolution_bits;

    int global_color_table_size; // number of entries in global_color_table
    rgb *global_color_table;

    unsigned char block_type = 0x0;

    // A GIF file starts with a Header (section 17)
    if (read(gif_file, header, 6) != 6)
    {
        perror("Invalid GIF file (too short)");
        return;
    }
    header[6] = 0x0;

    // XXX there's another format, GIF87a, that you may still find
    // floating around.
    if (strcmp("GIF89a", header))
    {
        fprintf(stderr,
                "Invalid GIF file (header is '%s', should be 'GIF89a')\n",
                header);
        return;
    }

    // Followed by a logical screen descriptor
    // Note that this works because GIFs specify little-endian order; on a
    // big-endian machine, the height & width would need to be reversed.

    // Can't use sizeof here since GCC does byte alignment;
    // sizeof( screen_descriptor_t ) = 8!
    if (read(gif_file, &screen_descriptor, 7) < 7)
    {
        perror("Invalid GIF file (too short)");
        return;
    }

    color_resolution_bits = ((screen_descriptor.fields & 0x70) >> 4) + 1;

    if (screen_descriptor.fields & 0x80)
    {
        int i;
        // If bit 7 is set, the next block is a global color table; read it
        global_color_table_size = 1 << (((screen_descriptor.fields & 0x07) + 1));

        global_color_table = (rgb *)malloc(3 * global_color_table_size);

        // XXX this could conceivably return a short count...
        if (read(gif_file, global_color_table, 3 * global_color_table_size) <
            3 * global_color_table_size)
        {
            perror("Unable to read global color table");
            return;
        }
    }

    while (block_type != TRAILER)
    {
        if (read(gif_file, &block_type, 1) < 1)
        {
            perror("Invalid GIF file (too short)");
            return;
        }

        switch (block_type)
        {
        case IMAGE_DESCRIPTOR:
            if (!process_image_descriptor(gif_file,
                                          global_color_table,
                                          global_color_table_size,
                                          color_resolution_bits))
            {
                return;
            }
            break;
        case EXTENSION_INTRODUCER:
            if (!process_extension(gif_file))
            {
                return;
            }
            break;
        case TRAILER:
            break;
        default:
            fprintf(stderr, "Bailing on unrecognized block type %.02x\n",
                    block_type);
            return;
        }
    }
}

int main(int argc, char *argv[])
{
    int gif_file;

    if (argc < 2)
    {
        fprintf(stderr, "Usage: %s <path-to-gif-file>\n", argv[0]);
        exit(0);
    }

    gif_file = open(argv[1], O_RDONLY);

    if (gif_file == -1)
    {
        fprintf(stderr, "Unable to open file '%s'", argv[1]);
        perror(": ");
    }

    process_gif_stream(gif_file);

    close(gif_file);
}
