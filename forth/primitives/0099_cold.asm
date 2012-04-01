// -*- asm -*-
//
// Forth-side boot code.
	;; word:  COLD
	;; flags: DOCOL ROM CFT
	;; notes: TEST ( -- )
	;;   Test the inner interpreter

	.word dw_dot_banner	; .banner ( )
	.word dw_QUIT
	.word dw_FAIL


	;; TODO: refactor this into QUIT, EVAL, $INTERPRET, etc.
	
okloop:
	.word dw_tick_dot_PROMPT ; '.PROMPT ( a )
	.word dw_fetch_EXECUTE	; @EXECUTE ( )
	.word dw_QUERY		; QUERY ( )

tokenloop:
	;; End of the input buffer?
	.word dw_EOTIBq		; EOTIB? ( f )
	.word dw_NOT		; NOT ( !f )
	.word dw_if_branch	; go to okloop if no tokens left (length = 0)
	.word oknextline

	;; Parse a space-delimited token starting at >IN
	.word dw_pIN		; >IN ( va )
	.word dw_fetch		; @ ( a )
	doLIT(32)		; 32 ( a 32 )
	.word dw__parse	   	; $parse ( token-addr len )

	;; Get next line if the token is empty.
	.word dw_DUP		; DUP ( token-addr len len )
	.word dw_if_branch	; go to okloop if the token is empty (len = 0)
	.word oknextline

	;; Step the >IN pointer.
	.word dw_2DUP		; 2DUP ( token-addr len token-addr len )
	.word dw_add		; 1+ ( token-addr len a+l )
	.word dw_pIN		; >IN ( token-addr len a+l va )
	.word dw_store		; ! ( token-addr len )


	.word dw_DUP		; DUP ( token-addr len len )
	.word dw_to_R		; >R ( token-addr len )
	.word dw_HERE		; HERE ( token-addr len here-addr )
	.word dw__cPACK		; $cPACK ( a3 a4 )

	.word dw_2DROP		; 2DROP ( )

	.word dw_R_from		; R> ( len )
	.word dw_HERE		; HERE ( len token-addr )
	.word dw_pstrupper	; pstrupper ( len token-addr)

	.word dw__FIND		; $FIND ( word-addr TRUE | token-addr FALSE )

	.word dw_if_branch	; ( token-addr ) \ Not a word. Try a number
	.word tokenloop_num

	.word dw_EXECUTE

	.word dw_qSTACK		; ?STACK \ check for underflow
	
	.word dw_branch
	.word tokenloop

oknextline:
	//.word dw_DROP
	.word dw_tick_dot_OK	; '.OK
	.word dw_fetch_EXECUTE 	; @EXECUTE
	.word dw_branch
	.word okloop

tokenloop_num:
	.word dw_NUMBERq
	.word dw_if_branch
	.word tokenloop_err
	.word dw_branch
	.word tokenloop
	
tokenloop_err:
	.word dw_dot_str	; ."
	.word 3
	.strp "  ? " 0
	.word dw_typep0		; type0
	//.word dw_doLIT		; &3f EMIT // '?'
	//.word &3f
	//.word dw_EMIT
	//.word dw_SPACE		; SPACE
	.word dw_branch		; go to tokenlop
	.word tokenloop


	
	;; word:  .banner
	;; alias: dot_banner
	;; flags: DOCOL ROM CFT
	;; notes: $banner ( -- )
	;;   Prints out boot banner.
	.word dw_doLIT
	.word _banner_text1
	.word dw_typep0
	.word dw_countwords
	.word dw_DECIMAL
	.word dw_dot
	.word dw_doLIT
	.word _banner_text2
	.word dw_typep0
	.word dw_EXIT
_banner_text1:
	.strp 10 10 27 "[0;33m" 27 "#3 CFT " 10 27 "#4 CFT " 10 10 27 "[0m16-bit Mini-Computer" 10 "CFT Booted. " 10 "Forth words known:" 0
_banner_text2:
	.strp " (type WORDS for a list)" 10 0

	
	;; word:  BYE
	;; flags: DOCOL ROM
	;; copy:  HALT
	;; notes: BYE ( -- )
	;;   Leaves Forth (just runs HALT, which halts the computer)
	.word dw_HALT
	.word dw_EXIT


	
	;; word:  HALT
	;; flags: CODE ROM
	;; notes: HALT ( -- )
	;;   Halts the machine. The computer may be resumed
	;;   from the front panel, in which case execution will continue.
	HALT
	NEXT
	
	
// End of file.
