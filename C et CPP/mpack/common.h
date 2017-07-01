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

#define TEMPFILENAME "tempdesc.txt"

#if defined(unix) && !defined(remove)
#define remove unlink
#endif

/* Flags for os_newtypedfile */
#define FILE_BINARY 0x1		/* File should be opened in binary mode */
#define FILE_INAPPLEDOUBLE 0x2	/* File was inside multipart/appledouble */
