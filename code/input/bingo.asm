.data 

a: .word 6
b: .word 8
c: .word 190
d: .asciiz "no!!!\n"
e: .asciiz "bingo\n"

.text
#inizio con le lw
lw $t0, a
lw $t1, b
lw $t2, c





beq $t0, 1, ciaone
	#se $t0 non e' uguale a 1
	beq $t0, 2, ciaone
		#se $t0 non e' uguale a 2 e a 1
		beq $t0, 4 , ciaone
			#se $t0 non e' uguale a 2, 1 e 4 
			beq $t0, 6, ciaone
				# se non e' uguale a nessuno allora niente
				j no 
	
ciaone:	
beq $t1, 8, ciaone2
	#se $t1 non e' uguale a 8
	j no
ciaone2:
beq $t2, 10, si
	#se $t2 non e' uguale a 10
	j no
	
si:
la $a0, e
li $v0, 4
syscall
j exit
	
#no
	
no:
la $a0, d
li $v0, 4
syscall


exit:
li $v0, 10
syscall 
