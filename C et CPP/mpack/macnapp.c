/* macnapp.c -- macintosh nifty application library
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
 *
 * BUGS:
 *	- should check 32bit mode works.
 */

#ifndef THINK_C
#include <Resources.h>
#include <Dialogs.h>
#include <Desk.h>
#include <SegLoad.h>
#include <OSEvents.h>
#include <DiskInit.h>
#include <Traps.h>
#include <ToolUtils.h>
#endif
#include <AppleEvents.h>
#include "macnapp.h"

/* export globals */
na_win **NAhead = (na_win**) NULL;		/* head of the window tree */
na_win **NAtask = (na_win**) NULL;		/* head of the task list */
na_win **NActask = (na_win**) NULL;		/* next task to be called */
na_win *NAwin = (na_win*) NULL;			/* the current window */
na_menup NAmenup = (na_menup) NULL;		/* application menu procedure */
short NAnewitem = 0;					/* the new item number */
short NAcloseitem = 0;					/* the close item number */
short NAappleitems = 0;					/* number of apple menu items */
Boolean NAhasedit = false;				/* true if application supports edit menu */
long NAdelay = 30;						/* delay (1/60th of a second) between null events */
SysEnvRec NAsysenv;						/* set up by Initialize */
Boolean NAinBack = false;				/* true when app is in the background */
short NAlastmouse = NA_RELEASE;			/* the last mouse event type */
long NAmousetime = 0;					/* the time of the last mouse up */
Point NAmousept;						/* the point (local) of last mouse down */

THz NAappzone;							/* the application heap zone */
RgnHandle NAfullRgn;					/* a region containing everything */
RgnHandle NAnullRgn;					/* a region containing nothing */
Cursor NAibeam;							/* the Ibeam cursor */
long NAgestaltBits;						/* flags for gestalt options */

/* private globals */
static Point	mselpoint;				/* the menu selection point */
static short	aestatus;				/* if set, close everything */

/* constants for DoDraw procedure */
#define	DO_UPDATE		0x0
#define DO_RESIZE		0x1
#define DO_ACTIVATE		0x2
#define DO_DEACTIVATE	0x4

/* private routines */

static na_win **GetWinH(WindowPtr);
static void DoDraw(na_win*, short);
static short DoActivate(WindowPtr, na_win*, Boolean, Point p);
static short DoMenu(na_win*, BYTE);
static void AdjustCursor(na_win*, Point, Boolean);
static short aboutmouse(na_win*, Point, short, short);

/* get the handle to a window
 */
static na_win **GetWinH(window)
	WindowPtr	window;
{
	na_win		**winh;
	
	/* make positively sure that we have a valid handle */
	if (window != (WindowPtr) NULL && !NAisDAWindow(window)) {
#ifdef DEBUG
		if (PtrZone((Ptr) window) == NAappzone && MemError() == noErr) {
#endif
			if ((winh = (na_win **) GetWRefCon(window)) != (na_win**) NULL) {
#ifdef DEBUG
				if (HandleZone((Handle) winh) == NAappzone && MemError() == noErr) {
					if ((*winh)->pwin == window) {
#endif
						return (winh);
#ifdef DEBUG
					} else {
						NAdebug("Corrupted window structure found.\015");
						NAdebug("handle: %lx, pwin: %lx, window: %lx\015",
							(long) winh, (long) (*winh)->pwin, (long) window);
						Debugger();
					}
				} else {
					NAdebug("Corrupted Handle Zone Found.\015");
					NAdebug("handle: %lx, error: %ld\015", (long) winh,
						(long) MemError());
					Debugger();
				}		
#endif
			}
#ifdef DEBUG
		} else {
			NAdebug("Corrupted Window Pointer Found.\n");
			NAdebug("Pointer: %lx, error: %ld\n", (long) window, (long) MemError());
			Debugger();
		}
#endif
	}
	return ((na_win**) NULL);
}

/* handle drawing controls & growbox for update/activate events
 */
#ifdef __STDC__
static void DoDraw(na_win *winp, short how)
#else
static void DoDraw(winp, how)
	na_win	*winp;
	short	how;
#endif
{
	WindowPtr	window = winp->pwin;
	long		flags = winp->flags;

	/* hilite or draw controls as appropriate */
	if (flags & NA_HASCONTROLS) {
		if (how & (DO_ACTIVATE | DO_DEACTIVATE)) {
			if (flags & NA_HILITECTRLS) {
				ControlHandle ctrl;
	
				for (ctrl = ((WindowPeek) window)->controlList; ctrl;
						ctrl = (*ctrl)->nextControl) {
					HiliteControl(ctrl, (how & DO_ACTIVATE) ? 0 : 255);
				}
			}
		} else {
			DrawControls(window);
		}
	}
	
	/* draw the grow box properly -- mask out scroll bar outlines */
	if (flags & NA_GROWBOX) {
		Rect				tmpRect;
		RgnHandle	tmpRgn = window->clipRgn;

		tmpRect.left = (tmpRect.right = window->portRect.right) - 15;
		tmpRect.top = (tmpRect.bottom = window->portRect.bottom) - 15;
		RectRgn(window->clipRgn = NewRgn(), &tmpRect);
		DrawGrowIcon(window);
		DisposeRgn(window->clipRgn);
		window->clipRgn = tmpRgn;
	}
	
	/* draw the default button on a dialog */
	if (flags & NA_DEFBUTTON) NAdefaultButton(window);
	
	/* calculate the un-cursor region if the window size changed */
	if (how & DO_RESIZE) NAcalcCursor(winp);
}

/* handle activate event (either activate or MultiFinder suspend/resume)
 */
#ifdef __STDC__
static short DoActivate(WindowPtr window, na_win *winp, Boolean activate, Point p)
#else
static short DoActivate(window, winp, activate, p)
	WindowPtr			window;
	na_win		*winp;
	Boolean	activate;
	Point				p;
