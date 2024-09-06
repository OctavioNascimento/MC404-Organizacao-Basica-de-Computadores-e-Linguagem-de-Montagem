main:
    # Le o segredo do teclado e armazena em s0
    li t0, 4
    ecall
    mv s0, a0
loop:
    # Le um numero do teclado enquanto for diferente de 0
    li t0, 4
    ecall
    BEQ a0, zero, fim
    XOR s1, a0, s0
    mv a0, s1
    li t0, 1
    ecall
    j loop
fim:
    ret
    