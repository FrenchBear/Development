# Microsoft Visual C++ Generated NMAKE File, Format Version 2.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

!IF "$(CFG)" == ""
CFG=Win32 Debug
!MESSAGE No configuration specified.  Defaulting to Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "Win32 Release" && "$(CFG)" != "Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "tar32.mak" CFG="Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

################################################################################
# Begin Project
# PROP Target_Last_Scanned "Win32 Debug"
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "WinRel"
# PROP BASE Intermediate_Dir "WinRel"
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "WinRel"
# PROP Intermediate_Dir "WinRel"
OUTDIR=.\WinRel
INTDIR=.\WinRel

ALL : .\WinRel\tar32.exe .\WinRel\tar32.bsc

$(OUTDIR) : 
    if not exist $(OUTDIR)/nul mkdir $(OUTDIR)

# ADD BASE CPP /nologo /W3 /YX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_X86_" /FR /c
# ADD CPP /nologo /W3 /YX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_X86_" /FR /c
CPP_PROJ=/nologo /W3 /YX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_X86_"\
 /FR$(INTDIR)/ /Fp$(OUTDIR)/"tar32.pch" /Fo$(INTDIR)/ /c 
CPP_OBJS=.\WinRel/
# ADD BASE RSC /l 0x40c /d "NDEBUG"
# ADD RSC /l 0x40c /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o$(OUTDIR)/"tar32.bsc" 
BSC32_SBRS= \
	.\WinRel\TAR.SBR \
	.\WinRel\CREATE.SBR \
	.\WinRel\Getoldopt.sbr \
	.\WinRel\GETOPT1.SBR \
	.\WinRel\MANGLE.SBR \
	.\WinRel\GETOPT.SBR \
	.\WinRel\NAMES.SBR \
	.\WinRel\BUFFER.SBR \
	.\WinRel\GNU.SBR \
	.\WinRel\MSD_DIR.SBR \
	.\WinRel\GETDATE.SBR \
	.\WinRel\VERSION.SBR \
	.\WinRel\LIST.SBR \
	.\WinRel\FNMATCH.SBR \
	.\WinRel\ALLOCA.SBR \
	.\WinRel\PORT.SBR \
	.\WinRel\DIFFARCH.SBR \
	.\WinRel\EXTRACT.SBR \
	.\WinRel\UPDATE.SBR \
	.\WinRel\REGEX.SBR

.\WinRel\tar32.bsc : $(OUTDIR)  $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
# ADD BASE LINK32 netapi32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /NOLOGO /SUBSYSTEM:console /MACHINE:IX86
# ADD LINK32 netapi32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /NOLOGO /SUBSYSTEM:console /MACHINE:IX86
LINK32_FLAGS=netapi32.lib kernel32.lib user32.lib gdi32.lib winspool.lib\
 comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib\
 odbc32.lib odbccp32.lib /NOLOGO /SUBSYSTEM:console /INCREMENTAL:no\
 /PDB:$(OUTDIR)/"tar32.pdb" /MACHINE:IX86 /OUT:$(OUTDIR)/"tar32.exe" 
DEF_FILE=
LINK32_OBJS= \
	.\WinRel\TAR.OBJ \
	.\WinRel\CREATE.OBJ \
	.\WinRel\Getoldopt.obj \
	.\WinRel\GETOPT1.OBJ \
	.\WinRel\MANGLE.OBJ \
	.\WinRel\GETOPT.OBJ \
	.\WinRel\NAMES.OBJ \
	.\WinRel\BUFFER.OBJ \
	.\WinRel\GNU.OBJ \
	.\WinRel\MSD_DIR.OBJ \
	.\WinRel\GETDATE.OBJ \
	.\WinRel\VERSION.OBJ \
	.\WinRel\LIST.OBJ \
	.\WinRel\FNMATCH.OBJ \
	.\WinRel\ALLOCA.OBJ \
	.\WinRel\PORT.OBJ \
	.\WinRel\DIFFARCH.OBJ \
	.\WinRel\EXTRACT.OBJ \
	.\WinRel\UPDATE.OBJ \
	.\WinRel\REGEX.OBJ

