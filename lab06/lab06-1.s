.data
vetor: 
    .word 1
    .word 2
    .word 3
    .word 4
    .word 5
.text

Main:
    # Diz o tamanho do vetor
    li a0, 5
    # Carrega o vetor
    lui a1, %hi(vetor)
    addi a1, s1, %lo(vetor)
    # Define o multiplicador 
    li a2, 10
    # Chama a funcao
    addi sp, sp, -4
    sw ra, sp,0

    call MultiplicaVetor

    lw ra, sp, 0
    addi sp, sp, 4

    ret
Multiplica:
    # Sem implementacao
    ret

MultiplicaVetor: #void MultiplicaVetor(unsigned N, unsigned *v, unsigned fator)
    # Movimenta o apontador da pilha 4 posicoes para baixo (16 bytes) e guarda 4 registradores na pilha
    addi sp, sp, -16 # Move o sp 4 posicoes pra baixo
    sw   s0, sp, 12 # Armazena o tamanho do vetor
    sw   s1, sp, 8 # Armazena o vetor
    sw   s2, sp, 4 # Armazena o multiplicador
    sw   ra, sp, 0 # Armazena o conteudo de ra na posicao sp da memoria

    mv   s0, a0 # Copia o valor de a0 para s0
    mv   s1, a1 # Copia o valor de a1 para s1
    mv   s2, a2 # Copia o valor de a2 para s2
    mv   s3, a3 # Preserva o valor de a3

    for:
        beq  s0, zero, fim # Valida Loop
        lw   a0, s1, 0 # Carrega o conteudo da posicao s1 (memoria) em a0
        mv   a1, s2 # Preserva o valor de s2 em a1
        call Multiplica # Chama a funcao multiplica
        sw   a0, s1, 0 # Armazena o conteudo recebido da funcao em a0 na posicao s1 da memoria
        addi s1, s1, 4 # Le o proximo chunk da memoria
        addi s0, s0, -1 # Variavel contadora
        j    for # Loop

    fim:
        # Movimenta o apontador da pilha 4 posicoes para cima (16 bytes) e recupera 4 registradores da pilha
        lw   ra, sp, 0 # Carrega o conteudo de sp em ra
        lw   s2, sp, 4 # Carrega o conteudo de sp+4 em s2
        lw   s1, sp, 8 # Carrega o conteudo de sp+8 em s1
        lw   s0, sp, 12 # Carrega o conteudo de sp+12 em s0
        addi sp, sp, 16 # Move o sp 4 posicoes pra cima
        ret