;HARSHIT SRIVASTAVA 19BCE0382
DATA SEGMENT
STR1 DB 'VIT'  ;Source
LEN EQU $-STR1
CH1 DB 'I'     ;Character to find
F DB 'FOUND!$'   ;message
NF DB 'NOT FOUND!$';message 
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA,ES:DATA
START: MOV AX,DATA
MOV DS,AX        ;Initialise Data
MOV ES,AX
MOV CX,LEN
MOV DI, OFFSET STR1;str offset in di
MOV AL, CH1      ; mov char in AL
REPNE SCASB      ; Search if AL in DI
JZ YES           ; If Yes
MOV DX,OFFSET NF ; Msg Not found
MOV AH,09H       ; Display on Screen
INT 21H
JMP OVER         ;jump to Over
YES: MOV DX,OFFSET F ;Message Found
MOV AH,09H       ;Display on Screen
INT 21H
OVER: MOV AH,4CH;Interrupt
INT 21H
CODE ENDS
END START