TITLE STRCPY

.MODEL SMALL

;-------------MACROS-------------

XYZ MACRO
	MOV AL, [SI]
	MOV [DI], AL
	INC SI
	INC DI
ENDM

XXX MACRO
	LODSB
	MOV DL, AL
	INT 21H
ENDM

;----------END OF MACROS----------

.STACK 64

.DATA
        ONE DB 'HELLO', '$'
        TWO DB 5 DUP(' ')
                  
.CODE
MAIN PROC FAR
        MOV AX, @DATA
        MOV DS, AX

        LEA SI, ONE
        LEA DI, TWO
	MOV CX, 5

    XY: XYZ
	LOOP XY

	LEA SI, TWO
	MOV AH, 02H
	MOV CX, 5

    XX: XXX
	LOOP XX

	MOV AX, 4C00H
        INT 21H

MAIN ENDP
END MAIN