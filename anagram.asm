INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
STR1 Dw 52 DUP('$')
STR2 Dw 52 DUP('$')
 
 
    
STR3 DW 52 dup('$')
STR4 DW 52 dup('$')
 
.CODE
MAIN PROC    
MOV AX,@DATA
MOV DS,AX  
   
    MOV SI,OFFSET STR3
    l1:
    MOV AH,1
    INT 21H
     
    CMP AL,13
    JE programend1
    MOV [SI],AL
    INC SI
    JMP l1
   
    programend1:
      
    PRINTN
    MOV SI,OFFSET STR4
    l2:
    MOV AH,1
    INT 21H
     
    CMP AL,13
    JE programend2
    MOV [SI],AL
    INC SI
    JMP l2
    
    programend2:    
   
    MOV AX,[STR1+BX]
    CMP AX,[STR2+BX]
    JE INCBX
    JNE NO 
    
    INCBX:
    
    PRINTN
    MOV DX,offset STR3
    MOV AH,9
    INT 21H
    
    NO:
      
    PRINTN
    MOV DX,offset STR4
    MOV AH,9
    INT 21H  

 
MOV AH, 4CH
INT 21H
MAIN ENDP
END MAIN