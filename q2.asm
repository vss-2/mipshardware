.data
m : .word 11                        #definindo as entradas
n : .word 2

.text
    .globl main
    
    main:
    
    lw $t0, m                       #coloco as entradas em registradores
    lw $t1, n
    
    loop:
    div $t2, $t0, $t1               #divido m/n
    beq $t2, $zero, fimdoprograma
    addi $t3, $t3, 1                #conto uma vez no addi
    move $t0, $t2                   #transfere o valor do quociente para m
    j loop

    fimdoprograma:
    
    # Dados três valores X, Y, Z, verificar se eles podem ser os comprimentos
    # dos lados de um triângulo. Se eles não formarem um triângulo, escrever o valor
    # 1 no registrador v1($3) caso contrário (formam um triângulo) escrever o
    # valor 1 no registrador (2),(3) ou (4) caso eles formem um triângulo equilátero,
    # isósceles ou escaleno respectivamente. Antes da elaboração do
    # algoritmo, torna-se necessária a revisão de algumas propriedades e definições.
    # Propriedade​ - O comprimento de cada lado de um triângulo é menor do
    # que a soma dos comprimentos dos outros dois lados.
    # Definição 1​ - Chama-se triângulo equilátero aqueles que têm os
    # comprimentos dos três lados iguais,
    # Definição 2​ - Chamam-se triângulos isósceles os que têm os
    # comprimentos de dois lados iguais.
    # Definição 3​ - Chama-se triângulo escaleno aqueles que têm os
    # comprimentos dos três lados diferentes.
