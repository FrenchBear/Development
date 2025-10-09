; This program displays "Hello, World!" to the console in 64-bit Windows.
; It uses the Windows API functions GetStdHandle, WriteFile, and ExitProcess.
;
; 2025-10-09	PV

; Declare external functions from the Kernel32 library.
; The PROC keyword specifies that these are procedure labels.
EXTERN GetStdHandle : PROC
EXTERN WriteFile : PROC
EXTERN ExitProcess : PROC

; Data segment
.data
    ; The message to be displayed, ending with a carriage return and line feed.
    message db 'Hello, World!', 0Dh, 0Ah
    ; Use the 'equ' directive to calculate the length of the message.
    ; '$' represents the current location counter.
    msglen equ $ - message

; Code segment
.code
main PROC
    ; Windows x64 calling convention requires allocating 32 bytes of "shadow space"
    ; on the stack, plus any additional space needed for local variables.
    ; We allocate 40 bytes (32 for shadow space + 8 for a qword).
    sub rsp, 40

    ; Call GetStdHandle to get a handle to the standard output console.
    ; STD_OUTPUT_HANDLE = -11. The first argument is passed in RCX.
    mov ecx, -11
    call GetStdHandle
    ; The handle is returned in RAX. We'll store it in RBX for the next call.
    mov rbx, rax

    ; Call WriteFile to write our message to the console.
    ; First arg (hFile) in RCX -> our handle from RBX
    ; Second arg (lpBuffer) in RDX -> address of our message
    ; Third arg (nNumberOfBytesToWrite) in R8 -> length of the message
    ; Fourth arg (lpNumberOfBytesWritten) in R9 -> pointer to a variable
    ; Fifth arg (lpOverlapped) on the stack -> NULL
    mov rcx, rbx
    lea rdx, message
    mov r8d, msglen
    lea r9, [rsp+24]        ; Point to a temporary qword on the stack
    mov qword ptr [rsp+32], 0 ; Set lpOverlapped to NULL
    call WriteFile

    ; Call ExitProcess to terminate the program gracefully.
    ; First arg (uExitCode) in RCX -> 0 for success
    mov ecx, 0
    call ExitProcess

main ENDP
END
