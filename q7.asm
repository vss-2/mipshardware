.data
	valor: .word 13
.text

.globl main

main:

    lw $v0, valor
    add $a0, $v0, $zero #RESPOSTA: sera salva em $a0

    jal recfib #inicia a recursao
    add $a0, $v0, $zero

    li $v0, 10 #executa a saida do programa
    syscall

recfib:

    addi $sp, $sp, -12     #salva informacoes na pilha
    sw $ra, 0($sp)
    sw $s0, 4($sp)
    sw $s1, 8($sp)

    add $s0, $a0, $zero

    addi $t1, $zero, 1
    beq $s0, $zero, casozero
    beq $s0, $t1, casoum

    addi $a0,$s0,-1

    jal recfib

    add $s1, $zero, $v0     #s1 = fibonacci(n-1)

    addi $a0, $s0, -2

    jal recfib              #v0 = fibonacci(n-2)

    add $v0, $v0, $s1       #v0 = fibonacci(n-2) + $s1

pilhagem:

    lw $ra, 0($sp)         #le os registradores da pilha
    lw $s0, 4($sp)
    lw $s1, 8($sp)
    addi $sp, $sp, 12       #volta o apontador da pilha
    jr $ra

casoum:

    li $v0, 1
    j pilhagem
casozero:     

    li $v0, 0
    j pilhagem
