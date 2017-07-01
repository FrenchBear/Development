/*
 * Decode MIME parts.
 */
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
#include <string.h>
#include <ctype.h>
#include "xmalloc.h"
#include "common.h"

extern char *os_idtodir();
extern FILE *os_newtypedfile();
extern char *md5digest();

/* List of pending multipart boundaries */
struct boundary {
    char **id;
    int count;
    int alloc;
};

/* The possible content transfer encodings */
enum encoding { enc_none, enc_binary, enc_qp, enc_base64 };

typedef char **params;

char *ParseHeaders();
enum encoding parseEncoding();
params ParseContent();
char *getParam();
char *getDispositionFilename();

/*
 * Read and handle an RFC 822 message from the file 'infile'.
 */
handleMessage(infile, defaultContentType, inAppleDouble, extractText,
	      boundaries)
FILE *infile;
char *defaultContentType;
int inAppleDouble;
int extractText;
struct boundary *boundaries;
{
    char *headers, *subject, *contentType, *contentDisposition, *contentMD5;
    enum encoding contentEncoding;
    params contentParams;
    struct boundary newboundaries;
    int depth;

    /* No passed-in boundary structure, create a new one */
    if (!boundaries) {
	boundaries = &newboundaries;
	boundaries->id = 0;
	boundaries->alloc = boundaries->count = 0;
    }

    /* Parse the headers, getting the ones we're interested in */
    headers = ParseHeaders(infile, &subject, &contentType, &contentEncoding,
			   &contentDisposition, &contentMD5, boundaries);
    if (!headers) return 1;

    /* If no content type, or a non-MIME content type, use the default */
    if (!contentType || !strchr(contentType, '/')) {
	contentType = defaultContentType;
    }
    contentParams = ParseContent(&contentType);

    if (!cistrcmp(contentType, "message/rfc822")) {
	if (contentEncoding != enc_none && contentEncoding != enc_binary) {
	    warn("ignoring invalid content encoding on message/rfc822");
	}

	/* Simple recursion */
	return handleMessage(infile, "text/plain", 0, extractText, boundaries);
    }
    else if (!cistrcmp(contentType, "message/partial")) {
	if (contentEncoding != enc_none && contentEncoding != enc_binary) {
	    warn("ignoring invalid content encoding on message/partial");
	}
	return handlePartial(infile, headers, contentParams, extractText,
			     boundaries);
    }
    else if (!cistrncmp(contentType, "message/", 8)) {
	/* Probably message/external.  We don't care--toss it */
	return ignoreMessage(infile, boundaries);
    }
    else if (!cistrncmp(contentType, "multipart/", 10)) {
	if (contentEncoding != enc_none && contentEncoding != enc_binary) {
	    warn("ignoring invalid content encoding on multipart");
	}
	return handleMultipart(infile, contentType, contentParams,
			       extractText, boundaries);
    }
    else if (!boundaries->count && !cistrncmp(contentType, "text/", 5)) {
	/* top-level text message, handle as possible uuencoded file */
	return handleUuencode(infile, subject);
    }
    else if (!extractText && !inAppleDouble &&
	     !getDispositionFilename(contentDisposition) &&
	     !getParam(contentParams, "name") &&
	     !cistrncmp(contentType, "text/", 5)) {
	return handleText(infile, contentEncoding, boundaries);
    }
    else {
	/* Some sort of attachment, extract it */
	return saveToFile(infile, inAppleDouble, contentType, contentParams,
			  contentEncoding, contentDisposition, contentMD5,
			  boundaries);
    }
}

/*
 * Skip whitespace and RFC-822 comments.
 */
SkipWhitespace(s)
char **s;
{
    char *p = *s;
    int commentlevel = 0;

    while (*p && (isspace(*p) || *p == '(')) {
	if (*p == '\n') {
	    p++;
	    if (*p != ' ' && *p != '\t') {
		*s = 0;
		return;
	    }
	}
	else if (*p == '(') {
	    p++;
	    commentlevel++;
	    while (commentlevel) {
		switch (*p) {
		case '\n':
		    p++;
		    if (*p == ' ' || *p == '\t') break;
		    /* FALL THROUGH */
		case '\0':
		    *s = 0;
		    return;
		    
		case '\\':
		    p++;
		    break;

		case '(':
		    commentlevel++;
		    break;

		case ')':
		    commentlevel--;
		    break;
		}
		p++;
	    }
	}
	else p++;
    }
    if (*p == 0) {
	*s = 0;
    }
    else {
	*s = p;
    }
}

