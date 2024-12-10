section  __TEXT,__text
    global _start        ; Entry point for the linker

_start:                   ; _start is the entry point
    ; Write system call (write to stdout)
    lea     rdx, [rel msg]      ; Load address of msg into rdx
    mov     rdi, 1              ; File descriptor 1 (stdout)
    mov     rsi, rdx            ; Message address in rsi
    mov     rdx, len            ; Message length in rdx
    mov     rax, 0x02000004     ; System call number for write (macOS)
    syscall                     ; Perform syscall to write message

    ; Exit system call
    mov     rax, 0x02000001     ; System call number for exit
    xor     rdi, rdi            ; Exit status 0
    syscall                     ; Perform syscall to exit

section  __DATA,__data
msg db 'Hello, world!', 0xa      ; Null-terminated string with newline
len equ $ - msg                  ; Length of the string
