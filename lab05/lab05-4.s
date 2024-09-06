.data
matriz: .word 0,0,0,0,0,0
.text
main:
    la a0, matriz
    # linha
    li a1, 0
    # coluna
    li a2, 0

    call matrix
matrix:
    # resultado das somas
    li t2, 0
    # variavel contadora
    li t3, 3
    # valor da matriz
    lw s0, 0(a0)
    loop:
    # altera os valores da matriz
    add t2, a1, a2
    add s0, t2, zero
    # manutencao do loop
    sw s0, 0(a0)
    addi a0, a0, 4
    addi a2, a2, 1
    addi t3, t3, -1
    bne t3, zero, loop

    # indices
    li a1, 1
    li a2, 0
    # variavel contadora
    li t3, 3
    loop2:
    # altera os valores da matriz
    add t2, a1, a2
    add s0, t2, zero
    # manutencao do loop
    sw s0, 0(a0)
    addi a0, a0, 4
    addi a2, a2, 1
    addi t3, t3, -1
    bne t3, zero, loop2

fim:
    # Encerra o programa
    li a0, 10
    ecall          
    ret