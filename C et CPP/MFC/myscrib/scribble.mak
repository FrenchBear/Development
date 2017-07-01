# Microsoft Developer Studio Generated NMAKE File, Format Version 4.10
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

!IF "$(CFG)" == ""
CFG=scribble - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to scribble - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "scribble - Win32 Debug" && "$(CFG)" !=\
 "scribble - Win32 Release"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "scribble.mak" CFG="scribble - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "scribble - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE "scribble - Win32 Release" (based on "Win32 (x86) Application")
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
RSC=rc.exe
MTL=mktyplib.exe
CPP=cl.exe

!IF  "$(CFG)" == "scribble - Win32 Debug"

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

ALL : "$(OUTDIR)\scribble.exe"

CLEAN : 
	-@erase "$(INTDIR)\mainfrm.obj"
	-@erase "$(INTDIR)\pendlg.obj"
	-@erase "$(INTDIR)\scribble.obj"
	-@erase "$(INTDIR)\scribble.pch"
	-@erase "$(INTDIR)\scribble.res"
	-@erase "$(INTDIR)\scribdoc.obj"
	-@erase "$(INTDIR)\scribfrm.obj"
	-@erase "$(INTDIR)\scribvw.obj"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\vc40.idb"
	-@erase "$(INTDIR)\vc40.pdb"
	-@erase "$(OUTDIR)\scribble.exe"
	-@erase "$(OUTDIR)\scribble.ilk"
	-@erase "$(OUTDIR)\scribble.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE CPP /nologo /MD /W3 /GX /Zi /Od /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /FR /Yu"stdafx.h" /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /Zi /Od /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /Yu"stdafx.h" /c
# SUBTRACT CPP /Fr
CPP_PROJ=/nologo /MDd /W3 /Gm /GX /Zi /Od /D "_DEBUG" /D "WIN32" /D "_WINDOWS"\
 /D "_AFXDLL" /D "_MBCS" /Fp"$(INTDIR)/scribble.pch" /Yu"stdafx.h"\
 /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\WinDebug/
CPP_SBRS=.\.
# ADD BASE RSC /l 0x40c /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x40c /d "_DEBUG" /d "_AFXDLL"
RSC_PROJ=/l 0x40c /fo"$(INTDIR)/scribble.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/scribble.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /debug /machine:I386
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 /nologo /subsystem:windows /debug /machine:I386
# SUBTRACT LINK32 /pdb:none
LINK32_FLAGS=/nologo /subsystem:windows /incremental:yes\
 /pdb:"$(OUTDIR)/scribble.pdb" /debug /machine:I386\
 /out:"$(OUTDIR)/scribble.exe" 
LINK32_OBJS= \
	"$(INTDIR)\mainfrm.obj" \
	"$(INTDIR)\pendlg.obj" \
	"$(INTDIR)\scribble.obj" \
	"$(INTDIR)\scribble.res" \
	"$(INTDIR)\scribdoc.obj" \
	"$(INTDIR)\scribfrm.obj" \
	"$(INTDIR)\scribvw.obj" \
	"$(INTDIR)\stdafx.obj"

"$(OUTDIR)\scribble.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "scribble - Win32 Release"

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

ALL : "$(OUTDIR)\scribble.exe"

CLEAN : 
	-@erase "$(INTDIR)\mainfrm.obj"
	-@erase "$(INTDIR)\pendlg.obj"
	-@erase "$(INTDIR)\scribble.obj"
	-@erase "$(INTDIR)\scribble.pch"
	-@erase "$(INTDIR)\scribble.res"
	-@erase "$(INTDIR)\scribdoc.obj"
	-@erase "$(INTDIR)\scribfrm.obj"
	-@erase "$(INTDIR)\scribvw.obj"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(OUTDIR)\scribble.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE CPP /nologo /MD /W3 /GX /O2 /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /FR /Yu"stdafx.h" /c
# ADD CPP /nologo /MD /W3 /GX /O2 /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /Yu"stdafx.h" /c
# SUBTRACT CPP /Fr
CPP_PROJ=/nologo /MD /W3 /GX /O2 /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_AFXDLL" /D "_MBCS" /Fp"$(INTDIR)/scribble.pch" /Yu"stdafx.h" /Fo"$(INTDIR)/"\
 /c 
CPP_OBJS=.\WinRel/
CPP_SBRS=.\.
# ADD BASE RSC /l 0x40c /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x40c /d "NDEBUG" /d "_AFXDLL"
RSC_PROJ=/l 0x40c /fo"$(INTDIR)/scribble.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/scribble.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /machine:I386
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 /nologo /subsystem:windows /machine:I386
# SUBTRACT LINK32 /pdb:none
LINK32_FLAGS=/nologo /subsystem:windows /incremental:no\
 /pdb:"$(OUTDIR)/scribble.pdb" /machine:I386 /out:"$(OUTDIR)/scribble.exe" 
