.MODEL SMALL

.STACK 64

.DATA
        one DB 5
        two DB 6
        three DB ?

.CODE
MAIN            PROC            FAR
                MOV AX, @DATA
                MOV DS, AX
                MOV AL, one
                ADD AL, two

                MOV AH, 00
                MOV BL, 0AH
                DIV BL
                MOV BL, AH
                ADD AL, 30H
                MOV AH, 02H
                MOV DL, AL
                INT 21H

                MOV AL, BL
                ADD AL, 30H
                MOV DL, AL
                MOV AH, 02H
                INT 21H

                MOV AX, 4C00H
                INT 21H

MAIN            ENDP
END             MAIN
