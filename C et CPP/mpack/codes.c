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
/*
Copyright (c) 1991 Bell Communications Research, Inc. (Bellcore)

Permission to use, copy, modify, and distribute this material 
for any purpose and without fee is hereby granted, provided 
that the above copyright notice and this permission notice 
appear in all copies, and that the name of Bellcore not be 
used in advertising or publicity pertaining to this 
material without the specific, prior written permission 
of an authorized representative of Bellcore.  BELLCORE 
MAKES NO REPRESENTATIONS ABOUT THE ACCURACY OR SUITABILITY 
OF THIS MATERIAL FOR ANY PURPOSE.  IT IS PROVIDED "AS IS", 
WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
*/
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include "xmalloc.h"
#include "md5.h"

static char basis_64[] =
   "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

static char index_64[128] = {
    -1,-1,-1,-1, -1,-1,-1,-1, -1,-1,-1,-1, -1,-1,-1,-1,
    -1,-1,-1,-1, -1,-1,-1,-1, -1,-1,-1,-1, -1,-1,-1,-1,
    -1,-1,-1,-1, -1,-1,-1,-1, -1,-1,-1,62, -1,-1,-1,63,
    52,53,54,55, 56,57,58,59, 60,61,-1,-1, -1,-1,-1,-1,
    -1, 0, 1, 2,  3, 4, 5, 6,  7, 8, 9,10, 11,12,13,14,
    15,16,17,18, 19,20,21,22, 23,24,25,-1, -1,-1,-1,-1,
    -1,26,27,28, 29,30,31,32, 33,34,35,36, 37,38,39,40,
    41,42,43,44, 45,46,47,48, 49,50,51,-1, -1,-1,-1,-1
};

#define char64(c)  (((c) < 0 || (c) > 127) ? -1 : index_64[(c)])

static char index_hex[128] = {
    -1,-1,-1,-1, -1,-1,-1,-1, -1,-1,-1,-1, -1,-1,-1,-1,
    -1,-1,-1,-1, -1,-1,-1,-1, -1,-1,-1,-1, -1,-1,-1,-1,
    -1,-1,-1,-1, -1,-1,-1,-1, -1,-1,-1,-1, -1,-1,-1,-1,
     0, 1, 2, 3,  4, 5, 6, 7,  8, 9,-1,-1, -1,-1,-1,-1,
    -1,10,11,12, 13,14,15,-1, -1,-1,-1,-1, -1,-1,-1,-1,
    -1,-1,-1,-1, -1,-1,-1,-1, -1,-1,-1,-1, -1,-1,-1,-1,
    -1,10,11,12, 13,14,15,-1, -1,-1,-1,-1, -1,-1,-1,-1,
    -1,-1,-1,-1, -1,-1,-1,-1, -1,-1,-1,-1, -1,-1,-1,-1
};

#define hexchar(c)  (((c) < 0 || (c) > 127) ? -1 : index_hex[(c)])

int to64(infile, outfile, limit) 
FILE *infile, *outfile;
long limit;
{
    int c1, c2, c3, ct=0, written=0;

    if (limit && limit < 73) return 1;

    while ((c1 = getc(infile)) != EOF) {
        c2 = getc(infile);
        if (c2 == EOF) {
            output64chunk(c1, 0, 0, 2, outfile);
        } else {
            c3 = getc(infile);
            if (c3 == EOF) {
                output64chunk(c1, c2, 0, 1, outfile);
            } else {
                output64chunk(c1, c2, c3, 0, outfile);
            }
        }
        ct += 4;
        if (ct > 71) {
            putc('\n', outfile);
	    if (limit) {
		limit -= ct + 1;
		if (limit < 73) return 1;
	    }
	    written += 73;
            ct = 0;
        }
    }
    if (ct) {
	putc('\n', outfile);
	ct++;
    }
    return written + ct;
}

