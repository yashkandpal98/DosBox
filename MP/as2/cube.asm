.model small

.stack 64

.data

row dw ?
col dw ?
row1 dw ?
col1 dw ?
.code

main proc far

mov ax,@data
mov ds,ax

mov ah,00h
mov al,12h
int 10h

mov ah,0bh
mov bh,00h
mov bl,05h
int 10h

mov row,20h
mov row1,60h
mov col,30h
mov col1,70h

x1:
mov col,30h

x:
mov ah,0ch
mov al,03
mov bh,0
mov cx,col
mov dx,row
int 10h

inc col
cmp col,70h
jne x

add row,40h
cmp row,60h
je x1

mov col,30h

y1:
mov row,20h
y:
mov ah,0ch
mov al,03
mov bh,0
mov cx,col
mov dx,row
int 10h

inc row
cmp row,60h
jne y

add col,40h
cmp col,70h
je y1

mov row,40h
x2:
mov col,50h

x3:
mov ah,0ch
mov al,03
mov bh,0
mov cx,col
mov dx,row
int 10h

inc col
cmp col,90h
jne x3

add row,40h
cmp row,80h
je x2

mov col,50h

y11:
mov row,40h
y2:
mov ah,0ch
mov al,03
mov bh,0
mov cx,col
mov dx,row
int 10h

inc row
cmp row,80h
jne y2

add col,40h
cmp col,90h
je y11


mov row,20h
mov col,30h
call draw

mov row,20h
mov col,70h
call draw

mov row,60h
mov col,70h
call draw

mov row,60h
mov col,30h
call draw

exit:
mov ax,4c00h
int 21h

main endp

draw proc near

mov col1,0h
s4:
mov ah,0ch
mov al,03
mov bh,0
mov cx,col
mov dx,row
int 10h

inc row
inc col
inc col1
cmp col1,20h
jne s4

ret
draw endp
end main