#endif
{
	na_win **winh;
	short	status = NA_NOTPROCESSED;

	/* unlock current front window */
	if (winp != (na_win*) NULL) {
		NAunlockWindow(winp);
		NAwin = (na_win*) NULL;
	}
	
	/* check if there is a new window, and lock it */
	if (window == (WindowPtr) NULL)  return (NA_PROCESSED);
	
	/* for app windows, update the cursor, call the activate proc, and DoDraw */
	if ((NAwin = winp = NAlockWindow(winh = GetWinH(window))) != (na_win*) NULL) {
		GrafPtr			tmpPort;

		GetPort(&tmpPort);
		SetPort(window);
		if (winp->cursorRgn != (RgnHandle) NULL && ((activate && !NAinBack)
				|| winp->flags & NA_CURSORON)) {
			LocalToGlobal(&p);
			AdjustCursor(winp, p, activate);
		}
		if (winp->activep == (na_activep) NULL
				|| (status = (*winp->activep)(winp, activate)) == NA_NOTPROCESSED) {
			DoDraw(winp, activate ? DO_ACTIVATE : DO_DEACTIVATE);
		}
		if (!activate || winp->pwin != FrontWindow()) {
			SetPort(tmpPort);
			NAunlockWindowh(winh, winp);
			NAwin = (na_win*) NULL;
		}
	}
	
	return (status);
}

/* handle menu selection -- either menu click or menu shortcut
 */
#ifdef __STDC__
static short DoMenu(na_win *winp, BYTE key)
#else
static short DoMenu(winp, key)
	na_win		*winp;
	BYTE		key;
#endif
{
	WindowPtr	window = FrontWindow();
	short 		status = NA_NOTPROCESSED;
	WORD		menuid, itemno;
	
	/* enable/disable edit menu as appropriate */
	if (NAhasedit) {
		MenuHandle	mnu = GetMHandle(mEdit);
		
		if (NAisDAWindow(window)) {
			EnableItem(mnu, iUndo);
			for (itemno = iCut; itemno <= iClear; itemno++) {
				EnableItem(mnu, itemno);
			}
		} else {
			DisableItem(mnu, iUndo);
			for (itemno = iCut; itemno <= iClear; itemno++) {
				DisableItem(mnu, itemno);
			}
		}
	}
	
	/* enable/disable the close menu as appropriate */
	if (NAcloseitem) {
		MenuHandle	mnu = GetMHandle(mFile);
		
		if (window != (WindowPtr) NULL && (winp == (na_win*) NULL
				|| winp->pwin != window || winp->flags & NA_CLOSEBOX)) {
			EnableItem(mnu, NAcloseitem);
		} else {
			DisableItem(mnu, NAcloseitem);
		}
	}
	
	/* call menu proc to enable/disable items as appropriate */
	if (winp != (na_win*) NULL && winp->menup != (na_menup) NULL) {
		status = (*winp->menup)(winp, (WORD) 0, (WORD) key);
	}
	if (status == NA_NOTPROCESSED && NAmenup != (na_menup) NULL) {
		status = (*NAmenup)(winp, (WORD) 0, (WORD) key);
	}
	if (status != NA_NOTPROCESSED) return (status);
	
	/* get menu selection */
	{
		long	menusel = (key == 0) ? MenuSelect(mselpoint) : MenuKey(key);

		itemno = LOWORD(menusel);
		if ((menuid = HIWORD(menusel)) == 0) menuid = 1;
	}
	
	/* check for DA menu items */
	switch (menuid) {
		case mApple:	/* check for a desk accessary selection */
			if (itemno > NAappleitems) {
				PCstr			mItem[256];
			
				GetItem(GetMHandle(menuid), itemno, mItem);
				OpenDeskAcc(mItem);
				menuid = 1;
			}
			break;
		
		case mFile:		/* check for the close menu item for DAs */
			if (itemno == NAcloseitem && NAisDAWindow(window)) {
				CloseDeskAcc(((WindowPeek) window)->windowKind);
				menuid = 1;
			}
			break;
	
		case mEdit: 	/* check for the edit menu for DAs */
			if (NAhasedit && itemno <= iClear && SystemEdit(itemno - iUndo)) {
				menuid = 1;
			}
			break;
	}
	
	/* call menu proc to handle/disable items */
	if (winp != (na_win*) NULL && winp->menup != (na_menup) NULL) {
		status = (*winp->menup)(winp, menuid, itemno);
	}
	if (status != NA_PROCESSED && NAmenup != (na_menup) NULL) {
		status = (*NAmenup)(winp, menuid, itemno);
	}
	
	/* if close item wasn't processed, process it */
	if (status == NA_NOTPROCESSED && menuid == mFile && itemno == NAcloseitem) {
		status = NA_REQCLOSE;
	}
	
	/* turn off the menu */
	HiliteMenu(0);
	
	return (status);
}

/* set the cursor icon appropriately
 */
#ifdef __STDC__
static void AdjustCursor(na_win *winp, Point gmouse, Boolean active)
#else
static void AdjustCursor(winp, gmouse, active)
	na_win	*winp;
	Point			gmouse;
	Boolean			active;
#endif
{
	short	status = NA_NOTPROCESSED;
	
	/* don't change the cursor when in wrong window */
	if (active && FrontWindow() != winp->pwin) return;
	
	/* if the cursor is on */
	if (winp->flags & NA_CURSORON) {
		/* and the point moves outside the cursor region or window is deactivated
		 * turn cursor off */
		if (!active || PtInRgn(gmouse, winp->uncrsrRgn)) {
			winp->flags &= ~NA_CURSORON;
			if (winp->cursorp == (na_cursorp*) NULL) {
				SetCursor(&QD(arrow));
			} else {
				goto DOCURSORP;
			}
		}
	
	/* if the cursor is off and the point moves into the window, turn cursor on */
	} else if (PtInRgn(gmouse, winp->cursorRgn)) {
		winp->flags |= NA_CURSORON;
		if (winp->cursorp == (na_cursorp) NULL) {
			SetCursor(&NAibeam);
		} else {
		DOCURSORP:
			GlobalToLocal(&gmouse);
			status = (*winp->cursorp)(winp, gmouse);
		}
	}
	
	/* if cursor event was processed, reset the un-cursor region */
	if (status == NA_PROCESSED) NAcalcCursor(winp);
}


