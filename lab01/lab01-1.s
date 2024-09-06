main:
  addi t0, zero, 4   # escolhe a operacao de leitura de inteiro (4)
  ecall              # efetua a operacao de leitura de inteiro

  add  s0, zero, a0  # salva o inteiro lido em s0

  addi t0, zero, 4   # escolhe a operacao de leitura de inteiro (4)
  ecall

  add  s1, zero, a0  # salva o inteiro lido em s1

  addi t0, zero, 4   # escolhe a operacao de leitura de inteiro (4)
  ecall

  add  s2, zero, a0  # salva o inteiro lido em s2

  add  s3, s0, s1    # s3 = s0 + s1
  
  sub  a0, s3, s2    # a0 = s3 - s2

  addi t0, zero, 1    # escolhe a operacao de escrita de inteiro (1)
  ecall              # efetua a operacao de escrita de inteiro

  ret