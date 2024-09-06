main:
    # Recebe um inteiro e armazena em s0
    li t0, 4
    ecall
    mv s0, a0
    # Verifica se eh maior que 9
    li s1, 9
    BGT s0, s1, letras
    
    # Converte para hexa
    addi s0, s0, 48
    # Printa
    mv a0, s0
    li t0, 2
    ecall
    # Imprime h
    li a0, 104
    li t0, 2
    ecall
    j fim
letras:
    # Converte para hexa
    addi s0, s0, 55
    # Printa
    mv a0, s0
    li t0, 2
    ecall
    # Imprime h
    li a0, 104
    li t0, 2
    ecall
fim:
    ret
