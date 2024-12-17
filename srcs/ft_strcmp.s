section .text
    global ft_strcmp

ft_strcmp:
    xor rax, rax
    ; rdi == s1
    ; rsi == s2

cmp_loop:
    mov al, byte[rdi]
    mov bl, byte[rsi]
    cmp al, 0
    je done
    cmp bl, 0
    je done

    cmp al, bl      ; ZF = 1 if al - bl = 0
    jne not_equal   ; jump is ZF != 0

    inc rdi
    inc rsi
    jmp cmp_loop

not_equal:
    movzx rax, al   ; permet de copier un registre de taille inférieur dans un registre de plus grande taille en remplissant les bits supplémentaires par des 0.
    movzx rbx, bl
    sub rax, rbx
    ret

done:
    movzx rax, al
    movzx rbx, bl
    sub rax, rbx
    ret
    ret