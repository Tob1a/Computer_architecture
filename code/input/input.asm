.data

a: .word 0
b: .word 0
c: .asciiz  "Inserisci un numero\n"
d: .asciiz "Il numero e' dispari"
e: .asciiz  "il numero e' pari"


.text

#faccio le lw

lw $s0, a
lw $s1, b

#stampa a video
la $a0, c
li $v0, 4
syscall 


#input 
li $v0 , 5
syscall #integer read in $v0 #mi da il risultato in $v0
move $a0, $v0 #sposto il risultato in $a0

#chiamata a funzione
jal paridispari
beq $v0, $zero, pari
#dispari
	li $v0, 4
	la $a0, d
	syscall
	j exit

pari:
	li $v0, 4
	la $a0, e
	syscall 
	j exit

#uscita dal programma
exit:
	li $v0, 10
	syscall 









#inizio funzione
paridispari:
li $t0, 2
div $a0, $t0 #divisione
mfhi $t0 #resto della divisione in $t0 #posso fare anche mfhi $v0 direttamente perche il resto puo essere o 0 o 1 e quindi saltarmi tutto il procedimento di beq
#se usavo $s0 al posto di $t0 non posso e quindi devo creare dei frame 
beq $t0, $zero, valezero
	li $v0,1
	jr $ra
valezero:
	li $v0, 0
	jr $ra