/*
 * Read and parse the headers of an RFC 822 message, returning them in
 * a pointer to a static buffer.  The headers are read from 'infile'.
 * A pointer to the value of any Subject:, Content-Type:,
 * Content-Disposition:, or Content-MD5: header is stored in the space
 * pointed to by 'subjectp', 'contentTypep', contentDispositionp, and
 * contentMD5p, respectively.  The Content-Transfer-Encoding is stored
 * in the enum pointed to by 'contentEncodingp'.
 */
#define HEADGROWSIZE 1000
char *ParseHeaders(infile, subjectp, contentTypep, contentEncodingp,
		   contentDispositionp, contentMD5p, boundaries)
FILE *infile;
char **subjectp, **contentTypep;
enum encoding *contentEncodingp;
char **contentDispositionp, **contentMD5p;
struct boundary *boundaries;
{
    static int alloced = 0;
    static char *headers;
    int left, len;
    char *next, *val;

    /* Read headers into buffer pointed to by "headers" */
    if (!alloced) {
	headers = xmalloc(alloced = HEADGROWSIZE);
    }
    next = headers;
    *next++ = '\n';		/* Leading newline to make matching header names easier */
    left = alloced - 2;		/* Allow room for terminating null */

    while (fgets(next, left, infile) && (*next != '\n' || next[-1] != '\n')) {
	len = strlen(next);
	left -= len;
	next += len;

	if (next[-1] == '\n' && *next == '-' &&
	    PendingBoundary(next, boundaries->id, &boundaries->count)) {
	    return 0;
	}

	if (left < 100) {
	    len = next - headers;
	    alloced += HEADGROWSIZE;
	    left += HEADGROWSIZE;
	    headers = xrealloc(headers, alloced);
	    next = headers + len;
	}
    }

    *next = '\0';

    /* Look for the headers we find particularly interesting */
    *subjectp = *contentTypep = *contentDispositionp = *contentMD5p = 0;
    *contentEncodingp = enc_none;
    for (next = headers; *next; next++) {
	if (*next == '\n') {
	    switch(next[1]) {
	    case 's':
	    case 'S':
		if (!cistrncmp(next+2, "ubject:", 7)) {
		    val = next+9;
		    SkipWhitespace(&val);
		    if (val) *subjectp = val;
		}
		break;

	    case 'c':
	    case 'C':
		if (!cistrncmp(next+2, "ontent-type:", 12)) {
		    val = next+14;
		    SkipWhitespace(&val);
		    if (val) *contentTypep = val;
		}
		else if (!cistrncmp(next+2, "ontent-transfer-encoding:", 25)) {
		    *contentEncodingp = parseEncoding(next+27);
		}
		else if (!cistrncmp(next+2, "ontent-disposition:", 19)) {
		    val = next+21;
		    SkipWhitespace(&val);
		    if (val) *contentDispositionp = val;
		}
		else if (!cistrncmp(next+2, "ontent-md5:", 11)) {
		    val = next+13;
		    SkipWhitespace(&val);
		    if (val) *contentMD5p = val;
		}
	    }
	}
    }
    return headers;
}

/*
 * Parse the Content-Transfer-Encoding: value pointed to by 's'.
 * Returns the appropriate encoding enum.
 */
enum encoding parseEncoding(s)
char *s;
{
    SkipWhitespace(&s);
    if (s) {
	switch (*s) {
	case 'q':
	case 'Q':
	    if (!cistrncmp(s+1, "uoted-printable", 15) &&
		(isspace(s[16]) || s[16] == '(')) {
		return enc_qp;
	    }
	    break;

	case '7':
	case '8':
	    if (!cistrncmp(s+1, "bit", 3) &&
		(isspace(s[4]) || s[4] == '(')) {
		return enc_none;
	    }
	    break;

	case 'b':
	case 'B':
	    if (!cistrncmp(s+1, "ase64", 5) &&
		(isspace(s[6]) || s[6] == '(')) {
		return enc_base64;
	    }
	    if (!cistrncmp(s+1, "inary", 5) &&
		(isspace(s[6]) || s[6] == '(')) {
		return enc_binary;
	    }
	}
	warn("ignoring unknown content transfer encoding\n");	
    }
    return enc_none;
}