output64chunk(c1, c2, c3, pads, outfile)
FILE *outfile;
{
    putc(basis_64[c1>>2], outfile);
    putc(basis_64[((c1 & 0x3)<< 4) | ((c2 & 0xF0) >> 4)], outfile);
    if (pads == 2) {
        putc('=', outfile);
        putc('=', outfile);
    } else if (pads) {
        putc(basis_64[((c2 & 0xF) << 2) | ((c3 & 0xC0) >>6)], outfile);
        putc('=', outfile);
    } else {
        putc(basis_64[((c2 & 0xF) << 2) | ((c3 & 0xC0) >>6)], outfile);
        putc(basis_64[c3 & 0x3F], outfile);
    }
}

PendingBoundary(s, Boundaries, BoundaryCt)
char *s;
char **Boundaries;
int *BoundaryCt;
{
    int i, len;

    if (s[0] != '-' || s[1] != '-') return(0);
    s+=2;

    for (i=0; i < *BoundaryCt; ++i) {
	len = strlen(Boundaries[i]);
        if (!strncmp(s, Boundaries[i], len)) {
            if (s[len] == '-' && s[len+1] == '-') *BoundaryCt = i;
            return(1);
        }
    }
    return(0);
}

static char *md5contextTo64(context)
MD5_CTX *context;
{
    unsigned char digest[18];
    char encodedDigest[25];
    int i;
    char *p;

    MD5Final(digest, context);
    digest[sizeof(digest)-1] = digest[sizeof(digest)-2] = 0;

    p = encodedDigest;
    for (i=0; i < sizeof(digest); i+=3) {
	*p++ = basis_64[digest[i]>>2];
	*p++ = basis_64[((digest[i] & 0x3)<<4) | ((digest[i+1] & 0xF0)>>4)];
	*p++ = basis_64[((digest[i+1] & 0xF)<<2) | ((digest[i+2] & 0xC0)>>6)];
	*p++ = basis_64[digest[i+2] & 0x3F];
    }
    *p-- = '\0';
    *p-- = '=';
    *p-- = '=';
    return strsave(encodedDigest);
}    


from64(infile, outfile, digestp, suppressCR, boundaries, boundaryct) 
FILE *infile, *outfile;
char **digestp;
int suppressCR;
char **boundaries;
int *boundaryct;
{
    int c1, c2, c3, c4;
    int newline = 1, DataDone = 0;
    char buf[3];
    MD5_CTX context;

    if (digestp) MD5Init(&context);
    while ((c1 = getc(infile)) != EOF) {
        if (isspace(c1)) {
            if (c1 == '\n') {
                newline = 1;
            } else {
                newline = 0;
            }
            continue;
        }
        if (newline && boundaries && c1 == '-') {
            char Buf[200];
            /* a dash is NOT base 64, so all bets are off if NOT a boundary */
            ungetc(c1, infile);
            fgets(Buf, sizeof(Buf), infile);
            if (boundaries
                 && (Buf[0] == '-')
                 && (Buf[1] == '-')
                 && PendingBoundary(Buf, boundaries, boundaryct)) {
                break;
            }
            warn("Ignoring unrecognized boundary line");
            continue;
        }
        if (DataDone) continue;
        newline = 0;
        do {
            c2 = getc(infile);
        } while (c2 != EOF && isspace(c2));
        do {
            c3 = getc(infile);
        } while (c3 != EOF && isspace(c3));
        do {
            c4 = getc(infile);
        } while (c4 != EOF && isspace(c4));
        if (c2 == EOF || c3 == EOF || c4 == EOF) {
            warn("Premature EOF");
            break;
        }
        if (c1 == '=' || c2 == '=') {
            DataDone=1;
            continue;
        }
        c1 = char64(c1);
        c2 = char64(c2);
	buf[0] = ((c1<<2) | ((c2&0x30)>>4));
        if (!suppressCR || buf[0] != '\r') putc(buf[0], outfile);
        if (c3 == '=') {
	    if (digestp) MD5Update(&context, buf, 1);
            DataDone = 1;
        } else {
            c3 = char64(c3);
	    buf[1] = (((c2&0XF) << 4) | ((c3&0x3C) >> 2));
            if (!suppressCR || buf[1] != '\r') putc(buf[1], outfile);
            if (c4 == '=') {
		if (digestp) MD5Update(&context, buf, 2);
                DataDone = 1;
            } else {
                c4 = char64(c4);
		buf[2] = (((c3&0x03) <<6) | c4);
                if (!suppressCR || buf[2] != '\r') putc(buf[2], outfile);
		if (digestp) MD5Update(&context, buf, 3);		
            }
        }
    }
    if (digestp) *digestp = md5contextTo64(&context);
}

