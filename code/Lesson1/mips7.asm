.data 
a: .word 5

.text 
#stampare 5  a video

li $s0, 0x10010000
la $s0, a #fa la stessa istruzione di quella precedente
lw $a0, a #fa la stessa istruzione di quella precedente
lw $a0, 0($s0)
li $v0, 1
syscall 
addi $v0, $zero, 10
syscall 