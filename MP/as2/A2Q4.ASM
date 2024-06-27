.model small

.stack 64

.data

str db 'Hello'
;msg1 db " hello, world! "
.code

;ascii 7 bel
main proc far
mov ax,@data
mov ds,ax

mov ah,00h
mov al,03h
int 10h

mov ah,02h
mov dh,0ch
mov dl,27h
int 10h

mov bx,5h
mov str[bx],07
mov str[bx+1],'$'

mov ah,13h
mov al,1h
mov bl,11100001b
push ds
pop es
mov bp,offset str
mov cx,06h
int 10h

mov ah,02h
mov dl,07h
int 21h


exit:
mov ax,4c00h
int 21h

main endp
end main