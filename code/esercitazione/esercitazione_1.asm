.data

a: .word 15
b: .word 10
c: .word 7
d: .word 2
e: .word 18
f: .word -3
z: .word 0


.text 

#non usare pseudoistruzioni lw e si usa di conseguenza lui

lui $t6, 0x1001

lw $s1, 0($t6)
lw $s2, 4($t6)
lw $s3, 8($t6)
lw $s4, 12($t6)
lw $s5, 16($t6)
lw $s6, 20($t6)
lw $s7, 24($t6)



#operazioni
add $t0, $s1, $s2
sub $t1, $s3, $s4
add $t2, $s5, $s6
sub $t3, $s1, $s3

add $t0, $t0, $t1
sub $t2, $t2, $t3

add $s7, $t0, $t2

#stampa a video
add $a0, $zero, $s7
addi $v0, $zero, 1
syscall 

#uscita programma
addi $v0, $zero, 10
syscall 
