.model small

.stack 64

.data

str db 'hello$'
row db ?
col db ?
temp dw ?
temp1 dw ?
.code

main proc far
mov ax,@data
mov ds,ax

mov cl,0h

mov row,00h
mov col,0h

; left-right
xxx:
;-->clear screen
mov ah,00h
mov al,03h
int 10h

mov ah,02h
mov dh,row
mov dl,cl
int 10h

lea dx,str
mov ah,09h
int 21h

mov col,cl

mov temp,199h
x2:
mov temp1,99h
y2:
dec temp1
jnz y2
dec temp
jnz x2

mov cl,col
inc cl
cmp cl,50h
jne xxx

; top-bottom
mov row,0h
mov col,0h
mov cl,row

yyy:

mov ah,00h
mov al,03h
int 10h

mov ah,02h
mov dh,cl
mov dl,col
int 10h

lea dx,str
mov ah,09h
int 21h

mov row,cl

mov temp,199h
x1:
mov temp1,99h
y1:
dec temp1
jnz y1
dec temp
jnz x1

mov cl,row
inc cl
cmp cl,19h
jne yyy

mov ax,4c00h
int 21h

main endp
end main