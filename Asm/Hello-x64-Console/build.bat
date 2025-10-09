@if "%VCToolsVersion%"=="" call devx64tools
ml64 hello.asm /link /subsystem:console /entry:main kernel32.lib

@rem separated assembly and link
@rem ml64.exe /c /Fo"hello.obj" hello_ml64.asm
@rem link.exe hello.obj /subsystem:console /entry:main /out:hello.exe kernel32.lib