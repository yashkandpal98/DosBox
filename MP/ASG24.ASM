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

	CALL CLRSCR

	MOV BL, 0CH
	MOV CL, 25H

	CALL SETCSR

	CALL PRINT

	MOV CX, 30000D
	MOV BX, 30000D
   XYZ: 
	WXY: MOV DL, 07H
	     MOV AH, 02H
	     INT 21H
	     DEC BX
	     JNZ WXY
	DEC CX
	JNZ XYZ

	CALL SETEND

	MOV AX, 4C00H
	INT 21H
MAIN ENDP
END MAIN