#esercizio 2
.data 
a: .word 8
b: .word 9
c: .word 10,11,12,13
#per vedere se l'endianess
.text 

la $s0, a
lb $t0 0($s0)


#se  00 00 00 08 
#low end: 08 e in 0x100100000? se si, little endian se no big 