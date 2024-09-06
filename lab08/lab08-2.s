.data
    str1: .space 11
    str2: .string "John 3:16\n"

.text
main:
    la s1, str1
    la s2, str2
    call strcpy

    # Printa
    li a0, 4      
    la a1, str1
    ecall 

    li a0, 4      
    la a1, str2
    ecall 

    j fim
strcpy:
    li, t0, 11
    loop:
        lbu t1, 0(s2)
        sb t1, 0(s1)
        addi t0, t0, -1
        addi s1, s1, 1
        addi s2, s2, 1
        bne t0, zero, loop
    ret

fim:
   # Encerra o programa
    li a0, 10
    ecall
    ret