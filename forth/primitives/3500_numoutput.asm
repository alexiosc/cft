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

	

	;; /ord:  EXTRACT
	;; /lags: DOCOL ROM
	;; /otes: EXTRACT ( n base -- n c )
	;;        Extracts the least significant digit of n, in preparation for
	;;        output in the specified base. Returns a character ready to
	;;        EMIT and the remainder of n.

	;; /MOD SWAP DIGIT ;
	
	;; .word dw_U_DIV_MOD	; UM/MOD ( rem quot )
	;; .word dw_SWAP		; SWAP ( quot rem )
	;; .word dw_DIGIT		; DIGIT ( quot char )
	;; .word dw_EXIT

	

	;; word:  EXTRACT
	;; flags: DOCOL ROM
	;; notes: EXTRACT ( d base -- d c )
	;;        Extracts the least significant digit of double integer d, in
	;;        preparation for output in the specified base. Returns a
	;;        character ready to EMIT and the remainder of d.
	;; code:  : EXTRACT ( d base -- d c ) DM/MOD ROT DROP ROT DIGIT ;
	
	.word dw_UM_DIV_MOD	; UM/MOD ( rl 0 ql qh )
	.word dw_ROT		; ROT ( rl ql qh 0 )
	.word dw_DROP		; DROP ( rl ql qh )
	.word dw_ROT		; ROT ( ql qh rl )
	.word dw_DIGIT		; DIGIT ( quot char )
	.word dw_EXIT

	

	;; word:  <#
	;; alias: bkt-number
	;; flags: DOCOL ROM
	;; notes: <# ( -- )
	;;        Begin number conversion.

_bkt_number_jumpin:
	.word dw_PAD		; PAD
	.word dw_HLD		; HLD
	.word dw_store		; !
	.word dw_EXIT		; EXIT

	

	;; word:  S<#
	;; alias: S-bkt-number
	;; flags: DOCOL ROM
	;; notes: S<# ( -- )
	;;        Begin number conversion for single-precision numbers.

	doLIT(0)		; 0 \ push zero high bits
	.word dw_branch
	.word _bkt_number_jumpin

	

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

	

	;; /ord:  #
	;; /lias: number
	;; /lags: DOCOL ROM
	;; /otes: # ( u -- u )
	;;        Extract a digit.
	;; code:  : # ( u -- u ) BASE @ EXTRACT HOLD ;

	;; .word dw_BASE		; BASE
	;; .word dw_fetch		; @
	;; .word dw_EXTRACT	; EXTRACT
	;; .word dw_HOLD		; HOLD
	;; .word dw_EXIT		; EXIT

	

	;; /ord:  #S
	;; /lias: number-s
	;; /lags: DOCOL ROM
	;; /otes: #S ( u -- 0 )
	;;        Extract all remaining digits.
	;; code:  : #S ( u -- 0 ) BEGIN # DUP WHILE REPEAT ;

;; _number_s_loop:			; BEGIN
;; 	.word dw_number		; #
;; 	.word dw_DUP		; DUP
;; 	.word dw_if_branch	; branch? ( if zero )
;; 	.word _number_s_end	; ( destination )
;; 	.word dw_branch	ct	; branch
;; 	.word _number_s_loop	; ( destination )
;; _number_s_end:
;; 	.word dw_EXIT		; EXIT

	

	;; word:  #
	;; alias: number
	;; flags: DOCOL ROM
	;; notes: # ( d -- d )
	;;        Extract a digit from double integer d.
	;; code:  : # ( d -- d ) BASE @ DEXTRACT HOLD ;

	.word dw_BASE		; BASE
	.word dw_fetch		; @
	.word dw_EXTRACT	; DEXTRACT
	.word dw_HOLD		; HOLD
	.word dw_EXIT		; EXIT

	

	;; word:  #S
	;; alias: number-s
	;; flags: DOCOL ROM
	;; notes: #S ( d -- 0 )
	;;        Extract all remaining digits from double integer d.

	;; BEGIN # DUP WHILE REPEAT ;

_dnumber_s_loop:		; BEGIN
	.word dw_number		; # ( d )
	.word dw_2DUP		; 2DUP ( d d )
	.word dw_OR		; OR ( d dl|dh )
	.word dw_if_branch	; branch? ( if zero )
	.word _dnumber_s_end	; ( destination )
	.word dw_branch		; branch
	.word _dnumber_s_loop	; ( destination )
_dnumber_s_end:
	.word dw_EXIT		; EXIT

	

	;; word:  0#S
	;; alias: 0-number-s
	;; flags: DOCOL ROM
	;; notes: 0#S ( d +n -- u )
	;;        Extract n zero-padded digits of d.

	.word dw_inc		; 1+ ( dl dh +n++ )
_znumber_s_loop:
	.word dw_dec		; 1- ( dl dh +n-1 )
	.word dw_DUP		; DUP ( dl dh +n-1 +n-1 )
	.word dw_if_branch	; branch? ( dl dh +n-1 )
	.word _znumber_s_end	;

	.word dw_not_ROT	; -ROT ( +n-1 dl dh )
	.word dw_number		; # ( +n dl dh )
	.word dw_ROT		; ROT ( dl dh +n )
	
	.word dw_branch		; branch
	.word _znumber_s_loop	; 

_znumber_s_end:
	.word dw_DROP		; DROP ( u )
	.word dw_EXIT		; EXIT

	

	;; word:  SIGN
	;; flags: DOCOL ROM
	;; notes: SIGN ( d -- 0 )
	;;        Adds a sign indicator.

	;; : SIGN ( d -- ) 0< IF 45 HOLD THEN ;

	.word dw_zero_less	; 0< ( dl f )
	.word dw_if_branch	; ?branch ( IF )
	.word _sign_end		;
	doCHAR("-")		; 45 ( dl 45 )
	.word dw_HOLD		; HOLD ( dl )
_sign_end:
	.word dw_DROP		; DROP ( ) 
	.word dw_EXIT		; EXIT

	

	;; word:  #>
	;; alias: number-bkt
	;; flags: DOCOL ROM
	;; notes: #> ( w -- a n )
	;;        End conversion. Return string details.

	;; : #> ( d -- b u ) DROP HLD @ PAD OVER - ;

	.word dw_2DROP		; 2DROP ( )
	.word dw_HLD		; HLD ( va )
	.word dw_fetch		; @ ( a )
	.word dw_PAD		; PAD ( a a2 )
	.word dw_OVER		; OVER ( a a2 a )
	.word dw_sub		; - ( a n )
	.word dw_EXIT		; EXIT

	
	
// End of file.