/* export routines */

/* save the current window position in a resource file
 */
void NAsaveWin(winp)
	na_win	*winp;
{
	Rect		*rptr;
	WindowPtr	window = winp->pwin;
	Handle		wind = GetResource('WIND', winp->resid);
	
	HLock(wind);
	rptr = (Rect *) *wind;
	rptr->right = (rptr->left = -window->portBits.bounds.left)
		+ window->portRect.right;
	rptr->bottom = (rptr->top = -window->portBits.bounds.top)
		+ window->portRect.bottom;
	ChangedResource(wind);
	HUnlock(wind);
}

/* calculate the cursor regions for Multi-Finder
 */
void NAcalcCursor(winp)
	na_win	*winp;
{
	if (winp->cursorRgn != (RgnHandle) NULL) {
		if (winp->uncrsrRgn == (RgnHandle) NULL)  winp->uncrsrRgn = NewRgn();
		DiffRgn(NAfullRgn, winp->cursorRgn, winp->uncrsrRgn);
	}
}

/* lock a window context
 */
na_win *NAlockWindow(winh)
	na_win **winh;
{
	if (winh == (na_win**) NULL) return ((na_win*) NULL);
	if (!(*winh)->locks++) {
		MoveHHi((Handle) winh);
		HLock((Handle) winh);
	}
	
	return (*winh);
}

/* request or force a window to close
 */
#ifdef __STDC__
short NAcloseWindow(na_win *winp, short status)
#else
short NAcloseWindow(winp, status)
	na_win	*winp;
	short	status;
#endif
{
	na_win	**winh, ***whp;
	short childstatus;
	na_closep closeproc = (na_closep) NULL;
	
	if (winp == (na_win*) NULL) return (NA_NOTPROCESSED);
	switch (status) {
		case NA_REQCLOSE:
			/* check if window ready to close */
			status = NA_CLOSED;
			if ((closeproc = winp->closep) != (na_closep) NULL) {
				status = (*closeproc)(winp);
				closeproc = winp->closep == closeproc ? (na_closep) NULL : closeproc;
			}
			if (status > NA_CLOSED)		break;
		case NA_CLOSED:
			/* close children */
			childstatus = NAcloseWindows(winp->child, NA_REQCLOSEALL);
			/* clear current window */
			if (winp == NAwin) NAwin = (na_win*) NULL;
			/* reset the cursor */
			if (winp->flags & NA_CURSORON) SetCursor(&QD(arrow));
			/* dispose of any cursor regions */
			if (winp->cursorRgn != (RgnHandle) NULL) DisposeRgn(winp->cursorRgn);
			if (winp->uncrsrRgn != (RgnHandle) NULL) DisposeRgn(winp->uncrsrRgn);
			/* close the window */
			if (winp->pwin != (WindowPtr) NULL) {
				if (winp->flags & NA_DIALOGWINDOW) {
					DisposDialog((DialogPtr) winp->pwin);
				} else {
					DisposeWindow(winp->pwin);
				}
			}
			/* remove from window list */
			winh = (na_win**) RecoverHandle((Ptr) winp);
#ifdef DEBUG
			if (MemError() != noErr || *winh != winp) {
				NAdebug("Handle error: pointer: %x, handle: %x, error: %d, zone: %x\015",
					(long) winp, (long) winh, (long) MemError(),
					(long) GetZone());
				Debugger();
			}
#endif /* DEBUG */
			whp = &NAhead;
			if (winp->parent != (na_win**) NULL) whp = &(*winp->parent)->child;
			while (*whp != (na_win**) NULL) {
				if (*whp == winh) {
					*whp = winp->next;
				} else {
					whp = &(**whp)->next;
				}
			}
			/* relink children in list */
			if (childstatus > NA_ALLCLOSED) {
				*whp = winp->child;
				do {
					(**whp)->parent = winp->parent;
					whp = &(**whp)->next;
				} while (*whp != (na_win**) NULL);
				*whp = winp->next;
			}
			/* remove from task list */
			whp = &NAtask;
			while (*whp != (na_win**) NULL && *whp != winh) {
				whp = &(**whp)->task;
			}
			*whp = winp->task;
			NActask = (na_win**) NULL;
			/* after-close function */
			if (closeproc != (na_closep) NULL) (*closeproc)(winp);
			/* destroy window structure */
			DisposHandle((Handle) winh);
			if (status < NA_CLOSED) {
				if ((status = NAcloseWindows(NAhead, status)) > NA_CLOSED) {
					status = NA_CLOSED;
				}
			}
			break;
	}
	
	return (status);			
}

#ifdef __STDC__
short NAcloseWindows(na_win **winh, short status)
#else
short NAcloseWindows(winh, status)
	na_win	**winh;
	short			status;
#endif
{
	na_win	*winp, **lasth;
	short	substatus;
	
	while ((winp = NAlockWindow(winh)) != (na_win*) NULL) {
		lasth = winh;
		winh = winp->next;
		substatus = NAcloseWindow(winp, status + 2);
		if (substatus > NA_CLOSED) {
			NAunlockWindowh(lasth, winp);
			return (NA_NOTPROCESSED);
		}
		if (substatus < NA_CLOSED) return (substatus);
	}
	
	return (NA_ALLCLOSED);
}

/* remove the window on a mouse-up event
 */
#ifdef __STDC__
static short aboutmouse(na_win *winp, Point mousep, short type, short mods)
#else
static short aboutmouse(winp, mousep, type, mods)
	na_win	*winp;
	Point	mousep;
	short	type, mods;
#endif
#ifdef applec
#pragma unused (winp, mousep, mods)
#endif
{
	return (type & 1 ? NA_REQCLOSE : NA_PROCESSED);
}

