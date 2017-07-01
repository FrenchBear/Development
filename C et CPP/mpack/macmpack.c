/* macmpack.c -- Mac user interface to mpack routines
 *
 * (C) Copyright 1993-1994 by Christopher J. Newman
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

#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include "macnapp.h"
#include "macmpack.h"
#include "version.h"

/* ThinkC's internal stdio functions: */
#include <ansi_private.h>

/* save watch cursor */
Cursor watch;

/* preferences */
struct mpack_preferences **mpack_prefs;

/* flag for active help window */
static WindowPtr helpw = NULL;

/* state for active decode status window */
static DialogPtr dstatus = NULL;

typedef struct filelist {
	short vRefNum;
	long dirID;
	PCstr fname[65];
} filelist;

typedef struct listwin {
	na_win win;
	int count;
	filelist **hflist;
	ListHandle l;
} listwin;

void warn(char *str);
static void do_decodefiles(listwin *);
static void addfile(listwin *, FSSpec *);
static void removefile(listwin *);
static short listclose(na_win *);
static short listmouse(na_win *, Point, short, short);
static short listctrl(na_win *, Point, short, short, ControlHandle);
static short listupdate(na_win *, Boolean);
static short listinit(na_win *,long *);
static short textinit(na_win *,long *);
static short prefsctrl(na_win *, Point, short, short, ControlHandle);
static short prefsinit(na_win *, long *);
static void do_decode(FSSpec *);
static void do_encode(SFReply *);
static short mainmenu(struct na_win*, WORD, WORD);

#define dwin ((listwin *) win)

SFTypeList textList = { 'TEXT', 0, 0, 0 };

/* Get a FILE* to a Macintosh file
 *******************************     ###############################
 * KLUDGE ALERT! KLUDGE ALERT! *     # KLUDGE ALERT! KLUDGE ALERT! #
 *******************************     ###############################
 * Mac files are specified by name/vRefNum/dirID combo, but the portable
 * portions of mpack use FILE* to do I/O.  We need a way to get an open FILE*
 * from a file specified by name/vRefNum/dirID.  Here we use the proper Macintosh
 * routines to open a file, then hack together a FILE* using ThinkC's internal
 * routines.  The major trouble is that we have no way to get at to FILE action
 * procedure (fp->proc), so we need a sample FILE* to be passed in.  Bleargh!
 *******************************     ###############################
 * KLUDGE ALERT! KLUDGE ALERT! *     # KLUDGE ALERT! KLUDGE ALERT! #
 *******************************     ###############################
 */
FILE *Macopen(FILE *sample, Str255 name, short vRefNum, long dirID,
				short binary_flag, short res_fork, SignedByte permission)
{
	FILE *fp = NULL;
	short refnum;
	long curEOF = 0;
	
	if ((!res_fork && HOpen(vRefNum, dirID, name, permission, &refnum) == noErr)
		|| (res_fork && HOpenRF(vRefNum, dirID, name, permission, &refnum) == noErr)) {
		if ((fp = __getfile()) == NULL) {
			FSClose(refnum);
		} else {
			if (permission == fsWrPerm) {
				/* if we're writing to the file, truncate it */
				SetEOF(refnum, curEOF = 0);
			} else {
				GetEOF(refnum, &curEOF);
			}
			fp->refnum = refnum;
			fp->len = (fpos_t) curEOF;
			fp->binary = binary_flag;
			setvbuf(fp, NULL, _IOFBF, BUFSIZ);
			fp->proc = sample->proc;
		}
	}
	
	return (fp);
}


/* warn the user
 */
void warn(char *str)
{
	PCstr wstr[257];
	
	CtoPCstrncpy(wstr, str, 255);
	ParamText(P(wstr), NULL, NULL, NULL);
	NAalert(warnALRT);
}

/* yell at the user
 */
void yell(char *str)
{
	PCstr wstr[257];
	
	CtoPCstrncpy(wstr, str, 255);
	ParamText(P(wstr), NULL, NULL, NULL);
	NAalert(errorALRT);
}

/* chat with user
 */
chat(char *str)
{
	PCstr tmpstr[256];

	if (dstatus) {	
		CtoPCstrcpy(tmpstr, str);
		NAsetIText(dstatus, iStatus, tmpstr);
	}
}

/* process the files in the file list
 */
