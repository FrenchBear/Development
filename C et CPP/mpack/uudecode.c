/* (C) Copyright 1993 by John G. Myers
 * All Rights Reserved.
 *
 * Permission to use, copy, modify, distribute, and sell this software
 * and its documentation for any purpose is hereby granted without
 * fee, provided that the above copyright notice appear in all copies
 * and that both that copyright notice and this permission notice
 * appear in supporting documentation, and that the name of John G.
 * Myers not be used in advertising or publicity pertaining to
 * distribution of the software without specific, written prior
 * permission.  John G. Myers makes no representations about the
 * suitability of this software for any purpose.  It is provided "as
 * is" without express or implied warranty.
 *
 * JOHN G. MYERS DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS
 * SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
 * FITNESS, IN NO EVENT SHALL JOHN G. MYERS BE LIABLE FOR ANY SPECIAL,
 * INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER
 * RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION
 * OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR
 * IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */
#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include "xmalloc.h"
#include "common.h"

extern char *os_idtodir();
extern FILE *os_newtypedfile();

/*
 * Read an input file, looking for data in split-uuencode format
 */
handleUuencode(infile, subject)
FILE *infile;
char *subject;
{
    char *fname;
    int part = 0, nparts = 0;
    char buf[1024];
    char *p;

    if (parseSubject(subject, &fname, &part, &nparts) == 0) {
	return saveUuFile(infile, fname, part, nparts, (char *)0);
    }

    /* Scan for something that looks like the start of uuencoded data */
    while (fgets(buf, sizeof(buf), infile)) {
	if (!strncmp(buf, "begin ", 6) &&
	    isdigit(buf[6]) && isdigit(buf[7]) && isdigit(buf[8]) &&
	    buf[9] == ' ') {
	    /* Possible single-part uuencoded file */
	    return saveUuFile(infile, (char *)0, 1, 0, buf);
	}
	if (!strncmp(buf, "section ", 8) &&
	    isdigit(buf[8])) {
	    /* Might be "section N of ... of file F ..." */
	    part = 0;
	    for (p = buf+8; isdigit(*p); p++) part = part*10 + *p - '0';
	    if (strncmp(p, " of ", 4) != 0) continue;
	    for (p += 4; *p && strncmp(p, " of file ", 9) != 0; p++);
	    if (!*p) continue;
	    p += 9;
	    fname = p;
	    p = strchr(p, ' ');
	    if (!p) continue;
	    *p = '\0';
	    return saveUuFile(infile, fname, part, 0, (char *)0);
	}
	if (!strcmp(buf, "(This file must be converted with BinHex 4.0)\n")) {
	    return os_binhex(infile, 1, 1);
	}
    }	

    return 0;
}

/*
 * Handle a split-uuencode part
 * If nparts is 0, then look for an "end" line to detect the last part.
 * If fname is null, then we are attempting to decode a single-part message.
 * If firstline is non-null, it is written as the first line of the saved part
 */
int
saveUuFile(infile, fname, part, nparts, firstline)
FILE *infile;
char *fname;
int part;
int nparts;
char *firstline;
{
    char buf[1024];
    char *dir;
    FILE *partfile;

    if (fname) {
	sprintf(buf, "Saving %s part %d", fname, part);
	if (nparts) sprintf(buf+strlen(buf), " of %d", nparts);
	chat(buf);
    }
    else fname = "unknown";

    /* Create directory to store parts and copy this part there. */
    dir = os_idtodir(fname);
    if (!dir) return 1;
    sprintf(buf, "%s%d", dir, part);
    partfile = fopen(buf, "w");
        if (!partfile) {
	os_perror(buf);
	return 1;
    }
    if (firstline) fputs(firstline, partfile);
    while (fgets(buf, sizeof(buf), infile)) {
	fputs(buf, partfile);
	if (nparts == 0 && strcmp(buf, "end\n") == 0) {
	    /* This is the last part. Remember the fact */
	    nparts = part;
	    fclose(partfile);
	    sprintf(buf, "%sCT", dir);
	    partfile = fopen(buf, "w");
	    if (!partfile) {
		os_perror(buf);
	    }
	    else {
		fprintf(partfile, "%d\n", nparts);
	    }
	    break;
	}
    }
    fclose(partfile);

    /* Retrieve any previously saved number of the last part */
    if (nparts == 0) {
	sprintf(buf, "%sCT", dir);
	if (partfile = fopen(buf, "r")) {
	    if (fgets(buf, sizeof(buf), partfile)) {
		nparts = atoi(buf);
		if (nparts < 0) nparts = 0;
	    }
	    fclose(partfile);
	}
    }

    if (nparts == 0) return 0;

    /* Check to see if we have all parts.  Start from the highest numbers
     * as we are more likely not to have them.
     */
    for (part = nparts; part; part--) {
	sprintf(buf, "%s%d", dir, part);
	partfile = fopen(buf, "r");
	if (partfile) {
	    fclose(partfile);
	}
	else {
	    return 0;
	}
    }

    return uudecodefiles(dir, nparts);
}

