# Microsoft Visual C++ generated build script - Do not modify

PROJ = CUC
DEBUG = 0
PROGTYPE = 4
CALLER = 
ARGS = 
DLLS = 
D_RCDEFINES = -d_DEBUG
R_RCDEFINES = -dNDEBUG
ORIGIN = MSVC
ORIGIN_VER = 1.00
PROJPATH = D:\LIB\CUC\
USEMFC = 0
CC = cl
CPP = cl
CXX = cl
CCREATEPCHFLAG = 
CPPCREATEPCHFLAG = 
CUSEPCHFLAG = 
CPPUSEPCHFLAG = 
FIRSTC = CUCCHB.C    
FIRSTCPP =             
RC = rc
CFLAGS_D_LIB = /nologo /G2 /W3 /Z7 /AL /Od /D "_DEBUG" /I "." /I "..\biberc" /I "..\pccurses" /I "..\include" /FR /GA /J
CFLAGS_R_LIB = /nologo /Gs /G2 /W3 /AL /O1 /Ox /D "NDEBUG" /I "." /I "..\biberc" /I "..\pccurses" /I "..\include" /FR /GA /J
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
SBRS = CUCCHB.SBR \
		CUCHSB.SBR \
		CUCLBL.SBR \
		CUCLST.SBR \
		CUCOPT.SBR \
		CUCUTIL.SBR \
		CUCVSB.SBR \
		CUCTXT.SBR \
		CUCBTN.SBR \
		CUCFRA.SBR \
		CUCCOB.SBR \
		CUCWIN.SBR \
		CUCFLB.SBR \
		CUCDLB.SBR \
		CUCFRM.SBR \
		CUCMNU.SBR \
		CUCGCTL.SBR \
		CUCOUT.SBR


CUCCHB_DEP = d:\lib\cuc\cuc.h \
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
	d:\lib\cuc\cucdlb.h \
	d:\lib\cuc\cucout.h \
	d:\lib\cuc\cucwin.h \
	d:\lib\cuc\cucmnu.h


CUCHSB_DEP = d:\lib\cuc\cuc.h \
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
	d:\lib\cuc\cucdlb.h \
	d:\lib\cuc\cucout.h \
	d:\lib\cuc\cucwin.h \
	d:\lib\cuc\cucmnu.h


CUCLBL_DEP = d:\lib\cuc\cuc.h \
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
	d:\lib\cuc\cucdlb.h \
	d:\lib\cuc\cucout.h \
	d:\lib\cuc\cucwin.h \
	d:\lib\cuc\cucmnu.h


CUCLST_DEP = d:\lib\cuc\cuc.h \
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
	d:\lib\cuc\cucdlb.h \
	d:\lib\cuc\cucout.h \
	d:\lib\cuc\cucwin.h \
	d:\lib\cuc\cucmnu.h


CUCOPT_DEP = d:\lib\cuc\cuc.h \
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
	d:\lib\cuc\cucdlb.h \
	d:\lib\cuc\cucout.h \
	d:\lib\cuc\cucwin.h \
	d:\lib\cuc\cucmnu.h


CUCUTIL_DEP = d:\lib\cuc\cuc.h \
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
	d:\lib\cuc\cucdlb.h \
	d:\lib\cuc\cucout.h \
	d:\lib\cuc\cucwin.h \
	d:\lib\cuc\cucmnu.h


CUCVSB_DEP = d:\lib\cuc\cuc.h \
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
	d:\lib\cuc\cucdlb.h \
	d:\lib\cuc\cucout.h \
	d:\lib\cuc\cucwin.h \
	d:\lib\cuc\cucmnu.h


CUCTXT_DEP = d:\lib\cuc\cuc.h \
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
	d:\lib\cuc\cucdlb.h \
	d:\lib\cuc\cucout.h \
	d:\lib\cuc\cucwin.h \
	d:\lib\cuc\cucmnu.h


CUCBTN_DEP = d:\lib\cuc\cuc.h \
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
	d:\lib\cuc\cucdlb.h \
	d:\lib\cuc\cucout.h \
	d:\lib\cuc\cucwin.h \
	d:\lib\cuc\cucmnu.h


CUCFRA_DEP = d:\lib\cuc\cuc.h \
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
	d:\lib\cuc\cucdlb.h \
	d:\lib\cuc\cucout.h \
	d:\lib\cuc\cucwin.h \
	d:\lib\cuc\cucmnu.h


CUCCOB_DEP = d:\lib\cuc\cuc.h \
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
	d:\lib\cuc\cucdlb.h \
	d:\lib\cuc\cucout.h \
	d:\lib\cuc\cucwin.h \
	d:\lib\cuc\cucmnu.h


CUCWIN_DEP = d:\lib\cuc\cuc.h \
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
	d:\lib\cuc\cucdlb.h \
	d:\lib\cuc\cucout.h \
	d:\lib\cuc\cucwin.h \
	d:\lib\cuc\cucmnu.h


