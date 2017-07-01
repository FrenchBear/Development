# Microsoft Visual C++ generated build script - Do not modify

PROJ = BIBERC
DEBUG = 0
PROGTYPE = 4
CALLER = 
ARGS = 
DLLS = 
D_RCDEFINES = -d_DEBUG
R_RCDEFINES = -dNDEBUG
ORIGIN = MSVC
ORIGIN_VER = 1.00
PROJPATH = D:\LIB\BIBERC\
USEMFC = 0
CC = cl
CPP = cl
CXX = cl
CCREATEPCHFLAG = 
CPPCREATEPCHFLAG = 
CUSEPCHFLAG = 
CPPUSEPCHFLAG = 
FIRSTC = ALERT.C     
FIRSTCPP =             
RC = rc
CFLAGS_D_LIB = /nologo /G2 /W3 /Z7 /AL /Od /D "_DEBUG" /D "DOS" /I "..\pccurses" /I "..\include" /FR /GA /J
CFLAGS_R_LIB = /nologo /Gs /G2 /W3 /AL /O1 /Ox /D "NDEBUG" /D "DOS" /I "..\pccurses" /I "..\include" /FR /GA /J
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
SBRS = ALERT.SBR \
		CHAINE.SBR \
		DATEFR.SBR \
		ESECR.SBR \
		FILTREO.SBR \
		FSELECT.SBR \
		GETENVST.SBR \
		HEURE.SBR \
		INPUT.SBR \
		INPUTBOX.SBR \
		IXTIMEUN.SBR \
		OPENPATH.SBR \
		STROP.SBR \
		TRIM.SBR \
		UNIXTIME.SBR \
		BOX.SBR \
		VPANEL.SBR \
		STRPAT.SBR \
		STRNCPY2.SBR \
		SZCASE.SBR \
		STRNCAT2.SBR \
		APRINTF.SBR \
		SQLFATAL.SBR \
		ASSERT.SBR \
		FGETS2.SBR \
		IERR.SBR \
		UNTIMEIX.SBR \
		VALID.SBR \
		RIGHT.SBR \
		STRICMP.SBR \
		BEMENU.SBR \
		BEGRILLE.SBR \
		CARTOUCH.SBR \
		TIMESTAM.SBR \
		PROFILE.SBR \
		FUTIL.SBR


ALERT_DEP = d:\lib\biberc\biberc.h \
	d:\lib\biberc\import.h


CHAINE_DEP = d:\lib\biberc\biberc.h \
	d:\lib\biberc\import.h


DATEFR_DEP = d:\lib\biberc\import.h


ESECR_DEP = d:\lib\biberc\biberc.h \
	d:\lib\biberc\import.h


FILTREO_DEP = d:\lib\biberc\biberc.h


FSELECT_DEP = d:\lib\biberc\biberc.h \
	d:\lib\biberc\import.h


GETENVST_DEP = d:\lib\biberc\biberc.h \
	d:\lib\biberc\import.h


HEURE_DEP = d:\lib\biberc\biberc.h \
	d:\lib\biberc\import.h


INPUT_DEP = d:\lib\biberc\biberc.h \
	d:\lib\biberc\import.h


INPUTBOX_DEP = d:\lib\biberc\biberc.h \
	d:\lib\biberc\import.h


IXTIMEUN_DEP = d:\lib\biberc\biberc.h \
	d:\lib\biberc\import.h


OPENPATH_DEP = d:\lib\biberc\import.h


STROP_DEP = d:\lib\biberc\biberc.h \
	d:\lib\biberc\import.h


TRIM_DEP = d:\lib\biberc\biberc.h


UNIXTIME_DEP = 

BOX_DEP = d:\lib\biberc\biberc.h \
	d:\lib\biberc\import.h


VPANEL_DEP = d:\lib\biberc\biberc.h \
	d:\lib\biberc\import.h


