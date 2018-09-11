.data
	ArrayA:	.word 1,2,3,4,5,6,7,8,9
	ArrayB:	.space 100 
	divs: .word
    contador: .word 0
	
.globl main

main:

	lw $t0, ArrayA	 #Array de entrada
	lw $t1, ArrayB   #Array de saida
	lw $t2, divs	 #Resultado da divisao
	lw $t3, contador #Percorre o ArrayA
	
Laco:
				#Varios branchs se nao for primo, se for salva no ArrayB
	rem  $t2, $t0, 2
	beq  $t2, 0, naoPrimo
	rem  $t2, $t0, 3
	beq  $t2, 0, naoPrimo
	rem  $t2, $t0, 5
	beq  $t2, 0, naoPrimo
	rem  $t2, $t0, 7
	beq  $t2, 0, naoPrimo
	
	j Primo

naoPrimo:
	add $t3, $t3, 4
	j Laco

Primo:
	sw $t1, ArrayB($t3)
	j Laco
	
fimLaco:

