DATA SEGMENT
   MSG1  DB  'Enter the character : $'
   MSG2  DB  0DH,0AH,'The ASCII code of the given number in binary form is : $'
   MSG3  DB  0DH,0AH,'The number of 1 bits in ASCII code are : $'
DATA ENDS

CODE SEGMENT
ASSUME CS: CODE, DS: DATA
START:
     MOV AX, DATA                ; initialize DS  
     MOV DS, AX

     LEA DX, MSG1             ; load and display MSG1   
     MOV AH, 9
     INT 21H

     MOV AH, 1                    ; read a character
     INT 21H

     XOR BX, BX                   ; clear BX
     MOV BL, AL                   ; move AL to BL

     LEA DX, MSG2             ; load and display MSG2
     MOV AH, 9
     INT 21H

     XOR BH, BH                   ; clear BH
     MOV CX, 8                    ; initialize loop counter
     MOV AH, 2                    ; set output function

     _OUTPUT:                     ; jump label
       SHL BL, 1                  ; shift left BX by 1 bit

       JNC _ZERO                  ; jump to label _ZERO if CF=0
       INC BH                     ; increment BH
       MOV DL, 31H                ; set DL=1
       JMP _DISPLAY               ; jump to label _DISPLAY

       _ZERO:                     ; jump label
         MOV DL, 30H              ; set DL=0

       _DISPLAY:                  ; jump label
         INT 21H                  ; display digit
     LOOP _OUTPUT                 ; jump to label _OUTPUT

     LEA DX, MSG3             ; load and display the string MSG3
     MOV AH, 9
     INT 21H

     OR BH, 30H                   ; convert the decimal to ascii code

     MOV AH, 2                    ; print the contents of BH
     MOV DL, BH
     INT 21H

     MOV AH, 4CH                  ; return control to DOS
     INT 21H
CODE ENDS 
END START