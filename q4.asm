.data

   ArrayA:  .word 2,4,6,8,10,12 
   ArrayB:  .word 1,3,5,7,9,11  
       AB:  .word 0
   contif:  .word 1
  adressA:  .word 4
  adressB:  .word 0

.text
    
    .globl main

main:

    lw $t0, ArrayA
    lw $t1, ArrayB
    lw $t2, AB
    lw $t3, contif
    lw $t4, adressA
    lw $t5, adressB
	
	for:
	bgt $t3, 10, fimlaco
	
	lw $a0, ArrayA($t4)
	lw $a1, ArrayB($t5)
	add $t2, $a0, $a1
	sw $t2, ArrayA($t5)
	add $t4, $t4, 4
	add $t5, $t5, 4
	
	add $t3, $t3, 1	

    j for    #Volte para o loop
    
    fimlaco:
