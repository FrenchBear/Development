# Microsoft Visual C++ generated build script - Do not modify

PROJ = PCCURSES
DEBUG = 0
PROGTYPE = 4
CALLER = 
ARGS = 
DLLS = 
D_RCDEFINES = -d_DEBUG
R_RCDEFINES = -dNDEBUG
ORIGIN = MSVC
ORIGIN_VER = 1.00
PROJPATH = D:\LIB\PCCURSES\
USEMFC = 0
CC = cl
CPP = cl
CXX = cl
CCREATEPCHFLAG = 
CPPCREATEPCHFLAG = 
CUSEPCHFLAG = 
CPPUSEPCHFLAG = 
FIRSTC = ATTRIB.C    
FIRSTCPP =             
RC = rc
CFLAGS_D_LIB = /nologo /G2 /W3 /Z7 /AM /Od /D "_DEBUG" /I "." /FR /GA /J
CFLAGS_R_LIB = /nologo /Gs /G3 /W3 /AL /O1 /D "NDEBUG" /I "." /GA /J
RCFLAGS = /nologo
RESFLAGS = /nologo
RUNFLAGS = 
OBJS_EXT = 
LIBS_EXT = 
!if "$(DEBUG)" == "1"
CFLAGS = $(CFLAGS_D_LIB)
LFLAGS = 
LIBS = 
MAPFILE = nul
RCDEFINES = $(D_RCDEFINES)
!else
CFLAGS = $(CFLAGS_R_LIB)
LFLAGS = 
LIBS = 
MAPFILE = nul
RCDEFINES = $(R_RCDEFINES)
!endif
!if [if exist MSVC.BND del MSVC.BND]
!endif
SBRS = ATTRIB.SBR \
		BEEP.SBR \
		BORDER.SBR \
		BOXES.SBR \
		CHARADD.SBR \
		CHARDEL.SBR \
		CHARGET.SBR \
		CHARINS.SBR \
		CHARPICK.SBR \
		CLRTOBOT.SBR \
		CLRTOEOL.SBR \
		CURSESIO.SBR \
		ENDWIN.SBR \
		INITSCR.SBR \
		LINEDEL.SBR \
		LINEINS.SBR \
		LONGNAME.SBR \
		MOVE.SBR \
		MVCURSOR.SBR \
		NEWWIN.SBR \
		OPTIONS.SBR \
		OVERLAY.SBR \
		PRNTSCAN.SBR \
		REFRESH.SBR \
		SCRREG.SBR \
		SETMODE.SBR \
		SETTERM.SBR \
		STRADD.SBR \
		STRGET.SBR \
		TABSIZE.SBR \
		TERMMISC.SBR \
		UNCTRL.SBR \
		UPDATE.SBR \
		WINCLEAR.SBR \
		WINDEL.SBR \
		WINERASE.SBR \
		WINMOVE.SBR \
		WINSCROL.SBR \
		WINTOUCH.SBR


ATTRIB_DEP = d:\lib\pccurses\curses.h \
	d:\lib\pccurses\curspriv.h


BEEP_DEP = d:\lib\pccurses\curses.h \
	d:\lib\pccurses\curspriv.h


BORDER_DEP = d:\lib\pccurses\curses.h \
	d:\lib\pccurses\curspriv.h


BOXES_DEP = d:\lib\pccurses\curses.h \
	d:\lib\pccurses\curspriv.h


CHARADD_DEP = d:\lib\pccurses\curses.h \
	d:\lib\pccurses\curspriv.h


CHARDEL_DEP = d:\lib\pccurses\curses.h \
	d:\lib\pccurses\curspriv.h


CHARGET_DEP = d:\lib\pccurses\curses.h \
	d:\lib\pccurses\curspriv.h


CHARINS_DEP = d:\lib\pccurses\curses.h \
	d:\lib\pccurses\curspriv.h


CHARPICK_DEP = d:\lib\pccurses\curses.h \
	d:\lib\pccurses\curspriv.h


CLRTOBOT_DEP = d:\lib\pccurses\curses.h \
	d:\lib\pccurses\curspriv.h


CLRTOEOL_DEP = d:\lib\pccurses\curses.h \
	d:\lib\pccurses\curspriv.h


CURSESIO_DEP = d:\lib\pccurses\curses.h \
	d:\lib\pccurses\curspriv.h


ENDWIN_DEP = d:\lib\pccurses\curses.h \
	d:\lib\pccurses\curspriv.h


INITSCR_DEP = d:\lib\pccurses\curses.h \
	d:\lib\pccurses\curspriv.h


LINEDEL_DEP = d:\lib\pccurses\curses.h \
	d:\lib\pccurses\curspriv.h


LINEINS_DEP = d:\lib\pccurses\curses.h \
	d:\lib\pccurses\curspriv.h


