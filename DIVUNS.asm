DATA SEGMENT
NUM1 DW 2036H
NUM2 DW 0202H
QOU DW DUP<2>
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
    
START: MOV AX,DATA
MOV DS,AX
MOV AX,NUM1
MOV BX,NUM2
CBW
DIV BX
LEA SI,QOU
MOV [SI],AX
MOV [SI+2],DX
MOV AH,4CH
INT 21H
CODE ENDS
END START