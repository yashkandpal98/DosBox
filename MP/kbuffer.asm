.model small

.stack 64

.data

keyboard segment at 40h
	org 1eh
	kbst dw ?
keyboard ends

.code

main proc far

mov ax,keyboard
mov es,ax



x:
mov ah,00h
int 16h

mov di,kbst

MOV BH, AL	
MOV ES:[DI],BH

cmp bh,27
je exit

mov dl,es:[di]
inc dl
cmp dl, 5Bh
je xyz
CMP DL, 7BH
JNE WXY
MOV DL, 61H
JMP WXY
jmp wxy
xyz: mov dl, 41h
wxy: mov ah,02h
     int 21h

jmp x

exit:
mov ax,4c00h
int 21h
main endp
end main