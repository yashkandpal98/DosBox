.model small

.stack 64

.data
row db ?
col db ?
r1 db 0
c1 db 0
row2 db ?
col2 db ?
ascii dw ?
.code

main proc far
mov ax,@data
mov ds,ax

mov ah,00h
mov al,03h
int 10h

mov row,23
mov col ,78

mov ah,00h
mov al,03h
int 10h

mov cl,0h
mov al,row
mov bl,25
sub bl,al
sub bl,2h
mov row2,bl

mov al,col
mov bl,80
sub bl,al
sub bl,2h
mov col2,bl

mov al,row2
mov r1,al
mov al,col2
mov c1,al

mov ah,02h
mov dh,r1
mov dl,c1
int 10h

mov dl,201
mov ah,02h
int 21h

call horiz
inc col

mov dl,187
mov ah,02h
int 21h

call vert

mov ah,02h
mov dh,row
mov dl,col
int 10h

dec col

mov dl,188
mov ah,02h
int 21h

call horizr


mov ah,02h
mov dh,row
mov dl,00h
int 10h

mov dl,200
mov ah,02h
int 21h

;------------vertical-------
dec row
mov al,row
mov r1,al

y3:

mov ah,02h
mov dh,r1
mov dl,row2
int 10h

mov dl,186
mov ah,02h
int 21h

dec r1
jnz y3

;----------------------------

;-->writing ascii values : 

mov row,7h
mov col,16
mov ascii,32
mov ah,02h
mov dh,row
mov dl,col
int 10h
xyz:
cmp col,64
je abc
print:
mov dx,ascii
mov ah,02h
int 21h
inc col
inc ascii
cmp ascii,256
jne xyz
jmp exit
abc: 
inc row
mov col,16
mov ah,02h
mov dh,row
mov dl,col
int 10h
jmp print

exit:
mov ax,4c00h
int 21h

main endp

horiz proc near

mov c1,0h

x:
mov dl,205
mov ah,02h
int 21h

inc c1
mov al,col
cmp c1,al
jne x
ret
horiz endp

horizr proc near

mov al,col
mov c1,al

x1:
mov ah,02h
mov dh,row
mov dl,c1
int 10h

mov dl,205
mov ah,02h
int 21h

dec c1
mov al,col2
cmp c1,al
jne x1
ret
horizr endp

vert proc near

mov al,row2
mov r1,al
inc r1

y:
mov ah,02h
mov dh,r1
mov dl,col
int 10h

mov dl,186
mov ah,02h
int 21h

inc r1
mov al,row
cmp r1,al
jne y

ret
vert endp

vertr proc near


vertr endp

end main


