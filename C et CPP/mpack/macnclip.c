/* macnclip.c -- clipboard window for nifty application library
 *
 * (C) Copyright 1990-1993 by Christopher J. Newman
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
 *
 * Author:	Christopher J. Newman
 * Message:	This is a nifty program.
 */

#include "macnapp.h"
#ifndef THINK_C
#include <Resources.h>
#include <Fonts.h>
#include <Scrap.h>
#endif

typedef struct clipinfo {
	nate_win	winp;
	Handle		data;
	ResType		type, preftype;
	short		scrapc;
	Boolean		valid;
} clipinfo;

/* handle to cliboard window */
static na_win **cliph = (na_win**) NULL;
static WORD	menuid, itemid;

/* function prototypes */
static short clipclose(na_win*);
static short clipupdate(na_win*, Boolean);
static short cliptask(na_win*);
static short clipinit(na_win*, long*);

#define cinfo	((clipinfo *) winp)
#define teinfo	((nate_win *) winp)

/* close the clipboard window
 */
static short clipclose(winp)
	na_win	*winp;
{
	Handle			hand;
	
	cliph = (na_win**) NULL;
	if (menuid)	CheckItem(GetMHandle(menuid), itemid, false);
	if ((hand = cinfo->data) != (Handle) NULL) {
		DisposHandle(hand);
	} else {
		NATEclosep(winp);
	}
	
	return (NA_CLOSED);
}

/* update the clipboard window -- this does all the work
 */
#ifdef __STDC__
static short clipupdate(na_win *winp, Boolean newsize)
#else
static short clipupdate(winp, newsize)
	na_win	*winp;
	Boolean			newsize;
#endif
{
	long		len;
	long				offset;
	
	if (!cinfo->valid) {
		winp->ctrlp = NULL;
		winp->activep = NULL;
		winp->idlep = NULL;
		winp->mousep = NULL;
		winp->cursorp = NULL;
		if (teinfo->vctrl != (ControlHandle) NULL) {
			DisposeControl(teinfo->vctrl);
			teinfo->vctrl = (ControlHandle) NULL;
		}
		if (winp->cursorRgn != (RgnHandle) NULL) {
			DisposeRgn(winp->cursorRgn);
			winp->cursorRgn = NULL;
			if (winp->flags & NA_CURSORON) SetCursor(&QD(arrow));
		}
		cinfo->scrapc = InfoScrap()->scrapCount;
		if (cinfo->data == (Handle) NULL) { 
			cinfo->data = NewHandle(0);
			if (MemError() != noErr) return (NA_NOTPROCESSED);
		}
		if ((len = GetScrap(cinfo->data, cinfo->type = cinfo->preftype, &offset)) <= 0) {
			if ((len = GetScrap(cinfo->data, cinfo->type =
					(cinfo->preftype == 'TEXT' ? 'PICT' : 'TEXT'), &offset)) <= 0) {
				return (NA_NOTPROCESSED);
			}
		}
		if (cinfo->type == 'TEXT') {
			HLock(cinfo->data);
			NATEinit(winp, NATE_READONLY | NATE_NOMOUSE | NATE_NOHSCROLL, 0, *cinfo->data, len);
			winp->updatep = clipupdate;
			winp->closep = clipclose;
			winp->menup = NULL;
			HUnlock(cinfo->data);
			DisposHandle(cinfo->data);
			cinfo->data = (Handle) NULL;
		}
		newsize = true;
		cinfo->valid = true;
	}

	if (cinfo->type == 'TEXT')  return (NATEupdatep(winp, newsize));
	{
		Rect	rtemp = (*(PicHandle)cinfo->data)->picFrame;
		
		DrawPicture((PicHandle) cinfo->data, &rtemp);
	}
	
	return (NA_NOTPROCESSED);
}

/* watch for the clipboard to change
 */
static short cliptask(winp)
	na_win *winp;
{
	if (cinfo->scrapc != InfoScrap()->scrapCount) {
		cinfo->valid = false;
		InvalRect(&winp->pwin->portRect);
	}
	
	return (NA_PROCESSED);
}

/* initialize the clipboard window
 */
static short clipinit(winp, data)
	na_win	*winp;
	long	*data;
{
	cliph = (na_win**) RecoverHandle((Ptr) winp);
	TextFont(monaco);
	TextSize(9);
	winp->type = NA_CLIPTYPE;
	ShowWindow(winp->pwin);
	winp->updatep = clipupdate;
	winp->closep = clipclose;
	winp->taskp = cliptask;
	teinfo->vctrl = (ControlHandle) NULL;
	
	return (NA_PROCESSED);
}

/* turn on/off the clipboard window
 */
#ifdef __STDC__
void NAclipboard(Boolean show, ResType preftype)
#else
void NAclipboard(show, preftype)
	Boolean	show;
	ResType	preftype;
#endif
{
	clipinfo	cinfob;
	
	if ((cliph == (na_win**) NULL && !show) || (cliph != (na_win**) NULL && show)) {
		return;
	}
	if (!show) {
		NAcloseWindow(NAlockWindow(cliph), NA_REQCLOSE);
		return;
	}
	cinfob.data = (Handle) NULL;
	cinfob.scrapc = 0;
	cinfob.valid = false;
	cinfob.preftype = preftype;
	NAwindow(NAscreenrect(NA_VQUARTERSCN | NA_H3QUARTERSCN | NA_LEFTSCN | NA_BOTTOMSCN),
		NA_USERESOURCE | NA_HASCONTROLS | NA_HILITECTRLS | NA_HASTASK | NA_CLOSEBOX | NA_GROWBOX
		| NA_FORCESIZE | NA_COPYDATA, NULL, NA_CLIPWINDOW,
		(long *) ((char *) &cinfob + sizeof (na_win)), sizeof (cinfob), clipinit);
}

/* deal with a menu selection of the "Show/Hide Clipboard" item
 */
#ifdef __STDC__
void NAclipboardMenu(WORD menu, WORD item, ResType preftype)
#else
void NAclipboardMenu(menu, item, preftype)
	WORD	menu, item;
	ResType	preftype;
#endif
{
	Boolean		show;
	
	CheckItem(GetMHandle(menuid = menu), itemid = item,
		show = (cliph == (na_win**) NULL ? true : false));
	NAclipboard(show, preftype);
}
