# Microsoft Developer Studio Generated NMAKE File, Format Version 4.20
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

!IF "$(CFG)" == ""
CFG=VTerm - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to VTerm - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "VTerm - Win32 Debug" && "$(CFG)" != "VTerm - Win32 Release"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "vterm.mak" CFG="VTerm - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "VTerm - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE "VTerm - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 
################################################################################
# Begin Project
# PROP Target_Last_Scanned "VTerm - Win32 Release"
RSC=rc.exe
MTL=mktyplib.exe
CPP=cl.exe

!IF  "$(CFG)" == "VTerm - Win32 Debug"

# PROP BASE Use_MFC 6
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "WinDebug"
# PROP BASE Intermediate_Dir "WinDebug"
# PROP Use_MFC 6
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "WinDebug"
# PROP Intermediate_Dir "WinDebug"
OUTDIR=.\WinDebug
INTDIR=.\WinDebug

ALL : "$(OUTDIR)\vterm.exe" "$(OUTDIR)\vterm.bsc"

CLEAN : 
	-@erase "$(INTDIR)\AboutVTerm.obj"
	-@erase "$(INTDIR)\AboutVTerm.sbr"
	-@erase "$(INTDIR)\BufferGlissant.obj"
	-@erase "$(INTDIR)\BufferGlissant.sbr"
	-@erase "$(INTDIR)\ConnexionRecente.obj"
	-@erase "$(INTDIR)\ConnexionRecente.sbr"
	-@erase "$(INTDIR)\Couleurs.obj"
	-@erase "$(INTDIR)\Couleurs.sbr"
	-@erase "$(INTDIR)\mainfrm.obj"
	-@erase "$(INTDIR)\mainfrm.sbr"
	-@erase "$(INTDIR)\Options.obj"
	-@erase "$(INTDIR)\Options.sbr"
	-@erase "$(INTDIR)\RemoteHost.obj"
	-@erase "$(INTDIR)\RemoteHost.sbr"
	-@erase "$(INTDIR)\StatsWindow.obj"
	-@erase "$(INTDIR)\StatsWindow.sbr"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\stdafx.sbr"
	-@erase "$(INTDIR)\Terminal.obj"
	-@erase "$(INTDIR)\Terminal.sbr"
	-@erase "$(INTDIR)\vc40.pdb"
	-@erase "$(INTDIR)\VTerm.obj"
	-@erase "$(INTDIR)\vterm.pch"
	-@erase "$(INTDIR)\VTerm.res"
	-@erase "$(INTDIR)\VTerm.sbr"
	-@erase "$(INTDIR)\VTermDoc.obj"
	-@erase "$(INTDIR)\VTermDoc.sbr"
	-@erase "$(INTDIR)\VTermGlobal.obj"
	-@erase "$(INTDIR)\VTermGlobal.sbr"
	-@erase "$(INTDIR)\VTermSock.obj"
	-@erase "$(INTDIR)\VTermSock.sbr"
	-@erase "$(INTDIR)\VTermView.obj"
	-@erase "$(INTDIR)\VTermView.sbr"
	-@erase "$(OUTDIR)\vterm.bsc"
	-@erase "$(OUTDIR)\vterm.exe"
	-@erase "$(OUTDIR)\vterm.ilk"
	-@erase "$(OUTDIR)\vterm.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE CPP /nologo /MD /W3 /GX /Zi /Od /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /FR /Yu"stdafx.h" /c
# ADD CPP /nologo /MD /W3 /GX /Zi /Od /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /FR /Yu"stdafx.h" /c
CPP_PROJ=/nologo /MD /W3 /GX /Zi /Od /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_MBCS" /D "_AFXDLL" /FR"$(INTDIR)/" /Fp"$(INTDIR)/vterm.pch" /Yu"stdafx.h"\
 /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\WinDebug/
