// -*- asm -*-
//
// Forth-side boot code.

	;; word:  COLD
	;; flags: DOCOL ROM
	;; notes: TEST ( -- )
	;;   Test the inner interpreter

okloop:
	.word dw_dot_ok		; .ok
	.word dw_QUERY		; QUERY
	.word dw_blskip		; blskip

tokenloop:
	.word dw__token		; $token
	.word dw_if_branch	; go to okloop if no tokens left
	.word okloop

	.word dw_HERE		; HERE
	.word dw__pack		; $pack
	
	.word dw_HERE
	.word dw_pstrupper
	.word dw_typep0

	.word dw_HERE
	.word dw_FIND
	.word dw_PRINTD
	.word dw_DUP
	.word dw_PRINTA
	.word dw_typep0
	
	//.word dw_type0		; type0
	.word dw_doLIT		; &3f EMIT // '?'
	.word &3f
	.word dw_EMIT
	.word dw_SPACE		; SPACE

	.word dw_branch		; go to tokenlop
	.word tokenloop

	//.word dw_TESTCOUNT
	//.word dw_COUNT
	//.word dw_PRINTD
	//.word dw_PRINTH

	//.word dw_doLIT
	//.word 10
	//.word dw_SPACES
	//.word dw_doLIT
	//.word 33
	//.word dw_EMIT
	//.word dw_CR
	//.word dw_HALT

	//.word dw_doLIT
	//.word bootstr
	//.word dw_COUNT
	//.word dw_PRINTD
	//.word dw_HALT
	
	//.word dw_doLIT
	//.word 9999
	//.word dw_doLIT
	//.word 142
	//.word dw_2DUP
	//.word dw_HALT
	//.word dw_less_than
	//.word dw_UMtimes
	//.word dw_PRINTH
	//.word dw_PRINTH

	//.word dw_doLIT
	//.word 0
	//.word dw_branch
	//.word @+2
	//.word dw_FAIL		; Jumped over
	//.word dw_SUCCESS

	//.word dw_if_branch	; if 10 == 0:
	//.word @+2		; skip next
	//.word dw_FAIL		; shouldn't happen
	//.word dw_SUCCESS

	;; Try a loop
	//.word dw_doLIT
	//.word 10
	//.word dw_to_r

testloop:	
	//.word dw_RDUP		; RDUP
	//.word dw_r_from		; R>
	//.word dw_PRINTD		; PRINTD
	//.word dw_doLIT
	//.str "*"
	//.word dw_tx
	//.word dw_next		; NEXT
	//.word testloop///

	//.word dw_dot_ok
	//.word dw_doLIT
	//.word &1000
	//.word dw_doLIT
	//.word 10
	//.word dw_accept

	//.word dw_tibptr
	//.word dw_SUCCESS
	//.word dw_HALT



	//.word dw_doLIT
	//.word &1000
	//.word dw_doLIT
	//.word &2000
	//.word dw__PACK
	//.word dw_doLIT
	//.word &2000
	//.word dw_typep0

	//.word dw_BYE
	//.word dw_EXIT
	
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
