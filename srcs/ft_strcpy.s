section .text
    global ft_strcpy

ft_strcpy:
    xor rax, rax
    ; rdi dest
    ; rsi source
    push rdi

copy_loop:
    mov al, [rsi]   ; mov first rsi byte into al (with a dereference (like [rsi]) is a read-only)
    cmp al, 0       ; check for NULL
    je done 
    mov [rdi], al
    inc rsi
    inc rdi
    jmp copy_loop

done:
    mov byte [rdi], 0
    pop rax
    ret
