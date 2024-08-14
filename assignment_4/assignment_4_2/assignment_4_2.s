	AREA ARMex, CODE, READONLY
	ENTRY
	
	MOV r0, #0				; store at r0~r7
	MOV r1, #1
	MOV r2, #2
	MOV r3, #3
	MOV r4, #4
	MOV r5, #5
	MOV r6, #6
	MOV r7, #7
	
	LDR sp, Address1		;address to store data(stack)
	
	STMFD sp!, {r0-r7}		;Store data(r0 - r1 - r2 - r3 - r4 - r5 - r6 - r7)
	
	LDMFD sp!, {r1}		;Load data(r1 - r6 - r0 - r2 - r7 - r3 - r4 - r5)
	LDMFD sp!, {r6}
	LDMFD sp!, {r0}
	LDMFD sp!, {r2}
	LDMFD sp!, {r7}
	LDMFD sp!, {r3-r5}
	
	MOV pc, lr
	
Address1 & &0004200
	
	END