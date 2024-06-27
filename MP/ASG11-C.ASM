.MODEL SMALL

.STACK 64

.DATA
        ONE DB 'HELLO', '$'
        TWO DB 'O'
                  
.CODE
MAIN PROC FAR
        MOV AX, @DATA
        MOV DS, AX

        LEA SI, ONE

   XXX: MOV AL, [SI]
        CMP AL, TWO
        JE YYY
        INC SI
        CMP AX, '$'
        JNE XXX

        MOV CL, 0
        JMP ZZZ
        
   YYY: MOV CL, 1

   ZZZ: MOV DL, CL
        ADD DL, 30H
        MOV AH, 02H
        INT 21H

        MOV AX, 4C00H
        INT 21H

MAIN ENDP
END MAIN