.\WinRel\tar32.exe : $(OUTDIR)  $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "WinDebug"
# PROP BASE Intermediate_Dir "WinDebug"
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "WinDebug"
# PROP Intermediate_Dir "WinDebug"
OUTDIR=.\WinDebug
INTDIR=.\WinDebug

ALL : .\WinDebug\tar32.exe .\WinDebug\tar32.bsc

$(OUTDIR) : 
    if not exist $(OUTDIR)/nul mkdir $(OUTDIR)

# ADD BASE CPP /nologo /W3 /Zi /YX /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_X86_" /D "NONAMES" /D "NO_REMOTE" /D "__MSDOS__" /D "HAVE_VPRINTF" /D "HAVE_FTIME" /D "HAVE_STRSTR" /D "HAVE_VALLOC" /D "HAVE_MKDIR" /D "HAVE_MKNOD" /D "HAVE_RENAME" /D "HAVE_GETCWD" /D "__STDC__" /D "STDC_HEADERS" /D ="1" /FR "main" ="_main" /c
# ADD CPP /nologo /W1 /Zi /YX /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_X86_" /D "NONAMES" /D "NO_REMOTE" /D "__MSDOS__" /D "HAVE_VPRINTF" /D "HAVE_GETCWD" /D __STDC__=1 /FR /D  STDC_HEADERS"="1",main ="_main"  /c
CPP_PROJ=/nologo /W1 /Zi /YX /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D\
 "_X86_" /D "NONAMES" /D "NO_REMOTE" /D "__MSDOS__" /D "HAVE_VPRINTF" /D\
 "HAVE_GETCWD" /D __STDC__=1 /FR$(INTDIR)/ /Fp$(OUTDIR)/"tar32.pch"\
 /Fo$(INTDIR)/ /Fd$(OUTDIR)/"tar32.pdb" /D  STDC_HEADERS"="1",main ="_main"  /c 
CPP_OBJS=.\WinDebug/
# ADD BASE RSC /l 0x40c /d "_DEBUG"
# ADD RSC /l 0x40c /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o$(OUTDIR)/"tar32.bsc" 
BSC32_SBRS= \
	.\WinDebug\TAR.SBR \
	.\WinDebug\CREATE.SBR \
	.\WinDebug\Getoldopt.sbr \
	.\WinDebug\GETOPT1.SBR \
	.\WinDebug\MANGLE.SBR \
	.\WinDebug\GETOPT.SBR \
	.\WinDebug\NAMES.SBR \
	.\WinDebug\BUFFER.SBR \
	.\WinDebug\GNU.SBR \
	.\WinDebug\MSD_DIR.SBR \
	.\WinDebug\GETDATE.SBR \
	.\WinDebug\VERSION.SBR \
	.\WinDebug\LIST.SBR \
	.\WinDebug\FNMATCH.SBR \
	.\WinDebug\ALLOCA.SBR \
	.\WinDebug\PORT.SBR \
	.\WinDebug\DIFFARCH.SBR \
	.\WinDebug\EXTRACT.SBR \
	.\WinDebug\UPDATE.SBR \
	.\WinDebug\REGEX.SBR

.\WinDebug\tar32.bsc : $(OUTDIR)  $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
# ADD BASE LINK32 netapi32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /NOLOGO /SUBSYSTEM:console /DEBUG /MACHINE:IX86
# ADD LINK32 netapi32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /NOLOGO /SUBSYSTEM:console /DEBUG /MACHINE:IX86
LINK32_FLAGS=netapi32.lib kernel32.lib user32.lib gdi32.lib winspool.lib\
 comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib\
 odbc32.lib odbccp32.lib /NOLOGO /SUBSYSTEM:console /INCREMENTAL:yes\
 /PDB:$(OUTDIR)/"tar32.pdb" /DEBUG /MACHINE:IX86 /OUT:$(OUTDIR)/"tar32.exe" 
