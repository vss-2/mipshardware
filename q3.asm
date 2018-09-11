.data

m : .word 11	#definindo as entradas
n : .word 2

.text
	.globl main
	
	main:
	
	lw $t0, m	#coloco as entradas em registradores
	lw $t1, n
	
	loop:
	
	div $t2, $t0, $t1		#divido m/n
	beq $t2, $zero, fimdoprograma
	addi $t3, $t3, 1 	#conto uma vez no addi
	move $t0, $t2		#transfere o valor do quociente para m
	j loop

	fimdoprograma:
	
