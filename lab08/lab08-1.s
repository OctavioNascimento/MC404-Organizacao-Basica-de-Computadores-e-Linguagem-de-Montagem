.data

  str1: .string "Teste de string"
  str2: .space 20
  str3: .string "Hello World"

.text
main:
  li a0, 4
  la a1, str1
  ecall          # Imprime string str1

  li a0, 11
  li a1, 13
  ecall          # Imprime caracter de nova linha (\n)

  la s0, str2
  li s1, 20
  li s3, 65
loop:
  sb s3, 0(s0)
  addi s0, s0, 1
  addi s1, s1, -1
  bne  s1, zero, loop

  li a0, 4      
  la a1, str2
  ecall          # Imprime string str2: O que vai ser impresso?

  li a0, 11
  li a1, 13
  ecall          # Imprime caracter de nova linha (\n)

  li a0, 4
  la a1, str2
  sb zero, 19(a1)
  ecall          # Imprime string str2: O que vai ser impresso?

  li a0, 11
  li a1, 13
  ecall          # Imprime caracter de nova linha (\n)

  li a0, 4
  la a1, str3
  ecall          # Imprime string str3

  li a0, 11
  li a1, 13
  ecall          # Imprime caracter de nova linha (\n)

  li a0, 10
  ecall          # Encerra o programa
  ret