static void do_decodefiles(dw)
	listwin *dw;
{
	int count = dw->count;
	filelist *fl;
	FILE *dfile, *tmpf;
	extern long _ftype, _fcreator;
	long ticks;
	
	setTypeCreator("text/plain");
	SetCursor(&watch);
	dstatus = GetNewDialog(dstatDLOG, NULL, (WindowPtr) -1);
	DrawDialog(dstatus);
	MoveHHi((Handle) dw->hflist);
	HLock((Handle) dw->hflist);
	fl = *dw->hflist;
	tmpf = tmpfile();
	while (count--) {
		if (dfile = Macopen(tmpf, fl->fname, fl->vRefNum, fl->dirID, 0, 0, 1)) {
			handleMessage(dfile, "text/plain", 0, (*mpack_prefs)->extract_text, 0);
			fclose(dfile);
		}
		++fl;
	}
	fclose(tmpf);
	HUnlock((Handle) dw->hflist);
	Delay(60, &ticks);
	DisposDialog(dstatus);
	dstatus = NULL;
	SetCursor(&arrow);
}

/* return non-zero if two filenames have the same prefix
 */
static int fprefixMatch(char *base, PCstr *match)
{
	PCstr temp[257];
	char *scan;
	short prefixlen;
	
	PtoPCstrcpy(temp, base);
	scan = C(temp) + PCstrlen(temp) - 1;
	while (isdigit(*scan) && scan > C(temp)) --scan;
	prefixlen = scan - C(temp) + 1;
	if (strncmp(C(temp), C(match), prefixlen)) return (0);
	scan = C(match) + prefixlen;
	while (isdigit(*scan)) ++scan;
	
	return (!*scan);
}

/* do the add of a file to a list
 */
static void addit(listwin *dw, short vRefNum, long dirID, char *fname)
{
	long size = GetHandleSize((Handle) dw->hflist) / sizeof (filelist);
	filelist *fl;
	char *bp;
	Cell c;
	PCstr fbuf[42];

	if (size == dw->count) {
		SetHandleSize((Handle) dw->hflist, (++size * sizeof (filelist)));
		if (MemError() != noErr) return;
	}
	MoveHHi((Handle) dw->hflist);
	HLock((Handle) dw->hflist);
	fl = *dw->hflist + dw->count;
	fl->vRefNum = vRefNum;
	fl->dirID = dirID;
	PtoPCstrcpy(fl->fname, fname);
	SetPt(&c, 0, dw->count);
	LAddRow(1, ++dw->count, dw->l);
	LSetCell((Ptr) C(fname), (short) Pstrlen(fname), c, dw->l);
	HUnlock((Handle) dw->hflist);
}

/* add file set to file list
 */
static void addfile(dw, fspec)
	listwin *dw;
	FSSpec *fspec;
{
	CInfoPBRec cipbr;
	HFileInfo *fpb = (HFileInfo *)&cipbr;
	PCstr fbuf[42];
	short idx, foundone = 0;

	/* loop through directory */
	for (idx = 1; ; ++idx) {
		fpb->ioVRefNum = fspec->vRefNum;
		fpb->ioNamePtr = P(fbuf);
		fpb->ioDirID = fspec->parID;
		fpb->ioFDirIndex = idx;
		if (PBGetCatInfoSync(&cipbr)) break;
		SetClen(fbuf);
		
		if (!(fpb->ioFlAttrib & 16) && fprefixMatch((char *)fspec->name, fbuf)) {
			addit(dw, fspec->vRefNum, fspec->parID, (char *) P(fbuf));
			foundone = 1;
		}
	}
	if (!foundone) {
		addit(dw, fspec->vRefNum, fspec->parID, (char *) fspec->name);
	}
}

/* remove file from file list
 */
static void removefile(dw)
	listwin *dw;
{
	filelist *fl;
	int count;
	Cell c;
	
	c.h = c.v = 0;
	if (LGetSelect(TRUE, &c, dw->l)) {
		MoveHHi((Handle) dw->hflist);
		HLock((Handle) dw->hflist);
		fl = *dw->hflist + c.v;
		count = dw->count - c.v;
		while (--count) {
			fl[0] = fl[1];
			++fl;
		}
		HUnlock((Handle) dw->hflist);		
		--dw->count;
		LDelRow(1, c.v, dw->l);
	}
}

