# Microsoft Developer Studio Generated NMAKE File, Format Version 4.20
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

!IF "$(CFG)" == ""
CFG=ttype - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to ttype - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "ttype - Win32 Release" && "$(CFG)" !=\
 "ttype - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "ttype.mak" CFG="ttype - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "ttype - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "ttype - Win32 Debug" (based on "Win32 (x86) Console Application")
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
# PROP Target_Last_Scanned "ttype - Win32 Debug"
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "ttype - Win32 Release"

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

ALL : "$(OUTDIR)\ttype.exe"

CLEAN : 
	-@erase "$(INTDIR)\ttype.obj"
	-@erase "$(INTDIR)\Cstring.obj"
	-@erase "$(OUTDIR)\ttype.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /YX /c
# SUBTRACT CPP /Z<none> /Fr
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE"\
 /Fp"$(INTDIR)/ttype.pch" /YX /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\Release/
CPP_SBRS=.\.
# ADD BASE RSC /l 0x40c /d "NDEBUG"
# ADD RSC /l 0x40c /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/ttype.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# SUBTRACT LINK32 /debug
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib /nologo /subsystem:console /incremental:no\
 /pdb:"$(OUTDIR)/ttype.pdb" /machine:I386 /out:"$(OUTDIR)/ttype.exe" 
LINK32_OBJS= \
	"$(INTDIR)\ttype.obj" \
	"$(INTDIR)\Cstring.obj"

"$(OUTDIR)\ttype.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "ttype - Win32 Debug"

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

ALL : "$(OUTDIR)\ttype.exe" "$(OUTDIR)\ttype.bsc"

CLEAN : 
	-@erase "$(INTDIR)\ttype.obj"
	-@erase "$(INTDIR)\ttype.sbr"
	-@erase "$(INTDIR)\Cstring.obj"
	-@erase "$(INTDIR)\Cstring.sbr"
	-@erase "$(INTDIR)\vc40.idb"
	-@erase "$(INTDIR)\vc40.pdb"
	-@erase "$(OUTDIR)\ttype.bsc"
	-@erase "$(OUTDIR)\ttype.exe"
	-@erase "$(OUTDIR)\ttype.ilk"
	-@erase "$(OUTDIR)\ttype.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /FR /YX /c
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE"\
 /FR"$(INTDIR)/" /Fp"$(INTDIR)/ttype.pch" /YX /Fo"$(INTDIR)/" /Fd"$(INTDIR)/"\
 /c 
CPP_OBJS=.\Debug/
CPP_SBRS=.\Debug/
# ADD BASE RSC /l 0x40c /d "_DEBUG"
# ADD RSC /l 0x40c /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/ttype.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\ttype.sbr" \
	"$(INTDIR)\Cstring.sbr"

"$(OUTDIR)\ttype.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib /nologo /subsystem:console /incremental:yes\
 /pdb:"$(OUTDIR)/ttype.pdb" /debug /machine:I386 /out:"$(OUTDIR)/ttype.exe" 
LINK32_OBJS= \
	"$(INTDIR)\ttype.obj" \
	"$(INTDIR)\Cstring.obj"

"$(OUTDIR)\ttype.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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

# Name "ttype - Win32 Release"
# Name "ttype - Win32 Debug"

!IF  "$(CFG)" == "ttype - Win32 Release"

!ELSEIF  "$(CFG)" == "ttype - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\ttype.cpp
DEP_CPP_ASTRU=\
	".\cstring.h"\
	

!IF  "$(CFG)" == "ttype - Win32 Release"


"$(INTDIR)\ttype.obj" : $(SOURCE) $(DEP_CPP_ASTRU) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "ttype - Win32 Debug"


"$(INTDIR)\ttype.obj" : $(SOURCE) $(DEP_CPP_ASTRU) "$(INTDIR)"

"$(INTDIR)\ttype.sbr" : $(SOURCE) $(DEP_CPP_ASTRU) "$(INTDIR)"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\Cstring.cpp
DEP_CPP_CSTRI=\
	".\cstring.h"\
	

!IF  "$(CFG)" == "ttype - Win32 Release"


"$(INTDIR)\Cstring.obj" : $(SOURCE) $(DEP_CPP_CSTRI) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "ttype - Win32 Debug"


"$(INTDIR)\Cstring.obj" : $(SOURCE) $(DEP_CPP_CSTRI) "$(INTDIR)"

"$(INTDIR)\Cstring.sbr" : $(SOURCE) $(DEP_CPP_CSTRI) "$(INTDIR)"


!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
