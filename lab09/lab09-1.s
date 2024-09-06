# ler a string, converter pra numero, multiplicar por 10 pra respeitar a casa decimal, somar
.text
main:
    call LeNumero
LeNumero:
    li t0, 1
    li t1, 2
    li t2, 31
    # le do teclado
    li a0, 0x130
    ecall
    verifica:
        li a0, 0x131
        ecall
        beq a0, t0, verifica
        mv s1, a1
        sw s1, 0(s0)
        addi s0, s0, 4
        lw s1, 0(s0)
        addi t2, t2, -1
        bne t2, zero, verifica
fim:
    # Encerra o programa
    li a0, 10
    ecall