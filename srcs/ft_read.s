section .text
    global ft_read

ft_read:
    ; rdi -> fd to write into
    ; rsi -> msg
    ; rdx -> size of msg
    mov rax, 0 ; System call number (for read, it's 0)
    syscall

    ret