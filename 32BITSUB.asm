;HARSHIT SRIVASTAVA 19BCE0382
DATA SEGMENT
NUM1 DW 0382H,0019H
NUM2 DW 0019H,0382H
DIF DW 4 DUP<0>
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START: MOV AX,DATA
MOV DS,AX
MOV AX,NUM1
SUB AX,NUM2
MOV DIF,AX
MOV AX,NUM1+2
SUB AX,NUM2+2

JNC DOWN
MOV DIF+4, 01H
DOWN: MOV DIF+2,AX
MOV AH,4CH
INT 21H
CODE ENDS 
END START