DEF_FILE=
LINK32_OBJS= \
	.\WinDebug\TAR.OBJ \
	.\WinDebug\CREATE.OBJ \
	.\WinDebug\Getoldopt.obj \
	.\WinDebug\GETOPT1.OBJ \
	.\WinDebug\MANGLE.OBJ \
	.\WinDebug\GETOPT.OBJ \
	.\WinDebug\NAMES.OBJ \
	.\WinDebug\BUFFER.OBJ \
	.\WinDebug\GNU.OBJ \
	.\WinDebug\MSD_DIR.OBJ \
	.\WinDebug\GETDATE.OBJ \
	.\WinDebug\VERSION.OBJ \
	.\WinDebug\LIST.OBJ \
	.\WinDebug\FNMATCH.OBJ \
	.\WinDebug\ALLOCA.OBJ \
	.\WinDebug\PORT.OBJ \
	.\WinDebug\DIFFARCH.OBJ \
	.\WinDebug\EXTRACT.OBJ \
	.\WinDebug\UPDATE.OBJ \
	.\WinDebug\REGEX.OBJ

.\WinDebug\tar32.exe : $(OUTDIR)  $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
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

SOURCE=.\TAR.C
DEP_TAR_C=\
	.\GETOPT.H\
	.\REGEX.H\
	.\TAR.H\
	.\PORT.H\
	.\FNMATCH.H\
	.\PATHMAX.H\
	.\MSD_DIR.H

!IF  "$(CFG)" == "Win32 Release"

.\WinRel\TAR.OBJ :  $(SOURCE)  $(DEP_TAR_C) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

.\WinDebug\TAR.OBJ :  $(SOURCE)  $(DEP_TAR_C) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\CREATE.C
DEP_CREAT=\
	.\TAR.H\
	.\PORT.H\
	.\PATHMAX.H\
	.\MSD_DIR.H

!IF  "$(CFG)" == "Win32 Release"

.\WinRel\CREATE.OBJ :  $(SOURCE)  $(DEP_CREAT) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

.\WinDebug\CREATE.OBJ :  $(SOURCE)  $(DEP_CREAT) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\Getoldopt.c

!IF  "$(CFG)" == "Win32 Release"

.\WinRel\Getoldopt.obj :  $(SOURCE)  $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

.\WinDebug\Getoldopt.obj :  $(SOURCE)  $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\GETOPT1.C

!IF  "$(CFG)" == "Win32 Release"

.\WinRel\GETOPT1.OBJ :  $(SOURCE)  $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

.\WinDebug\GETOPT1.OBJ :  $(SOURCE)  $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\MANGLE.C
DEP_MANGL=\
	.\TAR.H\
	.\PORT.H\
	.\PATHMAX.H\
	.\MSD_DIR.H

!IF  "$(CFG)" == "Win32 Release"

.\WinRel\MANGLE.OBJ :  $(SOURCE)  $(DEP_MANGL) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

.\WinDebug\MANGLE.OBJ :  $(SOURCE)  $(DEP_MANGL) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\GETOPT.C

!IF  "$(CFG)" == "Win32 Release"

.\WinRel\GETOPT.OBJ :  $(SOURCE)  $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

.\WinDebug\GETOPT.OBJ :  $(SOURCE)  $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\NAMES.C

!IF  "$(CFG)" == "Win32 Release"

.\WinRel\NAMES.OBJ :  $(SOURCE)  $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

.\WinDebug\NAMES.OBJ :  $(SOURCE)  $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\BUFFER.C
DEP_BUFFE=\
	.\TAR.H\
	.\PORT.H\
	.\RMT.H\
	.\REGEX.H\
	.\PATHMAX.H\
	.\MSD_DIR.H

!IF  "$(CFG)" == "Win32 Release"

.\WinRel\BUFFER.OBJ :  $(SOURCE)  $(DEP_BUFFE) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

.\WinDebug\BUFFER.OBJ :  $(SOURCE)  $(DEP_BUFFE) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\GNU.C
DEP_GNU_C=\
	.\TAR.H\
	.\PORT.H\
	.\PATHMAX.H\
	.\MSD_DIR.H

!IF  "$(CFG)" == "Win32 Release"

.\WinRel\GNU.OBJ :  $(SOURCE)  $(DEP_GNU_C) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

