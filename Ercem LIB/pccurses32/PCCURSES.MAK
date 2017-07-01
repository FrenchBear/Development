# Microsoft Visual C++ Generated NMAKE File, Format Version 2.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103
# TARGTYPE "Win32 (x86) Static Library" 0x0104

!IF "$(CFG)" == ""
CFG=Win32 Debug
!MESSAGE No configuration specified.  Defaulting to Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "Win32 Release" && "$(CFG)" != "Win32 Debug" && "$(CFG)" !=\
 "BiblioDebug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "PCCURSES.MAK" CFG="Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE "BiblioDebug" (based on "Win32 (x86) Static Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

################################################################################
# Begin Project
# PROP Target_Last_Scanned "Win32 Debug"

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

ALL : $(OUTDIR)/PCCURSES.exe $(OUTDIR)/PCCURSES.bsc

$(OUTDIR) : 
    if not exist $(OUTDIR)/nul mkdir $(OUTDIR)

CPP=cl.exe
# ADD BASE CPP /nologo /W3 /YX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_X86_" /FR /c
# ADD CPP /nologo /W3 /YX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_X86_" /FR /c
CPP_PROJ=/nologo /W3 /YX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_X86_"\
 /FR$(INTDIR)/ /Fp$(OUTDIR)/"PCCURSES.pch" /Fo$(INTDIR)/ /c 
CPP_OBJS=.\WinRel/

.c{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

RSC=rc.exe
# ADD BASE RSC /l 0x40c /d "NDEBUG"
# ADD RSC /l 0x40c /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o$(OUTDIR)/"PCCURSES.bsc" 
BSC32_SBRS= \
	$(INTDIR)/ATTRIB.SBR \
	$(INTDIR)/BEEP.SBR \
	$(INTDIR)/BORDER.SBR \
	$(INTDIR)/BOXES.SBR \
	$(INTDIR)/CHARADD.SBR \
	$(INTDIR)/CHARDEL.SBR \
	$(INTDIR)/CHARGET.SBR \
	$(INTDIR)/CHARINS.SBR \
	$(INTDIR)/CHARPICK.SBR \
	$(INTDIR)/CLRTOBOT.SBR \
	$(INTDIR)/CLRTOEOL.SBR \
	$(INTDIR)/CURSESIO.SBR \
	$(INTDIR)/ENDWIN.SBR \
	$(INTDIR)/INITSCR.SBR \
	$(INTDIR)/LINEDEL.SBR \
	$(INTDIR)/LINEINS.SBR \
	$(INTDIR)/LONGNAME.SBR \
	$(INTDIR)/MOVE.SBR \
	$(INTDIR)/MVCURSOR.SBR \
	$(INTDIR)/NEWWIN.SBR \
	$(INTDIR)/OPTIONS.SBR \
	$(INTDIR)/OVERLAY.SBR \
	$(INTDIR)/PRNTSCAN.SBR \
	$(INTDIR)/REFRESH.SBR \
	$(INTDIR)/SCRREG.SBR \
	$(INTDIR)/SETMODE.SBR \
	$(INTDIR)/SETTERM.SBR \
	$(INTDIR)/STRADD.SBR \
	$(INTDIR)/STRGET.SBR \
	$(INTDIR)/TABSIZE.SBR \
	$(INTDIR)/TERMMISC.SBR \
	$(INTDIR)/UNCTRL.SBR \
	$(INTDIR)/UPDATE.SBR \
	$(INTDIR)/WINCLEAR.SBR \
	$(INTDIR)/WINDEL.SBR \
	$(INTDIR)/WINERASE.SBR \
	$(INTDIR)/WINMOVE.SBR \
	$(INTDIR)/WINSCROL.SBR \
	$(INTDIR)/WINTOUCH.SBR

$(OUTDIR)/PCCURSES.bsc : $(OUTDIR)  $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
# ADD BASE LINK32 netapi32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /NOLOGO /SUBSYSTEM:console /MACHINE:IX86
# ADD LINK32 netapi32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /NOLOGO /SUBSYSTEM:console /MACHINE:IX86
LINK32_FLAGS=netapi32.lib kernel32.lib user32.lib gdi32.lib winspool.lib\
 comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib\
 odbc32.lib odbccp32.lib /NOLOGO /SUBSYSTEM:console /INCREMENTAL:no\
 /PDB:$(OUTDIR)/"PCCURSES.pdb" /MACHINE:IX86 /OUT:$(OUTDIR)/"PCCURSES.exe" 
DEF_FILE=
LINK32_OBJS= \
	$(INTDIR)/ATTRIB.OBJ \
	$(INTDIR)/BEEP.OBJ \
	$(INTDIR)/BORDER.OBJ \
	$(INTDIR)/BOXES.OBJ \
	$(INTDIR)/CHARADD.OBJ \
	$(INTDIR)/CHARDEL.OBJ \
	$(INTDIR)/CHARGET.OBJ \
	$(INTDIR)/CHARINS.OBJ \
	$(INTDIR)/CHARPICK.OBJ \
	$(INTDIR)/CLRTOBOT.OBJ \
	$(INTDIR)/CLRTOEOL.OBJ \
	$(INTDIR)/CURSESIO.OBJ \
	$(INTDIR)/ENDWIN.OBJ \
	$(INTDIR)/INITSCR.OBJ \
	$(INTDIR)/LINEDEL.OBJ \
	$(INTDIR)/LINEINS.OBJ \
	$(INTDIR)/LONGNAME.OBJ \
	$(INTDIR)/MOVE.OBJ \
	$(INTDIR)/MVCURSOR.OBJ \
	$(INTDIR)/NEWWIN.OBJ \
	$(INTDIR)/OPTIONS.OBJ \
	$(INTDIR)/OVERLAY.OBJ \
	$(INTDIR)/PRNTSCAN.OBJ \
	$(INTDIR)/REFRESH.OBJ \
	$(INTDIR)/SCRREG.OBJ \
	$(INTDIR)/SETMODE.OBJ \
	$(INTDIR)/SETTERM.OBJ \
	$(INTDIR)/STRADD.OBJ \
	$(INTDIR)/STRGET.OBJ \
	$(INTDIR)/TABSIZE.OBJ \
	$(INTDIR)/TERMMISC.OBJ \
	$(INTDIR)/UNCTRL.OBJ \
	$(INTDIR)/UPDATE.OBJ \
	$(INTDIR)/WINCLEAR.OBJ \
	$(INTDIR)/WINDEL.OBJ \
	$(INTDIR)/WINERASE.OBJ \
	$(INTDIR)/WINMOVE.OBJ \
	$(INTDIR)/WINSCROL.OBJ \
	$(INTDIR)/WINTOUCH.OBJ

$(OUTDIR)/PCCURSES.exe : $(OUTDIR)  $(DEF_FILE) $(LINK32_OBJS)
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

ALL : $(OUTDIR)/PCCURSES.exe $(OUTDIR)/PCCURSES.bsc

$(OUTDIR) : 
    if not exist $(OUTDIR)/nul mkdir $(OUTDIR)

CPP=cl.exe
# ADD BASE CPP /nologo /W3 /Zi /YX /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_X86_" /FR /J /c
# ADD CPP /nologo /W3 /Zi /YX /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_X86_" /FR /J /c
CPP_PROJ=/nologo /W3 /Zi /YX /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D\
 "_X86_" /FR$(INTDIR)/ /Fp$(OUTDIR)/"PCCURSES.pch" /Fo$(INTDIR)/\
 /Fd$(OUTDIR)/"PCCURSES.pdb" /J /c 
CPP_OBJS=.\WinDebug/

.c{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

RSC=rc.exe
# ADD BASE RSC /l 0x40c /d "_DEBUG"
# ADD RSC /l 0x40c /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o$(OUTDIR)/"PCCURSES.bsc" 
BSC32_SBRS= \
	$(INTDIR)/ATTRIB.SBR \
	$(INTDIR)/BEEP.SBR \
	$(INTDIR)/BORDER.SBR \
	$(INTDIR)/BOXES.SBR \
	$(INTDIR)/CHARADD.SBR \
	$(INTDIR)/CHARDEL.SBR \
	$(INTDIR)/CHARGET.SBR \
	$(INTDIR)/CHARINS.SBR \
	$(INTDIR)/CHARPICK.SBR \
	$(INTDIR)/CLRTOBOT.SBR \
	$(INTDIR)/CLRTOEOL.SBR \
	$(INTDIR)/CURSESIO.SBR \
	$(INTDIR)/ENDWIN.SBR \
	$(INTDIR)/INITSCR.SBR \
	$(INTDIR)/LINEDEL.SBR \
	$(INTDIR)/LINEINS.SBR \
	$(INTDIR)/LONGNAME.SBR \
	$(INTDIR)/MOVE.SBR \
	$(INTDIR)/MVCURSOR.SBR \
	$(INTDIR)/NEWWIN.SBR \
	$(INTDIR)/OPTIONS.SBR \
	$(INTDIR)/OVERLAY.SBR \
	$(INTDIR)/PRNTSCAN.SBR \
	$(INTDIR)/REFRESH.SBR \
	$(INTDIR)/SCRREG.SBR \
	$(INTDIR)/SETMODE.SBR \
	$(INTDIR)/SETTERM.SBR \
	$(INTDIR)/STRADD.SBR \
	$(INTDIR)/STRGET.SBR \
	$(INTDIR)/TABSIZE.SBR \
	$(INTDIR)/TERMMISC.SBR \
	$(INTDIR)/UNCTRL.SBR \
	$(INTDIR)/UPDATE.SBR \
	$(INTDIR)/WINCLEAR.SBR \
	$(INTDIR)/WINDEL.SBR \
	$(INTDIR)/WINERASE.SBR \
	$(INTDIR)/WINMOVE.SBR \
	$(INTDIR)/WINSCROL.SBR \
	$(INTDIR)/WINTOUCH.SBR

$(OUTDIR)/PCCURSES.bsc : $(OUTDIR)  $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
# ADD BASE LINK32 netapi32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /NOLOGO /SUBSYSTEM:console /DEBUG /MACHINE:IX86
# ADD LINK32 netapi32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /NOLOGO /SUBSYSTEM:console /DEBUG /MACHINE:IX86
LINK32_FLAGS=netapi32.lib kernel32.lib user32.lib gdi32.lib winspool.lib\
 comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib\
 odbc32.lib odbccp32.lib /NOLOGO /SUBSYSTEM:console /INCREMENTAL:yes\
 /PDB:$(OUTDIR)/"PCCURSES.pdb" /DEBUG /MACHINE:IX86\
 /OUT:$(OUTDIR)/"PCCURSES.exe" 
DEF_FILE=
LINK32_OBJS= \
	$(INTDIR)/ATTRIB.OBJ \
	$(INTDIR)/BEEP.OBJ \
	$(INTDIR)/BORDER.OBJ \
	$(INTDIR)/BOXES.OBJ \
	$(INTDIR)/CHARADD.OBJ \
	$(INTDIR)/CHARDEL.OBJ \
	$(INTDIR)/CHARGET.OBJ \
	$(INTDIR)/CHARINS.OBJ \
	$(INTDIR)/CHARPICK.OBJ \
	$(INTDIR)/CLRTOBOT.OBJ \
	$(INTDIR)/CLRTOEOL.OBJ \
	$(INTDIR)/CURSESIO.OBJ \
	$(INTDIR)/ENDWIN.OBJ \
	$(INTDIR)/INITSCR.OBJ \
	$(INTDIR)/LINEDEL.OBJ \
	$(INTDIR)/LINEINS.OBJ \
	$(INTDIR)/LONGNAME.OBJ \
	$(INTDIR)/MOVE.OBJ \
	$(INTDIR)/MVCURSOR.OBJ \
	$(INTDIR)/NEWWIN.OBJ \
	$(INTDIR)/OPTIONS.OBJ \
	$(INTDIR)/OVERLAY.OBJ \
	$(INTDIR)/PRNTSCAN.OBJ \
	$(INTDIR)/REFRESH.OBJ \
	$(INTDIR)/SCRREG.OBJ \
	$(INTDIR)/SETMODE.OBJ \
	$(INTDIR)/SETTERM.OBJ \
	$(INTDIR)/STRADD.OBJ \
	$(INTDIR)/STRGET.OBJ \
	$(INTDIR)/TABSIZE.OBJ \
	$(INTDIR)/TERMMISC.OBJ \
	$(INTDIR)/UNCTRL.OBJ \
	$(INTDIR)/UPDATE.OBJ \
	$(INTDIR)/WINCLEAR.OBJ \
	$(INTDIR)/WINDEL.OBJ \
	$(INTDIR)/WINERASE.OBJ \
	$(INTDIR)/WINMOVE.OBJ \
	$(INTDIR)/WINSCROL.OBJ \
	$(INTDIR)/WINTOUCH.OBJ

$(OUTDIR)/PCCURSES.exe : $(OUTDIR)  $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "BiblioDebug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "BiblioDe"
# PROP BASE Intermediate_Dir "BiblioDe"
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "BiblioDe"
# PROP Intermediate_Dir "BiblioDe"
OUTDIR=.\BiblioDe
INTDIR=.\BiblioDe

ALL : $(OUTDIR)/PCCURSES.lib $(OUTDIR)/PCCURSES.bsc

$(OUTDIR) : 
    if not exist $(OUTDIR)/nul mkdir $(OUTDIR)

CPP=cl.exe
# ADD BASE CPP /nologo /ML /W3 /GX /Z7 /YX /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /c
# ADD CPP /nologo /ML /W3 /GX /Z7 /YX /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /c
CPP_PROJ=/nologo /ML /W3 /GX /Z7 /YX /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS"\
 /FR$(INTDIR)/ /Fp$(OUTDIR)/"PCCURSES.pch" /Fo$(INTDIR)/ /c 
CPP_OBJS=.\BiblioDe/

.c{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o$(OUTDIR)/"PCCURSES.bsc" 
BSC32_SBRS= \
	$(INTDIR)/ATTRIB.SBR \
	$(INTDIR)/BEEP.SBR \
	$(INTDIR)/BORDER.SBR \
	$(INTDIR)/BOXES.SBR \
	$(INTDIR)/CHARADD.SBR \
	$(INTDIR)/CHARDEL.SBR \
	$(INTDIR)/CHARGET.SBR \
	$(INTDIR)/CHARINS.SBR \
	$(INTDIR)/CHARPICK.SBR \
	$(INTDIR)/CLRTOBOT.SBR \
	$(INTDIR)/CLRTOEOL.SBR \
	$(INTDIR)/CURSESIO.SBR \
	$(INTDIR)/ENDWIN.SBR \
	$(INTDIR)/INITSCR.SBR \
	$(INTDIR)/LINEDEL.SBR \
	$(INTDIR)/LINEINS.SBR \
	$(INTDIR)/LONGNAME.SBR \
	$(INTDIR)/MOVE.SBR \
	$(INTDIR)/MVCURSOR.SBR \
	$(INTDIR)/NEWWIN.SBR \
	$(INTDIR)/OPTIONS.SBR \
	$(INTDIR)/OVERLAY.SBR \
	$(INTDIR)/PRNTSCAN.SBR \
	$(INTDIR)/REFRESH.SBR \
	$(INTDIR)/SCRREG.SBR \
	$(INTDIR)/SETMODE.SBR \
	$(INTDIR)/SETTERM.SBR \
	$(INTDIR)/STRADD.SBR \
	$(INTDIR)/STRGET.SBR \
	$(INTDIR)/TABSIZE.SBR \
	$(INTDIR)/TERMMISC.SBR \
	$(INTDIR)/UNCTRL.SBR \
	$(INTDIR)/UPDATE.SBR \
	$(INTDIR)/WINCLEAR.SBR \
	$(INTDIR)/WINDEL.SBR \
	$(INTDIR)/WINERASE.SBR \
	$(INTDIR)/WINMOVE.SBR \
	$(INTDIR)/WINSCROL.SBR \
	$(INTDIR)/WINTOUCH.SBR

$(OUTDIR)/PCCURSES.bsc : $(OUTDIR)  $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LIB32=lib.exe
# ADD BASE LIB32 /NOLOGO
# ADD LIB32 /NOLOGO
LIB32_FLAGS=/NOLOGO /OUT:$(OUTDIR)\"PCCURSES.lib" 
DEF_FLAGS=
DEF_FILE=
LIB32_OBJS= \
	$(INTDIR)/ATTRIB.OBJ \
	$(INTDIR)/BEEP.OBJ \
	$(INTDIR)/BORDER.OBJ \
	$(INTDIR)/BOXES.OBJ \
	$(INTDIR)/CHARADD.OBJ \
	$(INTDIR)/CHARDEL.OBJ \
	$(INTDIR)/CHARGET.OBJ \
	$(INTDIR)/CHARINS.OBJ \
	$(INTDIR)/CHARPICK.OBJ \
	$(INTDIR)/CLRTOBOT.OBJ \
	$(INTDIR)/CLRTOEOL.OBJ \
	$(INTDIR)/CURSESIO.OBJ \
	$(INTDIR)/ENDWIN.OBJ \
	$(INTDIR)/INITSCR.OBJ \
	$(INTDIR)/LINEDEL.OBJ \
	$(INTDIR)/LINEINS.OBJ \
	$(INTDIR)/LONGNAME.OBJ \
	$(INTDIR)/MOVE.OBJ \
	$(INTDIR)/MVCURSOR.OBJ \
	$(INTDIR)/NEWWIN.OBJ \
	$(INTDIR)/OPTIONS.OBJ \
	$(INTDIR)/OVERLAY.OBJ \
	$(INTDIR)/PRNTSCAN.OBJ \
	$(INTDIR)/REFRESH.OBJ \
	$(INTDIR)/SCRREG.OBJ \
	$(INTDIR)/SETMODE.OBJ \
	$(INTDIR)/SETTERM.OBJ \
	$(INTDIR)/STRADD.OBJ \
	$(INTDIR)/STRGET.OBJ \
	$(INTDIR)/TABSIZE.OBJ \
	$(INTDIR)/TERMMISC.OBJ \
	$(INTDIR)/UNCTRL.OBJ \
	$(INTDIR)/UPDATE.OBJ \
	$(INTDIR)/WINCLEAR.OBJ \
	$(INTDIR)/WINDEL.OBJ \
	$(INTDIR)/WINERASE.OBJ \
	$(INTDIR)/WINMOVE.OBJ \
	$(INTDIR)/WINSCROL.OBJ \
	$(INTDIR)/WINTOUCH.OBJ

$(OUTDIR)/PCCURSES.lib : $(OUTDIR)  $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ENDIF 

################################################################################
# Begin Group "Source Files"

################################################################################
# Begin Source File

SOURCE=.\ATTRIB.C
DEP_ATTRI=\
	.\CURSES.H\
	.\CURSPRIV.H

!IF  "$(CFG)" == "Win32 Release"

$(INTDIR)/ATTRIB.OBJ :  $(SOURCE)  $(DEP_ATTRI) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

$(INTDIR)/ATTRIB.OBJ :  $(SOURCE)  $(DEP_ATTRI) $(INTDIR)

!ELSEIF  "$(CFG)" == "BiblioDebug"

$(INTDIR)/ATTRIB.OBJ :  $(SOURCE)  $(DEP_ATTRI) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\BEEP.C
DEP_BEEP_=\
	.\CURSES.H\
	.\CURSPRIV.H

!IF  "$(CFG)" == "Win32 Release"

$(INTDIR)/BEEP.OBJ :  $(SOURCE)  $(DEP_BEEP_) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

$(INTDIR)/BEEP.OBJ :  $(SOURCE)  $(DEP_BEEP_) $(INTDIR)

!ELSEIF  "$(CFG)" == "BiblioDebug"

$(INTDIR)/BEEP.OBJ :  $(SOURCE)  $(DEP_BEEP_) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\BORDER.C
DEP_BORDE=\
	.\CURSES.H\
	.\CURSPRIV.H

!IF  "$(CFG)" == "Win32 Release"

$(INTDIR)/BORDER.OBJ :  $(SOURCE)  $(DEP_BORDE) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

$(INTDIR)/BORDER.OBJ :  $(SOURCE)  $(DEP_BORDE) $(INTDIR)

!ELSEIF  "$(CFG)" == "BiblioDebug"

$(INTDIR)/BORDER.OBJ :  $(SOURCE)  $(DEP_BORDE) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\BOXES.C
DEP_BOXES=\
	.\CURSES.H\
	.\CURSPRIV.H

!IF  "$(CFG)" == "Win32 Release"

$(INTDIR)/BOXES.OBJ :  $(SOURCE)  $(DEP_BOXES) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

$(INTDIR)/BOXES.OBJ :  $(SOURCE)  $(DEP_BOXES) $(INTDIR)

!ELSEIF  "$(CFG)" == "BiblioDebug"

$(INTDIR)/BOXES.OBJ :  $(SOURCE)  $(DEP_BOXES) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\CHARADD.C
DEP_CHARA=\
	.\CURSES.H\
	.\CURSPRIV.H

!IF  "$(CFG)" == "Win32 Release"

$(INTDIR)/CHARADD.OBJ :  $(SOURCE)  $(DEP_CHARA) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

$(INTDIR)/CHARADD.OBJ :  $(SOURCE)  $(DEP_CHARA) $(INTDIR)

!ELSEIF  "$(CFG)" == "BiblioDebug"

$(INTDIR)/CHARADD.OBJ :  $(SOURCE)  $(DEP_CHARA) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\CHARDEL.C
DEP_CHARD=\
	.\CURSES.H\
	.\CURSPRIV.H

!IF  "$(CFG)" == "Win32 Release"

$(INTDIR)/CHARDEL.OBJ :  $(SOURCE)  $(DEP_CHARD) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

$(INTDIR)/CHARDEL.OBJ :  $(SOURCE)  $(DEP_CHARD) $(INTDIR)

!ELSEIF  "$(CFG)" == "BiblioDebug"

$(INTDIR)/CHARDEL.OBJ :  $(SOURCE)  $(DEP_CHARD) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\CHARGET.C
DEP_CHARG=\
	.\CURSES.H\
	.\CURSPRIV.H

!IF  "$(CFG)" == "Win32 Release"

$(INTDIR)/CHARGET.OBJ :  $(SOURCE)  $(DEP_CHARG) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

$(INTDIR)/CHARGET.OBJ :  $(SOURCE)  $(DEP_CHARG) $(INTDIR)

!ELSEIF  "$(CFG)" == "BiblioDebug"

$(INTDIR)/CHARGET.OBJ :  $(SOURCE)  $(DEP_CHARG) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\CHARINS.C
DEP_CHARI=\
	.\CURSES.H\
	.\CURSPRIV.H

!IF  "$(CFG)" == "Win32 Release"

$(INTDIR)/CHARINS.OBJ :  $(SOURCE)  $(DEP_CHARI) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

$(INTDIR)/CHARINS.OBJ :  $(SOURCE)  $(DEP_CHARI) $(INTDIR)

!ELSEIF  "$(CFG)" == "BiblioDebug"

$(INTDIR)/CHARINS.OBJ :  $(SOURCE)  $(DEP_CHARI) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\CHARPICK.C
DEP_CHARP=\
	.\CURSES.H\
	.\CURSPRIV.H

!IF  "$(CFG)" == "Win32 Release"

$(INTDIR)/CHARPICK.OBJ :  $(SOURCE)  $(DEP_CHARP) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

$(INTDIR)/CHARPICK.OBJ :  $(SOURCE)  $(DEP_CHARP) $(INTDIR)

!ELSEIF  "$(CFG)" == "BiblioDebug"

$(INTDIR)/CHARPICK.OBJ :  $(SOURCE)  $(DEP_CHARP) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\CLRTOBOT.C
DEP_CLRTO=\
	.\CURSES.H\
	.\CURSPRIV.H

!IF  "$(CFG)" == "Win32 Release"

$(INTDIR)/CLRTOBOT.OBJ :  $(SOURCE)  $(DEP_CLRTO) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

$(INTDIR)/CLRTOBOT.OBJ :  $(SOURCE)  $(DEP_CLRTO) $(INTDIR)

!ELSEIF  "$(CFG)" == "BiblioDebug"

$(INTDIR)/CLRTOBOT.OBJ :  $(SOURCE)  $(DEP_CLRTO) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\CLRTOEOL.C
DEP_CLRTOE=\
	.\CURSES.H\
	.\CURSPRIV.H

!IF  "$(CFG)" == "Win32 Release"

$(INTDIR)/CLRTOEOL.OBJ :  $(SOURCE)  $(DEP_CLRTOE) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

$(INTDIR)/CLRTOEOL.OBJ :  $(SOURCE)  $(DEP_CLRTOE) $(INTDIR)

!ELSEIF  "$(CFG)" == "BiblioDebug"

$(INTDIR)/CLRTOEOL.OBJ :  $(SOURCE)  $(DEP_CLRTOE) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\CURSESIO.C
DEP_CURSE=\
	.\CURSES.H\
	.\CURSPRIV.H

!IF  "$(CFG)" == "Win32 Release"

$(INTDIR)/CURSESIO.OBJ :  $(SOURCE)  $(DEP_CURSE) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

$(INTDIR)/CURSESIO.OBJ :  $(SOURCE)  $(DEP_CURSE) $(INTDIR)

!ELSEIF  "$(CFG)" == "BiblioDebug"

$(INTDIR)/CURSESIO.OBJ :  $(SOURCE)  $(DEP_CURSE) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\ENDWIN.C
DEP_ENDWI=\
	.\CURSES.H\
	.\CURSPRIV.H

!IF  "$(CFG)" == "Win32 Release"

$(INTDIR)/ENDWIN.OBJ :  $(SOURCE)  $(DEP_ENDWI) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

$(INTDIR)/ENDWIN.OBJ :  $(SOURCE)  $(DEP_ENDWI) $(INTDIR)

!ELSEIF  "$(CFG)" == "BiblioDebug"

$(INTDIR)/ENDWIN.OBJ :  $(SOURCE)  $(DEP_ENDWI) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\INITSCR.C
DEP_INITS=\
	.\CURSES.H\
	.\CURSPRIV.H

!IF  "$(CFG)" == "Win32 Release"

$(INTDIR)/INITSCR.OBJ :  $(SOURCE)  $(DEP_INITS) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

$(INTDIR)/INITSCR.OBJ :  $(SOURCE)  $(DEP_INITS) $(INTDIR)

!ELSEIF  "$(CFG)" == "BiblioDebug"

$(INTDIR)/INITSCR.OBJ :  $(SOURCE)  $(DEP_INITS) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\LINEDEL.C
DEP_LINED=\
	.\CURSES.H\
	.\CURSPRIV.H

!IF  "$(CFG)" == "Win32 Release"

$(INTDIR)/LINEDEL.OBJ :  $(SOURCE)  $(DEP_LINED) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

$(INTDIR)/LINEDEL.OBJ :  $(SOURCE)  $(DEP_LINED) $(INTDIR)

!ELSEIF  "$(CFG)" == "BiblioDebug"

$(INTDIR)/LINEDEL.OBJ :  $(SOURCE)  $(DEP_LINED) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\LINEINS.C
DEP_LINEI=\
	.\CURSES.H\
	.\CURSPRIV.H

!IF  "$(CFG)" == "Win32 Release"

$(INTDIR)/LINEINS.OBJ :  $(SOURCE)  $(DEP_LINEI) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

$(INTDIR)/LINEINS.OBJ :  $(SOURCE)  $(DEP_LINEI) $(INTDIR)

!ELSEIF  "$(CFG)" == "BiblioDebug"

$(INTDIR)/LINEINS.OBJ :  $(SOURCE)  $(DEP_LINEI) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\LONGNAME.C
DEP_LONGN=\
	.\CURSES.H\
	.\CURSPRIV.H

!IF  "$(CFG)" == "Win32 Release"

$(INTDIR)/LONGNAME.OBJ :  $(SOURCE)  $(DEP_LONGN) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

$(INTDIR)/LONGNAME.OBJ :  $(SOURCE)  $(DEP_LONGN) $(INTDIR)

!ELSEIF  "$(CFG)" == "BiblioDebug"

$(INTDIR)/LONGNAME.OBJ :  $(SOURCE)  $(DEP_LONGN) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\MOVE.C
DEP_MOVE_=\
	.\CURSES.H\
	.\CURSPRIV.H

!IF  "$(CFG)" == "Win32 Release"

$(INTDIR)/MOVE.OBJ :  $(SOURCE)  $(DEP_MOVE_) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

$(INTDIR)/MOVE.OBJ :  $(SOURCE)  $(DEP_MOVE_) $(INTDIR)

!ELSEIF  "$(CFG)" == "BiblioDebug"

$(INTDIR)/MOVE.OBJ :  $(SOURCE)  $(DEP_MOVE_) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\MVCURSOR.C
DEP_MVCUR=\
	.\CURSES.H\
	.\CURSPRIV.H

!IF  "$(CFG)" == "Win32 Release"

$(INTDIR)/MVCURSOR.OBJ :  $(SOURCE)  $(DEP_MVCUR) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

$(INTDIR)/MVCURSOR.OBJ :  $(SOURCE)  $(DEP_MVCUR) $(INTDIR)

!ELSEIF  "$(CFG)" == "BiblioDebug"

$(INTDIR)/MVCURSOR.OBJ :  $(SOURCE)  $(DEP_MVCUR) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\NEWWIN.C
DEP_NEWWI=\
	.\CURSES.H\
	.\CURSPRIV.H

!IF  "$(CFG)" == "Win32 Release"

$(INTDIR)/NEWWIN.OBJ :  $(SOURCE)  $(DEP_NEWWI) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

$(INTDIR)/NEWWIN.OBJ :  $(SOURCE)  $(DEP_NEWWI) $(INTDIR)

!ELSEIF  "$(CFG)" == "BiblioDebug"

$(INTDIR)/NEWWIN.OBJ :  $(SOURCE)  $(DEP_NEWWI) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\OPTIONS.C
DEP_OPTIO=\
	.\CURSES.H\
	.\CURSPRIV.H

!IF  "$(CFG)" == "Win32 Release"

$(INTDIR)/OPTIONS.OBJ :  $(SOURCE)  $(DEP_OPTIO) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

$(INTDIR)/OPTIONS.OBJ :  $(SOURCE)  $(DEP_OPTIO) $(INTDIR)

!ELSEIF  "$(CFG)" == "BiblioDebug"

$(INTDIR)/OPTIONS.OBJ :  $(SOURCE)  $(DEP_OPTIO) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\OVERLAY.C
DEP_OVERL=\
	.\CURSES.H\
	.\CURSPRIV.H

!IF  "$(CFG)" == "Win32 Release"

$(INTDIR)/OVERLAY.OBJ :  $(SOURCE)  $(DEP_OVERL) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

$(INTDIR)/OVERLAY.OBJ :  $(SOURCE)  $(DEP_OVERL) $(INTDIR)

!ELSEIF  "$(CFG)" == "BiblioDebug"

$(INTDIR)/OVERLAY.OBJ :  $(SOURCE)  $(DEP_OVERL) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\PRNTSCAN.C
DEP_PRNTS=\
	.\CURSES.H\
	.\CURSPRIV.H

!IF  "$(CFG)" == "Win32 Release"

$(INTDIR)/PRNTSCAN.OBJ :  $(SOURCE)  $(DEP_PRNTS) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

$(INTDIR)/PRNTSCAN.OBJ :  $(SOURCE)  $(DEP_PRNTS) $(INTDIR)

!ELSEIF  "$(CFG)" == "BiblioDebug"

$(INTDIR)/PRNTSCAN.OBJ :  $(SOURCE)  $(DEP_PRNTS) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\REFRESH.C
DEP_REFRE=\
	.\CURSES.H\
	.\CURSPRIV.H

!IF  "$(CFG)" == "Win32 Release"

$(INTDIR)/REFRESH.OBJ :  $(SOURCE)  $(DEP_REFRE) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

$(INTDIR)/REFRESH.OBJ :  $(SOURCE)  $(DEP_REFRE) $(INTDIR)

!ELSEIF  "$(CFG)" == "BiblioDebug"

$(INTDIR)/REFRESH.OBJ :  $(SOURCE)  $(DEP_REFRE) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\SCRREG.C
DEP_SCRRE=\
	.\CURSES.H\
	.\CURSPRIV.H

!IF  "$(CFG)" == "Win32 Release"

$(INTDIR)/SCRREG.OBJ :  $(SOURCE)  $(DEP_SCRRE) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

$(INTDIR)/SCRREG.OBJ :  $(SOURCE)  $(DEP_SCRRE) $(INTDIR)

!ELSEIF  "$(CFG)" == "BiblioDebug"

$(INTDIR)/SCRREG.OBJ :  $(SOURCE)  $(DEP_SCRRE) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\SETMODE.C
DEP_SETMO=\
	.\CURSES.H\
	.\CURSPRIV.H

!IF  "$(CFG)" == "Win32 Release"

$(INTDIR)/SETMODE.OBJ :  $(SOURCE)  $(DEP_SETMO) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

$(INTDIR)/SETMODE.OBJ :  $(SOURCE)  $(DEP_SETMO) $(INTDIR)

!ELSEIF  "$(CFG)" == "BiblioDebug"

$(INTDIR)/SETMODE.OBJ :  $(SOURCE)  $(DEP_SETMO) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\SETTERM.C
DEP_SETTE=\
	.\CURSES.H\
	.\CURSPRIV.H

!IF  "$(CFG)" == "Win32 Release"

$(INTDIR)/SETTERM.OBJ :  $(SOURCE)  $(DEP_SETTE) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

$(INTDIR)/SETTERM.OBJ :  $(SOURCE)  $(DEP_SETTE) $(INTDIR)

!ELSEIF  "$(CFG)" == "BiblioDebug"

$(INTDIR)/SETTERM.OBJ :  $(SOURCE)  $(DEP_SETTE) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\STRADD.C
DEP_STRAD=\
	.\CURSES.H\
	.\CURSPRIV.H

!IF  "$(CFG)" == "Win32 Release"

$(INTDIR)/STRADD.OBJ :  $(SOURCE)  $(DEP_STRAD) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

$(INTDIR)/STRADD.OBJ :  $(SOURCE)  $(DEP_STRAD) $(INTDIR)

!ELSEIF  "$(CFG)" == "BiblioDebug"

$(INTDIR)/STRADD.OBJ :  $(SOURCE)  $(DEP_STRAD) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\STRGET.C
DEP_STRGE=\
	.\CURSES.H\
	.\CURSPRIV.H

!IF  "$(CFG)" == "Win32 Release"

$(INTDIR)/STRGET.OBJ :  $(SOURCE)  $(DEP_STRGE) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

$(INTDIR)/STRGET.OBJ :  $(SOURCE)  $(DEP_STRGE) $(INTDIR)

!ELSEIF  "$(CFG)" == "BiblioDebug"

$(INTDIR)/STRGET.OBJ :  $(SOURCE)  $(DEP_STRGE) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\TABSIZE.C
DEP_TABSI=\
	.\CURSES.H\
	.\CURSPRIV.H

!IF  "$(CFG)" == "Win32 Release"

$(INTDIR)/TABSIZE.OBJ :  $(SOURCE)  $(DEP_TABSI) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

$(INTDIR)/TABSIZE.OBJ :  $(SOURCE)  $(DEP_TABSI) $(INTDIR)

!ELSEIF  "$(CFG)" == "BiblioDebug"

$(INTDIR)/TABSIZE.OBJ :  $(SOURCE)  $(DEP_TABSI) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\TERMMISC.C
DEP_TERMM=\
	.\CURSES.H\
	.\CURSPRIV.H

!IF  "$(CFG)" == "Win32 Release"

$(INTDIR)/TERMMISC.OBJ :  $(SOURCE)  $(DEP_TERMM) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

$(INTDIR)/TERMMISC.OBJ :  $(SOURCE)  $(DEP_TERMM) $(INTDIR)

!ELSEIF  "$(CFG)" == "BiblioDebug"

$(INTDIR)/TERMMISC.OBJ :  $(SOURCE)  $(DEP_TERMM) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\UNCTRL.C
DEP_UNCTR=\
	.\CURSES.H\
	.\CURSPRIV.H

!IF  "$(CFG)" == "Win32 Release"

$(INTDIR)/UNCTRL.OBJ :  $(SOURCE)  $(DEP_UNCTR) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

$(INTDIR)/UNCTRL.OBJ :  $(SOURCE)  $(DEP_UNCTR) $(INTDIR)

!ELSEIF  "$(CFG)" == "BiblioDebug"

$(INTDIR)/UNCTRL.OBJ :  $(SOURCE)  $(DEP_UNCTR) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\UPDATE.C
DEP_UPDAT=\
	.\CURSES.H\
	.\CURSPRIV.H

!IF  "$(CFG)" == "Win32 Release"

$(INTDIR)/UPDATE.OBJ :  $(SOURCE)  $(DEP_UPDAT) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

$(INTDIR)/UPDATE.OBJ :  $(SOURCE)  $(DEP_UPDAT) $(INTDIR)

!ELSEIF  "$(CFG)" == "BiblioDebug"

$(INTDIR)/UPDATE.OBJ :  $(SOURCE)  $(DEP_UPDAT) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\WINCLEAR.C
DEP_WINCL=\
	.\CURSES.H\
	.\CURSPRIV.H

!IF  "$(CFG)" == "Win32 Release"

$(INTDIR)/WINCLEAR.OBJ :  $(SOURCE)  $(DEP_WINCL) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

$(INTDIR)/WINCLEAR.OBJ :  $(SOURCE)  $(DEP_WINCL) $(INTDIR)

!ELSEIF  "$(CFG)" == "BiblioDebug"

$(INTDIR)/WINCLEAR.OBJ :  $(SOURCE)  $(DEP_WINCL) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\WINDEL.C
DEP_WINDE=\
	.\CURSES.H\
	.\CURSPRIV.H

!IF  "$(CFG)" == "Win32 Release"

$(INTDIR)/WINDEL.OBJ :  $(SOURCE)  $(DEP_WINDE) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

$(INTDIR)/WINDEL.OBJ :  $(SOURCE)  $(DEP_WINDE) $(INTDIR)

!ELSEIF  "$(CFG)" == "BiblioDebug"

$(INTDIR)/WINDEL.OBJ :  $(SOURCE)  $(DEP_WINDE) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\WINERASE.C
DEP_WINER=\
	.\CURSES.H\
	.\CURSPRIV.H

!IF  "$(CFG)" == "Win32 Release"

$(INTDIR)/WINERASE.OBJ :  $(SOURCE)  $(DEP_WINER) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

$(INTDIR)/WINERASE.OBJ :  $(SOURCE)  $(DEP_WINER) $(INTDIR)

!ELSEIF  "$(CFG)" == "BiblioDebug"

$(INTDIR)/WINERASE.OBJ :  $(SOURCE)  $(DEP_WINER) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\WINMOVE.C
DEP_WINMO=\
	.\CURSES.H\
	.\CURSPRIV.H

!IF  "$(CFG)" == "Win32 Release"

$(INTDIR)/WINMOVE.OBJ :  $(SOURCE)  $(DEP_WINMO) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

$(INTDIR)/WINMOVE.OBJ :  $(SOURCE)  $(DEP_WINMO) $(INTDIR)

!ELSEIF  "$(CFG)" == "BiblioDebug"

$(INTDIR)/WINMOVE.OBJ :  $(SOURCE)  $(DEP_WINMO) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\WINSCROL.C
DEP_WINSC=\
	.\CURSES.H\
	.\CURSPRIV.H

!IF  "$(CFG)" == "Win32 Release"

$(INTDIR)/WINSCROL.OBJ :  $(SOURCE)  $(DEP_WINSC) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

$(INTDIR)/WINSCROL.OBJ :  $(SOURCE)  $(DEP_WINSC) $(INTDIR)

!ELSEIF  "$(CFG)" == "BiblioDebug"

$(INTDIR)/WINSCROL.OBJ :  $(SOURCE)  $(DEP_WINSC) $(INTDIR)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\WINTOUCH.C
DEP_WINTO=\
	.\CURSES.H\
	.\CURSPRIV.H

!IF  "$(CFG)" == "Win32 Release"

$(INTDIR)/WINTOUCH.OBJ :  $(SOURCE)  $(DEP_WINTO) $(INTDIR)

!ELSEIF  "$(CFG)" == "Win32 Debug"

$(INTDIR)/WINTOUCH.OBJ :  $(SOURCE)  $(DEP_WINTO) $(INTDIR)

!ELSEIF  "$(CFG)" == "BiblioDebug"

$(INTDIR)/WINTOUCH.OBJ :  $(SOURCE)  $(DEP_WINTO) $(INTDIR)

!ENDIF 

# End Source File
# End Group
# End Project
################################################################################
