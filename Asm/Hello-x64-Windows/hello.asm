; Hello x64 Windows
; Sample x64 assembly program to show x64 fastcall calling convention (int/ptr passed into rcx, rdx, r8 and r9, then pushed on the stack)
; From doc "Intel Introduction to x64 assembly"
;
; 2021-08-19    PV
; 2025-10-09    PV		Better comment for 1st instruction

extrn ExitProcess: PROC
extrn MessageBoxA: PROC

.data
caption     db  '64-bit hello', 0
message     db  'Hello World!', 0

.code
Start PROC
    sub     rsp, 28h        ; Shadow space, aligns stack: allocate 40 bytes (32 for shadow space, Windows x64 calling convention) + 8 for a qword, not used here.
    mov     rcx, 0          ; hWnd = HWND_DESKTOP
    lea     rdx, message    ; LPCSTR lpText
    lea     r8, caption     ; LPCSTR lpCaption
    xor     r9d, r9d        ; uType = MB_OK (0)
    call    MessageBoxA     ; call MessageBox API
    mov     ecx, eax        ; uExitCode = retcode of MessageBox
    call    ExitProcess
start ENDP

End