CPP_SBRS=.\WinDebug/
# ADD BASE RSC /l 0x40c /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x40c /d "_DEBUG" /d "_AFXDLL"
RSC_PROJ=/l 0x40c /fo"$(INTDIR)/VTerm.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/vterm.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\AboutVTerm.sbr" \
	"$(INTDIR)\BufferGlissant.sbr" \
	"$(INTDIR)\ConnexionRecente.sbr" \
	"$(INTDIR)\Couleurs.sbr" \
	"$(INTDIR)\mainfrm.sbr" \
	"$(INTDIR)\Options.sbr" \
	"$(INTDIR)\RemoteHost.sbr" \
	"$(INTDIR)\StatsWindow.sbr" \
	"$(INTDIR)\stdafx.sbr" \
	"$(INTDIR)\Terminal.sbr" \
	"$(INTDIR)\VTerm.sbr" \
	"$(INTDIR)\VTermDoc.sbr" \
	"$(INTDIR)\VTermGlobal.sbr" \
	"$(INTDIR)\VTermSock.sbr" \
	"$(INTDIR)\VTermView.sbr"

"$(OUTDIR)\vterm.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /debug /machine:I386
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 /nologo /subsystem:windows /debug /machine:I386
# SUBTRACT LINK32 /pdb:none /nodefaultlib
LINK32_FLAGS=/nologo /subsystem:windows /incremental:yes\
 /pdb:"$(OUTDIR)/vterm.pdb" /debug /machine:I386 /out:"$(OUTDIR)/vterm.exe" 
LINK32_OBJS= \
	"$(INTDIR)\AboutVTerm.obj" \
	"$(INTDIR)\BufferGlissant.obj" \
	"$(INTDIR)\ConnexionRecente.obj" \
	"$(INTDIR)\Couleurs.obj" \
	"$(INTDIR)\mainfrm.obj" \
	"$(INTDIR)\Options.obj" \
	"$(INTDIR)\RemoteHost.obj" \
	"$(INTDIR)\StatsWindow.obj" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\Terminal.obj" \
	"$(INTDIR)\VTerm.obj" \
	"$(INTDIR)\VTerm.res" \
	"$(INTDIR)\VTermDoc.obj" \
	"$(INTDIR)\VTermGlobal.obj" \
	"$(INTDIR)\VTermSock.obj" \
	"$(INTDIR)\VTermView.obj"

"$(OUTDIR)\vterm.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "VTerm - Win32 Release"

# PROP BASE Use_MFC 6
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "WinRel"
# PROP BASE Intermediate_Dir "WinRel"
# PROP Use_MFC 6
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "WinRel"
# PROP Intermediate_Dir "WinRel"
OUTDIR=.\WinRel
INTDIR=.\WinRel

ALL : "$(OUTDIR)\vterm.exe" "$(OUTDIR)\vterm.bsc"

CLEAN : 
	-@erase "$(INTDIR)\AboutVTerm.obj"
	-@erase "$(INTDIR)\AboutVTerm.sbr"
	-@erase "$(INTDIR)\BufferGlissant.obj"
	-@erase "$(INTDIR)\BufferGlissant.sbr"
	-@erase "$(INTDIR)\ConnexionRecente.obj"
	-@erase "$(INTDIR)\ConnexionRecente.sbr"
	-@erase "$(INTDIR)\Couleurs.obj"
	-@erase "$(INTDIR)\Couleurs.sbr"
	-@erase "$(INTDIR)\mainfrm.obj"
	-@erase "$(INTDIR)\mainfrm.sbr"
	-@erase "$(INTDIR)\Options.obj"
	-@erase "$(INTDIR)\Options.sbr"
	-@erase "$(INTDIR)\RemoteHost.obj"
	-@erase "$(INTDIR)\RemoteHost.sbr"
	-@erase "$(INTDIR)\StatsWindow.obj"
	-@erase "$(INTDIR)\StatsWindow.sbr"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\stdafx.sbr"
	-@erase "$(INTDIR)\Terminal.obj"
	-@erase "$(INTDIR)\Terminal.sbr"
	-@erase "$(INTDIR)\VTerm.obj"
	-@erase "$(INTDIR)\vterm.pch"
	-@erase "$(INTDIR)\VTerm.res"
	-@erase "$(INTDIR)\VTerm.sbr"
	-@erase "$(INTDIR)\VTermDoc.obj"
	-@erase "$(INTDIR)\VTermDoc.sbr"
	-@erase "$(INTDIR)\VTermGlobal.obj"
	-@erase "$(INTDIR)\VTermGlobal.sbr"
	-@erase "$(INTDIR)\VTermSock.obj"
	-@erase "$(INTDIR)\VTermSock.sbr"
	-@erase "$(INTDIR)\VTermView.obj"
	-@erase "$(INTDIR)\VTermView.sbr"
	-@erase "$(OUTDIR)\vterm.bsc"
	-@erase "$(OUTDIR)\vterm.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE CPP /nologo /MD /W3 /GX /O2 /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /FR /Yu"stdafx.h" /c
