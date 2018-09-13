.data
	valor: .word #Insira aqui o valor de fib que voce quer
.text

.globl main
main:

	li $v0, 4
	la $a0, valor	     #$a0 = armazena o falor a ser fibaddo
	addi $t1,$zero, 1    #$t1 = 1

	li $v0,5

	add $a0,$v0,$zero #Incrementa 4

	jal fib #Inicia a funcao fibonacci

	add $a0,$v0,$zero
	li $v0,1

	li $v0,10

recursaofib:

	addi $sp,$sp,-12 #Salva na pilha os valores
	sw $ra,0($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)

	add $s0,$a0,$zero


	beq $s0,$zero, casozero	#Caso: igual a zero
	beq $s0,$t1, casoum     #Caso: iugal a um

	addi $a0,$s0,-1

	jal recursaofib

	add $s1,$zero,$v0     #$s1 = fib(n-1)

	addi $a0,$s0,-2

	jal recursaofib       #$v0 = fib(n-2)

	add $v0,$v0,$s1       #$v0 = fib(n-2)+$s1
	
pilhagem:

	lw $ra,0($sp)         #Le os valores armazenados na pilha
	lw $s0,4($sp)
	lw $s1,8($sp)
	addi $sp,$sp,12       #Avança o ponteiro da pilha de volta ao inicio
	jr $ra

casoum:
 	li $v0, 1
 	j pilhagem
casozero :
        li $v0, 0
 	j pilhagem
