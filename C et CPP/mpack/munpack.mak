# Microsoft Visual C++ generated build script - Do not modify

PROJ = MUNPACK
DEBUG = 1
PROGTYPE = 6
CALLER = 
ARGS = 
DLLS = 
D_RCDEFINES = -d_DEBUG
R_RCDEFINES = -dNDEBUG
ORIGIN = MSVC
ORIGIN_VER = 1.00
PROJPATH = D:\C\MPACK\
USEMFC = 0
CC = cl
CPP = cl
CXX = cl
CCREATEPCHFLAG = 
CPPCREATEPCHFLAG = 
CUSEPCHFLAG = 
CPPUSEPCHFLAG = 
FIRSTC = CODES.C     
FIRSTCPP =             
RC = rc
CFLAGS_D_DEXE = /nologo /G2 /Zi /Od /D "_DEBUG" /D "_DOS" /FR /Fd"MUNPACK.PDB"
CFLAGS_R_DEXE = /nologo /Gs /G2 /W3 /Ox /D "NDEBUG" /D "_DOS" /FR 
LFLAGS_D_DEXE = /NOLOGO /ONERROR:NOEXE /NOI /CO /STACK:5120
LFLAGS_R_DEXE = /NOLOGO /ONERROR:NOEXE /NOI /STACK:5120
LIBS_D_DEXE = oldnames slibce
LIBS_R_DEXE = oldnames slibce
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
SBRS = CODES.SBR \
		DOSOS.SBR \
		GETOPT.SBR \
		STRING.SBR \
		XMALLOC.SBR \
		MD5C.SBR \
		DECODE.SBR \
		DOSUNPK.SBR \
		UUDECODE.SBR


CODES_DEP = d:\c\mpack\xmalloc.h \
	d:\c\mpack\md5.h


DOSOS_DEP = d:\c\mpack\xmalloc.h \
	d:\c\mpack\common.h


GETOPT_DEP = 

STRING_DEP = 

XMALLOC_DEP = 

MD5C_DEP = d:\c\mpack\md5.h


DECODE_DEP = d:\c\mpack\xmalloc.h \
	d:\c\mpack\common.h


DOSUNPK_DEP = d:\c\mpack\version.h


UUDECODE_DEP = d:\c\mpack\xmalloc.h \
	d:\c\mpack\common.h


all:	$(PROJ).EXE $(PROJ).BSC

CODES.OBJ:	CODES.C $(CODES_DEP)
	$(CC) $(CFLAGS) $(CCREATEPCHFLAG) /c CODES.C

DOSOS.OBJ:	DOSOS.C $(DOSOS_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c DOSOS.C

GETOPT.OBJ:	GETOPT.C $(GETOPT_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c GETOPT.C

STRING.OBJ:	STRING.C $(STRING_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c STRING.C

XMALLOC.OBJ:	XMALLOC.C $(XMALLOC_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c XMALLOC.C

MD5C.OBJ:	MD5C.C $(MD5C_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c MD5C.C

DECODE.OBJ:	DECODE.C $(DECODE_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c DECODE.C

DOSUNPK.OBJ:	DOSUNPK.C $(DOSUNPK_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c DOSUNPK.C

UUDECODE.OBJ:	UUDECODE.C $(UUDECODE_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c UUDECODE.C

$(PROJ).EXE::	CODES.OBJ DOSOS.OBJ GETOPT.OBJ STRING.OBJ XMALLOC.OBJ MD5C.OBJ DECODE.OBJ \
	DOSUNPK.OBJ UUDECODE.OBJ $(OBJS_EXT) $(DEFFILE)
	echo >NUL @<<$(PROJ).CRF
CODES.OBJ +
DOSOS.OBJ +
GETOPT.OBJ +
STRING.OBJ +
XMALLOC.OBJ +
MD5C.OBJ +
DECODE.OBJ +
DOSUNPK.OBJ +
UUDECODE.OBJ +
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