# ADD CPP /nologo /MD /W3 /Gi /GX /O2 /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /FR /Yu"stdafx.h" /c
CPP_PROJ=/nologo /MD /W3 /Gi /GX /O2 /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_AFXDLL" /FR"$(INTDIR)/" /Fp"$(INTDIR)/vterm.pch" /Yu"stdafx.h"\
 /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\WinRel/
CPP_SBRS=.\WinRel/
# ADD BASE RSC /l 0x40c /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x40c /d "NDEBUG" /d "_AFXDLL"
RSC_PROJ=/l 0x40c /fo"$(INTDIR)/VTerm.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/vterm.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\AboutVTerm.sbr" \
	"$(INTDIR)\BufferGlissant.sbr" \
	"$(INTDIR)\ConnexionRecente.sbr" \
	"$(INTDIR)\Couleurs.sbr" \
	"$(INTDIR)\mainfrm.sbr" \
	"$(INTDIR)\Options.sbr" \
	"$(INTDIR)\RemoteHost.sbr" \
	"$(INTDIR)\StatsWindow.sbr" \
	"$(INTDIR)\stdafx.sbr" \
	"$(INTDIR)\Terminal.sbr" \
	"$(INTDIR)\VTerm.sbr" \
	"$(INTDIR)\VTermDoc.sbr" \
	"$(INTDIR)\VTermGlobal.sbr" \
	"$(INTDIR)\VTermSock.sbr" \
	"$(INTDIR)\VTermView.sbr"

"$(OUTDIR)\vterm.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /machine:I386
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 /nologo /subsystem:windows /machine:I386
# SUBTRACT LINK32 /pdb:none
LINK32_FLAGS=/nologo /subsystem:windows /incremental:no\
 /pdb:"$(OUTDIR)/vterm.pdb" /machine:I386 /out:"$(OUTDIR)/vterm.exe" 
LINK32_OBJS= \
	"$(INTDIR)\AboutVTerm.obj" \
	"$(INTDIR)\BufferGlissant.obj" \
	"$(INTDIR)\ConnexionRecente.obj" \
	"$(INTDIR)\Couleurs.obj" \
	"$(INTDIR)\mainfrm.obj" \
	"$(INTDIR)\Options.obj" \
	"$(INTDIR)\RemoteHost.obj" \
	"$(INTDIR)\StatsWindow.obj" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\Terminal.obj" \
	"$(INTDIR)\VTerm.obj" \
	"$(INTDIR)\VTerm.res" \
	"$(INTDIR)\VTermDoc.obj" \
	"$(INTDIR)\VTermGlobal.obj" \
	"$(INTDIR)\VTermSock.obj" \
	"$(INTDIR)\VTermView.obj"

"$(OUTDIR)\vterm.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 

MTL_PROJ=

