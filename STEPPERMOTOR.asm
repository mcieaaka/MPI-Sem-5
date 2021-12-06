DATA SEGMENT 
PORTA EQU 120H 
PORTB EQU 121H 
PORTC EQU 122H 
CWRD EQU 123H 
DATA ENDS    

CODE SEGMENT 
ASSUME CS:CODE,DS:DATA 
START: 
MOV AX,DATA 
MOV DS,AX 
MOV AL,80H ;initialise 8255 ,porta as o/p port 
MOV DX,CWRD 
OUT DX,AL 
MOV DX,PORTA 
MOV AL,88H ;load initial bit pattern 
OUT DX,AL ;output on porta 
UP: CALL DELAY 
ROL AL,01H ;rotate left to get exitation sequence of 11,22,44,88 
OUT DX,AL 
JMP UP 
DELAY:MOV CX,0FFFFH ;delay can be adjusted to get different speeds 
UP2:MOV BX,0FFH 
UP1:DEC BX 
JNZ UP1 
DEC CX 
JNZ UP2 
RET 
MOV AH,4CH 
INT 21H 
code ends
 END START 