/*
 * Parse the value of a Content-Type: header.
 * 'headerp' points to a pointer to the input string.
 * The pointer pointed to by 'headerp' is changed to point to
 * a static buffer containing the content type stripped of whitespace
 * and parameters.  The parameters are converted to a type suitable for
 * getParm() and returned.
 */
#define PARAMGROWSIZE 10
params ParseContent(headerp)
char **headerp;
{
    char *header;
    static int palloced = 0;
    static char **param;
    static int calloced = 0;
    static char *cbuf;
    char *p;
    int nparam;

    p = header = *headerp;

    /* Find end of header, including continuation lines */
    do {
	p = strchr(p+1, '\n');
    } while (p && isspace(p[1]));
    if (!p) {
	p = header + strlen(header);
    }

    /* If necessary, allocate/grow cbuf to hold header. */
    if (p - header >= calloced) {
	calloced = p - header + 1;
	if (calloced < 200) calloced = 200;
	cbuf = xrealloc(cbuf, calloced);
    }

    /* Copy header to cbuf */
    strncpy(cbuf, header, p - header);
    cbuf[p - header] = 0;
    header = *headerp = cbuf;
    
    nparam = 0;

    /* Strip whitespace from content type */
    /* ParseHeaders() stripped leading whitespace */
    p = header;
    while (header && *header && *header != ';') {
	while (*header && !isspace(*header) && *header != '(' &&
	       *header != ';') {
	    *p++ = *header++;
	}
	SkipWhitespace(&header);
    }
    if (!header || !*header) return 0;
    header++;
    *p = '\0';
    
    /* Parse the parameters */
    while (*header) {
	SkipWhitespace(&header);
	if (!header) break;

	if (nparam+1 >= palloced) {
	    palloced += PARAMGROWSIZE;
	    param = (char **) xrealloc((char *)param, palloced * sizeof(char *));
	}
	param[nparam++] = header;

	/* Find any separating semicolon.  Pay attention to quoted-strings */
	while (*header && *header != ';') {
	    if (*header == '\"') {
		++header;
		while (*header && *header != '\"') {
		    if (*header == '\\') {
			++header;
			if (!*header) break;
		    }
		    ++header;
		}
		if (!*header) break;
	    }
	    else if (*header == '(') {
		/* Convert comments to spaces */
		p = header;
		SkipWhitespace(&p);
		if (!p) {
		    break;
		}
		while (header < p) *header++ = ' ';
		header--;
	    }
	    header++;
	}
	if (*header) *header++ = '\0';
    }
    param[nparam] = 0;
    return param;
}

/*
 * Get the value of the parameter named 'key' from the content-type
 * parameters 'cParams'.  Returns a pointer to a static bufer which
 * contains the value, or null if no such parameter was found.
 */
#define VALUEGROWSIZE 100
char *getParam(cParams, key)
params cParams;
char *key;
{
    static char *value;
    static int alloced = 0;
    int left;
    int keylen = strlen(key);
    char *from, *to;

    if (!cParams) return 0;

    if (!alloced) {
	value = xmalloc(alloced = VALUEGROWSIZE);
    }

    /* Find the named parameter */
    while (*cParams) {
	if (!cistrncmp(key, *cParams, keylen) &&
	    ((*cParams)[keylen] == '=' || isspace((*cParams)[keylen]))) break;
	cParams++;
    }
    if (!*cParams) return 0;

    /* Skip over the "=" and any surrounding whitespace */
    from = *cParams + keylen;
    while (*from && isspace(*from)) from++;
    if (*from++ != '=') return 0;
    while (*from && isspace(*from)) from++;
    if (!*from) return 0;

    /* Copy value into buffer */
    to = value;
    left = alloced - 1;
    if (*from == '\"') {
	/* Quoted-string */
	from++;
	while (*from && *from != '\"') {
	    if (!--left) {
		alloced += VALUEGROWSIZE;
		value = xrealloc(value, alloced);
		to = value + alloced - left - 2;
	    }
	    if (*from == '\\') {
		from++;
		if (!*from) return 0;
	    }
	    *to++ = *from++;
	}
	if (!*from) return 0;
    }
    else {
	/* Just a token */
	while (*from && !isspace(*from)) {
	    if (!--left) {
		alloced += VALUEGROWSIZE;
		value = xrealloc(value, alloced);
		to = value + alloced - left - 2;
	    }
	    *to++ = *from++;
	}
    }
    *to = '\0';
    return value;
}

