; Sample x64 assembly program to show x64 fastcall calling convention (int/ptr passed into rcx, rdx, r8 and r9, then pushed on the stack)
; From doc "Intel Introduction to x64 assembly"
; 2021-08-19    PV

extrn ExitProcess: PROC
extrn MessageBoxA: PROC

.data
caption     db  '64-bit hello', 0
message     db  'Hello World!', 0

.code
Start PROC
    sub     rsp, 28h        ; Shadow space, aligns stack.  = 5x8 bytes. Ok for 8 bytes to keep stack 16-bytes aligned since caller has pushed 8-byte return address, byt why the remaining 4x8 bytes?
    mov     rcx, 0          ; hWnd = HWND_DESKTOP
    lea     rdx, message    ; LPCSTR lpText
    lea     r8, caption     ; LPCSTR lpCaption
    xor     r9d, r9d        ; uType = MB_OK (0)
    call    MessageBoxA     ; call MessageBox API
    mov     ecx, eax        ; uExitCode = retcode of MessageBox
    call    ExitProcess
start ENDP
End

