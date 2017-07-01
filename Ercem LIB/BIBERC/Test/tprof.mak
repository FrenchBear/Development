# Microsoft Visual C++ generated build script - Do not modify

PROJ = TPROF
DEBUG = 1
PROGTYPE = 6
CALLER = 
ARGS = 
DLLS = 
D_RCDEFINES = -d_DEBUG
R_RCDEFINES = -dNDEBUG
ORIGIN = MSVC
ORIGIN_VER = 1.00
PROJPATH = D:\LIB\BIBERC\TEST\
USEMFC = 0
CC = cl
CPP = cl
CXX = cl
CCREATEPCHFLAG = 
CPPCREATEPCHFLAG = 
CUSEPCHFLAG = 
CPPUSEPCHFLAG = 
FIRSTC = TPROF.C     
FIRSTCPP =             
RC = rc
CFLAGS_D_DEXE = /nologo /G2 /W3 /Zi /AL /Od /D "_DEBUG" /D "_DOS" /I "..\..\include" /I "..\..\pccurses" /I "..\..\biberc" /I "..\..\cuc" /FR /Fd"TPROF.PDB"
CFLAGS_R_DEXE = /nologo /Gs /G2 /W3 /AL /Ox /D "NDEBUG" /D "_DOS" /I "..\..\include" /I "..\..\pccurses" /I "..\..\biberc" /I "..\..\cuc" /FR 
LFLAGS_D_DEXE = /NOLOGO /NOI /STACK:15120 /ONERROR:NOEXE /CO 
LFLAGS_R_DEXE = /NOLOGO /NOI /STACK:15120 /ONERROR:NOEXE 
LIBS_D_DEXE = oldnames llibce ..\biberc ..\..\pccurses\pccurses 
LIBS_R_DEXE = oldnames llibce ..\biberc ..\..\pccurses\pccurses 
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
SBRS = TPROF.SBR


all:	$(PROJ).EXE $(PROJ).BSC

TPROF.OBJ:	TPROF.C $(TPROF_DEP)
	$(CC) $(CFLAGS) $(CCREATEPCHFLAG) /c TPROF.C

$(PROJ).EXE::	TPROF.OBJ $(OBJS_EXT) $(DEFFILE)
	echo >NUL @<<$(PROJ).CRF
TPROF.OBJ +
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
