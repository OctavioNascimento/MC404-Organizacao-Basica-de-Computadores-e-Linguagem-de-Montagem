main:
    # Recebe um char minusculo
    li t0, 5
    ecall
    # Registra em s0
    mv s0, a0
    # Converte o char para maiusculo
    ANDi s0, s0, 223
    # Printa
    mv a0, s0
    li t0, 2
    ecall
    ret