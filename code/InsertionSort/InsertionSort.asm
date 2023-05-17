.data 
ciao: .word 12 11 13 5 6
dimensione: .word 5
n: .word 5
acapo: .asciiz "\n"
space: .asciiz " "
.text
#carico i dati
la $a1, ciao
lw $a2, dimensione
lw $a3, n
#chiamata a funzione
jal InsertionSort

#chimata a funzione print
jal printArray
#uscita dal programma
li $v0, 10
syscall 







#InsertionSort
InsertionSort:
li $t0,1
#inizio ciclo for
ciclo: 
	bgt $t0,$a3,exitfor
	#tutta sta roba per k=a[i]
	sll $t2,$t0,2	#shift di 2 quindi moltiplico per 4 i e mi da l'indirizzo successivo
	add $t2,$t2,$a1 #indirizzo di a[i] //sommo all'indirizzo base di $a1
	lw $t3,0($t2)		#$t3 = key
	
	sub $t4,$t0,1
	#inizio ciclo while
		while:
		#condizione ciclo
		ble $t4,0,continua
		#se $t4 non e' maggiore o uguale a 0
			j exitwhile
		continua:	#$t4 = j
		#tutto sto popo per  arr[j] > key
		sll $t5,$t4,2
		add $t5,$t5,$a1
		lw $t6, 0($t5)
		bgt $t6,$t3,continua2
			j exitwhile
		#fine arr[j] > key
		continua2:
		
		
		#inizio istruzione arr[j + 1] = arr[j];
		sll $t7,$t6,2
		add $t7,$t7,$a1
		lw $t8, 0($t7) #$t8 = arr[j + 1]
		move $t8,$t6
		#fine istruzione arr[j + 1] = arr[j];
		
		
		sub $t4,$t4,1 #j = j - 1;
		#fine ciclo while
		j while
		exitwhile:
		
	move $t8,$t3 #arr[j + 1] = key;
	#fine ciclo for
	add $t0,$t0,1
	j ciclo
	
exitfor:
jr $ra





printArray:
#inizio ciclo for
li $t0, 0
printfor:
	bgt $t0,$a3,exitprint
	sll $t2,$t0,2 #shift di 2 quindi moltiplico per 4 i e mi da l'indirizzo successivo
	add $t2,$t2,$a1 #indirizzo di a[i]
	lw $t3, 0($t2)
	#inizio prima stampa a video
	move $a0, $t3
	li $v0, 1
	syscall 
	#stampa spazio tra una variabile e un'altra
	la $a0, space
	li $v0, 4
	syscall 
	#seconda stampa a video
	la $a0, acapo
	li $v0, 4
	syscall 
	#fine ciclo for
	add $t0,$t0,1
	j printfor
exitprint:
jr $ra


