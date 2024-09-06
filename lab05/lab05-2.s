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

    # Armazena da memoria para o registrador depois soma 1 e devolve ao endereco de memoria
    lw s1, s0, 0
    addi s1, s1, 1
    sw s1, s0, 0

    # Armazena da memoria para o registrador depois soma 1 e devolve ao endereco de memoria
    lw s1, s0, 4
    addi s1, s1, 1
    sw s1, s0, 4

    # Armazena da memoria para o registrador depois soma 1 e devolve ao endereco de memoria
    lw s1, s0, 8
    addi s1, s1, 1
    sw s1, s0, 8

    ret