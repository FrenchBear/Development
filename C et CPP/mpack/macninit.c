/* macninit.c -- general mac nifty application library initialization
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

#ifndef THINK_C
#include <Fonts.h>
#include <SegLoad.h>
#include <OSEvents.h>

extern void _DataInit();			/* MPW initialize routine */
#endif
#include <Traps.h>
#include <AppleEvents.h>
#include <GestaltEqu.h>
#include "macnapp.h"

extern pascal OSErr NArequiredAE(AppleEvent *, AppleEvent *, long);

#ifndef _Unimplemented
#define _Unimplemented					0xA89F
#endif
#ifndef _WaitNextEvent
#define _WaitNextEvent					0xA860
#endif
#ifndef _Gestalt
#define _Gestalt						0xA1AD
#endif

/* global to hold the application heap zone */
extern THz NAappzone;

static Boolean TrapAvailable(short);

/* this checks if a given trap is available on the system
 */
static Boolean TrapAvailable(short tNumber)
{
	short numtraps = 0x400;
	TrapType tType;
	
	tType = tNumber & 0x800 ? ToolTrap : OSTrap;
	if (tType == ToolTrap) {
		if (NGetTrapAddress(_InitGraf, ToolTrap)
			== NGetTrapAddress(0xAA6E, ToolTrap)) {
			numtraps = 0x200;
		}
		tNumber = tNumber & 0x07FF;
		if (tNumber >= numtraps)
			tNumber = _Unimplemented;
	}
	
	return (NGetTrapAddress(tNumber, tType)
			!= NGetTrapAddress(_Unimplemented, ToolTrap));
}

/* initialize the Macintosh managers and niftyapp internal variables.
 * call this first.  You may wish to call MoreMasters() after this.
 */
short NAinit(short minK, short masters, na_openp openp, na_menup menup,
	short numapple, short newitem, short closeitem)
 {
	long		total, contig, response;
	EventRecord event;
	short		count;
	Handle		menuBar;
	short		message, i, aeflag = 0;
	AppFile		afile;
	FSSpec		fspec;

#ifndef THINK_C
	UnloadSeg((Ptr) _DataInit);		/* unload MPW init routine */
#endif
	MaxApplZone();					/* expand heap so code loads at top */
	
	/* initialize all the managers */
	InitGraf((Ptr) &QD(thePort));
	InitFonts();
	InitWindows();
	InitMenus();
	TEInit();
	InitDialogs(NULL);
	InitCursor();
	
	/* allocate enough master pointers */
	for (count = 1; count <= masters; count++) {
		MoreMasters();
		if (MemError() != noErr) return (-1);
	}
	
	/* hack to bring to front in MultiFinder */
	for (count = 1; count <= 3; count++) EventAvail(everyEvent, &event);
		
	/* get the system environment */
	(void) SysEnvirons(1, &NAsysenv);
	
	/* verify we have 128K ROMS, WaitNextEvent is available, and we have enough memory */
	if (NAsysenv.machineType < 0
			|| !TrapAvailable(_WaitNextEvent)
			|| (long) GetApplLimit() - (long) ApplicZone() < minK) {
		return (-1);
	}
	
	/* check for Gestalt and set up Apple Event Handler */
	NAgestaltBits = 0;
	if (TrapAvailable(_Gestalt)) {
		NAgestaltBits = NA_HASGESTALT;
		if (Gestalt(gestaltAppleEventsAttr, &response) == noErr) {
			NAgestaltBits |= NA_HASAEVENTS;
			if (AEInstallEventHandler(kCoreEventClass, typeWildCard,
					NArequiredAE, (long) openp, FALSE) == noErr) {
				aeflag = 1;
			}
		}
	}
	
	/* clean up and check available free memory */
	PurgeSpace(&total, &contig);
	if (total < minK) return (-1);
	
	/* store our application heap zone */
	NAappzone = ApplicZone();
	
	/* if the user wants automatic menu handling, do it now */
	if (menup != (na_menup) NULL) {
		if ((menuBar = GetNewMBar(NA_MBAR)) == (Handle) NULL)
			return (-1);
		SetMenuBar(menuBar);
		DisposHandle(menuBar);
		AddResMenu(GetMHandle(mApple), 'DRVR');
		DrawMenuBar();
		NAcloseitem = closeitem;
		NAnewitem = newitem;
		NAappleitems = numapple;
		NAhasedit = true;
		NAmenup = menup;
	}
	
	/* create full region */
	SetRectRgn(NAfullRgn = NewRgn(), -32767, -32767, 32767, 32767);
	NAnullRgn = NewRgn();
	
	/* save ibeam cursor */
	NAibeam = **GetCursor(iBeamCursor);
	
	/* handle startup files */
	if (!aeflag) {
		count = 0;
		if (openp != (na_openp) NULL) {
			CountAppFiles(&message, &count);
			if (count) {
				for (i = 1; i <= count; i++) {
					GetAppFiles(i, &afile);
					if ((*openp)(message, &afile, 0) < 0) break;
				}
				ClrAppFiles(count);
				if (message == appPrint
						&& NAcloseWindows(NAhead, NA_REQCLOSEALL) == NA_ALLCLOSED) {
					return (1);
				}
			}
		}
		if (newitem && !count && menup != (na_menup) NULL) {
			(*menup)(NULL, mFile, newitem);
		}
	}

	return (0);
}
