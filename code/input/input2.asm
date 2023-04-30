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
andi $v0, $a0, 0x0001 #uso la porta logica and per trovare l'ultimo bit significativo che mi interessa e salvo l'ultimo bit in $v0

#quindi puo essere o 0 o 1 e quindi posso tornare su
jr $ra
