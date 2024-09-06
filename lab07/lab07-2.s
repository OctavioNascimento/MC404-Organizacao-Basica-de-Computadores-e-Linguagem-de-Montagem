.data
vetor: .word 1,2,3,4,5

.text
main:
    # Diz o tamanho do vetor
    li a0, 5
    # Carrega o vetor
    la a1, vetor
    # Chama a funcao
    call SomaVetor
    # finaliza o programa
    li a0, 10
    ecall

SomaVetor: # int SomaVetor(unsigned N, unsigned *v)
    for:
        # a0 eh o numero de iteracoes
        # a1 eh o vetor
        # t0 eh o aditivo
        li t0, 10
        beq  a0, zero, fim # Valida Loop
        lw t1, 0(a1)
        add t1, t1, t0
        sw t1, 0(a1)
        addi a0, a0, -1
        addi a1, a1, 4
        j for # Loop

    fim:
        ret