@if "%VCToolsVersion%"=="" call devcmd
ml64 hello.asm /link /subsystem:windows /defaultlib:kernel32.lib /defaultlib:user32.lib /entry:Start