/* close list window
 */
static short listclose(win)
	na_win *win;
{
	LDispose(dwin->l);
	DisposHandle((Handle) dwin->hflist);
	
	return (NA_CLOSED);
}

/* mouse procedure
 */
static short listmouse(na_win *win, Point p, short type, short mods)
{
	Cell c;
	
	if (!(type & 1)) {
		LClick(p, mods, dwin->l);
		c.h = c.v = 0;
		NAhiliteDItem((DialogPtr)win->pwin, iRemove, LGetSelect(TRUE, &c, dwin->l) ? 0 : 255);
	}
}

/* control procedure
 */
static short listctrl(na_win *win, Point p, short item, short mods, ControlHandle ctrlh)
{
	SFReply reply;
	Point where;
	FSSpec ftmp;

	switch (item) {
		case iAdd:
			where.h = where.v = 0;
			SFGetFile(where, NULL, NULL, 1, textList, NULL, &reply);
			if (reply.good) {
				if (!dwin->count) {
					NAhiliteDItem((DialogPtr)win->pwin, iOk, 0);
				}
				ftmp.vRefNum = reply.vRefNum;
				ftmp.parID = 0;
				BlockMove(reply.fName, ftmp.name, sizeof (ftmp.name));
				addfile(dwin, &ftmp);
			}
			return (NA_PROCESSED);
			
		case iRemove:
			removefile(dwin);
			NAhiliteDItem((DialogPtr)win->pwin, iRemove, 255);
			if (!dwin->count) {
				NAhiliteDItem((DialogPtr)win->pwin, iOk, 255);
			}
			return (NA_PROCESSED);

		case iOk:
			do_decodefiles(dwin);
		case iCancel:
			return (NA_REQCLOSE);
	}
	
	return (NA_NOTPROCESSED);
}

/* update the list window
 */
static short listupdate(na_win *win, Boolean resize)
{
	Rect r;
	Handle hand;
	short type;
	
	GetDItem((DialogPtr)win->pwin, iFileList, &type, &hand, &r);
	FrameRect(&r);
	UpdtDialog(win->pwin, win->pwin->visRgn);
	LUpdate(win->pwin->visRgn, dwin->l);
	
	return (NA_NOTPROCESSED);
}

/* initialize the list window
 */
static short listinit(win, data)
	na_win *win;
	long *data;
{
	FSSpec *fspec = (FSSpec *) data;
	Rect r, zrect;
	Point p;
	Handle hand;
	short type;
	
	GetDItem((DialogPtr)win->pwin, iFileList, &type, &hand, &r);
	InsetRect(&r, 1, 1);
	zrect.top = zrect.bottom = zrect.left = p.h = p.v = 0;\
	zrect.right = 1;
	dwin->l = LNew(&r, &zrect, p, 0, win->pwin, 0, 0, 0, 1);
	if (!dwin->l) return (NA_CLOSED);
	(*dwin->l)->selFlags = lOnlyOne;
	dwin->hflist = (filelist **) NewHandle(sizeof (filelist));
	if (!dwin->hflist) {
		LDispose(dwin->l);
		return (NA_CLOSED);
	}
	dwin->count = 0;
	addfile(dwin, fspec);
	win->closep = listclose;
	win->updatep = listupdate;
	win->ctrlp = listctrl;
	win->mousep = listmouse;
	NAhiliteDItem((DialogPtr)win->pwin, iRemove, 255);
	ShowWindow(win->pwin);
	DrawDialog(win->pwin);
	LDoDraw(TRUE, dwin->l);
	
	return (NA_NOTPROCESSED);
}

/* Decode procedure: first get a file, then open decode window
 */
static void do_decode(FSSpec *fspec)
{
	SFReply infile;
	FSSpec ftmp;
	Point where;
	
	if (!fspec) {
		where.h = where.v = 0;
		SFGetFile(where, NULL, NULL, 1, textList, NULL, &infile);
		if (!infile.good) return;
		ftmp.vRefNum = infile.vRefNum;
		ftmp.parID = 0;
		BlockMove(infile.fName, ftmp.name, sizeof (ftmp.name));
		fspec = &ftmp;
	}
	NAwindow(0, NA_DIALOGWINDOW | NA_USERESOURCE | NA_RECENTER | NA_DEFBUTTON |
		NA_HASCONTROLS | NA_CLOSEBOX, NULL, decodeDLOG, (long *) fspec,
		sizeof (listwin), listinit);
}

