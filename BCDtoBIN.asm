;HARSHIT SRIVASTAVA 19BCE0382
DATA SEGMENT
BCDANS DW 37H  ;BCDANS INPUT
BINANS DW ?    ; OUTPUT
DATA ENDS

CODE SEGMENT 
ASSUME CS:CODE, DS:DATA
START:
MOV AX, DATA        ;INTIALIZE DATA SEGMENT
MOV DS, AX
MOV BX, BCDANS ;BX IS NOW HAVING BCD NUMBER
MOV CX, 0       ; INITIALIZATION  
AGAIN:                               
CMP BL, 0       ;COMPARISION TO CHECK BCD NUM IS ZERO          
JZ ENDPROG      ; IF ZERO END THE PROGRAM
MOV AL, BL      ; 8 LSBs OF NUMBER IS TRANSFERRED TO AL
SUB AL, 1       ; SUBTRACT ONE FROM AL
DAS             ; DECIMAL DJUST AFTER SUBTRACTION
MOV BL, AL      ; RESULT IS STORED IN BL
MOV AL, BH      ; BMSB IS TRANSFERED TO AL
SBB AL, 00H     ; SUBTRACTION WITH BORROW
DAS             ; DECIMAL ADJUST AFTER SUBTRACTION
MOV BH, AL      ; RESULT BACK IN BH REGISTER
INC CX          ; INCREMENT CX BY 1
JMP AGAIN    
ENDPROG:
MOV BINANS, CX  ; RESULT IS DTORED IN DATA  
MOV AH, 4CH     ; TERMINATION OF PROGRAM
INT 21H         ; TERMINATION OF PROGRAM
CODE ENDS
END START