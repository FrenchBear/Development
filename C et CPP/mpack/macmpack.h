/* mac_mpack.h -- resources for mac interface to mpack
 *
 * (C) Copyright 1993 by Christopher J. Newman
 * All Rights Reserved.
 *
 * Permission to use, copy, modify, distribute, and sell this software and its
 * documentation for any purpose is hereby granted without fee, provided that
 * the above copyright notice appear in all copies and that both that
 * copyright notice and this permission notice appear in supporting
 * documentation, and that the name of Christopher J. Newman not be used in
 * advertising or publicity pertaining to distribution of the software without
 * specific, written prior permission.  Christopher J. Newman makes no
 * representations about the suitability of this software for any purpose.  It
 * is provided "as is" without express or implied warranty.
 *
 * CHRISTOPHER J. NEWMAN DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
 * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT
 * SHALL CHRISTOPHER J. NEWMAN BE LIABLE FOR ANY SPECIAL, INDIRECT OR
 * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
 * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
 * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE
 * OF THIS SOFTWARE.
 */

#define aboutDLOG	128
#define decodeDLOG	129
#define encodeDLOG	130
#define warnALRT	131
#define errorALRT	133
#define prefsDLOG	134
#define dstatDLOG	135

#define prefsID		128

#define mainMBAR	128

#define textWIND	128
#define helpWIND	129

#define helpTEXT	128
#define helpSTYL	128

/* apple menu */
#define iAbout		1
#define iHelp		2

/* file menu */
#define iEncode		1
#define iDecode		2
#define iOpen		3
#define iClose		4
#define iPrefs      6
#define iQuit		8

/* edit menu */
#define iSelectAll	7

/* decode dialog items */
#define iAdd		3
#define iRemove		4
#define iFileList	5
#define iFileScroll	6

/* encode dialog items */
#define iMaximum	9
#define iSubject	10
#define iDescfile	11
#define iSplit		13

/* replace alert */
#define iNewname	1
#define iReplace	2

/* preferences dialog */
#define iHost       3
#define iAuto		6
#define iData		7
#define iSingle		8
#define iDouble		9
#define iTextEncode 10

/* decode status dialog */
#define iStatus		2

/* mpack preferences */
extern struct mpack_preferences {
	short encoding;
	short extract_text;
	char internet_host[1];	/* C string */
} **mpack_prefs;

/* encodings */
#define EN_AUTO   0
#define EN_DATA   1
#define EN_DOUBLE 2
#define EN_SINGLE 3

/* shared routines */
FILE *Macopen(FILE *, Str255, short, long, short, short, SignedByte);

/* buffer for copy operations */
#define COPY_BUFSIZE 1024
extern char copy_buf[COPY_BUFSIZE];
