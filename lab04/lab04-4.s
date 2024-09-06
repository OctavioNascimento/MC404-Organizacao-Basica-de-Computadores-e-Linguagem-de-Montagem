main:
    # Recebe um char
    li t0, 5
    ecall
    # Registra em s0
    mv s0, a0

    # Verifica se eh doidera pt1
    li s1, 65
    BLT s0, s1, doidera
    # Verifica se eh doidera pt2
    li s1, 91
    BGE s0, s1, meiuca
verifica:
    # Verifica se eh maiusculo ou minusculo
    li s1, 1
    SLLi s1, s1, 5
    AND s1, s1, s0
    BNE s1, zero, minusculo
    # Converte o char para minusculo
    ORi s0, s0, 32
    # Printa
    mv a0, s0
    li t0, 2
    ecall
    j fim
minusculo:
    # Converte o char para maiusculo
    ANDi s0, s0, 223
    # Printa
    mv a0, s0
    li t0, 2
    ecall
    j fim
meiuca:
    # Verifica se eh doidera pt3
    li s1, 97
    BLT s0, s1, doidera
    # Verifica se eh doidera pt4
    li s1, 123
    BLT s0, s1, verifica
doidera:
    # Printa
    mv a0, s0
    li t0, 2
    ecall
fim:
    ret