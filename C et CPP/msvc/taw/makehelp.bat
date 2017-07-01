@echo off
REM -- First make map file from Microsoft Visual C++ generated resource.h
echo // MAKEHELP.BAT generated Help Map file.  Used by TAK.HPJ. >hlp\tak.hm
echo. >>hlp\tak.hm
echo // Commands (ID_* and IDM_*) >>hlp\tak.hm
makehm ID_,HID_,0x10000 IDM_,HIDM_,0x10000 resource.h >>hlp\tak.hm
echo. >>hlp\tak.hm
echo // Prompts (IDP_*) >>hlp\tak.hm
makehm IDP_,HIDP_,0x30000 resource.h >>hlp\tak.hm
echo. >>hlp\tak.hm
echo // Resources (IDR_*) >>hlp\tak.hm
makehm IDR_,HIDR_,0x20000 resource.h >>hlp\tak.hm
echo. >>hlp\tak.hm
echo // Dialogs (IDD_*) >>hlp\tak.hm
makehm IDD_,HIDD_,0x20000 resource.h >>hlp\tak.hm
echo. >>hlp\tak.hm
echo // Frame Controls (IDW_*) >>hlp\tak.hm
makehm IDW_,HIDW_,0x50000 resource.h >>hlp\tak.hm
REM -- Make help for Project TAK

echo Building Win32 Help files
call hc31 tak.hpj
if exist windebug copy tak.hlp windebug
if exist winrel copy tak.hlp winrel
EndLocal
