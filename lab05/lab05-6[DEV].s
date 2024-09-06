# declaração do vetor de pontos com 5 posições de 2 inteiros cada
.data
pontos: 
.word 0,0
.word 5,3
.word 10,6
.word 15,9
.word 20,12

# função main
.text
main:
  la a0, pontos
  lw s0, 0(a0)

  call percorre
# copia o primeiro ponto para os registradores de ponto superior direito
percorre:
  # recebe X
  mv s1, s0
  # recebe Y
  addi s1, s1, 4
  mv s2, s1
# loop para percorrer os demais pontos do vetor
loop:
  # compara a coordenada x do ponto atual com a coordenada x do ponto superior direito

  # compara a coordenada y do ponto atual com a coordenada y do ponto superior direito

# imprime o ponto superior direito na tela
imprime:


fim:
  # Encerra o programa
  li a0, 10
  ecall          
  ret