section .text
    global ft_strcpy

ft_strcpy:
    push rbp
    mov rbp, rsp
    push rbx
    mov rbx, rdi ; save original dst in rbx (callee-saved, not used as byte scratch)


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
    mov rax, rbx
    pop rbx
    mov rsp, rbp
    pop rbp
    ret
