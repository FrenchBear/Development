# Microsoft Visual C++ generated build script - Do not modify

PROJ = TAR
DEBUG = 1
PROGTYPE = 2
CALLER = 
ARGS = 
DLLS = 
ORIGIN = MSVCNT
ORIGIN_VER = 1.00
PROJPATH = D:\DIVERS\TAR\TAR1112\ 
USEMFC = 0
CC = cl
CPP = cl
CXX = cl
CCREATEPCHFLAG = 
CPPCREATEPCHFLAG = 
CUSEPCHFLAG = 
CPPUSEPCHFLAG = 
FIRSTC = ALLOCA.C
FIRSTCPP = 
RC = rc
CFLAGS_D_DEXE32 = /nologo /W3 /Zi /YX /D "STDC_HEADERS"="1" /D "main"="_main" /D "_X86_" /D "_DEBUG" /D "_CONSOLE" /D "NONAMES" /D "NO_REMOTE" /D "__MSDOS__" /D "NO_REMOTE" /D "HAVE_VPRINTF" /D "HAVE_FTIME" /D "HAVE_STRSTR" /D "HAVE_VALLOC" /D "HAVE_MKDIR" /D "HAVE_MKNOD" /D "HAVE_RENAME" /D "HAVE_GETCWD" /D "__STDC__" /FR /ML /Fd"TAR.PDB" /Fp"TAR.PCH"
CFLAGS_R_DEXE32 = /nologo /W3 /YX /O2 /D "_X86_" /D "NDEBUG" /D "_CONSOLE" /FR /ML /Fp"TAR.PCH"
LFLAGS_D_DEXE32 = /NOLOGO /DEBUG /DEBUGTYPE:cv /SUBSYSTEM:console netapi32.lib
LFLAGS_R_DEXE32 = /NOLOGO /SUBSYSTEM:console netapi32.lib
LFLAGS_D_LIB32 = /NOLOGO
LFLAGS_R_LIB32 = /NOLOGO
LIBS_D_DEXE32 = 
LIBS_R_DEXE32 = 
RCFLAGS32 = 
D_RCDEFINES32 = -d_DEBUG
R_RCDEFINES32 = -dNDEBUG
OBJS_EXT = 
LIBS_EXT = 
!if "$(DEBUG)" == "1"
CFLAGS = $(CFLAGS_D_DEXE32)
LFLAGS = $(LFLAGS_D_DEXE32)
LIBS = $(LIBS_D_DEXE32)
LFLAGS_LIB=$(LFLAGS_D_LIB32)
MAPFILE_OPTION = 
RCDEFINES = $(D_RCDEFINES32)
!else
CFLAGS = $(CFLAGS_R_DEXE32)
LFLAGS = $(LFLAGS_R_DEXE32)
LIBS = $(LIBS_R_DEXE32)
MAPFILE_OPTION = 
LFLAGS_LIB=$(LFLAGS_R_LIB32)
RCDEFINES = $(R_RCDEFINES32)
!endif
SBRS = TAR.SBR \
		CREATE.SBR


TAR_DEP =  \
	d:\divers\tar\tar1112\getopt.h \
	d:\divers\tar\tar1112\regex.h \
	d:\divers\tar\tar1112\tar.h \
	d:\divers\tar\tar1112\testpad.h \
	d:\divers\tar\tar1112\port.h \
	d:\divers\tar\tar1112\pathmax.h \
	d:\divers\tar\tar1112\msd_dir.h \
	d:\divers\tar\tar1112\fnmatch.h


CREATE_DEP =  \
	d:\divers\tar\tar1112\tar.h \
	d:\divers\tar\tar1112\testpad.h \
	d:\divers\tar\tar1112\port.h \
	d:\divers\tar\tar1112\pathmax.h \
	d:\divers\tar\tar1112\msd_dir.h


all:	$(PROJ).EXE $(PROJ).BSC

TAR.OBJ:	TAR.C $(TAR_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c TAR.C

CREATE.OBJ:	CREATE.C $(CREATE_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c CREATE.C

$(PROJ).EXE:	TAR.OBJ CREATE.OBJ $(OBJS_EXT) $(LIBS_EXT)
	echo >NUL @<<$(PROJ).CRF
TAR.OBJ 
CREATE.OBJ 
$(OBJS_EXT)
-OUT:$(PROJ).EXE
$(MAPFILE_OPTION)
$(LIBS)
$(LIBS_EXT)
$(DEFFILE_OPTION) -implib:$(PROJ).lib
<<
	link $(LFLAGS) @$(PROJ).CRF

run: $(PROJ).EXE
	$(PROJ) $(RUNFLAGS)


$(PROJ).BSC: $(SBRS)
	bscmake @<<
/o$@ $(SBRS)
<<
