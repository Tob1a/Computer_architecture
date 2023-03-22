.data 
# qui ci mettiamo i dati 


.eqv op1, $t0
.eqv op2, $t1
.eqv risultato, $t2


.text
#qui ci mettiamo le operazioni
#siamo noi i compilatori qui
#mars e un istruction set simulator (ISS) 
#ADD $s0, $s1, $s2
#1. modellare una unita aritmetica logica e fa la somma e poi viene fuori il risultato nel 
#2. creare un programma che con un linguaggio di alto livello mette le variabili e le altre operazioni con un linguaggio di alto livello. (Mars) Istruction Set simulator
#java e c non hanno la possibilita di eseguire le operazioni mentre systemc o hdl che simulano il punto 1 possono


addi op1, op1 ,1
addi op2, op2, 2
add risultato, op1, op2

