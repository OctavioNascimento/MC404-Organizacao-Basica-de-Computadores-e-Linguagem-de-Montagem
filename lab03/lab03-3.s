main:
    # Le um numero do teclado enquanto for diferente de 0
    li t0, 4
    ecall
    BEQ a0, zero, print
    mv s0, a0
    # Verifica se eh par
    li s1, 1
    AND s2, s1, s0
    BEQ s2, s1, impar
par:
    add s4, s4, s0
    # Loop
    j main
impar:
    add s3, s3, s0
    # Loop
    j main
print:
    # Subtrai os pares dos impares
    sub s5, s3, s4
    # Verifica se s5 ficou negativo, se ficou, pula para o printneg
    BLT s5, zero, printneg
    mv a0, s5
    li t0, 1
    ecall
    j fim
printneg:
    # Subtrai os pares dos impares (em modulo)
    sub s5, s4, s3
    # Adiciona o caractere "-" em a0
    li a0, 45
    # Imprime "-"
    li t0, 2
    ecall
    # Salva o valor de s5 em a0
    mv a0, s5
    # Imprime s5
    li t0, 1
    ecall
fim:
    ret