STRPAT_DEP = d:\lib\biberc\biberc.h \
	d:\lib\biberc\import.h


STRNCPY2_DEP = d:\lib\biberc\import.h


SZCASE_DEP = d:\lib\biberc\biberc.h \
	d:\lib\biberc\import.h


STRNCAT2_DEP = d:\lib\biberc\import.h


APRINTF_DEP = d:\lib\biberc\biberc.h \
	d:\lib\biberc\import.h


SQLFATAL_DEP = d:\lib\biberc\biberc.h \
	d:\lib\biberc\import.h


ASSERT_DEP = d:\lib\biberc\biberc.h \
	d:\lib\biberc\import.h


FGETS2_DEP = d:\lib\biberc\import.h


IERR_DEP = d:\lib\biberc\ierr.h \
	d:\lib\biberc\import.h


UNTIMEIX_DEP = d:\lib\biberc\biberc.h \
	d:\lib\biberc\import.h


VALID_DEP = d:\lib\biberc\biberc.h \
	d:\lib\biberc\import.h


RIGHT_DEP = d:\lib\biberc\biberc.h \
	d:\lib\biberc\import.h


STRICMP_DEP = d:\lib\biberc\biberc.h \
	d:\lib\biberc\import.h


BEMENU_DEP = d:\lib\biberc\biberc.h \
	d:\lib\biberc\import.h


BEGRILLE_DEP = d:\lib\biberc\biberc.h \
	d:\lib\biberc\import.h


CARTOUCH_DEP = d:\lib\biberc\biberc.h \
	d:\lib\biberc\import.h


TIMESTAM_DEP = d:\lib\biberc\biberc.h \
	d:\lib\biberc\import.h


FUTIL_DEP = 

all:	$(PROJ).LIB $(PROJ).BSC

ALERT.OBJ:	ALERT.C $(ALERT_DEP)
	$(CC) $(CFLAGS) $(CCREATEPCHFLAG) /c ALERT.C

