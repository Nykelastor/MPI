PRINTMSG			MACRO MSG
					LEA DX,MSG
					MOV AH,09H
					INT 21H
					ENDM
DATA SEGMENT
		MSG1 DB 'ENTER THE FIRST NUMBER: $'
	
		MSG2 DB 0AH,0DH, 'THE SQUARE IS: $'
		NUM DB ?
		RESULT DB 5 DUP('$')	
DATA ENDS		
		
CODE SEGMENT
ASSUME CS:CODE,DS:DATA
START:	MOV AX,DATA
			MOV DS,AX

			LEA DX,MSG1		;Print MSG1
			MOV AH,09H
			INT 21H
			
			MOV AH,01H
			INT 21H			;Read the first number
			SUB AL,30H		;Convert the ASCII value to binary
			MOV NUM,AL		;Store the first number in NUM1
			
			LEA DX,MSG2		;Print MSG2
			MOV AH,09H
			INT 21H
			
			MOV AL,NUM		;Move the first number to AL
			MOV BL,NUM		;Move the second number to BL
			MUL BL			;Multiply AL and BL and store result in AL
			
			
			MOV SI,OFFSET RESULT
			CALL HEX2ASCII
			
			;PRINTMSG RESULT
			
			LEA DX,RESULT		
			MOV AH,09H
			INT 21H
			
			MOV AH,4CH
			INT 21H
					
HEX2ASCII	PROC NEAR
			MOV BL,0AH
			DIV BL
			ADD AL,30H
			MOV [SI],AL
			INC SI
			ADD AH,30H
			MOV [SI],AH
			INC SI
			MOV AL,'$'
			MOV [SI],AL
			RET
HEX2ASCII	ENDP			
			
			

CODE ENDS
END START
