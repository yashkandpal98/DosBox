
.model small

.stack 64

.data
temp db ?
temp1 dw ?
t1 dw ?
t2 dw ?
str db ?

.code

main proc far

mov ax,@data
mov ds,ax

mov ah,00h
mov al,03h
int 10h

xxx:
mov ah,0ch
mov al,02h
int 21h

mov ah,2ch
int 21h

mov ch,00h
mov t1,cx
mov ax,t1
mov temp1,dx
mov bx,60
mul bx
mov dx,temp1
mov dl,dh
mov dh,00h
add ax,dx
mov t1,ax


input:

mov ah,01h
int 16h

jnz xxx

mov ah,2ch
int 21h
mov ch,00h
mov t2,cx
mov ax,t2
mov temp1,dx
mov bx,60
mul bx
mov dx,temp1
mov dl,dh
mov dh,00h
add ax,dx
mov t2,ax

mov ax,t2
sub ax,t1
cmp ax,5 
je sc
jmp input


sc:
mov ah,06h
mov al,00h
mov bh,1eh
mov cx,0000h
mov dx,184fh
int 10h

l:
mov ah,10h
int 16h

mov bl,'a'
cmp al,bl
jne b1
mov dl,'b'
jmp print

b1:
mov bl,'b'
cmp al,bl
jne c1
mov dl,'c'
jmp print

c1:
mov bl,'c'
cmp al,bl
jne ex
mov dl,'d'
jmp print

ex:
cmp al,27d
je exit

mov dl,al
print:
mov ah,02h
int 21h
jmp l

exit:
mov ax,4c00h
int 21h

main endp
end main