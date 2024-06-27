CODES SEGMENT PARA 
MAIN PROC FAR
ASSUME CS:CODES
ORG 100H
BEGIN:
JMP STAR


x1:
in al,60h
cmp al,01h
je skip 

jmp on

ON:
        in al,60h

        mov dl,al
        inc dl
        mov ah,02h
        int 21h                 

SKIP:
MOV AL,20H                      
OUT 20H,AL
IRET
x2:
   
    
STAR:  
MOV AH,25H                                           
MOV AL,09H
MOV DX,OFFSET x1
INT 21H

MOV AH,31H                      
MOV DX,OFFSET x2            
INT 21H    
      
exit:
mov ax,4c00h
int 21h

CODES ENDS
END BEGIN

