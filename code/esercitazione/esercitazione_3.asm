.data
#inserimento variabili
a: .word 15
b: .word 10
c: .word 7
d: .word 2
e: .word 18
f: .word -3
z: .word 0

.text 

lw $a0, a
lw $a1, b
lw $a2, c
lw $a3, d
lw $s0, e
lw $s1, f
lw $s2, z

#apertura $sp

addi $sp, $sp, -8
sw $t6,0($sp)
sw $t7,4($sp)

#copio valori nelle variabili

addi $sp, $sp, 8
lw $t6,4($sp)
lw $t7,0($sp)
add $fp, $zero, $sp #setto il frame pointer a $sp per recuperare dopo le variabili




#chiamata a funzione

jal do_match




#chiusura $sp

addi $sp, $sp, 8
lw $t6,4($sp)
lw $t7,0($sp)

#stampa a video
add $a0,$a0, $s6
li $v0, 1
syscall 

#uscita programma
li $v0, 10
syscall 













#funzione

do_match:


addi $sp, $sp, -20
sw $t3,16($sp)
sw $t2,12($sp)
sw $t1,8($sp)
sw $t0,4($sp)
sw $s0,0($sp)



#passo variabili per $a4, $a5

lw $t6, 0($fp)
lw $t7, 4($fp)

#esegue operazioni

add $t0, $a0, $a1
sub $t1, $a2, $a3
add $t2, $t6, $t7
sub $t3, $a0, $a2

add $t0 , $t0, $t1
sub $t2 , $t2, $t3

add $s0 , $t0, $t2

#mette la variabile s0 in v0 che il registro che ritorna

add $v0, $s0, $zero

#chiusura operazioni


lw $s0, 0($t6)
lw $t0, 4($t6)
lw $t1, 8($t6)
lw $t2, 12($t6)
lw $t3, 16($t6)
addi $sp, $sp, 20

#salta

jr $ra 