/*
 * Get the value of the "filename" parameter in a Content-Disposition:
 * header.  Returns a pointer to a static buffer containing the value, or
 * a null pointer if there was no such parameter.
 */
char *
getDispositionFilename(disposition)
char *disposition;
{
    static char *value;
    static int alloced = 0;
    int left;
    char *to;

    if (!disposition) return 0;

    /* Skip until we find ";" "filename" "=" tokens. */
    for (;;) {
	/* Skip until we find ";" */
	while (*disposition != ';') {
	    if (!*disposition) return 0;
	    else if (*disposition == '\"') {
		++disposition;
		while (*disposition && *disposition != '\"') {
		    if (*disposition == '\\') {
			++disposition;
			if (!*disposition) return 0;
		    }
		    ++disposition;
		}
		if (!*disposition) return 0;
	    }
	    else if (*disposition == '(') {
		SkipWhitespace(&disposition);
		if (!disposition) return 0;
		disposition--;
	    }
	    disposition++;
	}

	/* Skip over ";" and trailing whitespace */
	disposition++;
	SkipWhitespace(&disposition);
	if (!disposition) return 0;

	/*
	 * If we're not looking at a "filename" token, go back
	 * and look for another ";".  Otherwise skip it and
	 * trailing whitespace.
	 */
	if (cistrncmp(disposition, "filename", 8) != 0) continue;
	disposition += 8;
	if (!isspace(*disposition) && *disposition != '=' &&
	    *disposition != '(') {
	    continue;
	}
	SkipWhitespace(&disposition);
	if (!disposition) return 0;

	/* If we're looking at a ";", we found what we're looking for */
	if (*disposition++ == '=') break;
    }

    SkipWhitespace(&disposition);
    if (!disposition) return 0;
      
    if (!alloced) {
	value = xmalloc(alloced = VALUEGROWSIZE);
    }

    /* Copy value into buffer */
    to = value;
    left = alloced - 1;
    if (*disposition == '\"') {
	/* Quoted-string */
	disposition++;
	while (*disposition && *disposition != '\"') {
	    if (!--left) {
		alloced += VALUEGROWSIZE;
		value = xrealloc(value, alloced);
		to = value + alloced - left - 2;
	    }
	    if (*disposition == '\\') {
		disposition++;
		if (!*disposition) return 0;
	    }
	    *to++ = *disposition++;
	}
	if (!*disposition) return 0;
    }
    else {
	/* Just a token */
	while (*disposition && !isspace(*disposition) &&
	       *disposition != '(') {
	    if (!--left) {
		alloced += VALUEGROWSIZE;
		value = xrealloc(value, alloced);
		to = value + alloced - left - 2;
	    }
	    *to++ = *disposition++;
	}
    }
    *to = '\0';
    return value;
}    

/*
 * Read and handle a message/partial object from the file 'infile'.
 */
handlePartial(infile, headers, contentParams, extractText, boundaries)
FILE *infile;
char *headers;
params contentParams;
int extractText;
struct boundary *boundaries;
{
    char *id, *dir, *p;
    int thispart;
    int nparts = 0;
    char buf[1024];
    FILE *partfile, *outfile;
    int i, docopy;

    id = getParam(contentParams, "id");
    if (!id) {
	warn("partial message has no id parameter");
	goto ignore;
    }

    /* Get directory to store the parts being reassembled */
    dir = os_idtodir(id);
    if (!dir) goto ignore;

    p = getParam(contentParams, "number");
    if (!p) {
	warn("partial message doesn't have number parameter");
	goto ignore;
    }
    thispart = atoi(p);

    if (p = getParam(contentParams, "total")) {
	nparts = atoi(p);
	if (nparts <= 0) {
	    warn("partial message has invalid number of parts");
	    goto ignore;
	}
	/* Store number of parts in reassembly directory */
	sprintf(buf, "%sCT", dir);
	partfile = fopen(buf, "w");
	if (!partfile) {
	    os_perror(buf);
	    goto ignore;
	}
	fprintf(partfile, "%d\n", nparts);
	fclose(partfile);
    }
    else {
	/* Try to retrieve number of parts from reassembly directory */
	sprintf(buf, "%sCT", dir);
	if (partfile = fopen(buf, "r")) {
	    if (fgets(buf, sizeof(buf), partfile)) {
		nparts = atoi(buf);
		if (nparts < 0) nparts = 0;
	    }
	    fclose(partfile);
	}
    }