/* a standard about box init procedure
 */
short NAabout(winp, dptr)
	na_win	*winp;
	long	*dptr;
#ifdef applec
#pragma unused (dptr)
#endif
{
	short	item;
	
	ShowWindow(winp->pwin);
	winp->mousep = aboutmouse;
	
	return (NA_PROCESSED);
}

/* flash a button in a dialog box for equivalent keypresses
 */
#ifdef __STDC__
void NAflashButton(DialogPtr dialog, short item)
#else
void NAflashButton(dialog, item)
	DialogPtr	dialog;
	short		item;
#endif
{
	long	scratch;
	short	type;
	Handle	ctrl;
	Rect	box;
	
	GetDItem(dialog, item, &type, &ctrl, &box);
	if (type == ctrlItem + btnCtrl) {
		HiliteControl((ControlHandle) ctrl, 1);
		Delay(5, &scratch);
		HiliteControl((ControlHandle) ctrl, 0);
	}
}

/* draw the default button
 */
void NAdefaultButton(dialog)
	DialogPtr	dialog;
{
	Rect	tmpRect;
	
	NAgetDRect(dialog, iOk, &tmpRect);
	{
		PenState		pnState;
		
		GetPenState(&pnState);
		PenNormal();
		PenSize(3, 3);
		InsetRect(&tmpRect, -4, -4);
		FrameRoundRect(&tmpRect, 16, 16);
		SetPenState(&pnState);
	}
}

/* send an event message to all windows
 */
short NAallWindows(winh, pevent)
	na_win	**winh;
	EventRecord		*pevent;
{
	na_win *winp, **oldwinh;
	short	status = NA_NOTPROCESSED;
	
	while ((winp = NAlockWindow(winh)) != (na_win*) NULL) {
		oldwinh = winh;
		winh = winp->next;
		if (winp->miscp != (na_miscp) NULL) {
			GrafPtr	tempPort;
			
			GetPort(&tempPort);
			SetPort(winp->pwin);
			status = (*winp->miscp)(winp, pevent);
			SetPort(tempPort);
		}
		if ((status == NA_CLOSED || status == NA_REQCLOSE)
				&& NAcloseWindow(winp, status) == NA_CLOSED) {
			continue;
		}
		NAunlockWindowh(oldwinh, winp);
		if (status == NA_ALLCLOSED || status == NA_REQCLOSEALL) {
			if (NAcloseWindows(NAhead, status) == NA_ALLCLOSED) {
				return (NA_ALLCLOSED);
			}
			/* make sure our handle is still valid */
			if (GetHandleSize((Handle) oldwinh) == 0) continue;
		}
		if ((*oldwinh)->child != (na_win**) NULL &&
				NAallWindows((*oldwinh)->child, pevent) == NA_ALLCLOSED) {
			return (NA_ALLCLOSED);
		}
	}
	
	return (NA_PROCESSED);
}

/* apple event handler
 */
pascal OSErr NArequiredAE(AppleEvent *, AppleEvent *, long);
pascal OSErr NArequiredAE(event, reply, ref)
	AppleEvent *event, *reply;
	long ref;
{
	na_openp openp = (na_openp) ref;
	OSErr err;
	DescType actualType, eventID;
	Size actualSize;
	AEDescList doclist;
	long count, i;
	short gotdoc;
	FSSpec fspec;
	AEKeyword keywd;
	
	err = AEGetAttributePtr(event, keyEventIDAttr, typeType, &actualType,
		(Ptr) &eventID, sizeof (eventID), &actualSize);
	if (err == noErr) {
		gotdoc = 0;
		if (eventID == kAEOpenDocuments || eventID == kAEPrintDocuments) {
			err = AEGetParamDesc(event, keyDirectObject, typeAEList, &doclist);
			if (err == noErr) gotdoc = 1;
		}
		if (err == noErr) {
			err = AEGetAttributePtr(event, keyMissedKeywordAttr, typeWildCard,
				&actualType, NULL, 0, &actualSize);
			if (err == errAEDescNotFound) {
				err = noErr;
			} else if (err == noErr) {
				err = errAEEventNotHandled;
			}
		}
		if (err == noErr) switch (eventID) {
			case kAEOpenApplication:
				if (NAmenup && NAnewitem) {
					aestatus = (*NAmenup)(NULL, mFile, NAnewitem);
				}
				break;
			case kAEOpenDocuments:
			case kAEPrintDocuments:
				err = AECountItems(&doclist, &count);
				if (err != noErr) break;
				for (i = 1; i <= count; ++i) {
					err = AEGetNthPtr(&doclist, i, typeFSS, &keywd, &actualType,
						(Ptr) &fspec, sizeof (fspec), &actualSize);
					if (err != noErr) break;
					if (!openp || (*openp)(eventID == kAEOpenDocuments
								? appOpen : appPrint, 0, &fspec) < 0) {
						err = errAEEventNotHandled;
						break;
					}
				}
				break;
			case kAEQuitApplication:
				aestatus = NA_ALLCLOSED;
				if (NAhead != NULL) {
					aestatus = NAcloseWindows(NAhead, NA_REQCLOSEALL);
					if (aestatus != NA_ALLCLOSED) err = userCanceledErr;
				}
				break;
		}
		if (gotdoc) {
			AEDisposeDesc(&doclist);
		}
	}
	
	return (err);
}

/* call the main loop procedure
 */
