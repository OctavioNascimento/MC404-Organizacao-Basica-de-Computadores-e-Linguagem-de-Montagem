main:
    # Recebe o decimal do teclado
    li t0, 4
    ecall
    # Salva em s3
    mv s3, a0
    # Variavel de comparacao
    li s1, 1
    # Variavel contadora
    li s0, 31
    # Variavel comparadora
    SLL s4, s1, s0
    addi s0, s0, 1
loop:
    # Verifica se finalizou o loop
    BEQ s0, zero, fim
    # Valida se o bit em questao eh 0 ou 1
    AND s2, s3, s4
    BGE s2, s1, print1
    # Print 0
    li a0, 48
    li t0, 2
    ecall
    # Reduz 1 da contadora e pula um bit pra direita da comparadora
    SUB s0, s0, s1
    SRL s4, s4, s1
    j loop
print1:
    # Print 1
    li a0, 49
    li t0, 2
    ecall
    # Reduz 1 da contadora e pula um bit pra direita da comparadora
    SUB s0, s0, s1
    SRL s4, s4, s1
    j loop
fim:
    ret