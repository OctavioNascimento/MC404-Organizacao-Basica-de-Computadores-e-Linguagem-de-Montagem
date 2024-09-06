.data
coord: .word 0x00010003,0x00020002,0x00030001,0x00030003,0x00010002,0x00020001,0x00040004,0x00050005,0x00060006,0x00070007,0x00080008,0x00080006,0x00080005,0x00080004,0x00080003,0x00070002,0x00060008,0x00050008,0x00040008,0x00030007,0x00020006,0x00010007,0x00060001

.text
main:
    # pinta o background de vermelho
    li a0, 0x101
    li a1, 0xFF0000
    ecall

    call communism
    j fim

communism:
    li t0, 23
    la t1, coord
    for:
        lw t2, 0(t1)
        li a0, 0x100
        mv a1, t2
        li a2, 0xFFD700
        ecall
        addi t0, t0, -1
        addi t1, t1, 4
        bne t0, zero, for
    ret

fim:
    li a0, 10
    ecall