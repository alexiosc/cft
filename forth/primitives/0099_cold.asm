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
	.word dw__token		; $token ( token-addr len )
	.word dw_DUP		; DUP ( token-addr len len )
	.word dw_if_branch	; go to okloop if no tokens left (length = 0)
	.word oknextline
	.word dw_SWAP		; SWAP ( len token-addr )

	.word dw_HERE		; HERE  ( len token-addr here-addr )
	.word dw__pack		; $pack ( len token-addr+ here-addr+ )
	.word dw_2DROP		; 2DROP ( len )
	
	.word dw_HERE		; HERE ( len token-addr )
	.word dw_pstrupper	; pstrupper ( len token-addr) 

	.word dw__FIND		; $FIND
	/.word dw_DUMPS

	.word dw_if_branch
	.word tokenloop_num

	.word dw_EXECUTE
	.word dw_branch
	.word tokenloop

oknextline:
	.word dw_DROP
	.word dw_branch
	.word okloop

tokenloop_num:
	.word dw_NUMBER_
	.word dw_if_branch
	.word tokenloop_err
	.word dw_branch
	.word tokenloop
	
tokenloop_err:
	.word dw_typep0		; type0
	.word dw_doLIT		; &3f EMIT // '?'
	.word &3f
	.word dw_EMIT
	.word dw_SPACE		; SPACE

	.word dw_DUMPS

	.word dw_branch		; go to tokenlop
	.word tokenloop
	
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
