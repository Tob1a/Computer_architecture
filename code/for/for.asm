.data 
sum: .word 0
frase1: .asciiz "Enter a positive integer: "
frase2: .asciiz "Sum = "
num: .word 0
#stampa prima frase
.text
#tutti i lw
lw $s0, sum
la $a0, frase1
li $v0, 4
syscall 
#input
li $v0, 5
syscall 
move $t0,$v0
#inizio ciclo for
li $t1, 1
loop:
	bgt $t1,$t0,Exit
	add $t1,$t1,1
	#istruzioni all'interno del ciclo for
	add $s0, $s0, $t1
	#fine istruzioni 
	j loop

#fine ciclo for
Exit:
#stampa seconda frase
la $a0, frase2
li $v0, 4
syscall 
#stampa a video valore
move $a0, $s0
#in questo caso setto $v0 in 1 perche stampa di una variabile
li $v0, 1
syscall 
#uscita dal programma
li $v0,10
syscall 

