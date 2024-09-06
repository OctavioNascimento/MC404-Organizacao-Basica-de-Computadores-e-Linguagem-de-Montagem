main:
    # Le um numero do teclado enquanto for diferente de 0
    li t0, 4
    ecall
    mv s0, a0
    # Verifica se s0 eh negativo, se for, pula para o printneg
    BLT s0, zero, printneg
    mv a0, s0
    li t0, 1
    ecall
    j fim
printneg:
    sub s1, zero, s0
    # Adiciona o caractere "-" em a0
    li a0, 45
    # Imprime "-"
    li t0, 2
    ecall
    # Salva o valor de s1 em a0
    mv a0, s1
    # Imprime s1
    li t0, 1
    ecall
fim:
    ret