;On macOS, the system call numbers are different from those on Linux.
;If your assembly code uses Linux syscall numbers, it will fail on macOS.

section .text
    global hello_world

hello_world:
    mov rax, 0x2000004 ; macOS syscall for write
    mov rdi, 1         ; STDOUT
    lea rsi, [rel msg] ; address of message
    mov rdx, msglen    ; length of message
    syscall

    mov rax, 0x2000001 ; macOS syscall for exit
    xor rdi, rdi       ; exit code 0
    syscall

section .rodata
    msg: db "Hello, world!", 10
    msglen: equ $ - msg