/*
 * Parse a Subject: header, looking for clues with which to decode
 * split-uuencoded data.
 */
int
parseSubject(subject, fnamep, partp, npartsp)
char *subject;
char **fnamep;
int *partp;
int *npartsp;
{
    char *scan, *bak;
    int part = 0, nparts = 0;

    /* No subject header */
    if (!subject) return 1;

    /* Skip leading whitespace and other garbage */
    scan = subject;
    while (isspace(*scan) || *scan == '-') scan++;
    if (!cistrncmp(scan, "repost", 6)) {
	for (scan += 6; isspace(*scan) || *scan == ':' || *scan == '-'; scan++);
    }

    /* Replies aren't usually data */
    if (!cistrncmp(scan, "re:", 3)) return 1;

    /* Get filename */
    *fnamep = scan;
    while (isalnum(*scan) || *scan == '-' || *scan == '+' || *scan == '&'
	   || *scan == '_' || *scan == '.') scan++;
    if (*fnamep == scan || !*scan) return 1;
    *scan++ = '\0';

    /* Get part number */
    while (*scan) {
	/* look for "1/6" or "1 / 6" or "1 of 6" or "1o6" */
	if (isdigit(*scan) &&
	    (scan[1] == '/'
	     || (scan[1] == ' ' && scan[2] == '/')
	     || (scan[1] == ' ' && scan[2] == 'o' && scan[3] == 'f')
	     || (scan[1] == '-' && scan[2] == 'o' && scan[3] == 'f')
	     || (scan[1] == 'o' && isdigit(scan[2])))) {
	    while (isdigit(scan[-1])) scan--;
	    part = 0;
	    while (isdigit(*scan)) {
		part = part * 10 + *scan++ - '0';
	    }
	    while (scan != '\0' && !isdigit(*scan)) scan++;
	    if (isdigit(*scan)) {
		nparts = 0;
		while (isdigit(*scan)) {
		    nparts = nparts * 10 + *scan++ - '0';
		}
	    }
	    break;
	}

	/* look for "6 parts" or "part 1" */
	if (!cistrncmp("part", scan, 4)) {
	    if (scan[4] == 's') {
		for (bak = scan; bak >= subject && !isdigit(*bak); bak--);
		if (bak > subject) {
		    while (bak > subject && isdigit(bak[-1])) bak--;
		    nparts = 0;
		    while (isdigit(*bak)) {
			nparts = nparts * 10 + *bak++ - '0';
		    }
		}
	    } else {
		while (*scan != '\0' && !isdigit(*scan)) scan++;
		part = 0;
		while (isdigit(*scan)) {
		    part = part * 10 + *scan++ - '0';
		}
		scan -= 2;
	    }
	}
	scan++;
    }

    if (nparts == 0 || part == 0 || part > nparts) return 1;
    *partp = part;
    *npartsp = nparts;
    return 0;
}

/* Length of a normal uuencoded line, including newline */
#define UULENGTH 62

/*
 * Decode the uuencoded file that is in 'nparts' pieces in 'dir'.
 */
