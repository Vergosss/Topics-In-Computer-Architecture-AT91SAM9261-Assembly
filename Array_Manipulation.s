.arm
.text
.global main
main:
STMDB R13!,{R0-R12,R14}
MOV R3,#0
LOOP:
LDR R0,=Stor
STRB R3,[R0,R3]
ADD R3,R3,#1
TEQ R3,#6
BNE LOOP
MOV PC,R14
.data
Stor:
.byte 0