.arm
.text
.global main
main:
STMDB R13!,{R0-R12,R14}
LDR R0,=Values
LDR R5,=Const
LDR R10,=Results
MOV R3,#0
MOV R11,#0
BL Function
ADD R3,R3,#1
BL Function
ADD R3,R3,#1
BL Function
ADD R3,R3,#1
BL Function
MOV R11,#0		
LDRSB R12,[R10,R11]	
Loop:			
ADD R11,R11,#1	
LDRSB R0,[R10,R11]	
CMP R0,R12		
MOVGT R12,R0		
TEQ R11,#3		
BNE Loop		
STR R12,[R5,#4]
LDMIA R13!,{R0-R12,R14}
Function:
STMDB R13!,{R0-R12,R14}
LDR R0,=Values
LDR R5,=Const
LDR R10,=Results
LDRSB R6,[R5,#0]	@z0
LDRSB R7,[R5,#1] @z1
LDRSB R8,[R5,#2]	@z2
MOV R9,#5
LDRSB R1,[R0,R3]	@ai
ADD R3,R3,#1
LDRSB R2,[R0,R3]@bi
ADD R3,R3,#1
LDRSB R4,[R0,R3]	@ci
MUL R1,R6,R1
MUL R2,R7,R2
MUL R4,R8,R4
ADD R1,R1,R2
SUB R1,R1,R4
MUL R1,R9,R1
MOV R1,R1,ASR #6
STRB R1,[R10,R11]
ADD R11,R11,#1
MOV PC,LR
.data
Values:
.byte 0x02,0x03,0x04
.byte 0x10,0x05,0x06
.byte 0x0B,0x02,0x0D
.byte 0x01,0x0C,0x08
Const:
.byte 0x04,0x07,0x05
Results:
.byte 0,0,0,0



