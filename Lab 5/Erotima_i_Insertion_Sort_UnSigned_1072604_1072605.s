.arm
.text
.global main
main:
STMDB R13!,{R0-R8,R14}
MOV R7,#0 
LDR R0,=table@--->''first adress of the array''
MOV R1,#6@table_size
SUB R8,R1,#1
BL Function	
Function:
Label1:
ADD R3,R7,#1
LDRB R6,[R0,R7]
MOV R2,R7
Label2:
LDRB R4,[R0,R3]
CMP R6,R4
BLS Label3 
MOV R2,R3
MOV R6,R4
Label3:
ADD R3,R3,#1
CMP R3,R1 @table_size
BCC Label2
LDRB R5,[R0,R7]
STRB R6,[R0,R7]
STRB R5,[R0,R2]
ADD R7,R7,#1
CMP R7,R8@table_size-1
BCC Label1
BX LR


.data
table:
.byte 0xFF,0x5,0x4,0x3,0x2,0x1