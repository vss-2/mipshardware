#Algoritmo fibonacci
#entrada int n
#saida soma fib(n)

#Metodo
#Caso base, se n <= 1, retorne 1
#Recursao: fib(n-1)+fib(n-2)

.data

 n: .word 10

.globl main

.text 

main: 

	lw 	$t0, n
	bgt 	$t0, 1, recursao #Se n for maior que um, faça recursao
	move    $v0, $a0
	j 	fim	#Senao acabou

recursao:

	sub	$sp, $sp, 12 #Armazenamento em pilha, de tamanho 3
	sw	$ra, 0($sp) #Armazenando n
	sw	$a0, 4($sp) #Armazena n-1
	add     $a0, $a0, -1
	jal 	main
	lw	$a0, 4($sp) #Pega o valor de n
	sw	$v0, 8($sp) #Guarda resultado de fib(n-1)
	add	$a0, $a0, -2
	jal 	main
	
	lw	$t0, 8($sp) #Resgata valor fib(n-1)
	add	$v0, $t0, $v0 #Soma dos fibs
	lw      $ra, 0($sp)
	add	$sp, $sp, 12 #Limpa a fila
	jr	$ra

fim:
