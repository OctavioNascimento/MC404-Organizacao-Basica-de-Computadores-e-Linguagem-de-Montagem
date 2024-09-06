main:
  # Le um numero do teclado e armazena em a0
  addi t0, zero, 4
  ecall
  # Salva o valor de a0 em s0
  add s0, zero, a0
  # Se o valor lido for igual a zero, finaliza o programa
  beq s0, zero, fim

  # Le um numero do teclado e armazena em a0
  addi t0, zero, 4
  ecall
  # Salva o valor de a0 em s1
  add s1, zero, a0
  # Se o valor lido for igual a zero, finaliza o programa
  beq s1, zero, fim

  # Valida o maior valor
  BLTU s1, s0, prints0
  # Caso s0 nao seja o maior valor, imprime s1
  add a0, zero, s1
  addi t0, zero, 1
  ecall

  # Variavel contadora
  addi s2, s2, 1
  # Variavel fixa com o limite de execucao (10)
  addi s3, zero, 10
  # Se o valor da variavel contadora for igual a 10, finaliza o programa
  beq s2, s3, fim

  # Volta para o inicio
  j main

prints0:# Imprime o s0 na tela
  add a0, zero, s0
  addi t0, zero, 1
  ecall
  j main

  # Finaliza o programa
fim:
  ret