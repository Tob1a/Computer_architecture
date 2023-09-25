.data
arr: .word 1 2 3 4 5 6
n: .word 6
key: .word 3
print: .asciiz "Element found at position: "


.text 
#main
#eseguo le lw
la $s0,arr
lw $s1,n
lw $s2,key
#preservo
addi $sp, $sp, -12
sw $s0, 8($sp) 
sw $s1, 4($sp) 
sw $s2, 0($sp) 
#chiamo la funzione
jal findElement
addi $sp, $sp, -12
#uscita dal programma
li $v0, 10
syscall 



findElement:
addi $sp,$sp, -16
sw $fp,12($sp)
sw $s0,8($sp)
sw $s1,4($sp)
sw $s2,0($sp)
addi $fp, $sp, 12



#eseguo le operazioni
li $s3,0 #i=0
loop:
	
	
	#condizione ciclo
	bgt $s3, $s2, Exitloop
	
	
	
	#arr[i]=key per la condizione
	sll $t0,$s3,2	#shift di 2 quindi moltiplico per 4 i e mi da l'indirizzo successivo
	add $t0,$t0,$s0 #indirizzo di a[i] //sommo all'indirizzo base di $s0
	lw  $t1,0($t0)	#leggo il valore e lo metto $t1
	
	#inizio if
	bne $t1, $s2, continua
		#stampa a video frase
		la $a0,print
		li $v0,4
		syscall 
		#stampa a video valore i+1
		move $a0,$s3
		addi $a0,$a0,1
		li $v0, 1
		syscall 
		#fine stampa
		j Exitloop #break
	continua:
	#fine if
	addi $s3, $s3, 1
	j loop
Exitloop:
#fine ciclo
li $s3,0 #metto apposto la i
#eseguo le pop
lw $s2,0($sp)
lw $s1,4($sp)
lw $s0,8($sp)
lw $fp,12($sp)
addi $sp,$sp, 16
#uscita dalla funzione
jr $ra