.arm
.text
.global main

main:
STMDB R13!, {R0-R12, R14}
MOV R0, #94
MOV R1, R0, LSR #1
ADDS R2, R0, R0
ADDS R2, R2, R2
ADDS R2, R0, R1
MOV R0, 0x80000000
ADD R1, R0, #0x80
MOV R2, #1
SUBS R3, R0, R2
SUBS R3, R0, R1
RSBS R3, R0, R1
LDMIA R13!, {R0-R12, PC}