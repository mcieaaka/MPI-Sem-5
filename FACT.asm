DATA SEGMENT
X DW 06H
F DW ?
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE,DS:DATA
START:
MOV AX,DATA
MOV DS,AX
MOV AX, 01H
MOV CX, X
L1: MUL CX
LOOP L1
MOV F,AX
MOV AH,4CH
INT 21H
CODE ENDS
END START
