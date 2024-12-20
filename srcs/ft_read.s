section .text
    global ft_read
    extern __errno_location ; pour trouver l'adresse de la fonction dans la table des procédures externes il faut faire la commande suivante : nm -D /usr/lib/x86_64-linux-gnu/libc.so.6 | grep __errno_location

ft_read:
    ; rdi -> fd to write into
    ; rsi -> msg
    ; rdx -> size of msg
    mov rax, 0 ; System call number (for read, it's 0)
    syscall
    test rax, rax
    js error
    ret

error:
    neg rax         ; (rax = -rax) alternative way to get the positive value
    mov rdi, rax
    call __errno_location wrt ..plt
    mov [rax] , rdi ; This is where you write the error code into errno.
    mov rax , -1
    ret