/* a filter proc which handles Return, Enter, Esc, command-period properly
 */
pascal Boolean mySaveFilterProc(dialog, pevent, item)
	DialogPtr		dialog;
	EventRecord		*pevent;
	short			*item;
{
	int c;

	if (pevent->what == autoKey || pevent->what == keyDown) {
		switch (c = (pevent->message & charCodeMask)) {
			case '\r':
			case '\n':
			case 0x03:
				*item = 1;
				goto HILITE;
			
			case '.':
				if (!(pevent->modifiers & cmdKey)) break;
			case '\033':
				*item = 2;
			HILITE:
				NAflashButton(dialog, *item);
				return (true);
			default:
				if (((DialogPeek)dialog)->editField + 1 == iMaximum
					&& isprint(c) && c != '\t' && !isdigit(c)) {
					pevent->what = nullEvent;
				}
				break;
					
		}
	}
	
	return (false);
}

static long save_max;
static PCstr save_subject[257];
static short save_dflag;

/* custom file dialog procedure
 */
pascal short mySaveDialog(short item, DialogPtr theDialog)
{
	Handle etext;
	PCstr tstr[257];
	ControlHandle	ctrl;
	short value;
	
	switch (item) {
		case iDescfile:
			NAgetDHandle(theDialog, iDescfile, &ctrl);
			SetCtlValue(ctrl, !GetCtlValue(ctrl));
			break;
			
		case iSplit:
			NAgetDHandle(theDialog, iSplit, &ctrl);
			value = GetCtlValue(ctrl);
			SetCtlValue(ctrl, !value);
			break;
			
		case iOk:
			NAgetIText(theDialog, iSubject, save_subject);
			NAgetDHandle(theDialog, iSplit, &ctrl);
			save_max = 0;
			if (GetCtlValue(ctrl)) {
				NAgetIText(theDialog, iMaximum, tstr);
				save_max = atol(C(tstr));
			}
			NAgetDHandle(theDialog, iDescfile, &ctrl);
			save_dflag = GetCtlValue(ctrl);
			break;
	}
	
	return (item);
}

/* Decode procedure: first get a file, then open decode window
 */
