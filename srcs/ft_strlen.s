.section .text
    .global ft_strlen

ft_strlen:
    xor rax, rax        ; Any number XORed with itself is 0

ft_strlen_loop:
    mov al, byte [rdi]  ; Load the byte at address in RDI into AL
    test al, al         ; The test instruction performs a bitwise AND operation between its operands.
    je done
    inc rdi
    inc rax
    jmp ft_strlen_loop

done:
    ret