void NAmainloop()
{
	na_win		*winp;
	Boolean	gotEvent;
	Boolean	dialogAction;
	EventRecord			event;
	Point				mouse;
	short		status;
	short				itemHit;
	DialogPtr			dialog;
	
	UnloadSeg((Ptr) NAinit);		/* unload the initialize routine */
	
	MAINLOOP:
	/* check for a window in front */
	{
		WindowPtr	window;
		
		if ((winp = NAwin) == (na_win*) NULL
				&& (window = FrontWindow()) != (WindowPtr) NULL
				&& (NAwin = winp = NAlockWindow(GetWinH(window))) != (na_win *) NULL) {
			SetPort(window);
		}
	}

	/* get an event */
	{
		RgnHandle	rgn = NAfullRgn;
		short		delay = NAdelay;
		
		/* if there is an app window in front, use app delay & cursor region */
		if (winp != (na_win*) NULL) {
			delay = winp->delay;
			if (winp->cursorRgn != (RgnHandle) NULL && !NAinBack) {
				rgn = winp->cursorRgn;
				if (!(winp->flags & NA_CURSORON)) rgn = winp->uncrsrRgn;
			}
			if (winp->mousepix && !(NAlastmouse & 1)) {
				rgn = NAnullRgn;
				delay = 0;
			}
		}
		gotEvent = WaitNextEvent(everyEvent, &event, delay, rgn);
	}
	status = NA_NOTPROCESSED;
	
	/* get mouse position */
	mouse = event.where;
	GlobalToLocal(&mouse);
	
	/* check for dialog events */
	dialogAction = FrontWindow() != (WindowPtr) NULL ? IsDialogEvent(&event) : false;
	if (dialogAction && event.what != keyDown && event.what != autoKey
			&& event.what != updateEvt) {
		ControlHandle	ctrl;
		
		if (DialogSelect(&event, &dialog, &itemHit) && winp != (na_win*) NULL) {
	DOCONTROLP:
			if (winp->ctrlp != (na_ctrlp) NULL) {
				NAgetDHandle(dialog, itemHit, &ctrl);
				status = (*winp->ctrlp)(winp, mouse, itemHit, event.modifiers, ctrl);
				gotEvent = false;
			}
		}
	}
				
	/* handle the event */
	if (gotEvent) switch (event.what) {
		case mouseUp:
			/* deal with mouse up events to keep track of double/triple clicks */
			if (NAlastmouse & 1) break;
			++NAlastmouse;
			NAmousetime = TickCount();
			if (winp == (na_win*) NULL) break;
		DOMOUSEP:
			if (winp->mousep != (na_mousep) NULL) {
				status = (*winp->mousep)(winp, mouse, NAlastmouse, event.modifiers);
			}
			break;

		case mouseDown:
			if (winp != (na_win*) NULL && winp->flags & NA_MODAL
					&& !PtInRect(mouse, &winp->pwin->portRect)) {
				SysBeep(10);
				break;
			}
			{
				short	part;
				WindowPtr		window;
				
				/* deal with mouse down events */
				switch (part = FindWindow(event.where, &window)) {
					case inMenuBar:
						/* call an appropriate menu bar handler */
						mselpoint = event.where;
						status = DoMenu(winp, 0);
						break;
						
					case inSysWindow:
						/* System Click in DA */
						SystemClick(&event, window);
						break;
	
					case inContent:
						/* click a window to front if not in front */
						if (window != FrontWindow()) {
							SelectWindow(window);
							if (winp != (na_win*) NULL) NAunlockWindow(winp);
							NAwin = (na_win*) NULL;
							NAlastmouse = NA_RELEASE;
							break;
						}
						
						/* don't bother processing further if no mouse proc */
						if (winp == (na_win*) NULL) break;
	
						/* check for control events */
						if (winp->ctrlp != (na_ctrlp) NULL && winp->flags & NA_HASCONTROLS) {
							ControlHandle	hctl;
							short	item;
							
							if ((item = FindControl(mouse, window, &hctl)) != 0
									&& (status = (*winp->ctrlp)(winp, mouse, item,
									event.modifiers, hctl)) != NA_NOTPROCESSED) {
								break;
							}
						}
						
						/* deal with double clicks */
						if ((NAlastmouse & 1) && NAlastmouse < NA_RELEASE
								&& event.when - NAmousetime <= GetDblTime()) {
							if (++NAlastmouse > NA_DOWNN) NAlastmouse = NA_DOWNN;
						} else {
							NAlastmouse = NA_DOWN1;
						}
						NAmousept = mouse;
						
						/* call the mouse handler */
						goto DOMOUSEP;
	
					case inDrag:
						/* drag the window */
						{
							Rect 			tmpRect, bRect;
							na_win	**wh, *wp;
							
							{
								int		four = 4;
								
								tmpRect = QD(screenBits.bounds);
								InsetRect(&tmpRect, four, four);
							}
							bRect = window->portBits.bounds;
							DragWindow(window, event.where, &tmpRect);
							if ((bRect.left != window->portBits.bounds.left
									|| bRect.top != window->portBits.bounds.top) &&
									(wp = NAlockWindow(wh = GetWinH(window))) != NULL) {
								if (wp->flags & NA_SMARTSIZE) NAsaveWin(wp);
								if (wp->cursorRgn != (RgnHandle) NULL) {
									OffsetRgn(wp->cursorRgn,
										bRect.left - window->portBits.bounds.left,
										bRect.top - window->portBits.bounds.top);
									NAcalcCursor(wp);
								}
								NAunlockWindowh(wh, wp);
							}
						}
						break;
					
					case inGoAway:
						/* deal with the close window box */
						if (TrackGoAway(window, event.where)) status = NA_REQCLOSE;
						break;
	
					case inGrow:
						/* grow the window */
						{
							Rect			tmpRect;
							long	growInfo;
							
							/* assume there is a valid app window in front */
							/* calculate min & max grow dimensions */
							tmpRect = QD(screenBits.bounds);
							tmpRect.bottom -= tmpRect.top;
							tmpRect.right -= tmpRect.left;
							tmpRect.top = winp->minh;
							tmpRect.left = winp->minw;
							if (winp->maxh) tmpRect.bottom = winp->maxh;
							if (winp->maxw) tmpRect.right = winp->maxw;
							
							/* check for resize proc */
							if (winp->resizep != (na_resizep) NULL) {
								status = (*winp->resizep)(winp, event.where, &tmpRect);
								if (status == NA_PROCESSED) break;
								goto RESIZEWINDOW;
							}
							
							/* grow, resize, and update the window */
							if ((growInfo = GrowWindow(window, event.where, &tmpRect))) {
								SizeWindow(window, LOWORD(growInfo), HIWORD(growInfo),
									false);
								goto RESIZEWINDOW;
							}
						}
						break;
					
					case inZoomIn:
					case inZoomOut:
						/* assume there is a valid app window in front */
						/* track, zoom, and update the window */
						if (TrackBox(window, event.where, part)) {
							SetPort(window);
							EraseRect(&window->portRect);
							ZoomWindow(window, part, true);
					RESIZEWINDOW:
							if (winp != (na_win*) NULL) {
								if (winp->flags & NA_SMARTSIZE) NAsaveWin(winp);
								if (winp->updatep == (na_updatep) NULL ||
										(status = (*winp->updatep)(winp, (Boolean) true))
										== NA_NOTPROCESSED) {
									DoDraw(winp, DO_RESIZE);
								}
							}
							ValidRect(&window->portRect);
						}
						break;
				}
			}
			break;
		
		case keyDown:
		case autoKey:
			/* deal with keyboard events */
			{
				long	key = event.message & charCodeMask;

				/* translate command-foo to an appropriate menu operation */
				if (!(winp->flags & NA_MODAL)) {
					if ((event.modifiers & cmdKey) && event.what == keyDown &&
							(status = DoMenu(winp, key)) != NA_NOTPROCESSED) {
						break;
					}
				}
				
				/* require an app window for further processing */
				if (winp == (na_win*) NULL) break;

				/* call the window's key handling procedure */
				if (winp->keyp != (na_keyp) NULL) {
					status = (*winp->keyp)(winp, winp->flags & NA_RAWKEY ? event.message : key,
						event.modifiers);
				}
				
				/* if it's an unprocessed event in a dialog window */
				if ((status == NA_NOTPROCESSED || status == NA_DPROCESSED)
					&& (winp->flags & NA_DIALOGWINDOW)) {
					ControlHandle	ctrl;
					
					/* check for return/ESC/command-. */
					itemHit = 0;
					if (status == NA_NOTPROCESSED) switch (key) {
						case '\r':
						case '\n':
							NAgetDHandle((DialogPtr)winp->pwin, iOk, &ctrl);
							if (ctrl && !(*ctrl)->contrlHilite) {
								itemHit = iOk;
							}
							break;
						
						case '.':
							if (!(event.modifiers & cmdKey)) break;
						case '\033':
							itemHit = iCancel;
							break;
					}
					
					/* if it's a special key, flash it's item */
					dialog = winp->pwin;
					if (itemHit) {
						NAflashButton(dialog, itemHit);
					} else if ((event.modifiers & cmdKey)
							|| !DialogSelect(&event, &dialog, &itemHit)) {
						break;
					}
					
					/* if there's a control procedure, call it, otherwise ignore */
					if (winp->ctrlp != (na_ctrlp) NULL) goto DOCONTROLP;
				}
			}
			break;
		
		case activateEvt:
			/* deal with activate windows based on activeFlag */
			status = DoActivate((WindowPtr) event.message, winp,
				event.modifiers & activeFlag, mouse);
			break;
			
		case updateEvt:
			/* deal with update events with proper port setting, etc. */
			{
				na_win		*wp;
				WindowPtr	window;
				na_win 				**winh;
				GrafPtr				tempPort;
				
				window = (WindowPtr) event.message;
				BeginUpdate(window);
				if ((wp = NAlockWindow(winh = GetWinH(window))) != (na_win*) NULL) {
					GetPort(&tempPort);
					SetPort(window);
					if (wp->flags & NA_DIALOGUPDATE) {
						UpdtDialog(window, window->visRgn);
						status = NA_PROCESSED;
					}
					if (wp->updatep == (na_updatep) NULL
							|| (status = (*wp->updatep)(wp, (Boolean) false))
							== NA_NOTPROCESSED) {
						DoDraw(wp, DO_UPDATE);
					}
					if (status == NA_NOTPROCESSED && dialogAction) {
						(void) DialogSelect(&event, &dialog, &itemHit);
					}
					SetPort(tempPort);
					NAunlockWindowh(winh, wp);
				}
				EndUpdate(window);
			}
			break;
		
		case diskEvt:
			/* let the user format bad disks */
			if (HIWORD(event.message) != noErr) {
				Point	ptemp;
				
				SetPt(&ptemp, 0x0070, 0x0050);
				(void) DIBadMount(ptemp, event.message);
			} else {
				status = NAallWindows(NAhead, &event);
			}
			break;
		
		case networkEvt:
		case driverEvt:
		case app1Evt:
		case app2Evt:
		case app3Evt:
			/* send event to all windows */
			status = NAallWindows(NAhead, &event);
			break;
		
		case osEvt:
			switch ((event.message >> 24) & 0xff) {
				case suspendResumeMessage:
					status = DoActivate(FrontWindow(), winp,
						!(NAinBack = !(event.message & resumeFlag)), mouse);
					break;
				
				case mouseMovedMessage:
					/* only interesting if a window is in front */
					if (NAinBack || winp == (na_win*) NULL) break;
					
					{
						short mousepix = winp->mousepix;
						
						/* deal with mouse dragging */
						if (mousepix && !(NAlastmouse & 1)) {
							if (NAlastmouse != NA_DRAG) {
								Rect	tmpRect;
								
								InsetRect(&tmpRect, -mousepix, -mousepix);
								if (PtInRect(mouse, &tmpRect)) break;
								NAlastmouse = NA_DRAG;
							}
							goto DOMOUSEP;
						
						/* deal with cursor moving in/out of window */
						} else if (winp->cursorRgn != (RgnHandle) NULL) {
							AdjustCursor(winp, event.where, true);
						}
					}
					break;
				}
			break;
		
		case kHighLevelEvent:
			if (NAgestaltBits & NA_HASAEVENTS) {
				aestatus = status;
				(void) AEProcessAppleEvent(&event);
				status = aestatus;
			}
			break;
	}
	
	/* call the idle procedure of the front window */
	if ((winp = NAwin) != (na_win*) NULL && !NAinBack
			&& status >= NA_NOTPROCESSED && winp->idlep != (na_idlep) NULL) {
		status = (*winp->idlep)(winp);
	}
	
	/* deal with window/app close requests and events */
	switch (status) {
		case NA_ALLCLOSED:
		case NA_REQCLOSEALL:
			status = NAcloseWindows(NAhead, status);
			break;
			
		case NA_CLOSED:
		case NA_REQCLOSE:
			status = NAcloseWindow(winp, status);
			break;
		
		default:
			/* call the next task procedure */
			if (NAtask != (na_win**) NULL) {
				static BYTE		prioritycnt;
				na_win *wp;
				GrafPtr			tempPort;
				
				if (NActask == (na_win**) NULL) {
					NActask = NAtask;
					prioritycnt = (*NAtask)->priority;
				}
				if ((wp = NAlockWindow(NActask)) != (na_win*) NULL
						&& wp->taskp != (na_taskp) NULL) {
					GetPort(&tempPort);
					if (wp->pwin != (WindowPtr) NULL) SetPort(wp->pwin);
					switch (status = (*wp->taskp)(wp)) {
						case NA_REQCLOSE:
						case NA_CLOSED:
							NAcloseWindow(wp, status);
							break;
					}
					SetPort(tempPort);
				}
				if (!prioritycnt-- && (NActask = wp->task) != (na_win**) NULL) {
					prioritycnt = (*NActask)->priority;
				}
				NAunlockWindowh(NActask, wp);
			}
			break;
	}
	if (status != NA_ALLCLOSED) goto MAINLOOP;
	
	while (NAtask != NULL) NAcloseWindow(NAlockWindow(NAtask), NA_REQCLOSE);
	
	DisposeRgn(NAfullRgn);
	DisposeRgn(NAnullRgn);
}