static void do_encode(SFReply *reply)
{
	SFReply infile, outfile, descfile;
	Point where;
	PCstr fname[65], mtype[257];
	struct lookupct *ctptr;
	char *scan;
	short mapcount, i, encoding, refnum, vrefnum;
	Handle h;
	ResType type = 'TyCr';
	extern long _ftype, _fcreator;
	CInfoPBRec cipbr;
	HFileInfo *fpb = (HFileInfo *) &cipbr;
	FILE *fp, *resfork, *dfile, *tmpf;
	
	where.h = where.v = 0;
	if (!reply) {
		SFGetFile(where, NULL, NULL, -1, NULL, NULL, &infile);
		if (!infile.good) return;
	} else {
		infile = *reply;
	}
	PtoPCstrcpy(fname, (char *) infile.fName);
	if (scan = strrchr(C(fname), '.')) {
		*scan = '\0';
		SetPlen(fname);
	}
	if (PCstrlen(fname) >= 25) {
		*fname = 25;
		SetClen(fname);
	}
  RETRYSFP:
	SFPPutFile(where, "\pMIME part prefix:", P(fname), 
		mySaveDialog, &outfile, encodeDLOG, mySaveFilterProc);
	if (outfile.good) {
		PtoCstr(outfile.fName);
		PtoPCstrcpy(fname, (char *) infile.fName);
		if (!strcmp(C(fname), (char *)outfile.fName)) {
			yell("The output filename must be different from the input filename");
			goto RETRYSFP;
		}
		if (save_dflag) {
			SFGetFile(where, NULL, NULL, 1, textList, NULL, &descfile);
			if (!descfile.good) {
				save_dflag = 0;
			}
		}
		
		/* find the correct MIME type to use for this file */
		mapcount = CountResources(type);
		*mtype = '\0';
		for (i = 1; i <= mapcount; ++i) {
			h = GetIndResource(type, i);
			if (h && **(OSType **)h == infile.fType) {
				GetResInfo(h, &i, &type, P(mtype));
				if (ResError() == noErr) break;
			}
		}
		SetClen(mtype);
		
		/* Determine the correct encoding */
		encoding = (*mpack_prefs)->encoding;
		fpb->ioVRefNum = infile.vRefNum;
		fpb->ioNamePtr = infile.fName;
		fpb->ioDirID = 0;
		fpb->ioFDirIndex = 0;
		if (PBGetCatInfoSync(&cipbr) != noErr) {
			yell("Failed to open file for encoding");
			return;
		}
		if (encoding == EN_AUTO) {
			encoding = EN_DOUBLE;
			if (!fpb->ioFlRLgLen && *mtype != '\0') encoding = EN_DATA;
		}
		if (!fpb->ioFlLgLen) encoding = EN_SINGLE;
		
		/* do applesingle/appledouble encoding */
		SetCursor(&watch);
		tmpf = tmpfile();
		fp = Macopen(tmpf, infile.fName, infile.vRefNum, 0,
			strcmp(C(mtype), "text/plain") ? 1 : 0, 0, fsRdPerm);
		if (!fp) {
			fclose(tmpf);
			SetCursor(&arrow);
			yell("Failed to open file for encoding");
			return;
		}
		dfile = NULL;
		if (save_dflag) {
			dfile = Macopen(tmpf, descfile.fName, descfile.vRefNum, 0, 0, 0, fsRdPerm);
		}
		if (encoding == EN_DATA) {
			fclose(tmpf);
			tmpf = NULL;
		} else {
			/* open resource fork & output file for applesingle/double encoding */
			resfork = Macopen(tmpf, infile.fName, infile.vRefNum, 0, 1, 1, 1);
			if (encode_applefile(tmpf, fpb, resfork, encoding == EN_SINGLE ? fp : NULL) < 0) {
				SetCursor(&arrow);
				yell("Failed to encode file");
				return;
			}
			rewind(tmpf);
			if (encoding == EN_SINGLE) {
				fp = tmpf;
				tmpf = NULL;
				strcpy(C(mtype), "application/applefile");
				SetPlen(mtype);
			}
		}
		
		/* generate output files */
		_fcreator = 'mPAK';
		_ftype = 'TEXT';
		GetVol(0, &vrefnum);
		SetVol(0, outfile.vRefNum);
		encode(fp, tmpf, C(fname), dfile,
			*C(save_subject) ? C(save_subject) : C(fname), NULL, save_max,
			PCstrlen(mtype) ? C(mtype) : NULL, outfile.fName);
		SetVol(0, vrefnum);
		if (tmpf) fclose(tmpf);
		if (dfile) fclose(dfile);
		fclose(fp);
		SetCursor(&arrow);
	}
}

/* open a textedit window & load a file into it
 */
static short textinit(na_win *win, long *data)
{
	Handle h = (Handle) data;
	long size;
	
	TextFont(monaco);
	TextSize(9);
	size = GetHandleSize(h);
	MoveHHi(h);
	HLock(h);
	NATEinit(win, NATE_READONLY, 489, *h, size);
	HUnlock(h);
	ShowWindow(win->pwin);
	
	return (NA_NOTPROCESSED);
}

/* Open a window for a text file
 */
