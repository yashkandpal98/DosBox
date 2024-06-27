.model small

.stack 64

.data 

row dw ?
col dw ?
ht dw ?

.code
main proc far

mov ax,@data
mov ds,ax
mov es,ax

mov ah,0h
mov al,12h
int 10h

mov ah,0bh
mov bh,00
mov bl,07h
int 10h

mov row,50
mov col,0

mov ht,50h
call drawView

d1:
mov ah,0h
int 16h

cmp ah,4dh
je d2

cmp ah,01h
je exit
jmp d1

d2:
mov ah,0h
mov al,12h
int 10h

mov ah,0bh
mov bh,00
mov bl,07h
int 10h

call drawView

add col,8
inc row
dec ht
jnz d1

exit:
mov ax,4c00h
int 21h

main endp

drawView proc near

    DrawSquare:
    mov dx,row       
    mov di,ht      

SquareYloop:
    mov cx,col       
    mov si,ht         

SquareXloop:
    
    mov bh,0h                   
    mov al,02h   
    mov ah,0ch                  
    int 10h                      

    inc cx                      
    dec si                      
    jne SquareXloop             

    inc dx                      
    dec di                      
    jne SquareYloop             

ret
drawView endp
end main