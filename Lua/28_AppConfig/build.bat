@if "%VCToolsVersion%"=="" call devcmd
cl /W3 /O2 /favor:INTEL64 /I..\lua-5.4.4\src /Fe: app.exe app.c ..\lua-5.4.4\bin\lua.lib
if not exist lua.dll copy ..\lua-5.4.4\bin\lua.dll