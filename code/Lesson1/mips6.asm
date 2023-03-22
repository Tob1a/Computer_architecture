.data
a: .byte 8
Stringa: .asciiz "AB"
b: .byte 9
c: .byte 10,11,12,13

#esercizio  system call
.text 
#print a video
addi $a0, $zero, 96
li $a0, 96 # fa la stessa cosa dell'istruzione precendente
addi $v0, $zero ,1
syscall 
#uscita exit
addi $v0 , $zero, 10
syscall 