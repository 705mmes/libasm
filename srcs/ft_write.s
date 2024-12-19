section .text
    global ft_write

ft_write:
    ; rdi -> fd to write into
    ; rsi -> msg
    ; rdx -> size of msg
    mov rax, 1 ; System call number (for write, it's 1)
    syscall    
    ret