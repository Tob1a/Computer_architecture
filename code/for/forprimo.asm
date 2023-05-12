.data
z: .word 0
x: .word 0
frase1: .asciiz "Input a number larger than 1: "
primo: .asciiz " is a prime number"
nonprimo: .asciiz " is not a prime number"

.text 
#faccio i lw
lw $s0, z
lw $s1, x
#prima stampa a video
la $a0, frase1
li $v0, 4
syscall 
#input
li $v0, 5
syscall 
move $s1, $v0
#inizio ciclo for
li $t0, 2
loop:
	bge $t0,$s1,Exitloop
	div $s1,$t0
	mfhi $t1
	beq $t1, $zero, if
	add $t0,$t0,1
	j loop
Exitloop:
beq $s0,0,ciao
Exit:
#uscita dal programma
li $v0, 10
syscall 

ciao:
	#stampa a video
	la $a0, primo
	li $v0, 4
	syscall
	j Exit



if:
	#stampa a video
	la $a0, nonprimo
	li $v0, 4
	syscall 
	li $s0, 1
	j Exitloop

	
