DATA	SEGMENT
	A	DW	70H
	B	DW	60H
	CC	DW	40H
	D	DW	20H
	S	DW	?
DATA	ENDS

CODE	SEGMENT
	ASSUME	DS:DATA, CS:CODE
MAIN:	
	MOV	AX, DATA
	MOV	DS, AX


	MOV	AX, A
	MUL	B
	MOV	DI, AX	;把a*b送到DI中

	MOV	BX, CC
	ADD	BX, D
	
	MOV	AX, DI
	CWD
	IDIV	BX	;计算完第一个表达式

	
	MOV	SI, AX	;移动计算结果至si
	MOV	AX, A
	MOV	BX, B
	SUB	AX, BX
	MOV	BX, 5
	IMUL	BX
	SAR	AX, 1
	ADD	AX, SI
	MOV	SI, AX

	
	MOV	BX, D
	MOV	AX, CC
	CWD
	IDIV	BX
	ADD	AX, SI
	MOV	S, AX


	MOV	AX, 4C00H
	INT	21H
CODE	ENDS
	END 	MAIN