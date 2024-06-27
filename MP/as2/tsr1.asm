CODES SEGMENT PARA 
MAIN PROC FAR
ASSUME CS:CODES
ORG 100H
BEGIN:
JMP STAR

x1:
IN AL,60H
CMP AL,01H
JE OFF

CMP AL,01eH
JE ON

JMP SKIP
ON:
        MOV AL,182         
        OUT 43H,AL         
        MOV AX,4560        
        OUT 42H,AL         
        MOV AL,AH          
        OUT 42H,AL 
        IN AL,61H       
                                
        OR AL, 00000011B   
        OUT 61H,AL         

        MOV BX,0FFFFH       
y1:
     
        DEC BX
        JNE y1
        
JMP SKIP

OFF:
    IN AL,61H           
    AND AL,11111100B    
    OUT 61H,AL          


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
      

CODES ENDS
END BEGIN

