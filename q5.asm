.data
	ArrayA:	.word 99, 2, 3, 4, 5, 6, 7, 8, 9
	ArrayB:	.word 0, 0, 0, 0, 0, 0, 0, 0, 0 
	  rems: .word 0
      contador: .word 0
   percorredor: .word 0
      armazena: .word 0
	
.globl main
.text main:

	lw $t0, ArrayA	 #Array de entrada
	lw $t1, ArrayB   #Array de saida
	lw $t2, rems	 #Resultado da remisao
	lw $t3, contador #Percorre o ArrayB
	lw $t4, percorredor #Percorre o ArrayA
	lw $t5, armazena #Armazena o valor de ArrayA
	
Laco:
	#Efetua varias divisoes, faz ands, se todas tiverem resto 1, é primo, 
	#senão, and de algum 0 é sempre 0, e não é primo
	
	lw $t5, ArrayA($t4)
	
	rem  $a0, $t0, 2
	rem  $a1, $t0, 3
	rem  $a2, $t0, 5
	rem  $a3, $t0, 7
	add  $t4, $t4, 4

	beq $a0, 0, naoPrimo
	beq $a1, 0, naoPrimo
	beq $a2, 0, naoPrimo
	beq $a3, 0, naoPrimo

	bne $a0, 0, Primo
	bne $a1, 0, Primo
	bne $a2, 0, Primo
	bne $a3, 0, Primo

naoPrimo:
	add $t3, $t3, 4
	j Laco

Primo:
	sw $t1, ArrayB($t3)
	add $t3, $t3, 4
	j Laco
	
fimLaco:
