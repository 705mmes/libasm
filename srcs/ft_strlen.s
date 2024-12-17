section .text
    global ft_strlen

ft_strlen:
    xor rax, rax        ; Any number XORed with itself is 0

ft_strlen_loop:
    cmp byte [rdi], 0         ; The test instruction performs a bitwise AND operation between its operands.
    je done                   ; Stop loop if ZF == 0
    inc rdi                   ; go to next byte
    inc rax                   ; length +1
    jmp ft_strlen_loop

done:
    ret
