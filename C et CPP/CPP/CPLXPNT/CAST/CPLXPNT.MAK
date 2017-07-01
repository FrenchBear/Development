# Microsoft Visual C++ generated build script - Do not modify

PROJ = CPLXPNT
DEBUG = 1
PROGTYPE = 3
CALLER = 
ARGS = 
DLLS = 
D_RCDEFINES = -d_DEBUG
R_RCDEFINES = -dNDEBUG
ORIGIN = MSVC
ORIGIN_VER = 1.00
PROJPATH = D:\CPP\CPLXPNT\CAST\
USEMFC = 0
CC = cl
CPP = cl
CXX = cl
CCREATEPCHFLAG = 
CPPCREATEPCHFLAG = 
CUSEPCHFLAG = 
CPPUSEPCHFLAG = 
FIRSTC =             
FIRSTCPP = POINT.CPP   
RC = rc
CFLAGS_D_WTTY = /nologo /G2 /Mq /W4 /Zi /Od /D "_DEBUG" /FR /Fd"CPLXPNT.PDB"
CFLAGS_R_WTTY = /nologo /Gs /G2 /Mq /W3 /AM /Ox /D "NDEBUG" /FR 
LFLAGS_D_WTTY = /NOLOGO /ONERROR:NOEXE /NOD /PACKC:57344 /CO /ALIGN:16
LFLAGS_R_WTTY = /NOLOGO /ONERROR:NOEXE /NOD /PACKC:57344 /ALIGN:16
LIBS_D_WTTY = oldnames libw slibcewq
LIBS_R_WTTY = oldnames libw mlibcewq
RCFLAGS = /nologo
RESFLAGS = /nologo
RUNFLAGS = 
OBJS_EXT = 
LIBS_EXT = 
!if "$(DEBUG)" == "1"
CFLAGS = $(CFLAGS_D_WTTY)
LFLAGS = $(LFLAGS_D_WTTY)
LIBS = $(LIBS_D_WTTY)
MAPFILE = nul
RCDEFINES = $(D_RCDEFINES)
DEFFILE=E:\MSVC\BIN\CL.DEF
!else
CFLAGS = $(CFLAGS_R_WTTY)
LFLAGS = $(LFLAGS_R_WTTY)
LIBS = $(LIBS_R_WTTY)
MAPFILE = nul
RCDEFINES = $(R_RCDEFINES)
DEFFILE=E:\MSVC\BIN\CL.DEF
!endif
!if [if exist MSVC.BND del MSVC.BND]
!endif
SBRS = POINT.SBR \
		CPLXPNT.SBR \
		COMPLEXE.SBR


POINT_DEP = d:\cpp\cplxpnt\cast\point.h \
	d:\cpp\cplxpnt\cast\complexe.h


CPLXPNT_DEP = d:\cpp\cplxpnt\cast\point.h \
	d:\cpp\cplxpnt\cast\complexe.h


COMPLEXE_DEP = d:\cpp\cplxpnt\cast\complexe.h \
	d:\cpp\cplxpnt\cast\point.h


all:	$(PROJ).EXE $(PROJ).BSC

POINT.OBJ:	POINT.CPP $(POINT_DEP)
	$(CPP) $(CFLAGS) $(CPPCREATEPCHFLAG) /c POINT.CPP

CPLXPNT.OBJ:	CPLXPNT.CPP $(CPLXPNT_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c CPLXPNT.CPP

COMPLEXE.OBJ:	COMPLEXE.CPP $(COMPLEXE_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c COMPLEXE.CPP


$(PROJ).EXE::	POINT.OBJ CPLXPNT.OBJ COMPLEXE.OBJ $(OBJS_EXT) $(DEFFILE)
	echo >NUL @<<$(PROJ).CRF
POINT.OBJ +
CPLXPNT.OBJ +
COMPLEXE.OBJ +
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
	$(RC) $(RESFLAGS) $@


run: $(PROJ).EXE
	$(PROJ) $(RUNFLAGS)


$(PROJ).BSC: $(SBRS)
	bscmake @<<
/o$@ $(SBRS)
<<
