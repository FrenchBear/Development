@if "%VCToolsVersion%"=="" call devcmd
cl /W3 /O2 /favor:INTEL64 /Fe: li.exe li.c ..\lua-5.4.4\bin\lua.lib
