.data 

a: .word -2147483647
#valore massimo positivo 2^31-1
#valore massimo negativo 2^31


#complemento a 2 serve per calcolarmi da un numero positivo o negativo il suo opposto cambiando i bit o facendo somme


.text

lw $a0, a
jal nega
#se io metto li $a0, 2147483648  li me la mette sempre come signed e quindi il valore e -2147483648 
#stampa a video
#move vuol dire sposta il valore in $v0 in $a0
move $a0, $v0
li $v0, 1
syscall 
li $v0, 10
syscall 


nega:
#devo fare venire il valore passato come valore_passato*-1

nor $v0,$a0,$a0
addi $v0, $v0,1



#le variabili $a servono per passare il valore non per farlo ritornare
#in questo caso metto $v0 come varibaile per il valore di ritorno

jr $ra