CHAINE.OBJ:	CHAINE.C $(CHAINE_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c CHAINE.C

DATEFR.OBJ:	DATEFR.C $(DATEFR_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c DATEFR.C

ESECR.OBJ:	ESECR.C $(ESECR_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ESECR.C

FILTREO.OBJ:	FILTREO.C $(FILTREO_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c FILTREO.C

FSELECT.OBJ:	FSELECT.C $(FSELECT_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c FSELECT.C

GETENVST.OBJ:	GETENVST.C $(GETENVST_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c GETENVST.C

HEURE.OBJ:	HEURE.C $(HEURE_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c HEURE.C

INPUT.OBJ:	INPUT.C $(INPUT_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c INPUT.C

INPUTBOX.OBJ:	INPUTBOX.C $(INPUTBOX_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c INPUTBOX.C

IXTIMEUN.OBJ:	IXTIMEUN.C $(IXTIMEUN_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c IXTIMEUN.C

OPENPATH.OBJ:	OPENPATH.C $(OPENPATH_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c OPENPATH.C

STROP.OBJ:	STROP.C $(STROP_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c STROP.C

TRIM.OBJ:	TRIM.C $(TRIM_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c TRIM.C

UNIXTIME.OBJ:	UNIXTIME.C $(UNIXTIME_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c UNIXTIME.C

BOX.OBJ:	BOX.C $(BOX_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c BOX.C

VPANEL.OBJ:	VPANEL.C $(VPANEL_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c VPANEL.C

STRPAT.OBJ:	STRPAT.C $(STRPAT_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c STRPAT.C

STRNCPY2.OBJ:	STRNCPY2.C $(STRNCPY2_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c STRNCPY2.C

SZCASE.OBJ:	SZCASE.C $(SZCASE_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c SZCASE.C

STRNCAT2.OBJ:	STRNCAT2.C $(STRNCAT2_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c STRNCAT2.C

APRINTF.OBJ:	APRINTF.C $(APRINTF_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c APRINTF.C

SQLFATAL.OBJ:	SQLFATAL.C $(SQLFATAL_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c SQLFATAL.C

ASSERT.OBJ:	ASSERT.C $(ASSERT_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ASSERT.C

FGETS2.OBJ:	FGETS2.C $(FGETS2_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c FGETS2.C

IERR.OBJ:	IERR.C $(IERR_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c IERR.C

UNTIMEIX.OBJ:	UNTIMEIX.C $(UNTIMEIX_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c UNTIMEIX.C

VALID.OBJ:	VALID.C $(VALID_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c VALID.C

RIGHT.OBJ:	RIGHT.C $(RIGHT_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c RIGHT.C

STRICMP.OBJ:	STRICMP.C $(STRICMP_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c STRICMP.C

BEMENU.OBJ:	BEMENU.C $(BEMENU_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c BEMENU.C

BEGRILLE.OBJ:	BEGRILLE.C $(BEGRILLE_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c BEGRILLE.C

CARTOUCH.OBJ:	CARTOUCH.C $(CARTOUCH_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c CARTOUCH.C

TIMESTAM.OBJ:	TIMESTAM.C $(TIMESTAM_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c TIMESTAM.C

PROFILE.OBJ:	PROFILE.C $(PROFILE_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c PROFILE.C

FUTIL.OBJ:	FUTIL.C $(FUTIL_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c FUTIL.C

$(PROJ).LIB::	ALERT.OBJ CHAINE.OBJ DATEFR.OBJ ESECR.OBJ FILTREO.OBJ FSELECT.OBJ GETENVST.OBJ \
	HEURE.OBJ INPUT.OBJ INPUTBOX.OBJ IXTIMEUN.OBJ OPENPATH.OBJ STROP.OBJ TRIM.OBJ UNIXTIME.OBJ \
	BOX.OBJ VPANEL.OBJ STRPAT.OBJ STRNCPY2.OBJ SZCASE.OBJ STRNCAT2.OBJ APRINTF.OBJ SQLFATAL.OBJ \
	ASSERT.OBJ FGETS2.OBJ IERR.OBJ UNTIMEIX.OBJ VALID.OBJ RIGHT.OBJ STRICMP.OBJ BEMENU.OBJ \
	BEGRILLE.OBJ CARTOUCH.OBJ TIMESTAM.OBJ PROFILE.OBJ FUTIL.OBJ $(OBJS_EXT)
	echo >NUL @<<$(PROJ).CRF
$@ /PAGESIZE:64
y
+ALERT.OBJ &
+CHAINE.OBJ &
+DATEFR.OBJ &
+ESECR.OBJ &
+FILTREO.OBJ &
+FSELECT.OBJ &
+GETENVST.OBJ &
+HEURE.OBJ &
+INPUT.OBJ &
+INPUTBOX.OBJ &
+IXTIMEUN.OBJ &
+OPENPATH.OBJ &
+STROP.OBJ &
+TRIM.OBJ &
+UNIXTIME.OBJ &
+BOX.OBJ &
+VPANEL.OBJ &
+STRPAT.OBJ &
+STRNCPY2.OBJ &
+SZCASE.OBJ &
+STRNCAT2.OBJ &
+APRINTF.OBJ &
+SQLFATAL.OBJ &
+ASSERT.OBJ &
+FGETS2.OBJ &
+IERR.OBJ &
+UNTIMEIX.OBJ &
+VALID.OBJ &
+RIGHT.OBJ &
+STRICMP.OBJ &
+BEMENU.OBJ &
+BEGRILLE.OBJ &
+CARTOUCH.OBJ &
+TIMESTAM.OBJ &
+PROFILE.OBJ &
+FUTIL.OBJ &
;
<<
	if exist $@ del $@
	lib @$(PROJ).CRF

$(PROJ).BSC: $(SBRS)
	bscmake @<<
/o$@ $(SBRS)
<<
