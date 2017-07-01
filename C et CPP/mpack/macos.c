/* macos.c -- operating system dependant mpack code for the Macintosh
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
#include <ctype.h>
#include <string.h>
#include <errno.h>
#include "common.h"
#include "macnapp.h"
#include "macmpack.h"

extern char *malloc(), *realloc();

char copy_buf[COPY_BUFSIZE];

char *xmalloc(unsigned size)
{
    char *ret;

    if (ret = malloc((unsigned) size))
      return ret;

    yell("Virtual memory exhausted");
    exit(1);
}

char *xrealloc (char *ptr, unsigned size)
{
    char *ret;

    /* xrealloc (NULL, size) behaves like xmalloc (size), as in ANSI C */
    if (ret = !ptr ? malloc ((unsigned) size) : realloc (ptr, (unsigned) size))
      return ret;

    yell("Virtual memory exhausted");
    exit(1);
}

char *strsave(char *str)
{
    char *p = xmalloc(strlen(str)+1);
    strcpy(p, str);
    return p;
}

/* save output filename buffer */
static char *output_fname = NULL;
static short applefile_flag = 0;
static FSSpec fspec;

/* TMPL resource for IDna -- ID to name mappings
 */
char TMPL[] = {
	16 , 'D', 'i', 'r', 'e', 'c', 't', 'o',
	'r', 'y', ' ', 'N', 'u', 'm', 'b', 'e',
	'r', 'D', 'W', 'R', 'D'
};

/* rename or copy a file to a new location
 */
void rename_or_copy(srcfname, dstfname, dstvRefNum)
	char *srcfname;
	PCstr *dstfname;
	short dstvRefNum;
{
	PCstr tstr[257];
	short dstvol, srefnum, drefnum;
	long dirid, procid = 0, count;
	WDPBRec wdpb;
	HParamBlockRec hpb;
	CMovePBRec cpb;
	
	wdpb.ioNamePtr = P(tstr);
	if (PBHGetVol(&wdpb, FALSE) != noErr) return;
	if (GetWDInfo(dstvRefNum, &dstvol, &dirid, &procid) != noErr) return;
	CtoPCstrcpy(tstr, srcfname);
	if (HOpen(0, 0, P(tstr), fsRdPerm, &srefnum) != noErr) return;
	if (GetEOF(srefnum, &count) == noErr && !count) {
		FSClose(srefnum);
		return;
	}
	if (wdpb.ioWDVRefNum == dstvol) {
		/* files on same drive -- do a rename/move */
		FSClose(srefnum);
		hpb.fileParam.ioNamePtr = P(tstr);
		hpb.fileParam.ioVRefNum = 0;
		hpb.ioParam.ioMisc = (Ptr) P(dstfname);
		hpb.fileParam.ioDirID = 0;
		if (PBHRenameSync(&hpb) == noErr && wdpb.ioWDDirID != dirid) {
			cpb.ioNamePtr = P(dstfname);
			cpb.ioVRefNum = 0;
			cpb.ioNewName = NULL;
			cpb.ioNewDirID = dirid;
			cpb.ioDirID = 0;
			PBCatMoveSync(&cpb);
		}
	} else {
		/* files on different drive -- do a copy */
		if (Create(P(dstfname), dstvRefNum, _fcreator, _ftype) != noErr) {
			FSClose(srefnum);
			return;
		}
		if (HOpen(dstvRefNum, 0, P(dstfname), fsWrPerm, &drefnum) != noErr) {
			FSClose(srefnum);
			FSDelete(P(dstfname), dstvRefNum);
			return;
		}
		count = sizeof (copy_buf);
		while (FSRead(srefnum, &count, (Ptr) copy_buf) != noErr && count > 0) {
			FSWrite(drefnum, &count, (Ptr) copy_buf);
			count = sizeof (copy_buf);
		}
		FSClose(srefnum);
		FSClose(drefnum);
	}
}

/* Generate a message-id */
char *os_genid()
{
    char *result;
    long tick;
    unsigned long time;

	tick = TickCount();
    result = malloc(64);
    GetDateTime(&time);
    HLock((Handle) mpack_prefs);
    sprintf(result, "%lu.%lu@%s", tick, time, (*mpack_prefs)->internet_host);
    HUnlock((Handle) mpack_prefs);
    
    /* make sure tick count is bumped before we return... */
    while (tick == TickCount());
    
    return (result);
}

