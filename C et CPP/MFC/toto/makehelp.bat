@echo off
REM -- First make map file from Microsoft Visual C++ generated resource.h
echo // MAKEHELP.BAT generated Help Map file.  Used by TOTO.HPJ. >hlp\toto.hm
echo. >>hlp\toto.hm
echo // Commands (ID_* and IDM_*) >>hlp\toto.hm
makehm ID_,HID_,0x10000 IDM_,HIDM_,0x10000 resource.h >>hlp\toto.hm
echo. >>hlp\toto.hm
echo // Prompts (IDP_*) >>hlp\toto.hm
makehm IDP_,HIDP_,0x30000 resource.h >>hlp\toto.hm
echo. >>hlp\toto.hm
echo // Resources (IDR_*) >>hlp\toto.hm
makehm IDR_,HIDR_,0x20000 resource.h >>hlp\toto.hm
echo. >>hlp\toto.hm
echo // Dialogs (IDD_*) >>hlp\toto.hm
makehm IDD_,HIDD_,0x20000 resource.h >>hlp\toto.hm
echo. >>hlp\toto.hm
echo // Frame Controls (IDW_*) >>hlp\toto.hm
makehm IDW_,HIDW_,0x50000 resource.h >>hlp\toto.hm
REM -- Make help for Project TOTO

echo Building Win32 Help files
call hc31 toto.hpj
if exist windebug copy toto.hlp windebug
if exist winrel copy toto.hlp winrel
EndLocal
