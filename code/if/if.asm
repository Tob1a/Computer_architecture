.data 
i: .word 3
j: .word 6
k: .word 0

.text
lw $t0,i
lw $t1,j
lw $s0,k

bge $t1,$t2,Else
	li $s0,0
	j Exit
Else:	
	li $s0,1
Exit:
li $v0,1
move $a0,$s0
syscall 
li $v0,10
syscall