Main:
    # Aloca memoria e chama a funcao
    addi sp, sp, -20
    sw s0, sp, 16
    sw ra, sp, 0 # salva o endereco de retorno

    call TamanhoString

    lw ra, sp, 0
    lw s0, sp, 16
    addi sp, sp, 20

    ret

strlen: # int strlen(char *s)




    fim:
        ret

TamanhoString: # int TamanhoString()
    # salva o endereco de retorno
    addi sp, sp, -4
    sw ra, sp, 0

    # recebe e aloca o conteudo da string
    li t0, 2
    ecall
    mv s0, a0

    # aloca a string na memoria
    addi sp, sp, -20
    sw s0, sp, 0

    # recebe o tamanho da string
    call strlen

    addi s0, sp, 20
    lw ra, sp, 0
    addi sp, sp, 4
    fim:
        ret