# Microsoft Visual C++ generated build script - Do not modify

PROJ = CUCPLUS
DEBUG = 0
PROGTYPE = 4
CALLER = 
ARGS = 
DLLS = 
D_RCDEFINES = -d_DEBUG
R_RCDEFINES = -dNDEBUG
ORIGIN = MSVC
ORIGIN_VER = 1.00
PROJPATH = D:\LIB\CUCPLUS\
USEMFC = 0
CC = cl
CPP = cl
CXX = cl
CCREATEPCHFLAG = 
CPPCREATEPCHFLAG = 
CUSEPCHFLAG = 
CPPUSEPCHFLAG = 
FIRSTC = IBOX.C      
FIRSTCPP =             
RC = rc
CFLAGS_D_LIB = /nologo /G2 /W3 /Z7 /AM /Od /D "_DEBUG" /I "..\include" /I "..\pccurses" /I "..\biberc" /I "..\cuc" /FR /GA 
CFLAGS_R_LIB = /nologo /Gs /G2 /W3 /AL /O1 /Ox /D "NDEBUG" /I "..\include" /I "..\pccurses" /I "..\biberc" /I "..\cuc" /FR /GA 
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
SBRS = IBOX.SBR \
		FORMHELP.SBR \
		FIMPR.SBR


IBOX_DEP = d:\lib\cucplus\cucplus.h


FORMHELP_DEP = d:\lib\cucplus\cucplus.h


FIMPR_DEP = d:\lib\cucplus\cucplus.h


all:	$(PROJ).LIB $(PROJ).BSC

IBOX.OBJ:	IBOX.C $(IBOX_DEP)
	$(CC) $(CFLAGS) $(CCREATEPCHFLAG) /c IBOX.C

FORMHELP.OBJ:	FORMHELP.C $(FORMHELP_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c FORMHELP.C

FIMPR.OBJ:	FIMPR.C $(FIMPR_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c FIMPR.C

$(PROJ).LIB::	IBOX.OBJ FORMHELP.OBJ FIMPR.OBJ $(OBJS_EXT)
	echo >NUL @<<$(PROJ).CRF
$@ /PAGESIZE:64
y
+IBOX.OBJ &
+FORMHELP.OBJ &
+FIMPR.OBJ &
;
<<
	if exist $@ del $@
	lib @$(PROJ).CRF

$(PROJ).BSC: $(SBRS)
	bscmake @<<
/o$@ $(SBRS)
<<
