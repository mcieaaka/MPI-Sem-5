;HARSHIT SRIVASTAVA 19BCE0382
DATA SEGMENT
X DW 09H
A DW 00H
B DW 01H
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE,DS:DATA
START:
MOV AX,DATA
MOV DS,AX
MOV CX,X
PUSH A
L1: MOV AX,B
MOV BX, A
ADD AX,BX
MOV B,BX
MOV A,AX
PUSH AX
DEC CX
JNZ L1    
PUSH 00H
MOV AH,4CH
INT 21H

CODE ENDS
END START
