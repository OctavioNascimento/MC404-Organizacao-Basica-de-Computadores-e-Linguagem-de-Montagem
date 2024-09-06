.data
vetor: 
    .word 10
    .word 20
    .word 30
.text
main:
    # Carrega os bits mais significativos
    lui s0, %hi(vetor)
    # Carrega os bits menos significativos
    addi s0, s0, %lo(vetor)
    # Armazena da memoria para o registrador
    lw t0, s0, 0
    # Adiciona na soma
    add s1, t0, zero
    # Armazena da memoria para o registrador
    lw t0, s0, 4
    # Adiciona na soma
    add s1, s1, t0
    # Armazena da memoria para o registrador
    lw t0, s0, 8
    # Adiciona na soma
    add s1, s1, t0
    # Printa a soma
    mv a0, s1
    li t0, 1
    ecall
    ret