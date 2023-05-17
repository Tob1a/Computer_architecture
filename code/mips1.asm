.data
// $s0 variabile per stampa a video
// $t0 variabile temporanea
// inserisce le parole (dati)
g: .word 3
h: .word 4
i: .word 4
j: .word 1

// mette le parole nelle celle
.text 
lw $s0, g
lw $s1, h
lw $s2, i
lw $s3, j


//guarda istruzioni lw e sw
//esegue calcoli
add $t0, $s0, $s1
add $t1, $s2, $s3
add $t2, $t0, $t1


// provo a fare il while(save[i] ==k) i += 1;

loop: sll $t1, $s3, 2 #$t1 = 4*i
add $t1, $t1, $s6 # $t1 = address of save[i]
lw $t0, 0($t1) # $t0 = save[i]
bne $t0, $s5, Exit
add $s3, $s3, 1 # i += 1
j loop  #salto obligatorio a loop
Exit: #uscita per il bne



#è la stessa cosa per l'istruzione li $t1, $s6

//Lw $t0, offset($base)