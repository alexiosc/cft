;; // -*- asm -*-
;; //
;; // rudimentary line editing and terminal buffering


	;; word:  DIGIT
	;; flags: DOCOL ROM
	;; notes: DIGIT ( u -- c )
	;;        Converts an integer to a digit. The integer should
	;;        be <= BASE.

	.word dw_doLIT		; 9
	.word 9
	.word dw_OVER		; OVER
	.word dw_lt		; <
	.word dw_doLIT		; 7
	.word 7
	.word dw_AND		; AND
	.word dw_add		; +
	.word dw_doLIT		; 48
	.word 48
	.word dw_add		; +
	.word dw_EXIT

	

	;; word:  EXTRACT
	;; flags: DOCOL ROM
	;; notes: EXTRACT ( n base -- n c )
	;;        Extracts the least significant digit of n, in preparation for
	;;        output in the specified base. Returns a character ready to
	;;        EMIT and the remainder of n.

	;; /MOD SWAP DIGIT ;
	
	.word dw_U_DIV_MOD	; UM/MOD ( rem quot )
	.word dw_SWAP		; SWAP ( quot rem )
	.word dw_DIGIT		; DIGIT ( quot char )
	.word dw_EXIT

	

	;; word:  <#
	;; alias: bkt-number
	;; flags: DOCOL ROM
	;; notes: <# ( -- )
	;;        Begin number conversion.

	.word dw_PAD		; PAD
	.word dw_HLD		; HLD
	.word dw_store		; !
	.word dw_EXIT		; EXIT

	

	;; word:  HOLD
	;; flags: DOCOL ROM
	;; notes: HOLD ( c -- )
	;;        Add a character to the number hold buffer.

	;; : HOLD ( c -- ) HLD @ 1 - DUP HLD ! C! ;

	.word dw_HLD		; HLD
	.word dw_fetch		; @
	.word dw_doLIT		; 1
	.word 1
	.word dw_sub		; -
	.word dw_DUP		; DUP
	.word dw_HLD		; HLD
	.word dw_store		; !
	.word dw_store		; C! ( which is identical to ! )
	.word dw_EXIT		; EXIT

	

	;; word:  #
	;; alias: number
	;; flags: DOCOL ROM
	;; notes: # ( u -- u )
	;;        Extract a digit.
	;; code:  : # ( u -- u ) BASE @ EXTRACT HOLD ;

	.word dw_BASE		; BASE
	.word dw_fetch		; @
	.word dw_EXTRACT	; EXTRACT
	.word dw_HOLD		; HOLD
	.word dw_EXIT		; EXIT

	

	;; word:  #S
	;; alias: number-s
	;; flags: DOCOL ROM
	;; notes: #S ( u -- 0 )
	;;        Extract all remaining digits.

	;; BEGIN # DUP WHILE REPEAT ;

_number_s_loop:			; BEGIN
	.word dw_number		; #
	.word dw_DUP		; DUP
	.word dw_if_branch	; branch? ( if zero )
	.word _number_s_end	; ( destination )
	.word dw_branch		; branch
	.word _number_s_loop	; ( destination )
_number_s_end:
	.word dw_EXIT		; EXIT

	

	;; word:  SIGN
	;; flags: DOCOL ROM
	;; notes: SIGN ( n -- 0 )
	;;        Adds a sign indicator.

	;; : SIGN ( n -- ) 0< IF 45 HOLD THEN ;

	.word dw_zero_less	; 0<
	.word dw_if_branch	; ?branch ( IF )
	.word _sign_end		;
	.word dw_doLIT		; 45
	.word 45
	.word dw_HOLD		; HOLD
_sign_end:
	.word dw_EXIT		; EXIT

	

	;; word:  #>
	;; alias: number-bkt
	;; flags: DOCOL ROM
	;; notes: #> ( w -- b u )
	;;        Adds a sign indicator.

	;; : #> ( w -- b u ) DROP HLD @ PAD OVER - ;

	.word dw_DROP		; DROP
	.word dw_HLD		; HLD
	.word dw_fetch		; @
	.word dw_PAD		; PAD
	.word dw_OVER		; OVER
	.word dw_sub		; -
	.word dw_EXIT		; EXIT



// End of file.