/* Create and return directory for a message-id
 */
char *os_idtodir(id)
char *id;
{
	static PCstr buf[257];
	static unsigned char mpackdir[] = "\pmpack-tmp";
	PCstr idbuf[257];
	char *fname;
    short wrefnum, vrefnum, resfile, uqid, createflag = 0;
    long dirid, procid;
    OSErr err;
    Handle h;
    ResType type = 'IDna';
    FInfo finfo;

	/* get name of default volume */
	if (GetVol(P(buf), &wrefnum) != noErr) return (NULL);
	procid = 0;
	if (GetWDInfo(wrefnum, &vrefnum, &dirid, &procid) != noErr) return (NULL);
	
	/* try creating tmp dir */
	err = DirCreate(vrefnum, 0, mpackdir, &dirid);
	if (err != noErr && err != dupFNErr) return (NULL);
	CtoPCstrcat(buf, ":");
	PtoPCstrcat(buf, (char *) mpackdir);
	CtoPCstrcat(buf, ":");
	fname = C(buf) + PCstrlen(buf);
	
	/* open the map file */
	strcpy(fname, "map");
	SetPlen(buf);
	CreateResFile(P(buf));
	if ((err = ResError()) == noErr && GetFInfo(P(buf), vrefnum, &finfo) == noErr) {
		finfo.fdType = 'rsrc';
		finfo.fdCreator = 'RSED';
		SetFInfo(P(buf), vrefnum, &finfo);
	}
	if ((resfile = OpenResFile(P(buf))) < 0) return (NULL);
	if (err == noErr && PtrToHand((Ptr) TMPL, &h, sizeof (TMPL)) == noErr) {
		AddResource(h, 'TMPL', 1000, "\pIDna");
	}
	
	/* is there a mapping for the id? */
	CtoPCstrcpy(idbuf, id);
	h = GetNamedResource(type, P(idbuf));
	
	/* no mapping -- create one */
	if (!h) {
		createflag = 1;
		while ((uqid = UniqueID(type)) < 128);
		h = NewHandle(sizeof (short));
		if (h) (**(short **)h) = uqid;
		AddResource(h, type, uqid, P(idbuf));
		if ((err = ResError()) != noErr) {
			CloseResFile(resfile);
			return (NULL);
		}
	} else {
		uqid = ** (short **) h;
	}
	
	/* set directory name & create it */
	sprintf(fname, "%d:", uqid);
	SetPlen(buf);
	err = DirCreate(vrefnum, 0, P(buf), &dirid);
	if (err != noErr && err != dupFNErr) {
		RmveResource(h);
		DisposHandle(h);
		h = NULL;
	}

	/* done with map file */
	CloseResFile(resfile);
	
	return (h ? C(buf) : NULL);
}

/*
 * We are done with the directory returned by os_idtodir()
 * Remove it
 */
os_donewithdir(dir)
char *dir;
{
	PCstr buf[257];
	short uqid, resfile;
	char *fname;
	Handle h;
	
	CtoPCstrcpy(buf, dir);
	HDelete(0, 0, P(buf));
	fname = strchr(C(buf), ':');
	if (fname && (fname = strchr(fname + 1, ':'))) {
		uqid = atoi(fname + 1);
		strcpy(fname, ":map");
		SetPlen(buf);
		if ((resfile = OpenResFile(P(buf))) >= 0) {
			h = GetResource('IDna', uqid);
			if (h) {
				RmveResource(h);
				DisposHandle(h);
			}
			CloseResFile(resfile);
		}
	}
}

/* Set the file types based on a content type
 */
void setTypeCreator(char *contenttype)
{
	PCstr tstr[257];
	Handle h;
	
	CtoPCstrncpy(tstr, contenttype, 255);
	h = GetNamedResource('TyCr', P(tstr));
	if (h) {
		_ftype = (*(OSType **)h)[0];
		_fcreator = (*(OSType **)h)[1];
	} else {
		_ftype = '????';
		_fcreator = 'mPAK';
	}
}

/* rename the description file
 */
