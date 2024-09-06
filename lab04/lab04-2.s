main:
    # Recebe um char maiusculo
    li t0, 5
    ecall
    # Registra em s0
    mv s0, a0
    # Converte o char para minusculo
    ORi s0, s0, 32
    # Printa
    mv a0, s0
    li t0, 2
    ecall
    ret