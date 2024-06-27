TITLE A04ASM1 (EXE) Adding two arrays
STACKSEG   SEGMENT PARA    STACK 'STACK' 
        DW      32 DUP(0)
STACKSEG ENDS


DATASEG SEGMENT PARA 'DATA'
        ONE DB 5, 8, 3
        TWO DB 4, 0, 2
        THREE DB 3 DUP(0)
DATASEG ENDS


CODESEG         SEGMENT         PARA    'CODE'
MAIN            PROC            FAR
                ASSUME SS : STACKSEG , DS : DATASEG , CS : CODESEG

                MOV AX, DATASEG
                MOV DS, AX

                LEA SI, ONE
                LEA DI, TWO
                LEA BX, THREE

                CLC

                MOV AX, [SI]
                ADD AX, [DI]
                MOV [BX], AX
                MOV CL, 2

            XXX:INC SI
                INC DI
                INC BX
                MOV AX, [SI]
                ADC AX, [DI]
                MOV [BX], AX
                DEC CL
                JNZ XXX


                MOV CL, 3
            ZZZ:MOV AL, [BX]
                ADD AL, 30H
                MOV AH, 02H
                MOV DL, AL
                INT 21H
                MOV DL,  ' '
                MOV AH, 02H
                INT 21H
                DEC BX
                DEC CL
                JNZ ZZZ

                MOV AX, 4C00H
                INT 21H

MAIN            ENDP
CODESEG         ENDS
END             MAIN
