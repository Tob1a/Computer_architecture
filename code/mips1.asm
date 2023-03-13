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

