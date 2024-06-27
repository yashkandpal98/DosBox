.model small
.stack 64

video_seg segment at 0b900h
vid_area db 1000h dup(?)

video_seg ends
.286

.code

main proc far
mov ax,@data
mov ds,ax

mov ax,video_seg
mov es,ax
assume es:video_seg


mov ah,0fh
int 10h
push ax
push bx

mov ax,0003h
int 10h
mov ax,0501h
int 10h
call display

mov ah,10h
int 16h

mov ah,05h
pop bx
mov al,bh
int 10h
pop ax
mov ah,00h
int 10h
mov ax,4c00h
int 21h

main endp

display proc near


pusha

mov al,41h
mov ah,01h
mov di,1820
b30:
mov es:word ptr[di],ax
add di,2
inc al
add di,2
cmp al,49h
jne b30

popa
ret
display endp

end main