CUCFLB_DEP = d:\lib\cuc\cuc.h \
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
	d:\lib\cuc\cucdlb.h \
	d:\lib\cuc\cucout.h \
	d:\lib\cuc\cucwin.h \
	d:\lib\cuc\cucmnu.h


CUCDLB_DEP = d:\lib\cuc\cuc.h \
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
	d:\lib\cuc\cucdlb.h \
	d:\lib\cuc\cucout.h \
	d:\lib\cuc\cucwin.h \
	d:\lib\cuc\cucmnu.h


CUCFRM_DEP = d:\lib\cuc\cuc.h \
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
	d:\lib\cuc\cucdlb.h \
	d:\lib\cuc\cucout.h \
	d:\lib\cuc\cucwin.h \
	d:\lib\cuc\cucmnu.h \
	d:\lib\cuc\cucgctl.h


CUCMNU_DEP = d:\lib\cuc\cuc.h \
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
	d:\lib\cuc\cucdlb.h \
	d:\lib\cuc\cucout.h \
	d:\lib\cuc\cucwin.h \
	d:\lib\cuc\cucmnu.h


CUCGCTL_DEP = d:\lib\cuc\cuc.h \
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
	d:\lib\cuc\cucdlb.h \
	d:\lib\cuc\cucout.h \
	d:\lib\cuc\cucwin.h \
	d:\lib\cuc\cucmnu.h


CUCOUT_DEP = d:\lib\cuc\cuc.h \
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
	d:\lib\cuc\cucdlb.h \
	d:\lib\cuc\cucout.h \
	d:\lib\cuc\cucwin.h \
	d:\lib\cuc\cucmnu.h


all:	$(PROJ).LIB $(PROJ).BSC

CUCCHB.OBJ:	CUCCHB.C $(CUCCHB_DEP)
	$(CC) $(CFLAGS) $(CCREATEPCHFLAG) /c CUCCHB.C

CUCHSB.OBJ:	CUCHSB.C $(CUCHSB_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c CUCHSB.C

CUCLBL.OBJ:	CUCLBL.C $(CUCLBL_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c CUCLBL.C

CUCLST.OBJ:	CUCLST.C $(CUCLST_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c CUCLST.C

CUCOPT.OBJ:	CUCOPT.C $(CUCOPT_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c CUCOPT.C

CUCUTIL.OBJ:	CUCUTIL.C $(CUCUTIL_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c CUCUTIL.C

CUCVSB.OBJ:	CUCVSB.C $(CUCVSB_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c CUCVSB.C

CUCTXT.OBJ:	CUCTXT.C $(CUCTXT_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c CUCTXT.C

CUCBTN.OBJ:	CUCBTN.C $(CUCBTN_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c CUCBTN.C

CUCFRA.OBJ:	CUCFRA.C $(CUCFRA_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c CUCFRA.C

CUCCOB.OBJ:	CUCCOB.C $(CUCCOB_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c CUCCOB.C

CUCWIN.OBJ:	CUCWIN.C $(CUCWIN_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c CUCWIN.C

CUCFLB.OBJ:	CUCFLB.C $(CUCFLB_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c CUCFLB.C

CUCDLB.OBJ:	CUCDLB.C $(CUCDLB_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c CUCDLB.C

CUCFRM.OBJ:	CUCFRM.C $(CUCFRM_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c CUCFRM.C

CUCMNU.OBJ:	CUCMNU.C $(CUCMNU_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c CUCMNU.C

CUCGCTL.OBJ:	CUCGCTL.C $(CUCGCTL_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c CUCGCTL.C

CUCOUT.OBJ:	CUCOUT.C $(CUCOUT_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c CUCOUT.C

$(PROJ).LIB::	CUCCHB.OBJ CUCHSB.OBJ CUCLBL.OBJ CUCLST.OBJ CUCOPT.OBJ CUCUTIL.OBJ \
	CUCVSB.OBJ CUCTXT.OBJ CUCBTN.OBJ CUCFRA.OBJ CUCCOB.OBJ CUCWIN.OBJ CUCFLB.OBJ CUCDLB.OBJ \
	CUCFRM.OBJ CUCMNU.OBJ CUCGCTL.OBJ CUCOUT.OBJ $(OBJS_EXT)
	echo >NUL @<<$(PROJ).CRF
$@ /PAGESIZE:64
y
+CUCCHB.OBJ &
+CUCHSB.OBJ &
+CUCLBL.OBJ &
+CUCLST.OBJ &
+CUCOPT.OBJ &
+CUCUTIL.OBJ &
+CUCVSB.OBJ &
+CUCTXT.OBJ &
+CUCBTN.OBJ &
+CUCFRA.OBJ &
+CUCCOB.OBJ &
+CUCWIN.OBJ &
+CUCFLB.OBJ &
+CUCDLB.OBJ &
+CUCFRM.OBJ &
+CUCMNU.OBJ &
+CUCGCTL.OBJ &
+CUCOUT.OBJ &
;
<<
	if exist $@ del $@
	lib @$(PROJ).CRF

$(PROJ).BSC: $(SBRS)
	bscmake @<<
/o$@ $(SBRS)
<<
