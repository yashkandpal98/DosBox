.MODEL SMALL    


.STACK 64


.DATA
        MSG DB 'HELLO WORLD$'


.CODE
MAIN PROC FAR

        MOV AX, @DATA
        MOV DS, AX

        MOV AH, 00
        MOV AL, 02H
        INT 10H


        
        MOV AX, 4C00H
        INT 21H

MAIN ENDP
END MAIN
