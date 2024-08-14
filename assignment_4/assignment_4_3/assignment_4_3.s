	AREA ARMex, CODE, READONLY
	ENTRY
	
	MOV r0, #10							;data
	MOV r1, #11
	MOV r2, #12
	MOV r3, #13
	MOV r4, #14
	MOV r5, #15
	MOV r6, #16
	MOV r7, #17
	
	MOV r8, #160
	
	LDR r9, Address1					;Address to store
	
	STMFD sp!, {r4}					;Store r4 before doRegister()
	
	MOV lr, pc							;Do after doRegister() is done
	B doRegister
	
	MOV lr, pc							;Do after doGCD() is done
	B doGCD
	
	LDMFD sp!, {r4}						;Read r4 before doRegister()
	ADD r8, r4							;add GCD and r4
	STR r8, [r9]							;store it
	
	MOV pc, #0
	
	
doRegister			;Suffle register
	
	STMFD sp!, {r0-r7, lr}		;store at stack
	
	LDMFD sp!, {r1}		;load from stack
	LDMFD sp!, {r6}
	LDMFD sp!, {r0}
	LDMFD sp!, {r2}
	LDMFD sp!, {r7}
	LDMFD sp!, {r3-r5}
	
	ADD r1, #1			;add index
	ADD r2, #2
	ADD r3, #3
	ADD r4, #4
	ADD r5, #5
	ADD r6, #6
	ADD r7, #7
	
	MOV r10, r0		;add all of num at r10
	ADD r10, r1
	ADD r10, r2
	ADD r10, r3
	ADD r10, r4
	ADD r10, r5
	ADD r10, r6
	ADD r10, r7
	
	LDMFD sp!, {pc}		;fuction end
	
doGCD				;get GCD
	CMP r8, r10						; A%B = R
	SUBHI r8, r8, r10
	BHI doGCD

	MOVEQ pc, lr					;if R == 0, r8 is GCD
	
	MOV r11, r8				;swqp r8, r10				
	MOV r8, r10
	MOV r10, r11
	
	B doGCD					;GCD again
	

Address1 & &0004200
	
	END