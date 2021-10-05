DATA SEGMENT
ADA DB ? ; ADDITION ANSWER
SUA DB ? ; SUB ANSWER
MUA DB ? ; MUL ANSWER
DIA DB ? ; DIV ANSWER
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START: MOV AX,DATA
MOV DS,AX   ; INITIALISE DS
MOV AL,7    ; 7 IN AL
MOV BL,6    ; 6 IN BL
SUB AH,AH   ; CLEAR AH
ADD AL,BL   ; ADD
AAA         ; AAA ADJUSTMENT
MOV ADA,AL  ; STORE ANSWER
MOV AL,9    ; 9 IN AL, 6IN BL
SUB AL,BL   ; SUB
AAS         ; AAS
MOV SUA,AL  ; STORE ANSWER
MOV AL,3    ; 3 IN AL
MOV BL,9    ; 9 IN BL
MUL BL      ; MUL
AAM         ;AAM 
MOV MUA,AL  ; STORE ANSWER
MOV AL,9    ; 9 IN AL
MOV BL,3    ; 3 IN BL
AAD         ; AAD BEFORE DIV
DIV BL      ; DIVIDE OP
MOV DIA,AL  ; STORE ANSWER
MOV AH,4CH
INT 21H
CODE ENDS
END START