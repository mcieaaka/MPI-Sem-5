;Assessment 2-Square and Cube ;lcm AND gcd; FIBONACCI; FACT

DATA SEGMENT
NUM DW 03H
SQ DW ?
CU DW ?
DATA ENDS

ASSUME CS: CODE, DS:DATA
CODE SEGMENT
START:
MOV AX,DATA
MOV DS,AX
MOV AX,NUM
MOV BX,NUM
MUL BX
MOV SI, OFFSET SQ
MOV [SI],AX
MUL BX
MOV SI, OFFSET CU
MOV [SI],AX
MOV AH,4CH
INT 21H
CODE ENDS
END START