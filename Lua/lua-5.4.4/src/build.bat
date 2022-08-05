@REM Build lua 5.4.4
@REM 2022-08-04	PV
@if "%VCToolsVersion%"=="" call devcmd
if not exist ..\bin\ mkdir ..\bin
cl /c /W3 /O2 /favor:INTEL64 /DLUA_COMPAT_5_3 lapi.c lcode.c lctype.c ldebug.c ldo.c ldump.c lfunc.c lgc.c llex.c lmem.c lobject.c lopcodes.c lparser.c lstate.c lstring.c ltable.c ltm.c lundump.c lvm.c lzio.c lauxlib.c lbaselib.c lcorolib.c ldblib.c liolib.c lmathlib.c loadlib.c loslib.c lstrlib.c ltablib.c lutf8lib.c linit.c
lib /out:..\bin\lua.lib lapi.obj lcode.obj lctype.obj ldebug.obj ldo.obj ldump.obj lfunc.obj lgc.obj llex.obj lmem.obj lobject.obj lopcodes.obj lparser.obj lstate.obj lstring.obj ltable.obj ltm.obj lundump.obj lvm.obj lzio.obj lauxlib.obj lbaselib.obj lcorolib.obj ldblib.obj liolib.obj lmathlib.obj loadlib.obj loslib.obj lstrlib.obj ltablib.obj lutf8lib.obj linit.obj
cl /W3 /O2 /favor:INTEL64 /DLUA_COMPAT_5_3 /Fe: ..\bin\lua.exe lua.c ..\bin\lua.lib
cl /W3 /O2 /favor:INTEL64 /DLUA_COMPAT_5_3 /Fe: ..\bin\luac.exe luac.c ..\bin\lua.lib
del *.obj
