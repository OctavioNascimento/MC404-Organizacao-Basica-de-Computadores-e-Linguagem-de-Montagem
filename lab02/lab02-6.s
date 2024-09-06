main:
    # Le um numero do teclado
    addi t0, zero, 4
    ecall

    # Subtrai 10 do numero lido 
    addi a0, a0, -10
    # Salva o valor de a0 em s0
    add s0, zero, a0

    # Verifica se s0 ficou negativo, se ficou, pula para o printneg
    BLT s0, zero, printneg

    # Caso o a0 nao seja negativo, printa normalmente
    addi t0, zero, 1
    ecall
    j fim
    # Printa s0 com sinal, caso seja negativo
printneg:
    # Subtrai 10 do numero lido (em modulo)
    sub s0, zero, s0
    # Adiciona o caractere "-" em a0
    addi a0, zero, 45
    # Imprime um caractere
    addi t0, zero, 2
    ecall
    # Salva o valor de s0 em a0
    add a0, zero, s0
    # Imprime um inteiro
    addi t0, zero, 1
    ecall
fim:
    ret