/* position a rectangle based on screen size
 */ 
#ifdef __STDC__
Rect *NAscreenrect(short position)
#else
Rect *NAscreenrect(position)
	short position;
#endif
{
	static short	stacktimes = 0;
	static Rect		sb;
	short topoffset, leftoffset;
			
	/* calculate the position to open the window */
	{
		int		four = 4;
		
		sb = QD(screenBits.bounds);
		InsetRect(&sb, four, four);
		sb.top += MBarHeight;
	}
	if (position & NA_TITLEOFFSET) {
		sb.top += 18;
	}
	{
		short 	width, height;
		
		width = sb.right - sb.left;
		height = sb.bottom - sb.top;
		if (position & 0x03) {
			width = (width * (position & 0x03)) >> 2;
		}
		if (position & 0x0c) {
			height = (height * ((position & 0x0c) >> 2)) >> 2;
		}
		if (position & NA_TOPSCN) {
			sb.bottom = sb.top + height;
		} else if (position & NA_BOTTOMSCN) {
			sb.top = sb.bottom - height;
		} else {
			short bw = (sb.bottom - sb.top - height) >> 1;
			sb.top += bw;
			sb.bottom -= bw;
		}
		if (position & NA_LEFTSCN) {
			sb.right = sb.left + width;
		} else if (position & NA_RIGHTSCN) {
			sb.left = sb.right - width;
		} else {
			short bw = (sb.right - sb.left - width) >> 1;

			sb.left += bw;
			sb.right -= bw;
		}
		if (position & NA_STACK) {
			if (stacktimes >= 5) {
				stacktimes = 0;
			}
			topoffset = 22 * stacktimes;
			leftoffset = (4 - stacktimes) * 4;
			if (sb.top + topoffset < sb.bottom) sb.top += topoffset;
			if (sb.left + leftoffset < sb.right) sb.left += leftoffset;
			++stacktimes;
		}
	}
	
	return (&sb);
}

