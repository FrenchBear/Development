# Microsoft Visual C++ generated build script - Do not modify

PROJ = WS_PING
DEBUG = 1
PROGTYPE = 0
CALLER = 
ARGS = 
DLLS = 
D_RCDEFINES = -d_DEBUG
R_RCDEFINES = -dNDEBUG
ORIGIN = MSVC
ORIGIN_VER = 1.00
PROJPATH = D:\C\WS_PING\
USEMFC = 0
CC = cl
CPP = cl
CXX = cl
CCREATEPCHFLAG = 
CPPCREATEPCHFLAG = 
CUSEPCHFLAG = 
CPPUSEPCHFLAG = 
FIRSTC = WS_ERROR.C  
FIRSTCPP =             
RC = rc
CFLAGS_D_WEXE = /nologo /G2 /W2 /Zi /AL /Od /D "_DEBUG" /FR /GA /Fd"WS_PING.PDB"
CFLAGS_R_WEXE = /nologo /W3 /AM /O1 /D "NDEBUG" /FR /GA 
LFLAGS_D_WEXE = /NOLOGO /NOD /PACKC:61440 /ALIGN:16 /ONERROR:NOEXE /CO  
LFLAGS_R_WEXE = /NOLOGO /NOD /PACKC:61440 /STACK:10240 /ALIGN:16 /ONERROR:NOEXE  
LIBS_D_WEXE = oldnames libw llibcew winsock commdlg.lib olecli.lib olesvr.lib shell.lib 
LIBS_R_WEXE = oldnames libw mlibcew commdlg.lib olecli.lib olesvr.lib shell.lib 
RCFLAGS = /nologo
RESFLAGS = /nologo
RUNFLAGS = 
DEFFILE = WS_PING.DEF
OBJS_EXT = 
LIBS_EXT = 
!if "$(DEBUG)" == "1"
CFLAGS = $(CFLAGS_D_WEXE)
LFLAGS = $(LFLAGS_D_WEXE)
LIBS = $(LIBS_D_WEXE)
MAPFILE = nul
RCDEFINES = $(D_RCDEFINES)
!else
CFLAGS = $(CFLAGS_R_WEXE)
LFLAGS = $(LFLAGS_R_WEXE)
LIBS = $(LIBS_R_WEXE)
MAPFILE = nul
RCDEFINES = $(R_RCDEFINES)
!endif
!if [if exist MSVC.BND del MSVC.BND]
!endif
SBRS = WS_ERROR.SBR \
		WS_GLOB.SBR \
		WS_PAINT.SBR \
		WS_PING.SBR \
		WS_PINGR.SBR


WS_ERROR_DEP = d:\c\ws_ping\ws_glob.h \
	d:\c\ws_ping\winsock.h \
	d:\c\ws_ping\ws_ping.h


WS_GLOB_DEP = d:\c\ws_ping\ws_glob.h \
	d:\c\ws_ping\winsock.h \
	d:\c\ws_ping\ws_ping.h


WS_PAINT_DEP = d:\c\ws_ping\ws_glob.h \
	d:\c\ws_ping\winsock.h \
	d:\c\ws_ping\ws_ping.h


WS_PING_DEP = d:\c\ws_ping\ws_glob.h \
	d:\c\ws_ping\winsock.h \
	d:\c\ws_ping\ws_ping.h \
	d:\c\ws_ping\ip_icmp.h


WS_PINGR_DEP = d:\c\ws_ping\ws_glob.h \
	d:\c\ws_ping\winsock.h \
	d:\c\ws_ping\ws_ping.h \
	d:\c\ws_ping\ip_icmp.h


WS_PING_RCDEP = d:\c\ws_ping\ws_ping.h \
	d:\c\ws_ping\ws_ping.ico \
	d:\c\ws_ping\ws_pingd.ico


all:	$(PROJ).EXE $(PROJ).BSC

WS_ERROR.OBJ:	WS_ERROR.C $(WS_ERROR_DEP)
	$(CC) $(CFLAGS) $(CCREATEPCHFLAG) /c WS_ERROR.C

WS_GLOB.OBJ:	WS_GLOB.C $(WS_GLOB_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c WS_GLOB.C

WS_PAINT.OBJ:	WS_PAINT.C $(WS_PAINT_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c WS_PAINT.C

WS_PING.OBJ:	WS_PING.C $(WS_PING_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c WS_PING.C

WS_PINGR.OBJ:	WS_PINGR.C $(WS_PINGR_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c WS_PINGR.C

WS_PING.RES:	WS_PING.RC $(WS_PING_RCDEP)
	$(RC) $(RCFLAGS) $(RCDEFINES) -r WS_PING.RC


$(PROJ).EXE::	WS_PING.RES

$(PROJ).EXE::	WS_ERROR.OBJ WS_GLOB.OBJ WS_PAINT.OBJ WS_PING.OBJ WS_PINGR.OBJ $(OBJS_EXT) $(DEFFILE)
	echo >NUL @<<$(PROJ).CRF
WS_ERROR.OBJ +
WS_GLOB.OBJ +
WS_PAINT.OBJ +
WS_PING.OBJ +
WS_PINGR.OBJ +
$(OBJS_EXT)
$(PROJ).EXE
$(MAPFILE)
e:\msvc\lib\+
e:\msvc\mfc\lib\+
e:\msvc\lib\+
d:\ole2\lib\+
$(LIBS)
$(DEFFILE);
<<
	link $(LFLAGS) @$(PROJ).CRF
	$(RC) $(RESFLAGS) WS_PING.RES $@
	@copy $(PROJ).CRF MSVC.BND

$(PROJ).EXE::	WS_PING.RES
	if not exist MSVC.BND 	$(RC) $(RESFLAGS) WS_PING.RES $@

run: $(PROJ).EXE
	$(PROJ) $(RUNFLAGS)


$(PROJ).BSC: $(SBRS)
	bscmake @<<
/o$@ $(SBRS)
<<