static short textopen(short message, AppFile *afile, FSSpec *fspec)
{
	SFReply reply;
	Point where;
	Handle data;
	long len, saved;
	short fref;
	OSErr err;
	Rect *sr;
	FInfo finfo;
	FSSpec fstmp;
	PCstr fname[257];
	char emsg[512];
	
	if (message != appOpen) return (-1);
	
	/* find & open file */
	if (!afile && !fspec) {
		where.h = where.v = 0;
		SFGetFile(where, NULL, NULL, 1, textList, NULL, &reply);
		if (!reply.good) return (-1);
		PtoPCstrcpy(fname, (char *) reply.fName);
		err = FSOpen(reply.fName, reply.vRefNum, &fref);
	} else if (afile) {
		PtoPCstrcpy(fname, (char *) afile->fName);
		BlockMove(afile->fName, reply.fName, sizeof (reply.fName));
		reply.fType = afile->fType;
		reply.vRefNum = afile->vRefNum;
		reply.good = 1;
		if (afile->fType == 'TEXT') {
			fstmp.parID = 0;
			fstmp.vRefNum = afile->vRefNum;
			BlockMove(afile->fName, fstmp.name, sizeof (fstmp.name));
			do_decode(&fstmp);
		} else {
			do_encode(&reply);
		}
		return (0);
	} else {
		PtoPCstrcpy(fname, (char *) fspec->name);
		if (FSpGetFInfo(fspec, &finfo) == noErr) {
			if (finfo.fdType == 'TEXT') {
				do_decode(fspec);
			} else {
				BlockMove(fspec->name, reply.fName, sizeof (reply.fName));
				OpenWD(fspec->vRefNum, fspec->parID, 0, &reply.vRefNum);
				reply.fType = finfo.fdType;
				reply.good = 1;
				do_encode(&reply);
				CloseWD(reply.vRefNum);
			}
			return (0);
		}
		err = FSpOpenDF(fspec, fsRdPerm, &fref);
	}
	
	/* read file */
	if (err != noErr) {
		sprintf(emsg, "Could not open file %s\rError %d", C(fname), err);
		yell(emsg);
		return (-1);
	}
	if (GetEOF(fref, &len) < 0 || len >= 32000 || !(data = NewHandle(len))) {
		FSClose(fref);
		sprintf(emsg, "File %s is too long to view.", C(fname));
		yell(emsg);
		return (-1);
	}
	MoveHHi(data);
	HLock(data);
	saved = len;
	err = FSRead(fref, &saved, *data);
	HUnlock(data);
	FSClose(fref);
	if (err != noErr || saved != len) {
		sprintf(emsg, "Could not read file %s\rError %d", C(fname), err);
		yell(emsg);
		return (-1);
	}
	
	/* open NATE window */
	sr = NAscreenrect(NA_TOPSCN | NA_RIGHTSCN | NA_TITLEOFFSET | NA_STACK);
	if (sr->right - sr->left > 512) sr->right = sr->left + 512;
	NAwindow(sr, NA_USERESOURCE | NA_FORCESIZE | NATEflags, C(fname), textWIND,
		(long *) data, sizeof (nate_win), textinit);
	DisposHandle(data);
	
	return (0);
}

#define hwinfo ((nate_win *)win)

/* help close procedure
 */
static short helpclose(na_win *win)
{
	helpw = NULL;

	return (NATEclosep(win));
}

/* help window procedure
 */
static short helpwindow(na_win *win, long *data)
{
	Rect		rtemp, vtemp;
	Handle		h, hs;
	long		len;
	TEHandle	hTE;
	
	rtemp = win->pwin->portRect;
	vtemp = rtemp;
	vtemp.right = vtemp.left + (hwinfo->docwidth = 475);
	win->mousep = NATEmousep;
	win->idlep = NATEidlep;
	win->menup = NATEmenup;
	win->activep = NATEactivep;
	win->updatep = NATEupdatep;
	win->ctrlp = NATEctrlp;
	win->closep = helpclose;
	win->cursorRgn = NewRgn();
	hwinfo->vctrl = hwinfo->hctrl = NULL;
	
	TEAutoView(true, hTE = hwinfo->hTE = TEStylNew(&vtemp, &rtemp));
	h = GetResource('TEXT', helpTEXT);
	hs = GetResource('styl', helpSTYL);
	len = GetHandleSize(h);
	HLock(h);
	TEStylInsert(*h, len, (StScrpHandle) hs, hTE);
	HUnlock(h);
	TESetSelect(0, 0, hTE);
	hwinfo->lheight = TEGetHeight((*hTE)->nLines, 0, hTE) / (*hTE)->nLines;
	ShowWindow(helpw = win->pwin);
	
	return (NA_NOTPROCESSED);
}

/* control procedure
 */