LONGNAME_DEP = d:\lib\pccurses\curses.h \
	d:\lib\pccurses\curspriv.h


MOVE_DEP = d:\lib\pccurses\curses.h \
	d:\lib\pccurses\curspriv.h


MVCURSOR_DEP = d:\lib\pccurses\curses.h \
	d:\lib\pccurses\curspriv.h


NEWWIN_DEP = d:\lib\pccurses\curses.h \
	d:\lib\pccurses\curspriv.h


OPTIONS_DEP = d:\lib\pccurses\curses.h \
	d:\lib\pccurses\curspriv.h


OVERLAY_DEP = d:\lib\pccurses\curses.h \
	d:\lib\pccurses\curspriv.h


PRNTSCAN_DEP = d:\lib\pccurses\curses.h \
	d:\lib\pccurses\curspriv.h


REFRESH_DEP = d:\lib\pccurses\curses.h \
	d:\lib\pccurses\curspriv.h


SCRREG_DEP = d:\lib\pccurses\curses.h \
	d:\lib\pccurses\curspriv.h


SETMODE_DEP = d:\lib\pccurses\curses.h \
	d:\lib\pccurses\curspriv.h


SETTERM_DEP = d:\lib\pccurses\curses.h \
	d:\lib\pccurses\curspriv.h


STRADD_DEP = d:\lib\pccurses\curses.h \
	d:\lib\pccurses\curspriv.h


STRGET_DEP = d:\lib\pccurses\curses.h \
	d:\lib\pccurses\curspriv.h


TABSIZE_DEP = d:\lib\pccurses\curses.h \
	d:\lib\pccurses\curspriv.h


TERMMISC_DEP = d:\lib\pccurses\curses.h \
	d:\lib\pccurses\curspriv.h


UNCTRL_DEP = d:\lib\pccurses\curses.h \
	d:\lib\pccurses\curspriv.h


UPDATE_DEP = d:\lib\pccurses\curses.h \
	d:\lib\pccurses\curspriv.h


WINCLEAR_DEP = d:\lib\pccurses\curses.h \
	d:\lib\pccurses\curspriv.h


WINDEL_DEP = d:\lib\pccurses\curses.h \
	d:\lib\pccurses\curspriv.h


WINERASE_DEP = d:\lib\pccurses\curses.h \
	d:\lib\pccurses\curspriv.h


WINMOVE_DEP = d:\lib\pccurses\curses.h \
	d:\lib\pccurses\curspriv.h


WINSCROL_DEP = d:\lib\pccurses\curses.h \
	d:\lib\pccurses\curspriv.h


WINTOUCH_DEP = d:\lib\pccurses\curses.h \
	d:\lib\pccurses\curspriv.h


all:	$(PROJ).LIB

ATTRIB.OBJ:	ATTRIB.C $(ATTRIB_DEP)
	$(CC) $(CFLAGS) $(CCREATEPCHFLAG) /c ATTRIB.C

