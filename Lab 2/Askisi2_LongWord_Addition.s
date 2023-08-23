.arm
.text
.global main
main:
STMDB R13!,{R0-R4}
MOV R3,#0
LOOP:
LDR R0,=PinakasA
LDR R1,=PinakasB
LDR R2,=PinakasGamma
LDR R0,[R0,R3]
LDR R1,[R1,R3]
ADCS R4,R1,R0
STR R4,[R2,R3]
ADD R3,R3,#4
TEQ R3,#16 @CMP ruins the bits of CPSR!
BNE LOOP
.data
PinakasA:
.byte 32,127,254,57,22,111,48,11,87,45,114,45,66,23,134,168
PinakasB:
.byte 19,1,18,89,90,112,89,32,23,98,67,83,146,140,200,67
PinakasGamma:
.byte 0
