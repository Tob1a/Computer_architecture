.data

num: .word 0
i: .word 0
flag: .word 0
print1: .asciiz "Enter a number to check whether prime or not:  "
print2: .asciiz "Entered number "
print3: .asciiz " is a prime number."
print4: .asciiz " is not a prime number."


.text
#faccio le lw
lw $s0,num
lw $s1,i
lw $s2, flag
#fine lw
#inizio prima stampa a video
la $a0, print1
li $v0,4
syscall 
#fine prima stampa a video
#inizio input
li $v0,5
syscall 
move $s0,$v0
#fine input
beq $s0,$zero,PIF
	beq $s0,1,PIF
j exit1
PIF:
		li $s2,1
exit1:
#inizio ciclo
li $t2,2
li $s1,2
div $s0,$t2
mflo $t1
LOOP:
	bge $s1,$t1,EXITLOOP
	div $s0,$s1
	mfhi $t0
	bne $t0,$zero,Ciao
		li $s2,1
		j EXITLOOP
	Ciao:
	add $s1,$s1,1
	j LOOP
EXITLOOP:
#fine ciclo
la $a0, print2
li $v0,4
syscall 
move $a0,$s0
li $v0,1
syscall 
bne $s2,$zero,Ciaone
#prima stampa if
la $a0,print3
li $v0,4
syscall 
j fine
Ciaone:
	#prima stampa if
	la $a0, print4
	li $v0,4
	syscall 
fine:
#fine programma
li $v0,10
syscall 