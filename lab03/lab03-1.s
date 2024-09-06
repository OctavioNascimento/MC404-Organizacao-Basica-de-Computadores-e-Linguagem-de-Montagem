main:
    # Le um numero do teclado e salva em s0
    addi t0, zero, 4
    ecall
    mv s0, a0
    # Verifica se eh par e salva em s2
    li s1, 1
    AND s2, s1, s0
    # 1 = "I", 0 = "P"
    BEQ s2, s1, print_impar
    # Printa "P" pois eh par
    li a0, 80
    addi t0, zero, 2
    ecall
    j fim
print_impar:
    # Printa "I" pois eh impar
    li a0, 73
    addi t0, zero, 2
    ecall
fim:
    ret