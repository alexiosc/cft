// -*- asm -*-
//
// The inner interpreter.

	;; word:  doLIST
	;; flags: FFL_PRIMITIVE ROM
	;; notes: $doLIST ( a -- )
	;;   Execute address list starting with a.

	LOAD IP
	PUSH (RP)		; Push the IP onto the Return Stack (RP)
	POP (SP)		; Pop the new value of the IP from the Data Stack
	STORE IP
	NEXT
	
	;; word:  EXIT
	;; flags: FFL_PRIMITIVE ROM
	;; notes: EXIT ( -- )

	POP (RP)
	NEXT
	
	;; word:  EXECUTE
	;; flags: FFL_PRIMITIVE ROM
	;; notes: EXECUTE ( ca -- )
	;;   Pop address from data stack and jump to it.

	POP0 (RP)
	JMP I TMP0
	
	;; word:  doLIT
	;; flags: FFL_PRIMITIVE ROM
	;; notes: EXECUTE ( -- w )
	;;   Push a literal onto the stack.

	LOAD I IP
	PUSH (SP)
	NEXT
	

	;; word:  NOP
	;; flags: FFL_PRIMITIVE ROM
	;; notes: NOP ( -- )
	;;   Does nothing, and it does it slowly.

	NEXT
	

// End of file.
