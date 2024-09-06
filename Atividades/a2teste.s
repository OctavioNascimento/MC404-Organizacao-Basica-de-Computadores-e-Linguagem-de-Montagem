.text
main:
    # addi
    addi s0, s1, 20

    # slli
    slli s0, t1, 10

    # xor
    xor t1, s0, s1

    # lw
    lw a0, 0(s0)

    # sw
    sw a0, 8(s0)

    # lui
    lui a1, 1200

    # beq
    beq s0, s1, loop

    # mul
    mul t0, t1, t2

    # ret
    ret

    # call
    call loop

loop:
    # fim
    li a0, 10
    ecall


