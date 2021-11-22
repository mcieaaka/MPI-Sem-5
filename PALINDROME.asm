;HARSHIT SRIVASTAVA 19BCE0382
DATA SEGMENT
STR1 DB 'MADAM'     ;Source
LEN EQU $-STR1    ;source length
STR2 DB 20 DUP(0) ;Destination  
MG1 DB 'PALINDROME!$' ;Message
MG2 DB 'NOT PALINDROME!$';Message
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
LEA SI, STR1 ;Source
LEA DI, STR2 ;Destination
MOV CX,LEN         ; Length
CLD                ;Clear DF
REPE CMPSB         ;Check if SI==DI
JZ YES             ;Jump to YES
MOV DX,OFFSET MG2  ;Not Palindrome Message
MOV AH,09H         ;Print on screen
INT 21H
JMP OVER
YES: MOV DX,OFFSET MG1;Palindrome message
MOV AH,09H       ;print on screen
INT 21H
OVER: MOV AH,4CH;Interrupt
INT 21H
CODE ENDS
END START