TITLE STRNCPY

.MODEL SMALL

.STACK 64

.DATA
        ONE DB 'HELLO', '$'
        TWO DB 3 DUP(0), '$'

.CODE
MAIN PROC FAR
        MOV AX, @DATA
        MOV DS, AX

        LEA SI, ONE
        LEA DI, TWO

        MOV BL,3

   XXX: MOV AX, [SI]
        MOV [DI], AX
        INC SI
        INC DI
        DEC BL
        JNZ XXX

        MOV BL, '$'
        MOV [DI], BL
        
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
