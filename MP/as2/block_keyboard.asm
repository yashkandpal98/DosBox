.model small

.stack 64

.data
temp dw ?
temp1 dw ?
str db ?
.code

main proc far

mov ax,@data
mov ds,ax

mov cl,99h
lea si,str

input:
mov ah,01h
int 21h

cmp al,27d
je block
mov [si],al
inc si
jmp input


block:
mov ah,00h
mov al,03h
int 10h


mov temp1,9999h

x:
mov temp,90h
y:
mov ah,0ch
mov al,02h
int 21h

dec temp
jnz y

dec temp1 
jnz x

mov al,'$'
mov [si],al

lea dx,str
mov ah,09h
int 21h


mov ax,4c00h
int 21h

main endp
end main