.data
magic: .word 1325
guess: .word 0
frase1: .asciiz "Enter your guess: "
frase2: .asciiz "RIGHT!"
frase3: .asciiz " is the magic number.\n"
frase4: .asciiz "wrong..."
frase5: .asciiz "too high.\n"
frase6: .asciiz "too low.\n"
.text
#faccio le lw

lw $s0, magic
lw $s1, guess
#inizio for
li $t0, 0
loop:
	bgt $t0, 10, exit
	#se t0 non e maggiore di 10
	beq $s1,$s0, exit
	#se s1 non e uguale a s0
	#inizio prima frase 
	la $a0, frase1
	li $v0,4
	syscall
	#input
	li $v0,5
	syscall
	move $s1,$v0
	#primo if
	bne $s1,$s0,else1
	#se sono uguali
	#stampa a video
	la $a0, frase2
	li $v0,4
	syscall 
	#stampa a video variabile
	move $a0,$s0
	li $v0, 1
	syscall 
	#stampa a video
	la $a0, frase3
	li $v0,4
	syscall 
	j fineloop
	else1:
		#se non sono uguali
		#stampa a video
		la $a0, frase4
		li $v0,4
		syscall 
		blt $s1,$s0,else2
		la $a0, frase5
		li $v0,4
		syscall 
		j fineloop
		else2:
			la $a0, frase6
			li $v0,4
			syscall
	#fine ciclo
	fineloop:
	addi $t0,$t0,1
	j loop

exit:
li $v0,10
syscall 
