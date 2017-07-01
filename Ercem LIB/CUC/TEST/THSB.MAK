# Microsoft Visual C++ generated build script - Do not modify

PROJ = THSB
DEBUG = 1
PROGTYPE = 6
CALLER = 
ARGS = 
DLLS = 
D_RCDEFINES = -d_DEBUG
R_RCDEFINES = -dNDEBUG
ORIGIN = MSVC
ORIGIN_VER = 1.00
PROJPATH = D:\LIB\CUC\TEST\
USEMFC = 0
CC = cl
CPP = cl
CXX = cl
CCREATEPCHFLAG = 
CPPCREATEPCHFLAG = 
CUSEPCHFLAG = 
CPPUSEPCHFLAG = 
FIRSTC = THSB.C      
FIRSTCPP =             
RC = rc
CFLAGS_D_DEXE = /nologo /G2 /W3 /Zi /AM /Od /D "_DEBUG" /D "_DOS" /I "..\..\pccurses" /I "..\..\biberc" /I "..\..\include" /I ".." /FR /Fd"THSB.PDB"     /J
CFLAGS_R_DEXE = /nologo /Gs /G2 /W3 /AM /Ox /D "NDEBUG" /D "_DOS" /I "..\..\pccurses" /I "..\..\biberc" /I "..\..\include" /I ".." /FR /J
LFLAGS_D_DEXE = /NOLOGO /NOI /STACK:5120 /ONERROR:NOEXE /CO 
LFLAGS_R_DEXE = /NOLOGO /NOI /STACK:5120 /ONERROR:NOEXE 
LIBS_D_DEXE = oldnames mlibce ..\..\pccurses\pccurses ..\..\biberc\biberc ..\cuc 
LIBS_R_DEXE = oldnames mlibce ..\..\pccurses\pccurses ..\..\biberc\biberc ..\cuc 
RCFLAGS = /nologo
RESFLAGS = /nologo
RUNFLAGS = 
OBJS_EXT = 
LIBS_EXT = 
!if "$(DEBUG)" == "1"
CFLAGS = $(CFLAGS_D_DEXE)
LFLAGS = $(LFLAGS_D_DEXE)
LIBS = $(LIBS_D_DEXE)
MAPFILE = nul
RCDEFINES = $(D_RCDEFINES)
!else
CFLAGS = $(CFLAGS_R_DEXE)
LFLAGS = $(LFLAGS_R_DEXE)
LIBS = $(LIBS_R_DEXE)
MAPFILE = nul
RCDEFINES = $(R_RCDEFINES)
!endif
!if [if exist MSVC.BND del MSVC.BND]
!endif
SBRS = THSB.SBR


THSB_DEP = d:\lib\cuc\cuc.h \
	d:\lib\cuc\cucpriv.h \
	d:\lib\cuc\cuchsb.h \
	d:\lib\cuc\cucvsb.h \
	d:\lib\cuc\cuclbl.h \
	d:\lib\cuc\cucchb.h \
	d:\lib\cuc\cuclst.h \
	d:\lib\cuc\cucopt.h \
	d:\lib\cuc\cuctxt.h \
	d:\lib\cuc\cucfra.h \
	d:\lib\cuc\cucbtn.h \
	d:\lib\cuc\cuccob.h \
	d:\lib\cuc\cucflb.h \
	d:\lib\cuc\cucwin.h \
	d:\lib\cuc\cucdlb.h


all:	$(PROJ).EXE $(PROJ).BSC

THSB.OBJ:	THSB.C $(THSB_DEP)
	$(CC) $(CFLAGS) $(CCREATEPCHFLAG) /c THSB.C

$(PROJ).EXE::	THSB.OBJ $(OBJS_EXT) $(DEFFILE)
	echo >NUL @<<$(PROJ).CRF
THSB.OBJ +
$(OBJS_EXT)
$(PROJ).EXE
$(MAPFILE)
e:\msvc\lib\+
e:\msvc\mfc\lib\+
e:\msvc\lib\+
d:\ole2\lib\+
$(LIBS)
$(DEFFILE);
<<
	link $(LFLAGS) @$(PROJ).CRF

run: $(PROJ).EXE
	$(PROJ) $(RUNFLAGS)


$(PROJ).BSC: $(SBRS)
	bscmake @<<
/o$@ $(SBRS)
<<
