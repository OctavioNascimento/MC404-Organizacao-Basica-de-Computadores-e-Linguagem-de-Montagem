.data
coord: .word 0x00020002,0x00020003,0x00020004,0x00020005,0x00020006,0x00020007,0x00030007,0x00040007,0x00050007,0x00060007,0x00070007,0x00070006,0x00070005,0x00070004,0x00070003,0x00070002,0x00060002,0x00050002,0x00040002,0x00030002
color: .word 0x6A5ACD,0x00FFFF,0x008B8B,0x4B0082,0xFF1493,0xE6E6FA

.text
main:
    # pinta o background de branco
    li a0, 0x101
    li a1, 0x00FFFFFF
    ecall

    li t4, 6
    la a3,color
    for:
        lw t3, 0(a3)
        call quadrado
        addi t4,t4,-1
        addi a3,a3,4
        bne t4,zero,for
    j fim

quadrado:
    li t0, 20
    la t1,coord
    for1:
        lw t2, 0(t1)
        li a0, 0x100
        mv a1, t2
        mv a2, t3
        ecall
        addi t0,t0,-1
        addi t1,t1,4
        bne t0,zero,for1
    ret

fim:
    li a0, 10
    ecall