    /* Sanity check */
    if (thispart <= 0 || (nparts && thispart > nparts)) {
	warn("partial message has invalid number");
	goto ignore;
    }

    sprintf(buf, "Saving %s part %d", getParam(contentParams, "id"), thispart);
    if (nparts) sprintf(buf+strlen(buf), " of %d", nparts);
    chat(buf);

    /* Create file to store this part */
    sprintf(buf, "%s%d", dir, thispart);
    partfile = fopen(buf, "w");
    if (!partfile) {
	os_perror(buf);
	goto ignore;
    }

    /* Do special-case header handling for first part */
    if (thispart == 1) {
	int skippedfirstbyte = 0;

	while (*headers) {
	    if (*headers == '\n' &&
		(!cistrncmp(headers, "\ncontent-", 9) ||
		 !cistrncmp(headers, "\nmessage-id:", 12))) {
		/* Special case, skip header */
		headers++;
		while (*headers && (*headers != '\n' || isspace(headers[1]))) {
		    headers++;
		}
	    }
	    else {
		/* First byte of headers is extra newline, don't write it to file */
		if (skippedfirstbyte++)	putc(*headers, partfile);
		headers++;
	    }
	}
	docopy = 0;
	/* Handle headers in the multipart/partial body */
	while (fgets(buf, sizeof(buf), infile)) {
	    if (*buf == '\n') {
		putc('\n', partfile);
		break;
	    }
	    if (!cistrncmp(buf, "content-", 8) || !cistrncmp(buf, "message-id:", 11)) {
		docopy = 1;
	    }
	    else if (!isspace(*buf)) {
		docopy = 0;
	    }

	    if (docopy) fputs(buf, partfile);
	    while(buf[strlen(buf)-1] != '\n' && fgets(buf, sizeof(buf), infile)) {
		if (docopy) fputs(buf, partfile);
	    }
	}
    }

    /* Copy the contents to the file */
    while (fgets(buf, sizeof(buf), infile) &&
	   !PendingBoundary(buf, boundaries->id, &boundaries->count)) {
	fputs(buf, partfile);
    }
    fclose(partfile);

    /* Check to see if we have all parts.  Start from the highest numbers
     * as we are more likely not to have them.
     */
    for (i = nparts; i; i--) {
	sprintf(buf, "%s%d", dir, i);
	partfile = fopen(buf, "r");
	if (partfile) {
	    fclose(partfile);
	}
	else {
	    break;
	}
    }

    if (i || !nparts) {
	/* We don't have all the parts yet */
	return 0;
    }

    /* We have everything, concatenate all the parts into a single file */
    sprintf(buf, "%sFULL", dir);
    outfile = fopen(buf, "w");
    if (!outfile) {
	os_perror(buf);
	return 1;
    }
    for (i=1; i<=nparts; i++) {
	sprintf(buf, "%s%d", dir, i);
	partfile = fopen(buf, "r");
	if (!partfile) {
	    os_perror(buf);
	    return 1;
	}
	while (fgets(buf, sizeof(buf), partfile)) {
	    fputs(buf, outfile);
	}
	fclose(partfile);

	/* Done with message part file, delete it */
	sprintf(buf, "%s%d", dir, i);
	remove(buf);
    }

    /* Open the concatenated file for reading and handle it */
    fclose(outfile);
    sprintf(buf, "%sFULL", dir);
    outfile = fopen(buf, "r");
    if (!outfile) {
	os_perror(buf);
	return 1;
    }
    handleMessage(outfile, "text/plain", 0, extractText, (struct boundary *)0);
    fclose(outfile);

    /* Clean up the rest of the reassembly directory */
    sprintf(buf, "%sFULL", dir);
    remove(buf);
    sprintf(buf, "%sCT", dir);
    remove(buf);
    os_donewithdir(dir);

    return 0;

 ignore:
    ignoreMessage(infile, boundaries);
    return 1;
}

/*
 * Skip over a message object from the file 'infile'.
 */
ignoreMessage(infile, boundaries)
FILE *infile;
struct boundary *boundaries;
{
    char buf[1024];

    while (fgets(buf, sizeof(buf), infile) &&
	   !PendingBoundary(buf, boundaries->id, &boundaries->count));
    return 0;
}

/*
 * Read and handle a multipart object from the file 'infile'.
 */
handleMultipart(infile, contentType, contentParams, extractText, boundaries)
FILE *infile;
char *contentType;
params contentParams;
int extractText;
struct boundary *boundaries;
{
    char *id;
    char *defaultContentType = "text/plain";
    int depth;
    int isAppleDouble = 0;

