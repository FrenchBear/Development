/* macndlog.c -- dialog utilities for nifty application library
 *
 * (C) Copyright 1990-1994 by Christopher J. Newman
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
#include <ToolUtils.h>
#endif

/* place to save modifiers from a modal dialog */
static short dialog_modifiers;

/* a filter proc which handles Return, Enter, Esc, command-period properly
 */
pascal Boolean NAfilterProc(dialog, pevent, item)
	DialogPtr		dialog;
	EventRecord		*pevent;
	short			*item;
{
	dialog_modifiers = pevent->modifiers;
	if (pevent->what == autoKey || pevent->what == keyDown) {
		switch (pevent->message & charCodeMask) {
			case '\r':
			case '\n':
				*item = 1;
				goto HILITE;
			
			case '.':
				if (!(pevent->modifiers & cmdKey)) break;
			case '\033':
				*item = 2;
			HILITE:
				NAflashButton(dialog, *item);
				return (true);
		}
	}
	
	return (false);
}

/* send events from a modal dialog box to the control procedure.
 * if no ctrlp in window structure, then a simple OK/CANCEL box is assumed.
 * returns item number of last item event.
 */
short NAmodalLoop(winp)
	na_win	*winp;
{
	short			item;
	short			status = NA_NOTPROCESSED;
	ControlHandle	ctrl;
	Point			pt;
	
	* (long *) &pt = 0L;
	do {
		ModalDialog(NAfilterProc, &item);
		if (winp->ctrlp == (na_ctrlp) NULL) {
			if (item == iOk || item == iCancel)	break;
		} else {
			NAgetDHandle(winp->pwin, item, &ctrl);
			status = (*winp->ctrlp)(winp, pt, item, dialog_modifiers, ctrl);
		}
	} while (status >= NA_NOTPROCESSED);
	
	return (item);
}

/* enable/disable a control in a dialog window
 */
#ifdef __STDC__
void NAenableDItem(DialogPtr dialog, short item, Boolean on)
#else
void NAenableDItem(dialog, item, on)
	DialogPtr	dialog;
	short		item;
	Boolean		on;
#endif
{
	short	type;
	Handle			ctrl;
	short			ty;
	Rect			box;
	
	GetDItem(dialog, item, &ty, &ctrl, &box);
	type = ty;
	if (on) type &= ~itemDisable;
	else	type |= itemDisable;
	if (type == statText) type = editText;
	if (type == editText | itemDisable) type = statText;
	SetDItem(dialog, item, type, ctrl, &box);
}

/* hilite a control in a dialog window
 */
#ifdef __STDC__
void NAhiliteDItem(DialogPtr dialog, short item, short how)
#else
void NAhiliteDItem(dialog, item, how)
	DialogPtr	dialog;
	short		item;
	short		how;
#endif
{
	Handle		ctrl;
	short		type;
	Rect		box;
	PenState	tmpPen;
	
	GetDItem(dialog, item, &type, &ctrl, &box);
	if (type & ctrlItem) {
		HiliteControl((ControlHandle) ctrl, how);
	} else if (type & (statText | editText) && how == 255) {
		GetPenState(&tmpPen);
		PenNormal();
		PenPat(QD(gray));
		if (type & statText) {
			PenMode(patBic);
			PaintRect(&box);
		} else {
			InsetRect(&box, -3, -3);
			FrameRect(&box);
		}
		SetPenState(&tmpPen);
	}
}

/* make an item visible/invisible in a dialog window
 */
#ifdef __STDC__
void NAvisibleDItem(DialogPtr dialog, short item, Boolean show)
#else
void NAvisibleDItem(dialog, item, show)
	DialogPtr	dialog;
	short		item;
	Boolean		show;
#endif
{
	if (show)	ShowDItem(dialog, item);
	else		HideDItem(dialog, item);
}

/* set the text in a dialog item
 */
#ifdef __STDC__
void NAsetIText(DialogPtr dialog, short item, PCstr *str)
#else
void NAsetIText(dialog, item, str)
	DialogPtr	dialog;
	short		item;
	PCstr		*str;
#endif
{
	Handle		texth;
	
	NAgetDHandle(dialog, item, &texth);
	SetIText(texth, str);
}

/* get the text in a dialog item
 */
#ifdef __STDC__
void NAgetIText(DialogPtr dialog, short item, PCstr *str)
#else
void NAgetIText(dialog, item, str)
	DialogPtr	dialog;
	short		item;
	PCstr		*str;
#endif
{
	Handle		texth;
	
	NAgetDHandle(dialog, item, &texth);
	GetIText(texth, str);
	SetClen(str);
}

/* set the appropriate radio buttons
 */
#ifdef __STDC__
short NAradioSet(DialogPtr dialog, short firstitem, short lastitem, short setting)
#else
short NAradioSet(dialog, firstitem, lastitem, setting)
	DialogPtr	dialog;
	short		firstitem;
	short		lastitem;
	short		setting;
#endif
{
	short	item;
	ControlHandle	ctrl;
	
	for (item = firstitem; item <= lastitem; item++) {
		NAgetDHandle(dialog, item, &ctrl);
		SetCtlValue(ctrl, item == setting ? 1 : 0);
	}
	
	return (setting - firstitem);
}

/* get the itemno of the active radio button
 */
#ifdef __STDC__
short NAradioGet(DialogPtr dialog, short firstitem, short lastitem)
#else
short NAradioGet(dialog, firstitem, lastitem)
	DialogPtr	dialog;
	short		firstitem;
	short		lastitem;
#endif
{
	short	item;
	ControlHandle	ctrl;
	
	for (item = firstitem; item <= lastitem; item++) {
		NAgetDHandle(dialog, item, &ctrl);
		if (GetCtlValue(ctrl)) return (item);
	}
	
	return (firstitem);
}

/* an alert window with built-in param text calls
 */
#ifdef __STDC__
short NAalertParam(short alert, short strlist, short str1, short str2, short str3, short str4)
#else
short NAalertParam(alert, strlist, str1, str2, str3, str4)
	short	alert, strlist, str1, str2, str3, str4;
#endif
{
	PCstr	*param1 = NULL, *param2 = NULL, *param3 = NULL, *param4 = NULL;
	PCstr	store1[257], store2[257], store3[257], store4[257];
	
	if (str1) GetIndString(param1 = store1, strlist, str1);
	if (str2) GetIndString(param2 = store2, strlist, str2);
	if (str3) GetIndString(param3 = store3, strlist, str3);
	if (str4) GetIndString(param4 = store4, strlist, str4);
	ParamText(param1, param2, param3, param4);

	return (NAalert(alert));
}
