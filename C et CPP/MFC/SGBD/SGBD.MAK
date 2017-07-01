# Microsoft Visual C++ generated build script - Do not modify

PROJ = SGBD
DEBUG = 1
PROGTYPE = 0
CALLER = 
ARGS = 
DLLS = 
D_RCDEFINES = /d_DEBUG
R_RCDEFINES = /dNDEBUG
ORIGIN = MSVC
ORIGIN_VER = 1.00
PROJPATH = D:\CPP\MFC\SGBD\
USEMFC = 1
CC = cl
CPP = cl
CXX = cl
CCREATEPCHFLAG = 
CPPCREATEPCHFLAG = /YcSTDAFX.H
CUSEPCHFLAG = 
CPPUSEPCHFLAG = /YuSTDAFX.H
FIRSTC =             
FIRSTCPP = STDAFX.CPP  
RC = rc
CFLAGS_D_WEXE = /nologo /G2 /W3 /Zi /AM /Od /D "_DEBUG" /FR /GA /Fd"SGBD.PDB" 
CFLAGS_R_WEXE = /nologo /Gs /G3 /W3 /AM /O1 /D "NDEBUG" /FR /GA 
LFLAGS_D_WEXE = /NOLOGO /NOD /PACKC:61440 /STACK:10240 /ALIGN:16 /ONERROR:NOEXE /CO
LFLAGS_R_WEXE = /NOLOGO /NOD /PACKC:61440 /STACK:10240 /ALIGN:16 /ONERROR:NOEXE
LIBS_D_WEXE = mafxcwd oldnames libw mlibcew commdlg shell  odbc
LIBS_R_WEXE = mafxcw oldnames libw mlibcew commdlg shell  odbc
RCFLAGS = /nologo /z
RESFLAGS = /nologo /t
RUNFLAGS = 
DEFFILE = SGBD.DEF
OBJS_EXT = 
LIBS_EXT = 
!if "$(DEBUG)" == "1"
CFLAGS = $(CFLAGS_D_WEXE)
LFLAGS = $(LFLAGS_D_WEXE)
LIBS = $(LIBS_D_WEXE)
MAPFILE = nul
RCDEFINES = $(D_RCDEFINES)
!else
CFLAGS = $(CFLAGS_R_WEXE)
LFLAGS = $(LFLAGS_R_WEXE)
LIBS = $(LIBS_R_WEXE)
MAPFILE = nul
RCDEFINES = $(R_RCDEFINES)
!endif
!if [if exist MSVC.BND del MSVC.BND]
!endif
SBRS = STDAFX.SBR \
		SGBD.SBR \
		MAINFRM.SBR \
		SGBDDOC.SBR \
		SGBDVIEW.SBR \
		SGBDSET.SBR


SGBD_RCDEP = d:\cpp\mfc\sgbd\res\sgbd.ico \
	d:\cpp\mfc\sgbd\res\sgbd.rc2


STDAFX_DEP = d:\cpp\mfc\sgbd\stdafx.h


SGBD_DEP = d:\cpp\mfc\sgbd\stdafx.h \
	d:\cpp\mfc\sgbd\sgbd.h \
	d:\cpp\mfc\sgbd\mainfrm.h \
	d:\cpp\mfc\sgbd\sgbdset.h \
	d:\cpp\mfc\sgbd\sgbddoc.h \
	d:\cpp\mfc\sgbd\sgbdview.h


MAINFRM_DEP = d:\cpp\mfc\sgbd\stdafx.h \
	d:\cpp\mfc\sgbd\sgbd.h \
	d:\cpp\mfc\sgbd\mainfrm.h


SGBDDOC_DEP = d:\cpp\mfc\sgbd\stdafx.h \
	d:\cpp\mfc\sgbd\sgbd.h \
	d:\cpp\mfc\sgbd\sgbdset.h \
	d:\cpp\mfc\sgbd\sgbddoc.h


SGBDVIEW_DEP = d:\cpp\mfc\sgbd\stdafx.h \
	d:\cpp\mfc\sgbd\sgbd.h \
	d:\cpp\mfc\sgbd\sgbdset.h \
	d:\cpp\mfc\sgbd\sgbddoc.h \
	d:\cpp\mfc\sgbd\sgbdview.h


SGBDSET_DEP = d:\cpp\mfc\sgbd\stdafx.h \
	d:\cpp\mfc\sgbd\sgbd.h \
	d:\cpp\mfc\sgbd\sgbdset.h


all:	$(PROJ).EXE $(PROJ).BSC

SGBD.RES:	SGBD.RC $(SGBD_RCDEP)
	$(RC) $(RCFLAGS) $(RCDEFINES) -r SGBD.RC

STDAFX.OBJ:	STDAFX.CPP $(STDAFX_DEP)
	$(CPP) $(CFLAGS) $(CPPCREATEPCHFLAG) /c STDAFX.CPP

SGBD.OBJ:	SGBD.CPP $(SGBD_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c SGBD.CPP

MAINFRM.OBJ:	MAINFRM.CPP $(MAINFRM_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c MAINFRM.CPP

SGBDDOC.OBJ:	SGBDDOC.CPP $(SGBDDOC_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c SGBDDOC.CPP

SGBDVIEW.OBJ:	SGBDVIEW.CPP $(SGBDVIEW_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c SGBDVIEW.CPP

SGBDSET.OBJ:	SGBDSET.CPP $(SGBDSET_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c SGBDSET.CPP


$(PROJ).EXE::	SGBD.RES

$(PROJ).EXE::	STDAFX.OBJ SGBD.OBJ MAINFRM.OBJ SGBDDOC.OBJ SGBDVIEW.OBJ SGBDSET.OBJ $(OBJS_EXT) $(DEFFILE)
	echo >NUL @<<$(PROJ).CRF
STDAFX.OBJ +
SGBD.OBJ +
MAINFRM.OBJ +
SGBDDOC.OBJ +
SGBDVIEW.OBJ +
SGBDSET.OBJ +
$(OBJS_EXT)
$(PROJ).EXE
$(MAPFILE)
e:\msvc\lib\+
e:\msvc\mfc\lib\+
e:\msvc\lib\+
$(LIBS)
$(DEFFILE);
<<
	link $(LFLAGS) @$(PROJ).CRF
	$(RC) $(RESFLAGS) SGBD.RES $@
	@copy $(PROJ).CRF MSVC.BND

$(PROJ).EXE::	SGBD.RES
	if not exist MSVC.BND 	$(RC) $(RESFLAGS) SGBD.RES $@

run: $(PROJ).EXE
	$(PROJ) $(RUNFLAGS)


$(PROJ).BSC: $(SBRS)
	bscmake @<<
/o$@ $(SBRS)
<<
