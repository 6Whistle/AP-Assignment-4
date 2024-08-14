	AREA ARMex, CODE, READONLY			;Assignment3 using MUL
	ENTRY
	
	LDR r0, Address1		;Address to store
	MOV r1, #10
	MOV r2, #1
	
	MOV lr, pc
	B Factorial		;call Factorial(10)
	
	STR r2, [r0]		;store Factorial
	
	MOV pc, #0
	
Factorial						;Factorial function
	STMFD sp!, {r1, lr}			;store r1 and state
	
	CMP r1, #1					;compare while r1 == 1
	
	SUBHI r1, #1				;if r1 > 1, Factorial(r1-1)
	MOVHI lr, pc					
	BHI Factorial
	
	LDMFD sp!, {r1, lr}		;if after all Factorial() call, MUL it
	MUL r2, r1, r2
	MOV pc, lr					;next Factorial
	
	
Address1 & &4000				;Address to store array

	END