/* create a new window/dialog/task structure
 */
#ifdef __STDC__
short NAwindow(Rect *rpos, long flags, char *title, short res, long *initdata,
	long datasize, na_initp initp)
#else
short NAwindow(rpos, flags, title, res, initdata, datasize, initp)
	Rect			*rpos;
	long	flags;
	char			*title;
	short			res;
	long			*initdata;
	long			datasize;
	na_initp		initp;
#endif
{
	GrafPtr			tmpPort;
	short			procID;
	short	status;
	Boolean			goAwayFlag, visible;
	na_win	**winh, *winp;
	WindowPtr		behind, prev;
	PCstr			wtitle[256];
	
	/* save previous window */
	prev = FrontWindow();
	
	/* set up flags for the NewWindow call */
	goAwayFlag = (flags & NA_CLOSEBOX);
	visible = (flags & NA_NOTVISIBLE) ? false : true;
	behind = (flags & NA_BEHIND && NAwin != (na_win*) NULL) ? NAwin->pwin : (WindowPtr) -1;
	
	/* decide on the correct procID */
	{
		short	proc = rDocProc;
			
		if ((flags & NA_ROUNDBORDER) != NA_ROUNDBORDER) {
			proc = plainDBox;
			if (flags & NA_SHADOWBORDER)	proc = altDBoxProc;
			if (flags & NA_DOUBLEBORDER)	proc = dBoxProc;
			if (flags & NA_TITLEBAR)		proc = documentProc;
			if (!(flags & NA_GROWBOX)
				&& proc == documentProc)	proc |= noGrowDocProc;
			if (flags & NA_ZOOMBOX)			proc |= zoomDocProc;
		}
		procID = proc;
	}
	
	/* get the window title to a pacsal string */
	if (title) CtoPCstrcpy(wtitle, title);
		
	/* allocate memory and copy the user data */
	if (!datasize) datasize = sizeof (na_win);
	winh = (na_win**) NewHandleClear((Size) datasize);
	if (winh == (na_win**) NULL) return (NA_NOTPROCESSED);
	MoveHHi((Handle) winh);
	HLock((Handle) winh);
	winp = *winh;
	if (initdata != NULL && flags & NA_COPYDATA) {
		char *newdata;
		char *dcopy = (char *) initdata;
		
		datasize -= sizeof (na_win);
		for (newdata = (char*) winp + sizeof (na_win); datasize > 0; datasize--) {
			*newdata = *dcopy++;
			newdata++;
		}
	}
	
	/* initialize winp parameters */
	winp->locks = 1;
	winp->delay = NAdelay;
	winp->flags = flags;
	winp->minw = 128;
	winp->minh = 64;
	winp->resid = res;
		
	/* install in window tree */
	if (flags & NA_CHILDWINDOW && NAwin != (na_win*) NULL) {
		winp->parent = (na_win**) RecoverHandle((Ptr)NAwin);
		winp->next = NAwin->child;
		NAwin->child = winh;
	} else {
		winp->next = NAhead;
		NAhead = winh;
	}
	
	/* install in task list */
	if (flags & NA_HASTASK) {
		winp->task = NAtask;
		NAtask = winh;
	}
	
	{
		WindowPtr	window;
		
		/* open the window appropriately */
		switch (flags & (NA_COLORWINDOW | NA_DIALOGWINDOW)) {
			case NA_DIALOGWINDOW:
			case (NA_DIALOGWINDOW | NA_COLORWINDOW):
				if (flags & NA_USERESOURCE) {
					window = (WindowPtr) GetNewDialog(res, (Ptr) NULL, behind);
				} else {
					Handle items;
					
					items = GetResource('DITL', res);
					DetachResource(items);
					if (flags & NA_COLORWINDOW) {
						window = (WindowPtr) NewCDialog((Ptr) NULL, rpos, wtitle,
							visible, procID, behind, goAwayFlag, (long) winh, items);
					} else {
						window = (WindowPtr) NewDialog((Ptr) NULL, rpos, wtitle,
							visible, procID, behind, goAwayFlag, (long) winh, items);
					}
				}
				break;
				
			case NA_COLORWINDOW:
				if (flags & NA_USERESOURCE) {
					window = (WindowPtr) GetNewCWindow(res, (Ptr) NULL, behind);
				} else {
					window = (WindowPtr) NewCWindow((Ptr) NULL, rpos, wtitle,
						visible, procID, behind, goAwayFlag, (long) winh);
				}
				break;
			
			default:
				if (flags & NA_USERESOURCE) {
					window = GetNewWindow(res, (Ptr) NULL, behind);
				} else {
					window = NewWindow((Ptr) NULL, rpos, wtitle, visible, procID,
						behind, goAwayFlag, (long) winh);
				}
				break;
		}
		if (title && (flags & NA_USERESOURCE)) SetWTitle(window, wtitle);
		winp->pwin = window;
	
		/* activate the window */
		GetPort(&tmpPort);
		SetPort(window);
	
		/* additional options for windows from resources */
		if (flags & NA_USERESOURCE) {
			SetWRefCon(window, (long) winh);
			
			/* force the size */
			if (flags & NA_FORCESIZE) {
				MoveWindow(window, rpos->left, rpos->top, false);
				SizeWindow(window, rpos->right - rpos->left, rpos->bottom - rpos->top, false);
			}
		}
		{
			Rect wsize, sb;
				
			/* get the screen bounds */
			{
				short	four = 4;
				
				sb = QD(screenBits.bounds);
				InsetRect(&sb, four, four);
			}
			
			/* recenter a window -- great for dialog boxes */	
			wsize = window->portRect;
			LocalToGlobal((Point *)&wsize.top);
			if (flags & NA_RECENTER) {
				LocalToGlobal((Point *)&wsize.bottom);
				wsize.top = sb.top + (((sb.bottom - sb.top) - (wsize.bottom - wsize.top)) >> 1);
				wsize.left = sb.left + (((sb.right - sb.left) - (wsize.right - wsize.left)) >> 1);
				MoveWindow(window, wsize.left, wsize.top, false);
			}
			
			/* make sure the window is on the screen */
			if (wsize.top > sb.bottom || wsize.left > sb.right) {
				short coord = 60;
				
				MoveWindow(window, coord, coord, false);
			}
		}
		
		/* call the init procedure */
		if ((status = (*initp)(winp, initdata)) >= NA_NOTPROCESSED) {
		
			/* draw the window immediately for better look & update has first newsize */
			if (winp->updatep == (na_updatep) NULL
					|| (status = (*winp->updatep)(winp, (Boolean) true))
					== NA_NOTPROCESSED) {
				DoDraw(winp, FrontWindow() != window ? DO_RESIZE | DO_DEACTIVATE :
					DO_RESIZE);
			}
			if (flags & NA_DIALOGUPDATE) DrawDialog(window);
			ValidRect(&window->portRect);
		}
	
		/* deal with close requests/events result codes */
		switch (status) {
			case NA_ALLCLOSED:
			case NA_REQCLOSEALL:
				status = NAcloseWindows(NAhead, status);
				break;
	
			case NA_CLOSED:
			case NA_REQCLOSE:
				status = NAcloseWindow(winp, status);
				break;
			
			default:
				NAunlockWindowh(winh, winp);
				break;
		}
		
		/* give a nice return value & clean up the port */
		if (status == NA_NOTPROCESSED)							status = NA_PROCESSED;
		if (FrontWindow() != window || status != NA_PROCESSED)	SetPort(tmpPort);
	}
	
	return (status);
}

/* add a new task to the task list, calling init procedure with data pointer
 */
void NAaddtask(taskp, size)
	na_taskp taskp;
	long size;
{
	na_win **task, *winp;
	
	if (!size) size = sizeof (na_win);
	task = (na_win **) NewHandleClear(size);
	(*task)->taskp = taskp;
	(*task)->task = NAtask;
	NAtask = task;
}
