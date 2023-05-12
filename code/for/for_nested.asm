.data
frase1: .asciiz ", "
frase2: .asciiz "\n"

.text 
li $t0, 0
loop:
	bgt $t0,2,Exit
	li $t1, 0
	loop2:
		bgt $t1, 4, fineloop
		move $a0,$t0
		li $v0, 1
		syscall 
		la $a0, frase1
		li $v0, 4
		syscall 
		move $a0, $t1
		li $v0, 1
		syscall 
		la $a0, frase2
		li $v0, 4
		syscall 
		add $t1,$t1,1
		j loop2
	fineloop:
	addi $t0,$t0,1
	j loop
Exit:
li $v0, 10
syscall 
	
		