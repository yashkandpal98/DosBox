.model small

.stack 64

.data 

row dw ?
col dw ?
row1 dw ?
col1 dw ?
tr1 dw ?
tr2 dw ?
tc1 dw ?
tc2 dw ?

.code
main proc far

mov ax,@data
mov ds,ax
mov es,ax

mov ah,0h
mov al,02h
int 10h

mov ah,0bh
mov bh,00
mov bl,07h
int 10h

mov row,50
mov col,0

mov row1,60
mov col1,25

mov tr1,82
mov tc1,0

mov tr2,82
mov tc2,38

call drawCar

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

call drawCar

inc col
inc col1
inc tc1
inc tc2
jmp d1

exit:
mov ax,4c00h
int 21h

main endp

drawCar proc near

;---------body-----------
mov dx,row       
mov di,20h     

SquareYloop:
    mov cx,col       
    mov si,30h        

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
;---------------------------

;---------window-----------


mov dx,row1      
mov di,10    

SquareYloop1:
    mov cx,col1       
    mov si,15        

SquareXloop1:
    
    mov bh,0h                   
    mov al,10   
    mov ah,0ch                  
    int 10h                      

    inc cx                      
    dec si                      
    jne SquareXloop1            

    inc dx                      
    dec di                      
    jne SquareYloop1             
;---------------------------

;---------tyres-------------

mov dx,tr1     
mov di,10    

SquareYloop2:
    mov cx,tc1       
    mov si,10        

SquareXloop2:
    
    mov bh,0h                   
    mov al,9   
    mov ah,0ch                  
    int 10h                      

    inc cx                      
    dec si                      
    jne SquareXloop2            

    inc dx                      
    dec di                      
    jne SquareYloop2

mov dx,tr2     
mov di,10    

SquareYloop3:
    mov cx,tc2       
    mov si,10        

SquareXloop3:
    
    mov bh,0h                   
    mov al,9   
    mov ah,0ch                  
    int 10h                      

    inc cx                      
    dec si                      
    jne SquareXloop3            

    inc dx                      
    dec di                      
    jne SquareYloop3
;---------------------------
ret
drawCar endp
end main