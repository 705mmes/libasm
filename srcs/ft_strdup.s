section .text
    global ft_strdup
    extern __errno_location , ft_strlen , ft_strcpy, malloc

ft_strdup:
    ; char *strdup(const char *s);
    push rbp
	mov	rbp, rsp
    push rbx
    push r12
    mov rbx, rdi ; push the first argument into calle-save register
    call ft_strlen ; rax now holds the len of rdi

    inc rax ; null terminator
    mov rdi, rax ; rdi now holds the len of the string to copy
    call malloc wrt ..plt ; rax now holds the pointer to the allocated memory
    test rax, rax ; if malloc returns null the ZeroFlag == 1
    jz malloc_error ; If ZF==1 call malloc_error

    mov r12, rax ; save malloc ptr so im not getting cobbled as always
    mov rdi, rax ; strcpy dest -> malloc ptr
    mov rsi, rbx ; strcpy src -> original string
    call ft_strcpy
    
    mov rax, r12
    pop r12
    pop rbx
    mov rsp, rbp ; drop stack pointer to the current base pointer
    pop rbp ; pops base pointer off the stack so its back where it was before the prologue
    ret


malloc_error:
    call __errno_location wrt ..plt; returns a pointer to errno in rax / wrt ..plt causes the linker to build a procedure linkage table entry for the symbol
    mov qword [rax], 12 ; 12 = ENOMEM -> Insufficient memory available to allocate duplicate string
    pop r12
    pop rbx
    mov rsp, rbp
    pop rbp
    ret