static short prefsctrl(na_win *win, Point p, short item, short mods, ControlHandle ctrlh)
{
	PCstr tmpstr[256];
	short encoding, extract_text;
	ControlHandle ctrl;
	
	if (item == iOk) {
		/* if internet host has changed */
		NAgetIText(win->pwin, iHost, P(tmpstr));
		SetClen(tmpstr);
		HLock((Handle) mpack_prefs);
		encoding = NAradioGet(win->pwin, iAuto, iDouble) - iAuto;
		if (encoding != (*mpack_prefs)->encoding) {
			(*mpack_prefs)->encoding = encoding;
			ChangedResource((Handle) mpack_prefs);
		}
		NAgetDHandle(win->pwin, iTextEncode, &ctrl);
		extract_text = GetCtlValue(ctrl);
		if (extract_text != (*mpack_prefs)->extract_text) {
			(*mpack_prefs)->extract_text = extract_text;
			ChangedResource((Handle) mpack_prefs);
		}
		if (strcmp(C(tmpstr), (*mpack_prefs)->internet_host)) {
			HUnlock((Handle) mpack_prefs);
			/* update the preferences resource */
			SetHandleSize((Handle) mpack_prefs, sizeof (struct mpack_preferences)
				+ PCstrlen(tmpstr));
			HLock((Handle) mpack_prefs);
			strcpy((*mpack_prefs)->internet_host, C(tmpstr));
			ChangedResource((Handle) mpack_prefs);
		}
		HUnlock((Handle) mpack_prefs);
	} else if (item >= iAuto && item <= iDouble) {
		NAradioSet(win->pwin, iAuto, iDouble, item);
	} else if (item == iTextEncode) {
		SetCtlValue(ctrlh, !GetCtlValue(ctrlh));
	}
	
	return (item == iOk || item == iCancel ? NA_REQCLOSE : NA_NOTPROCESSED);
}

static short prefsinit(na_win *win, long *data)
{
	PCstr tmpstr[256];
	ControlHandle ctrl;
	
	win->ctrlp = prefsctrl;
	HLock((Handle) mpack_prefs);
	strcpy(C(tmpstr), (*mpack_prefs)->internet_host);
	HUnlock((Handle) mpack_prefs);
	SetPlen(tmpstr);
	NAsetIText(win->pwin, iHost, P(tmpstr));
	SelIText(win->pwin, iHost, 0, 32767);
	NAradioSet(win->pwin, iAuto, iDouble, (*mpack_prefs)->encoding + iAuto);
	NAgetDHandle(win->pwin, iTextEncode, &ctrl);
	SetCtlValue(ctrl, (*mpack_prefs)->extract_text);
	ShowWindow(win->pwin);
	
	return (NA_NOTPROCESSED);
}

/* Main menu procedure
 */
static short mainmenu(na_win *win, WORD menuid, WORD itemno)
{
	short status;
	MenuHandle mh;
	PCstr version[32];

	switch (menuid) {
		case mApple:
			if (itemno == iAbout) {
				CtoPCstrcpy(version, MPACK_VERSION);
				ParamText(P(version), NULL, NULL, NULL);
				return (NAwindow(0, NA_DIALOGWINDOW | NA_USERESOURCE | NA_RECENTER
					| NA_DIALOGUPDATE | NA_MODAL, "About", aboutDLOG, (long *) NULL, 0, NAabout));
			}
			if (!helpw) {
				NAwindow(0, NA_USERESOURCE | NATEflags | NA_SMARTSIZE, NULL, helpWIND,
					(long *) NULL, sizeof (nate_win), helpwindow);
			} else {
				SelectWindow(helpw);
			}
			break;
			
		case mFile:
			switch (itemno) {
				case iEncode:
					do_encode(NULL);
					return (NA_PROCESSED);
					
				case iDecode:
					do_decode(NULL);
					return (NA_PROCESSED);
				
				case iOpen:
					textopen(appOpen, NULL, NULL);
					return (NA_PROCESSED);

				case iClose:
					return (NA_NOTPROCESSED);
					
				case iPrefs:
					return (NAwindow(0, NA_DIALOGWINDOW | NA_USERESOURCE | NA_RECENTER
						| NA_DIALOGUPDATE | NA_MODAL | NA_DEFBUTTON, "Preferences", prefsDLOG,
						(long *) NULL, 0, prefsinit));

				case iQuit:
					return (NA_REQCLOSEALL);
			}
			break;

		case mEdit:
			switch (itemno) {
				case iClipboard:
					NAclipboardMenu(menuid, itemno, 'TEXT');
					return (NA_PROCESSED);
			}
			break;
	}
	return (NA_NOTPROCESSED);
}


main()
{
	CursHandle cursH;

	if (NAinit(128, 3, textopen, mainmenu, 2, 0, iClose) == 0) {
		mpack_prefs = (struct mpack_preferences **) GetResource('mPRF', prefsID);
		cursH = GetCursor(watchCursor);
		watch = **cursH;
		NAmainloop();
	}
}
