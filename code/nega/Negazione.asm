.data 

a: .word 55


.text

lw $a0, a
jal nega
#stampa a video
#move vuol dire sposta il valore in $v0 in $a0
move $a0, $v0
li $v0, 1
syscall 
li $v0, 10
syscall 


nega:
#devo fare venire il valore passato come valore_passato*-1



#inizio a fare la sottrazione per 0
sub $v0, $zero, $a0

#le variabili $a servono per passare il valore non per farlo ritornare
#in questo caso metto $v0 come varibaile per il valore di ritorno

jr $ra