BEEP.OBJ:	BEEP.C $(BEEP_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c BEEP.C

BORDER.OBJ:	BORDER.C $(BORDER_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c BORDER.C

BOXES.OBJ:	BOXES.C $(BOXES_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c BOXES.C

CHARADD.OBJ:	CHARADD.C $(CHARADD_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c CHARADD.C

CHARDEL.OBJ:	CHARDEL.C $(CHARDEL_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c CHARDEL.C

CHARGET.OBJ:	CHARGET.C $(CHARGET_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c CHARGET.C

CHARINS.OBJ:	CHARINS.C $(CHARINS_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c CHARINS.C

CHARPICK.OBJ:	CHARPICK.C $(CHARPICK_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c CHARPICK.C

CLRTOBOT.OBJ:	CLRTOBOT.C $(CLRTOBOT_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c CLRTOBOT.C

CLRTOEOL.OBJ:	CLRTOEOL.C $(CLRTOEOL_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c CLRTOEOL.C

CURSESIO.OBJ:	CURSESIO.C $(CURSESIO_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c CURSESIO.C

ENDWIN.OBJ:	ENDWIN.C $(ENDWIN_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ENDWIN.C

INITSCR.OBJ:	INITSCR.C $(INITSCR_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c INITSCR.C

LINEDEL.OBJ:	LINEDEL.C $(LINEDEL_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c LINEDEL.C

LINEINS.OBJ:	LINEINS.C $(LINEINS_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c LINEINS.C

LONGNAME.OBJ:	LONGNAME.C $(LONGNAME_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c LONGNAME.C

MOVE.OBJ:	MOVE.C $(MOVE_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c MOVE.C

MVCURSOR.OBJ:	MVCURSOR.C $(MVCURSOR_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c MVCURSOR.C

NEWWIN.OBJ:	NEWWIN.C $(NEWWIN_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c NEWWIN.C

OPTIONS.OBJ:	OPTIONS.C $(OPTIONS_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c OPTIONS.C

OVERLAY.OBJ:	OVERLAY.C $(OVERLAY_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c OVERLAY.C

PRNTSCAN.OBJ:	PRNTSCAN.C $(PRNTSCAN_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c PRNTSCAN.C

REFRESH.OBJ:	REFRESH.C $(REFRESH_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c REFRESH.C

SCRREG.OBJ:	SCRREG.C $(SCRREG_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c SCRREG.C

SETMODE.OBJ:	SETMODE.C $(SETMODE_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c SETMODE.C

SETTERM.OBJ:	SETTERM.C $(SETTERM_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c SETTERM.C

STRADD.OBJ:	STRADD.C $(STRADD_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c STRADD.C

STRGET.OBJ:	STRGET.C $(STRGET_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c STRGET.C

TABSIZE.OBJ:	TABSIZE.C $(TABSIZE_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c TABSIZE.C

TERMMISC.OBJ:	TERMMISC.C $(TERMMISC_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c TERMMISC.C

UNCTRL.OBJ:	UNCTRL.C $(UNCTRL_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c UNCTRL.C

UPDATE.OBJ:	UPDATE.C $(UPDATE_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c UPDATE.C

WINCLEAR.OBJ:	WINCLEAR.C $(WINCLEAR_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c WINCLEAR.C

WINDEL.OBJ:	WINDEL.C $(WINDEL_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c WINDEL.C

WINERASE.OBJ:	WINERASE.C $(WINERASE_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c WINERASE.C

WINMOVE.OBJ:	WINMOVE.C $(WINMOVE_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c WINMOVE.C

WINSCROL.OBJ:	WINSCROL.C $(WINSCROL_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c WINSCROL.C

WINTOUCH.OBJ:	WINTOUCH.C $(WINTOUCH_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c WINTOUCH.C

$(PROJ).LIB::	ATTRIB.OBJ BEEP.OBJ BORDER.OBJ BOXES.OBJ CHARADD.OBJ CHARDEL.OBJ CHARGET.OBJ \
	CHARINS.OBJ CHARPICK.OBJ CLRTOBOT.OBJ CLRTOEOL.OBJ CURSESIO.OBJ ENDWIN.OBJ INITSCR.OBJ \
	LINEDEL.OBJ LINEINS.OBJ LONGNAME.OBJ MOVE.OBJ MVCURSOR.OBJ NEWWIN.OBJ OPTIONS.OBJ \
	OVERLAY.OBJ PRNTSCAN.OBJ REFRESH.OBJ SCRREG.OBJ SETMODE.OBJ SETTERM.OBJ STRADD.OBJ \
	STRGET.OBJ TABSIZE.OBJ TERMMISC.OBJ UNCTRL.OBJ UPDATE.OBJ WINCLEAR.OBJ WINDEL.OBJ \
	WINERASE.OBJ WINMOVE.OBJ WINSCROL.OBJ WINTOUCH.OBJ $(OBJS_EXT)
	echo >NUL @<<$(PROJ).CRF
$@ /PAGESIZE:64
y
+ATTRIB.OBJ &
+BEEP.OBJ &
+BORDER.OBJ &
+BOXES.OBJ &
+CHARADD.OBJ &
+CHARDEL.OBJ &
+CHARGET.OBJ &
+CHARINS.OBJ &
+CHARPICK.OBJ &
+CLRTOBOT.OBJ &
+CLRTOEOL.OBJ &
+CURSESIO.OBJ &
+ENDWIN.OBJ &
+INITSCR.OBJ &
+LINEDEL.OBJ &
+LINEINS.OBJ &
+LONGNAME.OBJ &
+MOVE.OBJ &
+MVCURSOR.OBJ &
+NEWWIN.OBJ &
+OPTIONS.OBJ &
+OVERLAY.OBJ &
+PRNTSCAN.OBJ &
+REFRESH.OBJ &
+SCRREG.OBJ &
+SETMODE.OBJ &
+SETTERM.OBJ &
+STRADD.OBJ &
+STRGET.OBJ &
+TABSIZE.OBJ &
+TERMMISC.OBJ &
+UNCTRL.OBJ &
+UPDATE.OBJ &
+WINCLEAR.OBJ &
+WINDEL.OBJ &
+WINERASE.OBJ &
+WINMOVE.OBJ &
+WINSCROL.OBJ &
+WINTOUCH.OBJ &
;
<<
	if exist $@ del $@
	lib @$(PROJ).CRF

$(PROJ).BSC: $(SBRS)
	bscmake @<<
/o$@ $(SBRS)
<<
