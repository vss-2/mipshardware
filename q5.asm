.data
	ArrayA:	.word 3, 2, 3, 4, 5, 6, 7, 8, 9
	ArrayB:	.word 0, 0, 0, 0, 0, 0, 0, 0, 0 
	  rems: .word 0
      contador: .word 0
	
.globl main

.text 
main:

	lw $t0, ArrayA	 #Array de entrada
	lw $t1, ArrayB   #Array de saida
	lw $t2, rems	 #Resultado da remisao
	lw $t3, contador #Percorre o ArrayA
	
Laco:
	#Efetua varias divisoes, faz ands, se todas tiverem resto 1, é primo, 
	#senão, and de algum 0 é sempre 0, e não é primo
	rem  $a0, $t0, 2
	rem  $a1, $t0, 3
	rem  $a2, $t0, 5
	rem  $a3, $t0, 7

	and $t4, $a0, $a1
	and $t5, $a2, $a3
	and $t6, $t4, $t5
	beq $t6, 0, naoPrimo
	beq $t6, 1, Primo


naoPrimo:
	add $t3, $t3, 4
	j Laco

Primo:
	sw $t1, ArrayB($t0)
	j Laco
	
fimLaco:
