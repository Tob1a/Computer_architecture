.data 
i: .word 3
j: .word 6

.text
lw $s0,i
lw $s1,j
bge $s0,$s1,esciif #salta se i>= j cioe sulla condizione falsa
	li $s0,1
esciif:	
move $a0,$s0
li $v0,1
syscall 
li $v0,10
syscall
