DATA SEGMENT
		MSG1 DB 'ENTER THE FIRST NUMBER: $'
		MSG2 DB 0AH,0DH, 'ENTER THE SECOND NUMBER: $'
		MSG3 DB 0AH,0DH, 'THE DIFFERENCE IS: $'
		NUM1 DB ?
		NUM2 DB ?
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
			MOV NUM1,AL		;Store the first number in NUM1
			
			LEA DX,MSG2		;Print MSG2
			MOV AH,09H
			INT 21H
			
			MOV AH,01H
			INT 21H			;Read the second number
			SUB AL,30H		;Convert the ASCII value to binary
			MOV NUM2,AL		;Store the second number in NUM2
			
			LEA DX,MSG3		;Print MSG3
			MOV AH,09H
			INT 21H
			
			MOV AL,NUM1		;Move the first number to AL
			MOV BL,NUM2		;Move the second number to BL
			SUB AL,BL		;Subtract BL from AL and store result in AL
			
			ADD AL,30H		;Convert binary value to ASCII for display
			MOV DL,AL
			MOV AH,02H
			INT 21H			;Display the difference NUM1-NUM2
			
			MOV AH,4CH
			INT 21H

CODE ENDS
END START
