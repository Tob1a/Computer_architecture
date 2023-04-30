.data

#inserimento dati
a: .word 15
b: .word 10
c: .word 7
d: .word 2
e: .word 18
f: .word -3
z: .word 0
testo: .asciiz "Ciao"




.text
#fare tutte le lw
lw $a0, a
lw $a1, b
lw $a2, c
lw $a3, d
lw $s0, e
lw $s1, f
lw $s2, z




addi $sp, $sp, -8
sw $s0, 4($sp) #e sullo stack
sw $s1, 0($sp) #f sullo stack
jal do_match
addi $sp, $sp, -8

#stampa a video
move $t0, $v0
la $a0, testo
li $v0, 4
syscall 
#uscita dal programma
move $a0, $t0 #a0 ci vogliono i valori da stampare
li $v0, 1
syscall 
li $v0, 10
syscall 





do_match:

#gestiamo z direttamente nei registri del processore
#alloco un frame per la push di s0 es1 che
#usero per la variabile e ed f nonche per la push del frame pointer

addi $sp, $sp, -12  #questo e il framesize quindi 12

sw $fp, 8($sp)
sw $s0, 4($sp)
sw $s1, 0($sp)  #s0 e s1 sono preservati
addi $fp, $sp, 8

#a+b
add $t0,$a0,$a1
sub $t1, $a2, $a3
lw $s0,8($fp) #E in s0
lw $s1,4($fp) #f in s1

#e+f
add $t2, $s0, $s1
#a-c
add $t3, $a0, $a2 

add $t0, $t0, $t1
add $t0, $t0, $t3
sub $v0, $t0, $t3

#faccio le pop in modo last in first out
lw $s1, 0($sp)
lw $s0, 4($sp)
lw $fp, 8($sp)

#dealloco il frame
addi $sp, $sp, 12
jr $ra