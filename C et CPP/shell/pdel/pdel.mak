# Microsoft Developer Studio Generated NMAKE File, Format Version 4.10
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

!IF "$(CFG)" == ""
CFG=pdel - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to pdel - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "pdel - Win32 Release" && "$(CFG)" != "pdel - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "pdel.mak" CFG="pdel - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "pdel - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "pdel - Win32 Debug" (based on "Win32 (x86) Console Application")
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
# PROP Target_Last_Scanned "pdel - Win32 Debug"
RSC=rc.exe
CPP=cl.exe

!IF  "$(CFG)" == "pdel - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Target_Dir ""
OUTDIR=.\Release
INTDIR=.\Release

ALL : "$(OUTDIR)\pdel.exe"

CLEAN : 
	-@erase "$(INTDIR)\Cstring.obj"
	-@erase "$(INTDIR)\pdel.obj"
	-@erase "$(OUTDIR)\pdel.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /YX /c
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE"\
 /Fp"$(INTDIR)/pdel.pch" /YX /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\Release/
CPP_SBRS=.\.
# ADD BASE RSC /l 0x40c /d "NDEBUG"
# ADD RSC /l 0x40c /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/pdel.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib /nologo /subsystem:console /incremental:no\
 /pdb:"$(OUTDIR)/pdel.pdb" /machine:I386 /out:"$(OUTDIR)/pdel.exe" 
LINK32_OBJS= \
	"$(INTDIR)\Cstring.obj" \
	"$(INTDIR)\pdel.obj"

"$(OUTDIR)\pdel.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "pdel - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Target_Dir ""
OUTDIR=.\Debug
INTDIR=.\Debug

ALL : "$(OUTDIR)\pdel.exe" "$(OUTDIR)\pdel.bsc"

CLEAN : 
	-@erase "$(INTDIR)\Cstring.obj"
	-@erase "$(INTDIR)\Cstring.sbr"
	-@erase "$(INTDIR)\pdel.obj"
	-@erase "$(INTDIR)\pdel.sbr"
	-@erase "$(INTDIR)\vc40.idb"
	-@erase "$(INTDIR)\vc40.pdb"
	-@erase "$(OUTDIR)\pdel.bsc"
	-@erase "$(OUTDIR)\pdel.exe"
	-@erase "$(OUTDIR)\pdel.ilk"
	-@erase "$(OUTDIR)\pdel.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /FR /YX /c
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE"\
 /FR"$(INTDIR)/" /Fp"$(INTDIR)/pdel.pch" /YX /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\Debug/
CPP_SBRS=.\Debug/
# ADD BASE RSC /l 0x40c /d "_DEBUG"
# ADD RSC /l 0x40c /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/pdel.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\Cstring.sbr" \
	"$(INTDIR)\pdel.sbr"

"$(OUTDIR)\pdel.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib /nologo /subsystem:console /incremental:yes\
 /pdb:"$(OUTDIR)/pdel.pdb" /debug /machine:I386 /out:"$(OUTDIR)/pdel.exe" 
LINK32_OBJS= \
	"$(INTDIR)\Cstring.obj" \
	"$(INTDIR)\pdel.obj"

"$(OUTDIR)\pdel.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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

.c{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

################################################################################
# Begin Target

# Name "pdel - Win32 Release"
# Name "pdel - Win32 Debug"

!IF  "$(CFG)" == "pdel - Win32 Release"

!ELSEIF  "$(CFG)" == "pdel - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\pdel.cpp
DEP_CPP_PDEL_=\
	".\cstring.h"\
	

!IF  "$(CFG)" == "pdel - Win32 Release"


"$(INTDIR)\pdel.obj" : $(SOURCE) $(DEP_CPP_PDEL_) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "pdel - Win32 Debug"


"$(INTDIR)\pdel.obj" : $(SOURCE) $(DEP_CPP_PDEL_) "$(INTDIR)"

"$(INTDIR)\pdel.sbr" : $(SOURCE) $(DEP_CPP_PDEL_) "$(INTDIR)"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\Cstring.cpp
DEP_CPP_CSTRI=\
	".\cstring.h"\
	

!IF  "$(CFG)" == "pdel - Win32 Release"


"$(INTDIR)\Cstring.obj" : $(SOURCE) $(DEP_CPP_CSTRI) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "pdel - Win32 Debug"


"$(INTDIR)\Cstring.obj" : $(SOURCE) $(DEP_CPP_CSTRI) "$(INTDIR)"

"$(INTDIR)\Cstring.sbr" : $(SOURCE) $(DEP_CPP_CSTRI) "$(INTDIR)"


!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
