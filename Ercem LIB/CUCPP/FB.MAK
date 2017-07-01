# Microsoft Visual C++ generated build script - Do not modify

PROJ = FB
DEBUG = 1
PROGTYPE = 6
CALLER = 
ARGS = 
DLLS = 
D_RCDEFINES = -d_DEBUG
R_RCDEFINES = -dNDEBUG
ORIGIN = MSVC
ORIGIN_VER = 1.00
PROJPATH = D:\LIB\CUCPP\
USEMFC = 0
CC = cl
CPP = cl
CXX = cl
CCREATEPCHFLAG = 
CPPCREATEPCHFLAG = 
CUSEPCHFLAG = 
CPPUSEPCHFLAG = 
FIRSTC =             
FIRSTCPP = CUCPP.CPP   
RC = rc
CFLAGS_D_DEXE = /nologo /G2 /W3 /Zi /AL /Od /D "_DEBUG" /D "_DOS" /I "../pccurses" /I "../biberc" /I "../cuc" /FR /Fd"CUCPP.PDB"    /J
CFLAGS_R_DEXE = /nologo /Gs /G2 /W3 /AL /Ox /D "NDEBUG" /D "_DOS" /I "../pccurses" /I "../biberc" /I "../cuc" /FR /J
LFLAGS_D_DEXE = /NOLOGO /NOI /STACK:5120 /ONERROR:NOEXE /CO 
LFLAGS_R_DEXE = /NOLOGO /NOI /STACK:5120 /ONERROR:NOEXE 
LIBS_D_DEXE = oldnames llibce ..\pccurses\pccurses ..\biberc\biberc ..\cuc\cuc 
LIBS_R_DEXE = oldnames llibce ..\pccurses\pccurses ..\biberc\biberc ..\cuc\libcuc 
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
SBRS = CUCPP.SBR \
		FB.SBR \
		CSTRING.SBR


CUCPP_DEP = d:\lib\cucpp\cucpp.h


FB_DEP = d:\lib\cucpp\cstring.h \
	d:\lib\cucpp\cucpp.h


CSTRING_DEP = d:\lib\cucpp\cstring.h


all:	$(PROJ).EXE $(PROJ).BSC

CUCPP.OBJ:	CUCPP.CPP $(CUCPP_DEP)
	$(CPP) $(CFLAGS) $(CPPCREATEPCHFLAG) /c CUCPP.CPP

FB.OBJ:	FB.CPP $(FB_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c FB.CPP

CSTRING.OBJ:	CSTRING.CPP $(CSTRING_DEP)
	$(CPP) $(CFLAGS) $(CPPUSEPCHFLAG) /c CSTRING.CPP

$(PROJ).EXE::	CUCPP.OBJ FB.OBJ CSTRING.OBJ $(OBJS_EXT) $(DEFFILE)
	echo >NUL @<<$(PROJ).CRF
CUCPP.OBJ +
FB.OBJ +
CSTRING.OBJ +
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
