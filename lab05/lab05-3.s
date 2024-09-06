.data
vetor0: 
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
.rodata
vetor1: 
    .word 1
    .word 2
    .word 3
    .word 4
    .word 5
vetor2: 
    .word 6
    .word 7
    .word 8
    .word 9
    .word 10
.text
main:
    # Carrega os bits mais significativos
    lui s0, %hi(vetor0)
    # Carrega os bits menos significativos
    addi s0, s0, %lo(vetor0)
    
    # Carrega os bits mais significativos
    lui s1, %hi(vetor1)
    # Carrega os bits menos significativos
    addi s1, s1, %lo(vetor1)

    # Carrega os bits mais significativos
    lui s2, %hi(vetor2)
    # Carrega os bits menos significativos
    addi s2, s2, %lo(vetor2)

    # Loop for para somar elementos de s1 e s2 e armazenar em s0
    li s3, 5
    li s4, 1
loop:
    # Carrega da memoria e soma
    lw t1, s1, 0
    lw t2, s2, 0
    add t0, t1, t2
    # Escreve o resultado no vetor
    sw t0, s0, 0
    # Pula pro prox endereco de memoria
    addi s0, s0, 4
    addi s1, s1, 4
    addi s2, s2, 4
    # Verifica o loop
    sub s3, s3, s4
    BNE s3, zero, loop
    ret