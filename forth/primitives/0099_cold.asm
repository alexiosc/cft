// -*- asm -*-
//
// Forth-side boot code.

	;; word:  COLD
	;; flags: DOCOL ROM
	;; notes: TEST ( -- )
	;;   Test the inner interpreter

	//.word dw_TESTCOUNT
	//.word dw_COUNT
	//.word dw_PRINTD
	//.word dw_PRINTH
	
	.word dw_doLIT
	.word 10
	.word dw_doLIT
	.word 20
	.word dw_2DUP
	//.word dw_HALT
	.word dw_less_than
	.word dw_PRINTD

	.word dw_doLIT
	.word 0
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