LINK32_OBJS= \
	"$(INTDIR)\mainfrm.obj" \
	"$(INTDIR)\pendlg.obj" \
	"$(INTDIR)\scribble.obj" \
	"$(INTDIR)\scribble.res" \
	"$(INTDIR)\scribdoc.obj" \
	"$(INTDIR)\scribfrm.obj" \
	"$(INTDIR)\scribvw.obj" \
	"$(INTDIR)\stdafx.obj"

"$(OUTDIR)\scribble.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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

# Name "scribble - Win32 Debug"
# Name "scribble - Win32 Release"

!IF  "$(CFG)" == "scribble - Win32 Debug"

!ELSEIF  "$(CFG)" == "scribble - Win32 Release"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\stdafx.cpp
DEP_CPP_STDAF=\
	".\stdafx.h"\
	

!IF  "$(CFG)" == "scribble - Win32 Debug"

# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

BuildCmds= \
	$(CPP) /nologo /MDd /W3 /Gm /GX /Zi /Od /D "_DEBUG" /D "WIN32" /D "_WINDOWS"\
 /D "_AFXDLL" /D "_MBCS" /Fp"$(INTDIR)/scribble.pch" /Yc"stdafx.h"\
 /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c $(SOURCE) \
	

"$(INTDIR)\stdafx.obj" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\scribble.pch" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "scribble - Win32 Release"

# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

BuildCmds= \
	$(CPP) /nologo /MD /W3 /GX /O2 /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_AFXDLL" /D "_MBCS" /Fp"$(INTDIR)/scribble.pch" /Yc"stdafx.h" /Fo"$(INTDIR)/"\
 /c $(SOURCE) \
	

"$(INTDIR)\stdafx.obj" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\scribble.pch" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\scribble.cpp
DEP_CPP_SCRIB=\
	".\mainfrm.h"\
	".\scribble.h"\
	".\scribdoc.h"\
	".\scribfrm.h"\
	".\scribvw.h"\
	".\stdafx.h"\
	

"$(INTDIR)\scribble.obj" : $(SOURCE) $(DEP_CPP_SCRIB) "$(INTDIR)"\
 "$(INTDIR)\scribble.pch"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\mainfrm.cpp
DEP_CPP_MAINF=\
	".\mainfrm.h"\
	".\scribble.h"\
	".\stdafx.h"\
	

"$(INTDIR)\mainfrm.obj" : $(SOURCE) $(DEP_CPP_MAINF) "$(INTDIR)"\
 "$(INTDIR)\scribble.pch"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\scribdoc.cpp
DEP_CPP_SCRIBD=\
	".\pendlg.h"\
	".\scribble.h"\
	".\scribdoc.h"\
	".\stdafx.h"\
	

"$(INTDIR)\scribdoc.obj" : $(SOURCE) $(DEP_CPP_SCRIBD) "$(INTDIR)"\
 "$(INTDIR)\scribble.pch"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\scribvw.cpp
DEP_CPP_SCRIBV=\
	".\scribble.h"\
	".\scribdoc.h"\
	".\scribvw.h"\
	".\stdafx.h"\
	

"$(INTDIR)\scribvw.obj" : $(SOURCE) $(DEP_CPP_SCRIBV) "$(INTDIR)"\
 "$(INTDIR)\scribble.pch"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\scribble.rc
DEP_RSC_SCRIBB=\
	".\res\scribble.ico"\
	".\res\scribble.rc2"\
	".\res\scribdoc.ico"\
	".\res\toolbar.bmp"\
	

"$(INTDIR)\scribble.res" : $(SOURCE) $(DEP_RSC_SCRIBB) "$(INTDIR)"
   $(RSC) $(RSC_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE=.\readme.txt

!IF  "$(CFG)" == "scribble - Win32 Debug"

!ELSEIF  "$(CFG)" == "scribble - Win32 Release"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\pendlg.cpp
DEP_CPP_PENDL=\
	".\pendlg.h"\
	".\scribble.h"\
	".\stdafx.h"\
	

"$(INTDIR)\pendlg.obj" : $(SOURCE) $(DEP_CPP_PENDL) "$(INTDIR)"\
 "$(INTDIR)\scribble.pch"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\scribfrm.cpp
DEP_CPP_SCRIBF=\
	".\scribble.h"\
	".\scribfrm.h"\
	".\stdafx.h"\
	

"$(INTDIR)\scribfrm.obj" : $(SOURCE) $(DEP_CPP_SCRIBF) "$(INTDIR)"\
 "$(INTDIR)\scribble.pch"


# End Source File
# End Target
# End Project
################################################################################
