.MODEL SMALL

.STACK 64
.286
.DATA
	ONE DB 'HELLO$'
.CODE

PRINT PROC NEAR

	LEA SI, ONE

	MOV DL, [SI]
   XXX: MOV AH, 02H
	INT 21H
	INC SI
	MOV DL, [SI]
	CMP DL, '$'
	JNE XXX
	RET
PRINT ENDP

CLRSCR PROC NEAR
	MOV AX, 0600H
	MOV BH, 0F0H
	MOV CX, 0000
	MOV DX, 184FH
	INT 10H
	RET
CLRSCR ENDP

SETCSR PROC NEAR
	MOV AX, 0200H
	MOV BH, 00
	MOV DH, BL
	MOV DL, CL
	INT 10H
	RET
SETCSR ENDP

SETEND PROC NEAR
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 1800H
	INT 10H
	RET
SETEND ENDP

MAIN PROC FAR

	MOV AX, @DATA
	MOV DS, AX

	MOV AL, DS:17H

	MOV DL, AL
	MOV AH, 02H
	INT 21H

	MOV AH, 0CH
	INT 21H

	MOV AL, DS:17H

	MOV DL, AL
	MOV AH, 02H
	INT 21H

	MOV AX, 4C00H
	INT 21H
MAIN ENDP
END MAIN