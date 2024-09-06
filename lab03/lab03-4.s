main:
    # Le um numero do teclado
    li t0, 4
    ecall
    # Codifica ou decodifica o numero lido
    li s0, 37
    XOR s1, a0, s0
    # Printa o numero codificado ou decodificado
    mv a0, s1
    li t0, 1
    ecall