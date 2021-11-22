;HARSHIT SRIVASTAVA 19BCE0382
DATA SEGMENT
STR1 DB 'VIT'     ;Source
LEN EQU $-STR1    ;source length
STR2 DB 20 DUP(0) ;Destination
DATA ENDS    
CODE SEGMENT
ASSUME CS:CODE,DS:DATA,ES:DATA
START: MOV AX,DATA
MOV DS,AX
MOV ES,AX
LEA SI,STR1   ;Source Offset
MOV DI,OFFSET STR2+LEN-1;Destination offset+Len-1
MOV CX,LEN    ; Length of string
UP: CLD       ;Clear DF
LODSB         ;DF to SI
STD           ;Set Direction
STOSB         ;Store Byte
LOOP UP
MOV AH,4CH
INT 21H       ;interrupt
CODE ENDS
END START