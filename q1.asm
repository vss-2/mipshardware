.data

x: .word 7	             #Atribuindo valores às variáveis
y: .word 11	
z: .word 0	

.text 		               #Representação simbólica dos "imports" ou "includes"
	.globl main
	
	main: lw $t0,x 	       #Carrega os valores em seus respectivos registradores
		lw $t1,y
		lw $t2,z
		bgt $t0, $t1, True	 #Branch if Greater Than, é basicamente um IF
                                                  #     de maior que 
		add $t2, $t1, $zero	 #Já é o else da condiciona

		j Fim			           #Pulo incondicional, simplesmente avança o programa
		
	True:				           #Se a condicional acima for verdadeira, pule para cá
		srl $t2, $t1, 2		   #Comando de shift right
	Fim:
		sw $t2, z		#Store word, armazena o valor de t2 em z
    
    
    # Codifique um programa correspondente ao pseudocodigo abaixo para Assembly MIPS
    # int x = 7;
    # int y = 11;
    # int z = 0;
    # if (x > y)
    #     z = y >> 2
    # else 
    #     z = y;
