// -*- asm -*-
//
// Define the NAME primitive

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



	

	;; word:  $$TEST$$
	;; alias: TEST
	;; flags: DOCOL ROM
	;; notes: TEST ( -- )
	;;   Test the inner interpreter
	.word dw_doLIT
	.word 0
	.word dw_doLIT
	.word 20
	.word dw_PRINTD
	.word dw_branch
	.word @+2
	.word dw_FAIL		; Jumped over
	.word dw_SUCCESS

	.word dw_if_branch	; if 10 == 0:
	.word @+2		; skip next
	.word dw_FAIL		; shouldn't happen
	.word dw_SUCCESS

	;; Try a loop
	.word dw_doLIT
	.word 10
	.word dw_to_r

testloop:	
	.word dw_RDUP		; RDUP
	.word dw_r_from		; R>
	.word dw_PRINTD		; PRINTD
	.word dw_doLIT
	.str "*"
	.word dw_tx
	.word dw_next		; NEXT
	.word testloop


	.word dw_BYE
	.word dw_EXIT
	
	;; word:  BYE
	;; flags: DOCOL ROM
	;; copy:  HALT
	;; notes: BYE ( -- )
	;;   Leaves Forth (just runs HALT, which halts the computer)
	.word dw_HALT
	.word dw_EXIT

	;; word:  HALT
	;; flags: FFL_PRIMITIVE ROM
	;; notes: HALT ( -- )
	;;   Halts the machine. The computer may be resumed
	;;   from the front panel, in which case execution will continue.
	HALT
	NEXT
	
	
// End of file.
