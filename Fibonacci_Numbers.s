.arm
.text
.global main
main:
STMDB R13!,{R0-R12,R14}
MOV R0,#1
MOV R4,#2
MOV R1,#2
LDR R3,=Stor
STRB R0,[R3]
STRB R1,[R3,#1]
LOOP:
LDR R3,=Stor
ADD R2,R1,R0
STRB R2,[R3,R4]
MOV R0,R1
MOV R1,R2 
ADD R4,R4,#1
TEQ R4,#6
BNE LOOP
MOV PC,R14
.data
Stor:
.byte 0
