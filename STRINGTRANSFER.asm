;HARSHIT SRIVASTAVA 19BCE0382
DATA SEGMENT
STR1 DB 'HOW ARE YOU' ;source
LEN EQU $-STR1        ;length
STR2 DB 20 DUP(0)     ;destination
DATA ENDS

CODE SEGMENT
ASSUME CS: CODE, DS:DATA,ES:DATA
START: MOV AX,DATA
MOV DS,AX
MOV ES,AX
LEA SI,STR1  ;Source offset in SI
LEA DI,STR2  ;Destination offset in DI
MOV CX,LEN   ; Length of string
CLD          ;clear DF, set auto inc
REP MOVSB    ;Mov string source to destination
MOV AH,4CH
INT 21H
CODE ENDS
END START