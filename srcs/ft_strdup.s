section .text
    global ft_strdup
    extern __errno_location , ft_strlen , ft_strcpy

ft_strdup:
    ; rdi -> str to copy
    call ft_strlen ; rax now holds the len of rdi
    
