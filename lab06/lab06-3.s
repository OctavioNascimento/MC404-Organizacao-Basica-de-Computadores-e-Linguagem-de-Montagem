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
    # Chama a funcao
    addi sp, sp, -4
    sw ra, sp, 0

    call SomaVetor

    lw ra, sp, 0
    addi sp, sp, 4

    ret

SomaVetor: # int SomaVetor(unsigned N, unsigned *v)
    for:
        # a0 eh o numero de iteracoes
        # a1 eh o vetor
        # t0 eh o aditivo
        li t0, 10
        beq  a0, zero, fim # Valida Loop
        lw t1, a1, 0
        add t1, t1, t0
        sw t1, a1, 0
        addi a0, a0, -1
        addi a1, a1, 4
        j for # Loop

    fim:
        ret