.data
sum: .word 0
count: .word 10
i: .word 0
frase1: .asciiz "\nTotal of the first "
frase2: .asciiz " numbers is "
frase3: .asciiz "\n"

.text 
#faccio le lw
lw $s0,sum
lw $s1, count
lw $t0, i
#inizio ciclo for
move $t0, $s1
loop:
	ble $t0,1,Exit
	#stampa a video
	#stampa a video frase n1
	la $a0, frase1
	li $v0, 4
	syscall 
	#stampa a video count
	move $a0, $s1
	li $v0, 1
	syscall 
	#stampa a video frase n2
	la $a0, frase2
	li $v0, 4
	syscall 
	#stampa a video sum
	move $a0, $s0
	li $v0, 1
	syscall
	#stampa a video frase n3
	la $a0, frase3
	li $v0, 4
	syscall
	#fine ciclo
	sub $t1,$t0,1
	add $s0,$s0,$t1
	j loop
Exit:
#uscita dal programma
li $v0, 10
syscall 