int
uudecodefiles(dir, nparts)
char *dir;
int nparts;
{
    int part;
    enum {st_start, st_desc, st_inactive, st_decode, st_nextlast, st_last,
	    st_binhex} state;
    FILE *infile;
    FILE *outfile;
    char buf[1024];
    char lastline[UULENGTH+1];
    char *fname, *p;
    char *contentType = "application/octet-stream";
    int line_length = 0;

    /* Create description filename */
    outfile = fopen(TEMPFILENAME, "w");
    state = outfile ? st_desc : st_start;

    /* Handle each part in order */
    for (part = 1; part <= nparts; part++) {
	sprintf(buf, "%s%d", dir, part);
	infile = fopen(buf, "r");
	if (!infile) {
	    os_perror(buf);
	    if (outfile) fclose(outfile);
	    remove(TEMPFILENAME);
	    return 1;
	}

	while (fgets(buf, sizeof(buf), infile)) {
	    switch (state) {
	    case st_desc:	/* Copying description text */
		if (!strncmp(buf, "---", 3) ||
		    !strncmp(buf, "#!", 2) ||
		    !cistrncmp(buf, "part=", 5) ||
		    !cistrncmp(buf, "begin", 5)) {
		    fclose(outfile);
		    outfile = 0;
		    state = st_start;
		}
		else {
		    fputs(buf, outfile);
		    break;
		}
		/* FALL THROUGH */

	    case st_start:	/* Looking for start of uuencoded
				 *  or binhex'ed file */
		if (!strcmp(buf,
			"(This file must be converted with BinHex 4.0)\n")) {
		    state = st_binhex;
		    os_binhex(infile, part, nparts);
		    goto endbinhex;
		}
		if (strncmp(buf, "begin ", 6)) break;
		/* skip mode */
		p = buf + 6;
		while (*p && !isspace(*p)) p++;
		while (*p && isspace(*p)) p++;
		fname = p;
		while (*p && !isspace(*p)) p++;
		*p = '\0';
		if (!*fname) return 1;

		/* Guess the content-type of common filename extensions */
		if (strlen(fname) > 4) {
		    p = fname + strlen(fname)-4;
		    if (!cistrcmp(p, ".gif")) contentType = "image/gif";
		    if (!cistrcmp(p, ".jpg")) contentType = "image/jpeg";
		    if (!cistrcmp(p, ".jpeg")) contentType = "image/jpeg";
		    if (!cistrcmp(p, ".mpg")) contentType = "video/mpeg";
		    if (!cistrcmp(p, ".mpeg")) contentType = "video/mpeg";
		}

		/* Create output file and start decoding */
		outfile = os_newtypedfile(fname, contentType, FILE_BINARY);
		if (!outfile) {
		    fclose(infile);
		    return 1;
		}
		state = st_decode;
		break;

	    case st_inactive:	/* Looking for uuencoded data to resume */
		if (*buf != 'M' || strlen(buf) != line_length) break;
		state = st_decode;
		/* FALL THROUGH */
	    case st_decode:	/* Decoding data */
		if (line_length == 0) line_length = strlen(buf);
		if (*buf == 'M' && strlen(buf) == line_length) {
		    uudecodeline(buf, outfile);
		    break;
		}
		if (strlen(buf) > line_length) {
		    state = st_inactive;
		    break;
		}
		/*
		 * May be on nearing end of file.
		 * Save this line in case we are.
		 */
		strcpy(lastline, buf);
		if (*buf == ' ' || *buf == '`') {
		    state = st_last;
		}
		else {
		    state = st_nextlast;
		}
		break;

	    case st_nextlast:	/* May be nearing end of file */
		if (*buf == ' ' || *buf == '`') {
		    state = st_last;
		}
		else {
		    state = st_inactive;
		}
		break;

	    case st_last:	/* Should be at end of file */
		if (!strcmp(buf, "end\n")) {
		    /* Handle that last line we saved */
		    uudecodeline(lastline, outfile);
		    fclose(infile);
		    os_closetypedfile(outfile);
		    for (;part <= nparts; part++) {
			sprintf(buf, "%s%d", dir, part);
			remove(buf);
		    }
		    os_donewithdir(dir);
		    return 0;
		}
		state = st_inactive;
		break;

	    case st_binhex:
		if (strncmp(buf, "---", 3)) break;
		os_binhex(infile, part, nparts);
		goto endbinhex;
	    }
	}
	if (state != st_binhex) state = st_inactive;
    endbinhex:
	fclose(infile);
	sprintf(buf, "%s%d", dir, part);
	remove(buf);
    }
    if (outfile) os_closetypedfile(outfile);
    if (state == st_binhex) os_binhex(0, 0, 0);
    sprintf(buf, "%sCT", dir);
    remove(buf);
    os_donewithdir(dir);
    return 0;
}

#define DEC(c)	(((c) - ' ') & 077)

/*
 * Decode a uuencoded line to 'outfile'
 */
uudecodeline(line, outfile)
char *line;
FILE *outfile;
{
    int c, len;

    len = DEC(*line++);
    while (len) {
	c = DEC(*line) << 2 | DEC(line[1]) >> 4;
	putc(c, outfile);
	if (--len) {
	    c = DEC(line[1]) << 4 | DEC(line[2]) >> 2;
	    putc(c, outfile);
	    if (--len) {
		c = DEC(line[2]) << 6 | DEC(line[3]);
		putc(c, outfile);
		len--;
	    }
	}
	line += 4;
    }
    return;
}

    
