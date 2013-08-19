// -*- asm -*-
//
// The inner interpreter.

	
	
	;; word:  doLIST
	;; flags: CODE ROM
	;; notes: $doLIST ( a -- )
	;;   Execute address list starting with a.


	RPUSH(RP, IP)	      ; Push the IP onto the Return Stack (RP)
	RPOP(IP, SP)	      ;	Pop the new value of the IP from the Data Stack
	NEXT


	
	;; word:  EXIT
	;; flags: CODE ROM COMPILE
	;; notes: EXIT ( -- )

	RPOP(IP, RP)		; Get the IP from the return stack
	NEXT


	
	;; word:  EXECUTE
	;; flags: CODE ROM
	;; notes: EXECUTE ( ca -- )
	;;   Pop address from data stack and jump to it.

	RPOP(TMP0,SP)
	JMP I TMP0


	
	;; word:  doLIT
	;; flags: CODE ROM IMMEDIATE
	;; notes: EXECUTE ( -- w )
	;;   Push a literal onto the stack. The literal is at the next address to be executed (IP).
	;;   The address is incremented afterwards, so the literal value is skipped over by the
	;;   inner interpreter.

	LOAD I IP
	PUSH SP
	NEXT

	

	;; word:  doPSTR
	;; flags: CODE ROM
	;; notes: EXECUTE ( -- w )
	;;   Push a string literal onto the stack.

	RMOV(TMP0, I IP)	; TMP0 = First cell after string.
	RPUSH(SP, IP)		; IP (no indirection) is the address of the string.
	RMOV(IP, TMP0)		; IP = TMP0
	NEXT

	

	;; word:  NOP
	;; flags: CODE ROM
	;; notes: NOP ( -- )
	;;   Does nothing, and it does it slowly.

	NEXT
	

// End of file.
