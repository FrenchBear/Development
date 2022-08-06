@REM Build lua 5.4.4
@REM 2022-08-04	PV
@if "%VCToolsVersion%"=="" call devcmd
if not exist ..\bin\ mkdir ..\bin
cl /LD /Fe: ..\bin\lua.dll /W3 /O2 /favor:INTEL64 /DLUA_COMPAT_5_3 /DLUA_BUILD_AS_DLL lapi.c lcode.c lctype.c ldebug.c ldo.c ldump.c lfunc.c lgc.c llex.c lmem.c lobject.c lopcodes.c lparser.c lstate.c lstring.c ltable.c ltm.c lundump.c lvm.c lzio.c lauxlib.c lbaselib.c lcorolib.c ldblib.c liolib.c lmathlib.c loadlib.c loslib.c lstrlib.c ltablib.c lutf8lib.c linit.c
cl /W3 /O2 /favor:INTEL64 /DLUA_COMPAT_5_3 /Fe: ..\bin\lua.exe lua.c ..\bin\lua.lib

@REM Don't build luac.exe with dll since it misses 3 exports: luaM_free_, luaG_getfuncline and luaU_dump. Use instead the statically built version
rem cl /W3 /O2 /favor:INTEL64 /DLUA_COMPAT_5_3 /DLUA_BUILD_AS_DLL /Fe: ..\bin\luac.exe luac.c ..\bin\lua.lib

del *.obj