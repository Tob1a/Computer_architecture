.data

a: .word 15
b: .word 10
c: .word 7
d: .word 2
e: .word 18
f: .word -3
z: .word 0


.text 


lw $s0, a
lw $s1, b
lw $s2, c
lw $s3, d
lw $s4, e
lw $s5, f
lw $s6, z



#operazioni
add $t0 , $s0, $s1
sub $t1, $s2 , $s3
add $t2, $s4, $s5
sub $t3, $s0, $s2

add $t0, $t0, $t1
sub $t2, $t2, $t3

add $s6, $t0, $t2

#stampa a video
add $a0,$a0, $s6
li $v0, 1
syscall 

#uscita programma
li $v0, 10
syscall 
