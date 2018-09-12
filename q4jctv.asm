.data

a: .word 0,1,2,3,4,5,6,7,8,9 # $a0
b: .word 9,8,7,6,5,4,3,2,1,0 # $a1
i: .word 9 #t3
# 8,15,21,26,30,33,35,36,36
.text
	 .globl main

main:


la $a0,a # t0 apontando para a0 A
la $a1,b # t1 apontando para a1  B

lw $t1,($a0) # Carregando base do array A



lw $t3,i ##carrega o dado de i(memória) para t3(registrador)


add $a1,$a1,4 #Adicionando 32bits(4 bytes) no endereço de t1 b[1]
lw $t2,($a1) # b[1] carregando o valor de  b[1] no registrador t2

volta:
bne $t3,$zero,loop # se i !=0 , então vá para a label loop
beq $t3,$zero,fim # se i==0, entao termine

loop:
                      
add $t4,$t1,$t2 ## t4 =  A[0]+B[1]=8   
add $a0,$a0,4 #adicionando 32bits (4 bytes) no endereço de a0, A[1]
sw $t4,($a0) # guardando valor de t4 em a0 A[1]
addi $t3,$t3,-1 #decrementando o i
add $a1,$a1,4 #adicionando 32bits (4 bytes) no endereço de a1, B[2]
lw $t2,($a1) # Carregando o valor de a1 para t2
lw $t1,($a0)# Carregando o valor de a0 para t1


j volta

fim:
