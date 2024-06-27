TITLE STRCPY

.MODEL SMALL

.STACK 64

.DATA
        ONE DB 'HELLO', '$'
        TWO DB 5 DUP(0)
                  
.CODE
MAIN PROC FAR
        MOV AX, @DATA
        MOV DS, AX

        LEA SI, ONE
        LEA DI, TWO

   XXX: MOV AX, [SI]
        MOV [DI], AX
        INC DI
        INC SI
        MOV CL, [SI]
        CMP CL, '$'
        JNE XXX
        
        LEA BX, TWO
   YYY: MOV DL, [BX]
        MOV AH, 02H
        INT 21H
        INC BX
        MOV CL, [BX]
        CMP CL, '$'
        JNE YYY

        MOV AX, 4C00H
        INT 21H

MAIN ENDP
END MAIN
