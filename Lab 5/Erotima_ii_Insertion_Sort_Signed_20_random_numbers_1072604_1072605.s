.arm
.text
.global main
main:
MOV R7,#0 
LDR R0,=table@--->''first adress of the array 1O ORISMA''
MOV R1,#20@table_size @deytero_orisma_arithmos_stixion_se_bytes
SUB R8,R1,#1
BL Function	
MOV R4,#0
BL Check_if_sorted
LDMIA R13!,{R0-R8,R14}
Function:
STMDB R13!,{R0-R8,R14}
Label1:
ADD R3,R7,#1
LDRSB R6,[R0,R7]
MOV R2,R7
Label2:
LDRSB R4,[R0,R3]
CMP R6,R4
BLE Label3 
MOV R2,R3
MOV R6,R4
Label3:
ADD R3,R3,#1
CMP R3,R1 @table_size
BLT Label2
LDRSB R5,[R0,R7]
STRB R6,[R0,R7]
STRB R5,[R0,R2]
ADD R7,R7,#1
CMP R7,R8@table_size-1
BLT Label1
BX LR

Check_if_sorted:
STMDB R13!,{R0-R4,R8,R14}
MOV R3,#0@-->metritis
LOOP:
LDRSB R1,[R0,R3]
ADD R3,R3,#1
LDRSB R2,[R0,R3]
CMP R1,R2
ADDGT R4,R4,#1
TEQ R3,R8
BNE LOOP
BX LR					   
.data
table:
.byte 0x05,0x0D,0x0D,0x0C,0x07,0x09,0x08,0x03,0x02,0x04,0x01,0x0A,0x-1,0x-3,0x-4,0x-2,0x00,0x-5,0x0B,0x0E