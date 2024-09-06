main:
    # Le um numero do teclado e salva em s0
    addi t0, zero, 4
    ecall
    mv s0, a0
    # Verifica se eh multiplo de 4 e salva em s2
    li s1, 3
    AND s2, s1, s0
    # 0 = "S", maior que 0 = "N"
    BEQ s2, zero, print_4
    # Printa "N" pois NAO eh multiplo de 4
    li a0, 78
    addi t0, zero, 2
    ecall
    j fim
print_4:
    # Printa "S" pois SIM eh multiplo de quatro
    li a0, 83
    addi t0, zero, 2
    ecall
fim:
    ret