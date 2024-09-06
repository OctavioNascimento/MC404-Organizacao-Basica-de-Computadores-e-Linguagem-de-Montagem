# 241327 - Octavio Augusto Barquilia do Nascimento

#addi
def addi(r1,r2,r3):
    opcode = "0010011"
    funct3 = "000"
    rd = (bin(r1)[2::]).zfill(5)
    rs1 = (bin(r2)[2::]).zfill(5)
    imm = (bin(r3)[2::]).zfill(12)

    binario = int(imm+rs1+funct3+rd+opcode,2)
    hexa = str(hex(binario)[2::]).upper().zfill(8)
    return  print("0x"+hexa)

#slli
def slli(r1,r2,r3):
    opcode = "0010011"
    funct3 = "001"
    funct7 = "0000000"
    rd = (bin(r1)[2::]).zfill(5)
    rs1 = (bin(r2)[2::]).zfill(5)
    shamt = (bin(r3)[2::]).zfill(5)

    binario = int(funct7+shamt+rs1+funct3+rd+opcode,2)
    hexa = str(hex(binario)[2::]).upper().zfill(8)
    return  print("0x"+hexa)

#xor
def xor(r1,r2,r3):
    opcode = "0110011"
    funct3 = "100"
    funct7 = "0000000"
    rd = (bin(r1)[2::]).zfill(5)
    rs1 = (bin(r2)[2::]).zfill(5)
    rs2 = (bin(r3)[2::]).zfill(5)

    binario = int(funct7+rs2+rs1+funct3+rd+opcode,2)
    hexa = str(hex(binario)[2::]).upper().zfill(8)
    return  print("0x"+hexa)

#lw
def lw(r1,r2,r3):
    opcode = "0000011"
    funct3 = "010"
    rd = (bin(r1)[2::]).zfill(5)
    rs1 = (bin(r2)[2::]).zfill(5)
    imm = (bin(r3)[2::]).zfill(12)
    binario = int(imm+rs1+funct3+rd+opcode,2)
    hexa = str(hex(binario)[2::]).upper().zfill(8)
    return  print("0x"+hexa)

#sw
def sw(r1,r2,r3):
    opcode = "0100011"
    funct3 = "010"
    imm = ((bin(r3)[2::]).zfill(12))[::-1]
    rs2 = (bin(r1)[2::]).zfill(5)
    rs1 = (bin(r2)[2::]).zfill(5)
    imm1 = (imm[5:11-1]).zfill(7)
    imm2 = (imm[0:4:-1]).zfill(5)
    binario = int(imm1+rs2+rs1+funct3+imm2+opcode,2)
    hexa = str(hex(binario)[2::]).upper().zfill(8)
    return  print("0x"+hexa)

#ret
def ret():
    opcode = "1101111"
    rd = "00001"
    imm = "000000000000000000000"

    binario = int(imm+rd+opcode,2)
    hexa = str(hex(binario)[2::]).zfill(8)
    return print("0x"+hexa)

#lui
def lui(r1,r2):
    opcode = "0110111"
    rd = (bin(r1)[2::]).zfill(5)
    imm = (bin(r2)[2::]).zfill(20)

    binario = int(imm+rd+opcode,2)
    hexa = str(hex(binario)[2::]).upper().zfill(8)
    return print("0x"+hexa)

#beq REVIEW
def beq(r1,r2,r3):
    opcode = "1100011"
    funct3 = "000"
    rs1 = (bin(r1)[2::]).zfill(5)
    rs2 = (bin(r2)[2::]).zfill(5)
    imm = ((bin(r3-1000)[2::]).zfill(13))[::-1]

    imm1 = imm[12]
    imm2 = imm[5:10:-1]
    imm3 = imm[1:4:-1]
    imm4 = imm[11]

    binario = int(imm1+imm2+rs2+rs1+funct3+imm3+imm4+opcode,2)
    hexa = str(hex(binario)[2::]).upper().zfill(8)
    return print("0x"+hexa)

#mul
def mul(r1,r2,r3):
    opcode = "0110011"
    funct3 = "000"
    funct7 = "0000001"
    rd = (bin(r1)[2::]).zfill(5)
    rs1 = (bin(r2)[2::]).zfill(5)
    rs2 = (bin(r3)[2::]).zfill(5)

    binario = int(funct7+rs2+rs1+funct3+rd+opcode,2)
    hexa = str(hex(binario)[2::]).upper().zfill(8)
    return  print("0x"+hexa)

#call
def call(r1):
    opcode = "1101111"
    rd = "00001"
    imm = ((bin(r1-1000)[2::]).zfill(21))[::-1]
    imm1 = imm[20]
    imm2 = imm[1:10]
    imm3 = imm[11]
    imm4 = imm[12:19]

    binario = int(imm1+imm2+imm3+imm4+rd+opcode,2)
    hexa = str(hex(binario)[2::]).upper().zfill(8)
    return print("0x"+hexa)

#main
def main():
    # lista de registradores
    registradores = ['zero','ra','sp','gp','tp','t0','t1','t2','s0','s1','a0','a1','a2','a3','a4','a5','a6','a7','s2','s3','s4','s5','s6','s7','s8','s9','s10','s11','t3','t4','t5','t6']

    # input
    entrada = list(map(str, input().split()))

    # verifica se há maiusculos
    encontrou_maiusculo = False
    for elemento in entrada:
        if any(caractere.isupper() for caractere in elemento):
            encontrou_maiusculo = True
            break
    if encontrou_maiusculo:
        print("A entrada contém elementos que não estão em minúsculas. O programa será finalizado.")
        exit()

    # atribui os valores da entrada aos "registradores"
    inst = entrada[0]

    if (len(entrada)==2):
        r1 = int(entrada[1])

    elif (len(entrada)==3):
        if (inst[-1] == "i"):
            r1 = registradores.index((entrada[1])[:-1])
            r2 = int(entrada[2])

        elif (inst == "lw" or inst == "sw"):
            # Separa o imediato do registrador
            parentese_pos = (entrada[2]).index('(')
            imediato = (entrada[2])[:parentese_pos]
            registrador = (entrada[2])[parentese_pos + 1:-1]

            r1 = registradores.index((entrada[1])[:-1])
            r2 = registradores.index(registrador)
            r3 = int(imediato)
        else:
            r1 = registradores.index((entrada[1])[:-1])
            r2 = registradores.index(entrada[2])

    elif(len(entrada)==4):
        if (inst[-1] == "i" or inst == "beq"):
            r1 = registradores.index((entrada[1])[:-1])
            r2 = registradores.index((entrada[2])[:-1])
            r3 = int(entrada[3])
        else:
            r1 = registradores.index((entrada[1])[:-1])
            r2 = registradores.index((entrada[2])[:-1])
            r3 = registradores.index(entrada[3])

    else:
        inst = entrada[0]
    
    # chama instrução
    if (inst == "addi"):
        addi(r1,r2,r3)

    elif (inst =="ret"):
        ret()
    
    elif (inst =="lw"):
        lw(r1,r2,r3)

    elif (inst =="sw"):
        sw(r1,r2,r3)

    elif (inst =="mul"):
        mul(r1,r2,r3)

    elif (inst =="xor"):
        xor(r1,r2,r3)

    elif (inst =="slli"):
        slli(r1,r2,r3)

    elif (inst =="lui"):
        lui(r1,r2)

    elif (inst =="beq"):
        beq(r1,r2,r3)
    
    elif (inst =="call"):
        call(r1)

    else: print("A entrada contém elementos não reconhecidos. O programa será finalizado.")

main()