# Microsoft Visual C++ generated build script - Do not modify

PROJ = TMNU
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
FIRSTC = TMNU.C      
FIRSTCPP =             
RC = rc
CFLAGS_D_DEXE = /nologo /G2 /W3 /Zi /AL /Od /D "_DEBUG" /D "_DOS" /I "..\..\pccurses" /I "..\..\biberc" /I "..\..\include" /I ".." /FR /Fd"THSB.PDB"       /J
CFLAGS_R_DEXE = /nologo /Gs /G2 /W3 /AL /Ox /D "NDEBUG" /D "_DOS" /I "..\pccurses" /I "..\biberc" /I "..\include" /I "." /FR /J
LFLAGS_D_DEXE = /NOLOGO /NOI /STACK:5120 /ONERROR:NOEXE /CO 
LFLAGS_R_DEXE = /NOLOGO /NOI /STACK:5120 /ONERROR:NOEXE 
LIBS_D_DEXE = oldnames llibce ..\..\pccurses\pccurses ..\..\biberc\biberc ..\cuc 
LIBS_R_DEXE = oldnames llibce ..\pccurses\pccurses ..\biberc\biberc cuc 
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
SBRS = TMNU.SBR


all:	$(PROJ).EXE $(PROJ).BSC

TMNU.OBJ:	TMNU.C $(TMNU_DEP)
	$(CC) $(CFLAGS) $(CCREATEPCHFLAG) /c TMNU.C

$(PROJ).EXE::	TMNU.OBJ $(OBJS_EXT) $(DEFFILE)
	echo >NUL @<<$(PROJ).CRF
TMNU.OBJ +
$(OBJS_EXT)
$(PROJ).EXE
$(MAPFILE)
E:\MSVC\LIB\+
E:\MSVC\MFC\LIB\+
D:\OLE2\LIB\+
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