fromqp(infile, outfile, digestp, boundaries, boundaryct) 
FILE *infile, *outfile;
char **digestp;
char **boundaries;
int *boundaryct;
{
    int c1, c2, sawnewline = 1, neednewline = 0;
    /* The neednewline hack is necessary because the newline leading into 
      a multipart boundary is part of the boundary, not the data */
    MD5_CTX context;
    char Buf[200], *s;
    char c;

    if (digestp) MD5Init(&context);

    while (fgets(Buf, sizeof(Buf), infile)) {
	if (sawnewline && boundaries
	    && (Buf[0] == '-')
	    && (Buf[1] == '-')
	    && PendingBoundary(Buf, boundaries, boundaryct)) {
	    neednewline = 0;
	    break;
        }
	/* Not a boundary, now we must treat THIS line as q-p, sigh */
	if (neednewline) {
	    putc('\n', outfile);
	    neednewline = 0;
	    if (digestp) MD5Update(&context, "\r\n", 2);
	}
	for (s=Buf; *s; ++s) {
	    if (*s == '=') {
		if (!*++s) break;
		if (*s == '\n') {
		    /* ignore it */
		    sawnewline = 1;
		} else {
		    c1 = hexchar(*s);
		    if (!*++s) break;
		    c2 = hexchar(*s);
		    c = c1<<4 | c2;
		    putc(c, outfile);
		    if (digestp) MD5Update(&context, &c, 1);
		}
	    } else {
		if (*s == '\n') {
		    sawnewline = 1;
		    neednewline = 1;
		}
		else {
		    putc(*s, outfile);
		    if (digestp) MD5Update(&context, s, 1);
		}
	    }
	}
    }
    if (neednewline) {
        putc('\n', outfile);
        neednewline = 0;
	if (digestp) MD5Update(&context, "\r\n", 2);
    }    
    if (digestp) *digestp=md5contextTo64(&context);
}

fromnone(infile, outfile, digestp, boundaries, boundaryct) 
FILE *infile, *outfile;
char **digestp;
char **boundaries;
int *boundaryct;
{
    char buf[1024], *p;
    int startofline = 1, neednewline = 0;
    MD5_CTX context;

    if (digestp) MD5Init(&context);

    while (fgets(buf, sizeof(buf)-1, infile)) {
	if (startofline && PendingBoundary(buf, boundaries, boundaryct)) {
	    neednewline = 0;
	    break;
	}
	if (neednewline) {
	    putc('\n', outfile);
	    if (digestp) MD5Update(&context, "\r\n", 2);
	}
	if (p = strchr(buf, '\n')) {
	    *p = '\0';
	    startofline = neednewline = 1;
	}
	else {
	    startofline = neednewline = 0;
	}
	fputs(buf, outfile);
	if (digestp) MD5Update(&context, buf, strlen(buf));
    }
    if (neednewline) {
	putc('\n', outfile);
	if (digestp) MD5Update(&context, "\r\n", 2);
    }
    if (digestp) *digestp=md5contextTo64(&context);
}

char *md5digest(infile, len)
FILE *infile;
long *len;
{
    MD5_CTX context;
    char buf[1000];
    long length = 0;
    int nbytes;
    
    MD5Init(&context);
    while (nbytes = fread(buf, 1, sizeof(buf), infile)) {
	length += nbytes;
	MD5Update(&context, buf, nbytes);
    }
    rewind(infile);
    if (len) *len = length;
    return md5contextTo64(&context);
}
