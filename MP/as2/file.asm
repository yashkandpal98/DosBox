.model small

.386

.stack 64

.data
namepar label byte
maxlen dw 30
namelen db ?
namerec db 30 dup(' ') ,0dh,0ah
errcode db 00
filehand dw ?
pathname db 'kom.dat',0
prompt db 'Name? $'
openmsg db '***Open error ***$'
file1 dw ?
writemsg db '***Write error ***$'
inarea db 'hello$'
row db 0


.code

main proc far
mov ax,@data
mov ds,ax
mov es,ax

mov ax,0003h
int 10h

call create
call record1
call write

mov ah,3fh
mov bx,file1
movzx cx,maxlen
add cx,2
lea dx,inarea
int 21h

lea dx,inarea
mov ah,09h
int 21h

exit:
mov ax,4c00h
int 21h

main endp

create proc near

mov ah,3ch
mov cx,00
lea dx,pathname
int 21h
mov filehand,ax
mov file1,ax
ret

create endp

opening proc near

mov ax,3dh
mov al,00
lea dx,pathname
int 21h
mov filehand,ax

ret
opening endp

record1 proc near

mov cx,05

lea dx,prompt
mov ah,09h
int 21h

mov ah,0ah
lea dx,namepar
int 21h
cmp namelen,00
mov al,20h
movzx dx,maxlen
add cx,dx
rep stosb

ret
record1 endp

write proc near

mov ah,40h
mov bx,filehand
movzx cx,maxlen
add cx,2
lea dx,namerec
int 21h

ret
write endp


end main

