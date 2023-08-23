.arm
.text
.global main
main:
STMDB R13!,{R0-R4}
MOV R3,#0
BL Polyonymo
Polyonymo:
STMDB R13!,{R0-R4}
LOOP:
LDR R0,=Values
LDR R1,=Const
LDR R4,=Result
LDR R0,[R0,R3] @fortono to x
LDRB R1,[R1,#6] @a6=b6
MUL R2,R1,R0
LDR R1,=Const
LDRB R1,[R1,#5]
ADD R2,R2,R1 @b5
MUL R2,R0,R2
LDR R1,=Const
LDRB R1,[R1,#4]
ADD R2,R2,R1 @b4
LDR R1,=Const
LDRB R1,[R1,#3]@a3
MUL R2,R0,R2
ADD R2,R2,R1 @b3
LDR R1,=Const
LDRB R1,[R1,#2]
MUL R2,R0,R2
ADD R2,R2,R1 @b2
LDR R1,=Const
LDRB R1,[R1,#1]
MUL R2,R0,R2
ADD R2,R2,R1
LDR R1,=Const
LDRB R1,[R1,#0] @a0
MUL R2,R0,R2
ADD R2,R2,R1
STR R2,[R4,R3]
ADD R3,R3,#4
TEQ R3,#16
BNE LOOP
MOV PC,LR
.data
Values:
.word 0x10
.word 0x50A
.word 0xCDCA
.word 0x80AB
Const:
.byte 0x04, 0x07, 0x05
.byte 0x20, 0x1A, 0x12, 0x06
Result:
.word 0
