# Microsoft Visual C++ Generated NMAKE File, Format Version 2.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Static Library" 0x0104

!IF "$(CFG)" == ""
CFG=Win32 Debug
!MESSAGE No configuration specified.  Defaulting to Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "Win32 Release" && "$(CFG)" != "Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "biberc32.mak" CFG="Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "Win32 Release" (based on "Win32 (x86) Static Library")
!MESSAGE "Win32 Debug" (based on "Win32 (x86) Static Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

################################################################################
# Begin Project
# PROP Target_Last_Scanned "Win32 Debug"
CPP=cl.exe

!IF  "$(CFG)" == "Win32 Release"

# PROP BASE Use_MFC 1
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "WinRel"
# PROP BASE Intermediate_Dir "WinRel"
# PROP Use_MFC 1
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "WinRel"
# PROP Intermediate_Dir "WinRel"
OUTDIR=.\WinRel
INTDIR=.\WinRel

ALL : $(OUTDIR)/biberc32.lib $(OUTDIR)/biberc32.bsc

$(OUTDIR) : 
    if not exist $(OUTDIR)/nul mkdir $(OUTDIR)

# ADD BASE CPP /nologo /MT /W3 /GX /YX /Ox /I "..\pccurses" /I "..\include" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /FR /J /c
# ADD CPP /nologo /MT /W3 /GX /YX /Ox /I "..\pccurses" /I "..\include" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /FR /J /c
CPP_PROJ=/nologo /MT /W3 /GX /YX /Ox /I "..\pccurses" /I "..\include" /D\
 "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /FR$(INTDIR)/\
 /Fp$(OUTDIR)/"biberc32.pch" /Fo$(INTDIR)/ /J /c 
CPP_OBJS=.\WinRel/
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o$(OUTDIR)/"biberc32.bsc" 
BSC32_SBRS= \
	$(INTDIR)/ALERT.SBR \
	$(INTDIR)/CHAINE.SBR \
	$(INTDIR)/DATEFR.SBR \
	$(INTDIR)/ESECR.SBR \
	$(INTDIR)/FILTREO.SBR \
	$(INTDIR)/FSELECT.SBR \
	$(INTDIR)/GETENVST.SBR \
	$(INTDIR)/HEURE.SBR \
	$(INTDIR)/INPUT.SBR \
	$(INTDIR)/INPUTBOX.SBR \
	$(INTDIR)/IXTIMEUN.SBR \
	$(INTDIR)/OPENPATH.SBR \
	$(INTDIR)/STROP.SBR \
	$(INTDIR)/TRIM.SBR \
	$(INTDIR)/UNIXTIME.SBR \
	$(INTDIR)/BOX.SBR \
	$(INTDIR)/VPANEL.SBR \
	$(INTDIR)/STRPAT.SBR \
	$(INTDIR)/strncpy2.sbr \
	$(INTDIR)/SZCASE.SBR \
	$(INTDIR)/STRNCAT2.SBR \
	$(INTDIR)/APRINTF.SBR \
	$(INTDIR)/SQLFATAL.SBR \
	$(INTDIR)/ASSERT.SBR \
	$(INTDIR)/FGETS2.SBR \
	$(INTDIR)/IERR.SBR \
	$(INTDIR)/UNTIMEIX.SBR \
	$(INTDIR)/VALID.SBR \
	$(INTDIR)/RIGHT.SBR \
	$(INTDIR)/STRICMP.SBR \
	$(INTDIR)/BEMENU.SBR \
	$(INTDIR)/BEGRILLE.SBR \
	$(INTDIR)/CARTOUCH.SBR \
	$(INTDIR)/TIMESTAM.SBR \
	$(INTDIR)/profile.sbr \
	$(INTDIR)/futil.sbr

$(OUTDIR)/biberc32.bsc : $(OUTDIR)  $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LIB32=lib.exe
# ADD BASE LIB32 /NOLOGO
# ADD LIB32 /NOLOGO
LIB32_FLAGS=/NOLOGO /OUT:$(OUTDIR)\"biberc32.lib" 
DEF_FLAGS=
DEF_FILE=
LIB32_OBJS= \
	$(INTDIR)/ALERT.OBJ \
	$(INTDIR)/CHAINE.OBJ \
	$(INTDIR)/DATEFR.OBJ \
	$(INTDIR)/ESECR.OBJ \
	$(INTDIR)/FILTREO.OBJ \
	$(INTDIR)/FSELECT.OBJ \
	$(INTDIR)/GETENVST.OBJ \
	$(INTDIR)/HEURE.OBJ \
	$(INTDIR)/INPUT.OBJ \
	$(INTDIR)/INPUTBOX.OBJ \
	$(INTDIR)/IXTIMEUN.OBJ \
	$(INTDIR)/OPENPATH.OBJ \
	$(INTDIR)/STROP.OBJ \
	$(INTDIR)/TRIM.OBJ \
	$(INTDIR)/UNIXTIME.OBJ \
	$(INTDIR)/BOX.OBJ \
	$(INTDIR)/VPANEL.OBJ \
	$(INTDIR)/STRPAT.OBJ \
	$(INTDIR)/strncpy2.obj \
	$(INTDIR)/SZCASE.OBJ \
	$(INTDIR)/STRNCAT2.OBJ \
	$(INTDIR)/APRINTF.OBJ \
	$(INTDIR)/SQLFATAL.OBJ \
	$(INTDIR)/ASSERT.OBJ \
	$(INTDIR)/FGETS2.OBJ \
	$(INTDIR)/IERR.OBJ \
	$(INTDIR)/UNTIMEIX.OBJ \
	$(INTDIR)/VALID.OBJ \
	$(INTDIR)/RIGHT.OBJ \
	$(INTDIR)/STRICMP.OBJ \
	$(INTDIR)/BEMENU.OBJ \
	$(INTDIR)/BEGRILLE.OBJ \
	$(INTDIR)/CARTOUCH.OBJ \
	$(INTDIR)/TIMESTAM.OBJ \
	$(INTDIR)/profile.obj \
	$(INTDIR)/futil.obj

$(OUTDIR)/biberc32.lib : $(OUTDIR)  $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Win32 Debug"

# PROP BASE Use_MFC 1
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "WinDebug"
# PROP BASE Intermediate_Dir "WinDebug"
# PROP Use_MFC 1
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "WinDebug"
# PROP Intermediate_Dir "WinDebug"
OUTDIR=.\WinDebug
INTDIR=.\WinDebug

ALL : $(OUTDIR)/biberc32.lib $(OUTDIR)/biberc32.bsc

$(OUTDIR) : 
    if not exist $(OUTDIR)/nul mkdir $(OUTDIR)

# ADD BASE CPP /nologo /MT /W3 /GX /Z7 /YX /Od /I "..\pccurses" /I "..\include" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /FR /J /c
# ADD CPP /nologo /MT /W3 /GX /Z7 /YX /Od /I "..\pccurses" /I "..\include" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /FR /J /c
CPP_PROJ=/nologo /MT /W3 /GX /Z7 /YX /Od /I "..\pccurses" /I "..\include" /D\
 "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /FR$(INTDIR)/\
 /Fp$(OUTDIR)/"biberc32.pch" /Fo$(INTDIR)/ /J /c 
CPP_OBJS=.\WinDebug/
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o$(OUTDIR)/"biberc32.bsc" 
BSC32_SBRS= \
	$(INTDIR)/ALERT.SBR \
	$(INTDIR)/CHAINE.SBR \
	$(INTDIR)/DATEFR.SBR \
	$(INTDIR)/ESECR.SBR \
	$(INTDIR)/FILTREO.SBR \
	$(INTDIR)/FSELECT.SBR \
	$(INTDIR)/GETENVST.SBR \
	$(INTDIR)/HEURE.SBR \
	$(INTDIR)/INPUT.SBR \
	$(INTDIR)/INPUTBOX.SBR \
	$(INTDIR)/IXTIMEUN.SBR \
	$(INTDIR)/OPENPATH.SBR \
	$(INTDIR)/STROP.SBR \
	$(INTDIR)/TRIM.SBR \
	$(INTDIR)/UNIXTIME.SBR \
	$(INTDIR)/BOX.SBR \
	$(INTDIR)/VPANEL.SBR \
	$(INTDIR)/STRPAT.SBR \
	$(INTDIR)/strncpy2.sbr \
	$(INTDIR)/SZCASE.SBR \
	$(INTDIR)/STRNCAT2.SBR \
	$(INTDIR)/APRINTF.SBR \
	$(INTDIR)/SQLFATAL.SBR \
	$(INTDIR)/ASSERT.SBR \
	$(INTDIR)/FGETS2.SBR \
	$(INTDIR)/IERR.SBR \
	$(INTDIR)/UNTIMEIX.SBR \
	$(INTDIR)/VALID.SBR \
	$(INTDIR)/RIGHT.SBR \
	$(INTDIR)/STRICMP.SBR \
	$(INTDIR)/BEMENU.SBR \
	$(INTDIR)/BEGRILLE.SBR \
	$(INTDIR)/CARTOUCH.SBR \
	$(INTDIR)/TIMESTAM.SBR \
	$(INTDIR)/profile.sbr \
	$(INTDIR)/futil.sbr

$(OUTDIR)/biberc32.bsc : $(OUTDIR)  $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LIB32=lib.exe
# ADD BASE LIB32 /NOLOGO
# ADD LIB32 /NOLOGO
LIB32_FLAGS=/NOLOGO /OUT:$(OUTDIR)\"biberc32.lib" 
DEF_FLAGS=
DEF_FILE=
LIB32_OBJS= \
	$(INTDIR)/ALERT.OBJ \
	$(INTDIR)/CHAINE.OBJ \
	$(INTDIR)/DATEFR.OBJ \
	$(INTDIR)/ESECR.OBJ \
	$(INTDIR)/FILTREO.OBJ \
	$(INTDIR)/FSELECT.OBJ \
	$(INTDIR)/GETENVST.OBJ \
	$(INTDIR)/HEURE.OBJ \
	$(INTDIR)/INPUT.OBJ \
	$(INTDIR)/INPUTBOX.OBJ \
	$(INTDIR)/IXTIMEUN.OBJ \
	$(INTDIR)/OPENPATH.OBJ \
	$(INTDIR)/STROP.OBJ \
	$(INTDIR)/TRIM.OBJ \
	$(INTDIR)/UNIXTIME.OBJ \
	$(INTDIR)/BOX.OBJ \
	$(INTDIR)/VPANEL.OBJ \
	$(INTDIR)/STRPAT.OBJ \
	$(INTDIR)/strncpy2.obj \
	$(INTDIR)/SZCASE.OBJ \
	$(INTDIR)/STRNCAT2.OBJ \
	$(INTDIR)/APRINTF.OBJ \
	$(INTDIR)/SQLFATAL.OBJ \
	$(INTDIR)/ASSERT.OBJ \
	$(INTDIR)/FGETS2.OBJ \
	$(INTDIR)/IERR.OBJ \
	$(INTDIR)/UNTIMEIX.OBJ \
	$(INTDIR)/VALID.OBJ \
	$(INTDIR)/RIGHT.OBJ \
	$(INTDIR)/STRICMP.OBJ \
	$(INTDIR)/BEMENU.OBJ \
	$(INTDIR)/BEGRILLE.OBJ \
	$(INTDIR)/CARTOUCH.OBJ \
	$(INTDIR)/TIMESTAM.OBJ \
	$(INTDIR)/profile.obj \
	$(INTDIR)/futil.obj

$(OUTDIR)/biberc32.lib : $(OUTDIR)  $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ENDIF 

.c{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

################################################################################
# Begin Group "Source Files"

################################################################################
# Begin Source File

SOURCE=.\ALERT.C
DEP_ALERT=\
	\LIB\pccurses\curses.h\
	\LIB\include\clib.ref\
	.\biberc.h\
	.\import.h

$(INTDIR)/ALERT.OBJ :  $(SOURCE)  $(DEP_ALERT) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\CHAINE.C
DEP_CHAIN=\
	\LIB\include\clib.ref\
	.\biberc.h\
	.\import.h\
	\LIB\pccurses\curses.h

$(INTDIR)/CHAINE.OBJ :  $(SOURCE)  $(DEP_CHAIN) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\DATEFR.C
DEP_DATEF=\
	.\import.h

$(INTDIR)/DATEFR.OBJ :  $(SOURCE)  $(DEP_DATEF) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\ESECR.C
DEP_ESECR=\
	\LIB\include\clib.ref\
	.\biberc.h\
	.\import.h\
	\LIB\pccurses\curses.h

$(INTDIR)/ESECR.OBJ :  $(SOURCE)  $(DEP_ESECR) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\FILTREO.C
DEP_FILTR=\
	.\biberc.h\
	\LIB\pccurses\curses.h

$(INTDIR)/FILTREO.OBJ :  $(SOURCE)  $(DEP_FILTR) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\FSELECT.C
DEP_FSELE=\
	\LIB\include\clib.ref\
	.\biberc.h\
	.\import.h\
	\LIB\pccurses\curses.h

$(INTDIR)/FSELECT.OBJ :  $(SOURCE)  $(DEP_FSELE) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\GETENVST.C
DEP_GETEN=\
	\LIB\include\clib.ref\
	.\biberc.h\
	.\import.h\
	\LIB\pccurses\curses.h

$(INTDIR)/GETENVST.OBJ :  $(SOURCE)  $(DEP_GETEN) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\HEURE.C
DEP_HEURE=\
	\LIB\include\clib.ref\
	.\biberc.h\
	.\import.h\
	\LIB\pccurses\curses.h

$(INTDIR)/HEURE.OBJ :  $(SOURCE)  $(DEP_HEURE) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\INPUT.C
DEP_INPUT=\
	\LIB\include\clib.ref\
	.\biberc.h\
	.\import.h\
	\LIB\pccurses\curses.h

$(INTDIR)/INPUT.OBJ :  $(SOURCE)  $(DEP_INPUT) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\INPUTBOX.C
DEP_INPUTB=\
	\LIB\pccurses\curses.h\
	\LIB\include\clib.ref\
	.\biberc.h\
	.\import.h

$(INTDIR)/INPUTBOX.OBJ :  $(SOURCE)  $(DEP_INPUTB) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\IXTIMEUN.C
DEP_IXTIM=\
	.\biberc.h\
	.\import.h\
	\LIB\pccurses\curses.h

$(INTDIR)/IXTIMEUN.OBJ :  $(SOURCE)  $(DEP_IXTIM) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\OPENPATH.C
DEP_OPENP=\
	\LIB\include\clib.ref\
	.\import.h

$(INTDIR)/OPENPATH.OBJ :  $(SOURCE)  $(DEP_OPENP) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\STROP.C
DEP_STROP=\
	.\biberc.h\
	.\import.h\
	\LIB\pccurses\curses.h

$(INTDIR)/STROP.OBJ :  $(SOURCE)  $(DEP_STROP) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\TRIM.C
DEP_TRIM_=\
	.\biberc.h\
	\LIB\pccurses\curses.h

$(INTDIR)/TRIM.OBJ :  $(SOURCE)  $(DEP_TRIM_) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\UNIXTIME.C

$(INTDIR)/UNIXTIME.OBJ :  $(SOURCE)  $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\BOX.C
DEP_BOX_C=\
	\LIB\pccurses\curses.h\
	\LIB\include\clib.ref\
	.\biberc.h\
	.\import.h

$(INTDIR)/BOX.OBJ :  $(SOURCE)  $(DEP_BOX_C) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\VPANEL.C
DEP_VPANE=\
	\LIB\pccurses\curses.h\
	.\biberc.h\
	.\import.h

$(INTDIR)/VPANEL.OBJ :  $(SOURCE)  $(DEP_VPANE) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\STRPAT.C
DEP_STRPA=\
	.\biberc.h\
	.\import.h\
	\LIB\pccurses\curses.h

$(INTDIR)/STRPAT.OBJ :  $(SOURCE)  $(DEP_STRPA) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\strncpy2.c
DEP_STRNC=\
	.\import.h

$(INTDIR)/strncpy2.obj :  $(SOURCE)  $(DEP_STRNC) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\SZCASE.C
DEP_SZCAS=\
	\LIB\include\clib.ref\
	.\biberc.h\
	.\import.h\
	\LIB\pccurses\curses.h

$(INTDIR)/SZCASE.OBJ :  $(SOURCE)  $(DEP_SZCAS) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\STRNCAT2.C
DEP_STRNCA=\
	.\import.h

$(INTDIR)/STRNCAT2.OBJ :  $(SOURCE)  $(DEP_STRNCA) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\APRINTF.C
DEP_APRIN=\
	.\biberc.h\
	.\import.h\
	\LIB\pccurses\curses.h

$(INTDIR)/APRINTF.OBJ :  $(SOURCE)  $(DEP_APRIN) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\SQLFATAL.C
DEP_SQLFA=\
	.\biberc.h\
	.\import.h\
	\LIB\pccurses\curses.h

$(INTDIR)/SQLFATAL.OBJ :  $(SOURCE)  $(DEP_SQLFA) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\ASSERT.C
DEP_ASSER=\
	.\biberc.h\
	.\import.h\
	\LIB\pccurses\curses.h

$(INTDIR)/ASSERT.OBJ :  $(SOURCE)  $(DEP_ASSER) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\FGETS2.C
DEP_FGETS=\
	.\import.h

$(INTDIR)/FGETS2.OBJ :  $(SOURCE)  $(DEP_FGETS) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\IERR.C
DEP_IERR_=\
	.\ierr.h\
	.\import.h

$(INTDIR)/IERR.OBJ :  $(SOURCE)  $(DEP_IERR_) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\UNTIMEIX.C
DEP_UNTIM=\
	.\biberc.h\
	.\import.h\
	\LIB\pccurses\curses.h

$(INTDIR)/UNTIMEIX.OBJ :  $(SOURCE)  $(DEP_UNTIM) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\VALID.C
DEP_VALID=\
	.\biberc.h\
	.\import.h\
	\LIB\pccurses\curses.h

$(INTDIR)/VALID.OBJ :  $(SOURCE)  $(DEP_VALID) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\RIGHT.C
DEP_RIGHT=\
	\LIB\include\clib.ref\
	.\biberc.h\
	.\import.h\
	\LIB\pccurses\curses.h

$(INTDIR)/RIGHT.OBJ :  $(SOURCE)  $(DEP_RIGHT) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\STRICMP.C
DEP_STRIC=\
	.\biberc.h\
	.\import.h\
	\LIB\pccurses\curses.h

$(INTDIR)/STRICMP.OBJ :  $(SOURCE)  $(DEP_STRIC) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\BEMENU.C
DEP_BEMEN=\
	.\biberc.h\
	.\import.h\
	\LIB\pccurses\curses.h

$(INTDIR)/BEMENU.OBJ :  $(SOURCE)  $(DEP_BEMEN) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\BEGRILLE.C
DEP_BEGRI=\
	.\biberc.h\
	.\import.h\
	\LIB\pccurses\curses.h

$(INTDIR)/BEGRILLE.OBJ :  $(SOURCE)  $(DEP_BEGRI) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\CARTOUCH.C
DEP_CARTO=\
	.\biberc.h\
	.\import.h\
	\LIB\pccurses\curses.h

$(INTDIR)/CARTOUCH.OBJ :  $(SOURCE)  $(DEP_CARTO) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\TIMESTAM.C
DEP_TIMES=\
	.\biberc.h\
	.\import.h\
	\LIB\pccurses\curses.h

$(INTDIR)/TIMESTAM.OBJ :  $(SOURCE)  $(DEP_TIMES) $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\profile.c

$(INTDIR)/profile.obj :  $(SOURCE)  $(INTDIR)

# End Source File
################################################################################
# Begin Source File

SOURCE=.\futil.c
DEP_FUTIL=\
	.\biberc.h\
	\LIB\pccurses\curses.h

$(INTDIR)/futil.obj :  $(SOURCE)  $(DEP_FUTIL) $(INTDIR)

# End Source File
# End Group
# End Project
################################################################################