.\WinDebug\GNU.OBJ :  $(SOURCE)  $(DEP_GNU_C) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\MSD_DIR.C
DEP_MSD_D=\
	.\MSD_DIR.H

!IF  "$(CFG)" == "Win32 Release"

.\WinRel\MSD_DIR.OBJ :  $(SOURCE)  $(DEP_MSD_D) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

.\WinDebug\MSD_DIR.OBJ :  $(SOURCE)  $(DEP_MSD_D) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\GETDATE.C

!IF  "$(CFG)" == "Win32 Release"

.\WinRel\GETDATE.OBJ :  $(SOURCE)  $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

.\WinDebug\GETDATE.OBJ :  $(SOURCE)  $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\VERSION.C

!IF  "$(CFG)" == "Win32 Release"

.\WinRel\VERSION.OBJ :  $(SOURCE)  $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

.\WinDebug\VERSION.OBJ :  $(SOURCE)  $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\LIST.C
DEP_LIST_=\
	.\TAR.H\
	.\PORT.H\
	.\PATHMAX.H\
	.\MSD_DIR.H

!IF  "$(CFG)" == "Win32 Release"

.\WinRel\LIST.OBJ :  $(SOURCE)  $(DEP_LIST_) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

.\WinDebug\LIST.OBJ :  $(SOURCE)  $(DEP_LIST_) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\FNMATCH.C
DEP_FNMAT=\
	.\FNMATCH.H

!IF  "$(CFG)" == "Win32 Release"

.\WinRel\FNMATCH.OBJ :  $(SOURCE)  $(DEP_FNMAT) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

.\WinDebug\FNMATCH.OBJ :  $(SOURCE)  $(DEP_FNMAT) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\ALLOCA.C

!IF  "$(CFG)" == "Win32 Release"

.\WinRel\ALLOCA.OBJ :  $(SOURCE)  $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

.\WinDebug\ALLOCA.OBJ :  $(SOURCE)  $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\PORT.C
DEP_PORT_=\
	.\TAR.H\
	.\PORT.H\
	.\OPEN3.H\
	.\PATHMAX.H\
	.\MSD_DIR.H

!IF  "$(CFG)" == "Win32 Release"

.\WinRel\PORT.OBJ :  $(SOURCE)  $(DEP_PORT_) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

.\WinDebug\PORT.OBJ :  $(SOURCE)  $(DEP_PORT_) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\DIFFARCH.C
DEP_DIFFA=\
	.\TAR.H\
	.\PORT.H\
	.\RMT.H\
	.\PATHMAX.H\
	.\MSD_DIR.H

!IF  "$(CFG)" == "Win32 Release"

.\WinRel\DIFFARCH.OBJ :  $(SOURCE)  $(DEP_DIFFA) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

.\WinDebug\DIFFARCH.OBJ :  $(SOURCE)  $(DEP_DIFFA) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\EXTRACT.C
DEP_EXTRA=\
	.\OPEN3.H\
	.\TAR.H\
	.\PORT.H\
	.\PATHMAX.H\
	.\MSD_DIR.H

!IF  "$(CFG)" == "Win32 Release"

.\WinRel\EXTRACT.OBJ :  $(SOURCE)  $(DEP_EXTRA) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

.\WinDebug\EXTRACT.OBJ :  $(SOURCE)  $(DEP_EXTRA) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\UPDATE.C
DEP_UPDAT=\
	.\TAR.H\
	.\PORT.H\
	.\RMT.H\
	.\PATHMAX.H\
	.\MSD_DIR.H

!IF  "$(CFG)" == "Win32 Release"

.\WinRel\UPDATE.OBJ :  $(SOURCE)  $(DEP_UPDAT) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

.\WinDebug\UPDATE.OBJ :  $(SOURCE)  $(DEP_UPDAT) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\REGEX.C

!IF  "$(CFG)" == "Win32 Release"

.\WinRel\REGEX.OBJ :  $(SOURCE)  $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

.\WinDebug\REGEX.OBJ :  $(SOURCE)  $(INTDIR)

!ENDIF 

# End Source File
# End Group
# End Project
################################################################################
