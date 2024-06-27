.MODEL SMALL

.STACK 64

.DATA
        ONE DB 'HELLO', '$'
        TWO DB 5 DUP(0), '$'

.CODE
MAIN PROC FAR
        MOV AX, @DATA
        MOV DS, AX

        LEA SI, ONE
        LEA DI, TWO
        MOV CL, 4

   ABC: INC SI
        DEC CL
        JNZ ABC
	
	MOV CL, 6
   XXX: MOV AX, [SI]
        MOV [DI], AX
        DEC SI
        INC DI
        DEC CL
        JNZ XXX

        LEA BX, TWO
	MOV CL, 5
   YYY: MOV DL, [BX]
        MOV AH, 02H
        INT 21H
        INC BX
	DEC CL
        JNZ YYY

        MOV AX, 4C00H
        INT 21H

MAIN ENDP
END MAIN