void renameDescFile(char *fname, short vRefNum)
{
	PCstr tstr[65];
	char *p;

    setTypeCreator("text/plain");

	/* save description file */
	CtoPCstrcpy(tstr, fname);
    if (p = strrchr(C(tstr), '.')) *p = '\0';
    strcat(C(tstr), ".desc");
    SetPlen(tstr);
    rename_or_copy(TEMPFILENAME, tstr, vRefNum);
    (void) remove(TEMPFILENAME);
}

/*
 * Create a new file, with suggested filename "fname".
 * "fname" may have come from an insecure source, so clean it up first.
 * It may also be null.
 * "contentType" is passed in for use by systems that have typed filesystems.
 * "flags" contains a bit pattern describing attributes of the new file.
 */
FILE *os_newtypedfile(fname, contentType, flags)
char *fname;
char *contentType;
int flags;
{
    char *p;
    int applefile;
    FILE *outfile = 0, *tmpf;
    extern Cursor watch;
    Point where;
    SFReply reply;
    PCstr tstr[257];

    if (!fname) fname = "";
    
    /* Translate ':' to underscore */
    for (p=fname; *p; p++) {
    	if (*p == ':' || !isprint(*p)) *p = '_';
    }
    
    /* chop filename to length */
    if (strlen(fname) > 31) {
		fname += strlen(fname) - 31;
    }

	/* get filename from user */
	sprintf(C(tstr), "Saving file: %s\rType: %s", fname[0] ? fname : "Untitled", contentType);
	chat(C(tstr));
	applefile = !strcmp(contentType, "application/applefile");
	if (!applefile && (!applefile_flag || !(flags & FILE_INAPPLEDOUBLE))) {
	    SetCursor(&arrow);
	    where.h = where.v = 0;
	    CtoPstr(fname);
	    SFPutFile(where, "\pSave decoded file as:",
	    	fname[0] ? (unsigned char *) fname : "\pUntitled", NULL, &reply);
	    PtoCstr((unsigned char *) fname);
	    SetCursor(&watch);
	    if (!reply.good) return (NULL);
	}

	/* set the type */
	setTypeCreator(contentType);

	/* save file */
	tmpf = tmpfile();
	if (applefile) {
		outfile = tmpf;
		tmpf = NULL;
	} else if ((flags & FILE_INAPPLEDOUBLE) && applefile_flag) {
		outfile = Macopen(tmpf, fspec.name, fspec.vRefNum, fspec.parID,
			flags & FILE_BINARY, 0, fsWrPerm);
	} else {
		Create(reply.fName, reply.vRefNum, _fcreator, _ftype);
	    outfile = Macopen(tmpf, reply.fName, reply.vRefNum, 0,
	    	flags & FILE_BINARY, 0, fsWrPerm);
	}
	applefile_flag = applefile;
	if (tmpf) fclose(tmpf);
	PtoCstr(reply.fName);
	fname = (char *) reply.fName;
    if (!outfile) {
    	sprintf(C(tstr), "Couldn't open file %s", fname);
    	warn(C(tstr));
    	return (0);
    }
	
    if (output_fname) free(output_fname);
    output_fname = strsave(fname);
    
    renameDescFile(fname, reply.vRefNum);

    return outfile;
}

/*
 * Close a file opened by os_newTypedFile()
 */
os_closetypedfile(outfile)
FILE *outfile;
{
	char buf[128];
	
	if (applefile_flag) {
		rewind(outfile);
		if (decode_applefile(outfile, &fspec) < 0) {
			sprintf(buf, "Failed to decode file %s", output_fname);
			warn(buf);
			applefile_flag = 0;
		}
	}

	/* close file */
    fclose(outfile);
}

/*
 * Warn user that the MD5 digest of the last file created by os_newtypedfile()
 * did not match that supplied in the Content-MD5: header.
 */
os_warnMD5mismatch()
{
    char *warning;

    warning = xmalloc(strlen(output_fname) + 100);
    sprintf(warning, "%s was corrupted in transit",
	    output_fname);
    warn(warning);
    free(warning);
}

/* bring up an error dialog for a file error
 */
void os_perror(char *str)
{
	extern int errno;
	char *err = strerror(errno), *scan;
	char msg[256];
	short maxflen;
	
	maxflen = 255 - (strlen(err) + 2);
	if (strlen(str) > maxflen) {
		str += strlen(str) - maxflen;
		for (scan = str; *scan && *scan++ != ':';);
		if (*scan) str = scan;
	}
	sprintf(msg, "%s: %s", str, err);
	yell(msg);
}
