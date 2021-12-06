;Seven Segment 
DATA SEGMENT 
PORTA EQU 120H 
PORTB EQU 121H 
PORTC EQU 122H 
CWRD EQU 123H 
TABLE DB 8CH,0C7H,86H,89H 
DATA ENDS 
CODE SEGMENT 
 ASSUME CS:CODE, DS:DATA 
 START: MOV AX,DATA ;intialise data segment 
MOV DS,AX 
MOV AL,80H ;initialise 8255 portb and portc as o/p 
MOV DX,CWRD 
OUT DX,AL 
MOV BH,04 ; BH = no of digitsto be displayed 
LEA SI,TABLE ; SI = starting address of lookup table 
NEXTDIGIT:MOV CL,08 ; CL = no of segments = 08 
MOV AL,[SI] 
NEXTBIT: ROL AL,01 
MOV CH,AL ;save al 
MOV DX,PORTB ;one bit is sent out on portb 
OUT DX,AL 
MOV AL,01 
MOV DX,PORTC ;one clock pulse sent on pc0   

OUT DX,AL 
DEC AL 
MOV DX,PORTC           

OUT DX,AL 
MOV AL,CH ; get the sevensegment code back in al 
DEC CL ;send all 8 bits,thus one digit is displayed 
JNZ NEXTBIT 
DEC BH 
INC SI 
JNZ NEXTDIGIT 
;display all the four digits 
MOV AH,4CH ;exit to dos 
INT 21H 
 CODE ENDS 
 END START 