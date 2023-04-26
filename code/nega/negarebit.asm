.data 

a: .word 2147483648
#valore massimo positivo 2^31-1
#valore massimo negativo 2^31

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



#inizio a fare la sottrazione per 0
subu $v0, $zero, $a0
#la subu non va a fare nessun controllo di overflow perche per lei i numeri sono tutti positivi e non ce il segno
#la sub controlla se un numero positivo + un altro numero positivo non puo dare un numero negativo (0+0111111111) dunque overflow
#u sta per unsignedo unchecked che si fa sull'overflow

#le variabili $a servono per passare il valore non per farlo ritornare
#in questo caso metto $v0 come varibaile per il valore di ritorno

jr $ra
