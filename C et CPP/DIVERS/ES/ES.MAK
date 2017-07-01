# Microsoft Visual C++ generated build script - Do not modify

PROJ = ES
DEBUG = 0
PROGTYPE = 6
CALLER = 
ARGS = 
DLLS = 
D_RCDEFINES = -d_DEBUG
R_RCDEFINES = -dNDEBUG
ORIGIN = MSVC
ORIGIN_VER = 1.00
PROJPATH = D:\DIVERS\ES\
USEMFC = 0
CC = cl
CPP = cl
CXX = cl
CCREATEPCHFLAG = 
CPPCREATEPCHFLAG = 
CUSEPCHFLAG = 
CPPUSEPCHFLAG = 
FIRSTC = ES.C        
FIRSTCPP =             
RC = rc
CFLAGS_D_DEXE = /nologo /G2 /W3 /Zi /AM /Od /D "_DEBUG" /D "_DOS" /I "..\..\lib\include" /I "..\..\lib\pccurses" /I "..\..\lib\biberc" /I "..\..\lib\cuc" /I "..\..\lib\cucplus" /FR /Fd"ES.PDB"
CFLAGS_R_DEXE = /nologo /Gs /G2 /W3 /AL /O1 /Ox /D "NDEBUG" /D "_DOS" /I "..\..\lib\include" /I "..\..\lib\pccurses" /I "..\..\lib\biberc" /I "..\..\lib\cuc" /I "..\..\lib\cucplus" /FR 
LFLAGS_D_DEXE = /NOLOGO /NOI /STACK:5120 /ONERROR:NOEXE /CO 
LFLAGS_R_DEXE = /NOLOGO /NOI /STACK:5120 /ONERROR:NOEXE 
LIBS_D_DEXE = oldnames mlibce ..\..\lib\pccurses\pccurses ..\..\lib\biberc\biberc ..\..\lib\cuc\cuc ..\..\lib\cucplus\cucplus 
LIBS_R_DEXE = oldnames llibce ..\..\lib\pccurses\pccurses ..\..\lib\biberc\biberc ..\..\lib\cuc\cuc ..\..\lib\cucplus\cucplus 
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
SBRS = ES.SBR \
		FFIND.SBR \
		FREPL.SBR \
		FOPT.SBR \
		FHELP.SBR


ES_DEP = d:\divers\es\ffind.h \
	d:\divers\es\frepl.h \
	d:\divers\es\fopt.h \
	d:\divers\es\fhelp.h


FFIND_DEP = d:\divers\es\ffind.h


FREPL_DEP = d:\divers\es\frepl.h


FOPT_DEP = d:\divers\es\fopt.h


FHELP_DEP = d:\divers\es\fhelp.h


all:	$(PROJ).EXE $(PROJ).BSC

ES.OBJ:	ES.C $(ES_DEP)
	$(CC) $(CFLAGS) $(CCREATEPCHFLAG) /c ES.C

FFIND.OBJ:	FFIND.C $(FFIND_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c FFIND.C

FREPL.OBJ:	FREPL.C $(FREPL_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c FREPL.C

FOPT.OBJ:	FOPT.C $(FOPT_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c FOPT.C

FHELP.OBJ:	FHELP.C $(FHELP_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c FHELP.C

$(PROJ).EXE::	ES.OBJ FFIND.OBJ FREPL.OBJ FOPT.OBJ FHELP.OBJ $(OBJS_EXT) $(DEFFILE)
	echo >NUL @<<$(PROJ).CRF
ES.OBJ +
FFIND.OBJ +
FREPL.OBJ +
FOPT.OBJ +
FHELP.OBJ +
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