.c{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.c{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

################################################################################
# Begin Target

# Name "VTerm - Win32 Debug"
# Name "VTerm - Win32 Release"

!IF  "$(CFG)" == "VTerm - Win32 Debug"

!ELSEIF  "$(CFG)" == "VTerm - Win32 Release"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\stdafx.cpp
DEP_CPP_STDAF=\
	".\stdafx.h"\
	

!IF  "$(CFG)" == "VTerm - Win32 Debug"

# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

BuildCmds= \
	$(CPP) /nologo /MD /W3 /GX /Zi /Od /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_MBCS" /D "_AFXDLL" /FR"$(INTDIR)/" /Fp"$(INTDIR)/vterm.pch" /Yc"stdafx.h"\
 /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c $(SOURCE) \
	

"$(INTDIR)\stdafx.obj" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\stdafx.sbr" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\vterm.pch" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "VTerm - Win32 Release"

# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

BuildCmds= \
	$(CPP) /nologo /MD /W3 /Gi /GX /O2 /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_AFXDLL" /FR"$(INTDIR)/" /Fp"$(INTDIR)/vterm.pch" /Yc"stdafx.h"\
 /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c $(SOURCE) \
	

"$(INTDIR)\stdafx.obj" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\stdafx.sbr" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\vterm.pch" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\mainfrm.cpp
DEP_CPP_MAINF=\
	".\BufferGlissant.h"\
	".\ConnexionRecente.h"\
	".\mainfrm.h"\
	".\stdafx.h"\
	".\Terminal.h"\
	".\VTerm.h"\
	".\VTermDoc.h"\
	".\VTermGlobal.h"\
	".\VTermSock.h"\
	

"$(INTDIR)\mainfrm.obj" : $(SOURCE) $(DEP_CPP_MAINF) "$(INTDIR)"\
 "$(INTDIR)\vterm.pch"

"$(INTDIR)\mainfrm.sbr" : $(SOURCE) $(DEP_CPP_MAINF) "$(INTDIR)"\
 "$(INTDIR)\vterm.pch"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\readme.txt

!IF  "$(CFG)" == "VTerm - Win32 Debug"

!ELSEIF  "$(CFG)" == "VTerm - Win32 Release"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\Terminal.cpp
DEP_CPP_TERMI=\
	".\BufferGlissant.h"\
	".\ConnexionRecente.h"\
	".\stdafx.h"\
	".\Terminal.h"\
	".\VTerm.h"\
	".\VTermGlobal.h"\
	

"$(INTDIR)\Terminal.obj" : $(SOURCE) $(DEP_CPP_TERMI) "$(INTDIR)"\
 "$(INTDIR)\vterm.pch"

"$(INTDIR)\Terminal.sbr" : $(SOURCE) $(DEP_CPP_TERMI) "$(INTDIR)"\
 "$(INTDIR)\vterm.pch"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\RemoteHost.cpp
DEP_CPP_REMOT=\
	".\BufferGlissant.h"\
	".\ConnexionRecente.h"\
	".\RemoteHost.h"\
	".\stdafx.h"\
	".\VTerm.h"\
	".\VTermGlobal.h"\
	

"$(INTDIR)\RemoteHost.obj" : $(SOURCE) $(DEP_CPP_REMOT) "$(INTDIR)"\
 "$(INTDIR)\vterm.pch"

"$(INTDIR)\RemoteHost.sbr" : $(SOURCE) $(DEP_CPP_REMOT) "$(INTDIR)"\
 "$(INTDIR)\vterm.pch"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\AboutVTerm.cpp
DEP_CPP_ABOUT=\
	".\AboutVTerm.h"\
	".\BufferGlissant.h"\
	".\ConnexionRecente.h"\
	".\stdafx.h"\
	".\VTerm.h"\
	

"$(INTDIR)\AboutVTerm.obj" : $(SOURCE) $(DEP_CPP_ABOUT) "$(INTDIR)"\
 "$(INTDIR)\vterm.pch"

"$(INTDIR)\AboutVTerm.sbr" : $(SOURCE) $(DEP_CPP_ABOUT) "$(INTDIR)"\
 "$(INTDIR)\vterm.pch"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\VTerm.cpp
DEP_CPP_VTERM=\
	".\AboutVTerm.h"\
	".\BufferGlissant.h"\
	".\ConnexionRecente.h"\
	".\Couleurs.h"\
	".\mainfrm.h"\
	".\Options.h"\
	".\stdafx.h"\
	".\Terminal.h"\
	".\VTerm.h"\
	".\VTermDoc.h"\
	".\VTermGlobal.h"\
	".\VTermSock.h"\
	".\vtermview.h"\
	

"$(INTDIR)\VTerm.obj" : $(SOURCE) $(DEP_CPP_VTERM) "$(INTDIR)"\
 "$(INTDIR)\vterm.pch"

"$(INTDIR)\VTerm.sbr" : $(SOURCE) $(DEP_CPP_VTERM) "$(INTDIR)"\
 "$(INTDIR)\vterm.pch"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\VTerm.rc
DEP_RSC_VTERM_=\
	".\res\ico00001.ico"\
	".\res\icon1.ico"\
	".\res\idr_main.ico"\
	".\res\irr_wins.ico"\
	".\res\miniconn.bmp"\
	".\res\toolbar.bmp"\
	".\res\VTerm.rc2"\
	".\res\VTermDoc.ico"\
	".\resource.hm"\
	

"$(INTDIR)\VTerm.res" : $(SOURCE) $(DEP_RSC_VTERM_) "$(INTDIR)"
   $(RSC) $(RSC_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE=.\VTermView.cpp
DEP_CPP_VTERMV=\
	".\BufferGlissant.h"\
	".\ConnexionRecente.h"\
	".\StatsWindow.h"\
	".\stdafx.h"\
	".\Terminal.h"\
	".\VTerm.h"\
	".\VTermDoc.h"\
	".\VTermGlobal.h"\
	".\VTermSock.h"\
	".\vtermview.h"\
	

"$(INTDIR)\VTermView.obj" : $(SOURCE) $(DEP_CPP_VTERMV) "$(INTDIR)"\
 "$(INTDIR)\vterm.pch"

"$(INTDIR)\VTermView.sbr" : $(SOURCE) $(DEP_CPP_VTERMV) "$(INTDIR)"\
 "$(INTDIR)\vterm.pch"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\VTermDoc.cpp
DEP_CPP_VTERMD=\
	".\BufferGlissant.h"\
	".\ConnexionRecente.h"\
	".\mainfrm.h"\
	".\RemoteHost.h"\
	".\stdafx.h"\
	".\telnet.h"\
	".\Terminal.h"\
	".\VTerm.h"\
	".\VTermDoc.h"\
	".\VTermGlobal.h"\
	".\VTermSock.h"\
	{$(INCLUDE)}"\sys\Timeb.h"\
	

"$(INTDIR)\VTermDoc.obj" : $(SOURCE) $(DEP_CPP_VTERMD) "$(INTDIR)"\
 "$(INTDIR)\vterm.pch"

"$(INTDIR)\VTermDoc.sbr" : $(SOURCE) $(DEP_CPP_VTERMD) "$(INTDIR)"\
 "$(INTDIR)\vterm.pch"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\VTerm.h

!IF  "$(CFG)" == "VTerm - Win32 Debug"

!ELSEIF  "$(CFG)" == "VTerm - Win32 Release"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\Options.cpp
DEP_CPP_OPTIO=\
	".\BufferGlissant.h"\
	".\ConnexionRecente.h"\
	".\Options.h"\
	".\stdafx.h"\
	".\VTerm.h"\
	".\VTermGlobal.h"\
	

"$(INTDIR)\Options.obj" : $(SOURCE) $(DEP_CPP_OPTIO) "$(INTDIR)"\
 "$(INTDIR)\vterm.pch"

"$(INTDIR)\Options.sbr" : $(SOURCE) $(DEP_CPP_OPTIO) "$(INTDIR)"\
 "$(INTDIR)\vterm.pch"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\VTermGlobal.cpp
DEP_CPP_VTERMG=\
	".\BufferGlissant.h"\
	".\ConnexionRecente.h"\
	".\stdafx.h"\
	".\VTerm.h"\
	".\VTermGlobal.h"\
	

"$(INTDIR)\VTermGlobal.obj" : $(SOURCE) $(DEP_CPP_VTERMG) "$(INTDIR)"\
 "$(INTDIR)\vterm.pch"

"$(INTDIR)\VTermGlobal.sbr" : $(SOURCE) $(DEP_CPP_VTERMG) "$(INTDIR)"\
 "$(INTDIR)\vterm.pch"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\VTermSock.cpp
DEP_CPP_VTERMS=\
	".\BufferGlissant.h"\
	".\ConnexionRecente.h"\
	".\stdafx.h"\
	".\Terminal.h"\
	".\VTerm.h"\
	".\VTermDoc.h"\
	".\VTermSock.h"\
	

"$(INTDIR)\VTermSock.obj" : $(SOURCE) $(DEP_CPP_VTERMS) "$(INTDIR)"\
 "$(INTDIR)\vterm.pch"

"$(INTDIR)\VTermSock.sbr" : $(SOURCE) $(DEP_CPP_VTERMS) "$(INTDIR)"\
 "$(INTDIR)\vterm.pch"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\StatsWindow.cpp
DEP_CPP_STATS=\
	".\BufferGlissant.h"\
	".\ConnexionRecente.h"\
	".\StatsWindow.h"\
	".\stdafx.h"\
	".\Terminal.h"\
	".\VTerm.h"\
	".\VTermDoc.h"\
	".\VTermSock.h"\
	".\vtermview.h"\
	

"$(INTDIR)\StatsWindow.obj" : $(SOURCE) $(DEP_CPP_STATS) "$(INTDIR)"\
 "$(INTDIR)\vterm.pch"

"$(INTDIR)\StatsWindow.sbr" : $(SOURCE) $(DEP_CPP_STATS) "$(INTDIR)"\
 "$(INTDIR)\vterm.pch"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\Couleurs.cpp
DEP_CPP_COULE=\
	".\BufferGlissant.h"\
	".\ConnexionRecente.h"\
	".\Couleurs.h"\
	".\stdafx.h"\
	".\VTerm.h"\
	".\VTermGlobal.h"\
	

"$(INTDIR)\Couleurs.obj" : $(SOURCE) $(DEP_CPP_COULE) "$(INTDIR)"\
 "$(INTDIR)\vterm.pch"

"$(INTDIR)\Couleurs.sbr" : $(SOURCE) $(DEP_CPP_COULE) "$(INTDIR)"\
 "$(INTDIR)\vterm.pch"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\ConnexionRecente.cpp
DEP_CPP_CONNE=\
	".\BufferGlissant.h"\
	".\ConnexionRecente.h"\
	".\stdafx.h"\
	".\VTerm.h"\
	

"$(INTDIR)\ConnexionRecente.obj" : $(SOURCE) $(DEP_CPP_CONNE) "$(INTDIR)"\
 "$(INTDIR)\vterm.pch"

"$(INTDIR)\ConnexionRecente.sbr" : $(SOURCE) $(DEP_CPP_CONNE) "$(INTDIR)"\
 "$(INTDIR)\vterm.pch"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\BufferGlissant.cpp
DEP_CPP_BUFFE=\
	".\BufferGlissant.h"\
	".\ConnexionRecente.h"\
	".\stdafx.h"\
	".\VTerm.h"\
	

"$(INTDIR)\BufferGlissant.obj" : $(SOURCE) $(DEP_CPP_BUFFE) "$(INTDIR)"\
 "$(INTDIR)\vterm.pch"

"$(INTDIR)\BufferGlissant.sbr" : $(SOURCE) $(DEP_CPP_BUFFE) "$(INTDIR)"\
 "$(INTDIR)\vterm.pch"


# End Source File
# End Target
# End Project
################################################################################
################################################################################
# Section VTerm : {B6805000-A509-11CE-A5B0-00AA006BBF16}
# 	1:23:CG_IDR_POPUP_VTERM_VIEW:102
# End Section
################################################################################
################################################################################
# Section VTerm : {34C8D273-C9DF-11CF-9014-444553540000}
# 	1:17:CG_IDS_DISK_SPACE:105
# 	1:19:CG_IDS_PHYSICAL_MEM:103
# 	1:25:CG_IDS_DISK_SPACE_UNAVAIL:106
# 	2:10:SysInfoKey:1234
# End Section
################################################################################