    /* Components of multipart/digest have a different default content-type */
    if (!cistrcmp(contentType, "multipart/digest")) {
	defaultContentType = "message/rfc822";
    }
    if (!cistrcmp(contentType, "multipart/appledouble")) {
	isAppleDouble++;
    }

    if (!(id = getParam(contentParams, "boundary"))) {
	warn("multipart message has no boundary parameter");
	id="";
    }

    /* Expand boundaries array if necessary */
    if (boundaries->count == boundaries->alloc) {
	boundaries->alloc += 20;
	boundaries->id = (char **)xrealloc((char *)boundaries->id,
					   boundaries->alloc * sizeof(char *));
    }
    
    /* Add the new boundary id */
    boundaries->id[boundaries->count++] = strsave(id);
    depth = boundaries->count;

    /* Skip over preamble */
    ignoreMessage(infile, boundaries);

    /* Handle the component messages */
    while (boundaries->count == depth) {
	handleMessage(infile, defaultContentType, isAppleDouble, extractText,
		      boundaries);
    }

    /* Skip over postamble */
    if (boundaries->count == depth-1) {
	ignoreMessage(infile, boundaries);
    }
	
    /* Remove any lingering unused description file */
    (void) remove(TEMPFILENAME);

    return 0;
}

/*
 * Handle a text message object from the file 'infile' by saving it to
 * the temporary description file.
 */
int handleText(infile, contentEncoding, boundaries)
FILE *infile;
enum encoding contentEncoding;
struct boundary *boundaries;
{
    FILE *descfile;

    descfile = fopen(TEMPFILENAME, "w");
    if (!descfile) {
	os_perror(TEMPFILENAME);
	ignoreMessage(infile, boundaries);
	return 1;
    }

    /* Write the file, handling the appropriate encoding */
    switch (contentEncoding) {
    case enc_none:
    case enc_binary:
	fromnone(infile, descfile, (char **)0, boundaries->id,
		 &boundaries->count);
	break;

    case enc_qp:
	fromqp(infile, descfile, (char **)0, boundaries->id,
	       &boundaries->count);
	break;

    case enc_base64:
	from64(infile, descfile, (char **)0, 1, boundaries->id,
	       &boundaries->count);
	break;
    }

    fclose(descfile);
    return 0;
}

/*
 * Read a message object from 'infile' and save it to a file.
 */
saveToFile(infile, inAppleDouble, contentType, contentParams,
	   contentEncoding, contentDisposition, contentMD5, boundaries)
FILE *infile;
int inAppleDouble;
char *contentType;
params contentParams;
enum encoding contentEncoding;
char *contentDisposition, *contentMD5;
struct boundary *boundaries;
{
    FILE *outfile = 0;
    int flags = 0;
    int suppressCR = 0;
    char *outputmd5;
    char *fname;

    /* Find an appropriate filename and create the output file */
    if (contentEncoding == enc_base64 && !cistrncmp(contentType, "text/", 5)) {
	suppressCR = 1;
    }
    else if (contentEncoding == enc_base64 || contentEncoding == enc_binary) {
	flags |= FILE_BINARY;
    }

    if (inAppleDouble) flags |= FILE_INAPPLEDOUBLE;
    
    fname = getDispositionFilename(contentDisposition);
    if (!fname) fname = getParam(contentParams, "name");
    outfile = os_newtypedfile(fname, contentType, flags);
    if (!outfile) {
	ignoreMessage(infile, boundaries);
	return 1;
    }

    /* Write the file, handling the appropriate encoding */
    switch (contentEncoding) {
    case enc_none:
    case enc_binary:
	fromnone(infile, outfile, &outputmd5, boundaries->id,
		 &boundaries->count);
	break;

    case enc_qp:
	fromqp(infile, outfile, &outputmd5, boundaries->id,
	       &boundaries->count);
	break;

    case enc_base64:
	from64(infile, outfile, &outputmd5, suppressCR, boundaries->id,
	       &boundaries->count);
	break;
    }
    rewind(outfile);

    /* Check the MD5 digest if it was supplied */
    if (contentMD5) {
	if (strncmp(outputmd5, contentMD5, strlen(outputmd5)) != 0) {
	    os_warnMD5mismatch();
	}
    }
    free(outputmd5);

    os_closetypedfile(outfile);
    return 0;
}

    
