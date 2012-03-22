;; // -*- asm -*-
;; //
;; // rudimentary line editing and terminal buffering

	

	;; word:  $str
	;; alias: _str
	;; flags: DOCOL ROM CFT
	;; notes: DIGIT ( u -- b u )
	;;        Converts an integer to a signed string. Returns the string
	;;        address and length.

	.word dw_DUP		; DUP
	.word dw_to_r		; >R
	.word dw_ABS		; ABS
	.word dw_bkt_number	; <#
	.word dw_number_s	; #S
	.word dw_r_from		; R>
	.word dw_SIGN		; SIGN
	.word dw_number_bkt	; >#
	.word dw_EXIT		; EXIT

	

	;; word:  DECIMAL
	;; flags: PRIMITIVE ROM
	;; notes: DECIMAL ( -- )
	;;   Set base 10.

	LI 10
	STORE BASE
	NEXT


	
	;; word:  HEX
	;; flags: PRIMITIVE ROM
	;; notes: HEX ( -- )
	;;   Set base 16.

	LI 16
	STORE BASE
	NEXT



	;; word:  .R
	;; alias: dot_r
	;; flags: DOCOL ROM CFT
	;; notes: .R ( n +n -- )
	;;        Right-justify signed integer n in a field of +n characters.
	;;

	.word dw_to_r		; >R
	.word dw__str		; $str
	.word dw_r_from		; >R
	.word dw_OVER		; OVER
	.word dw_sub		; -
	.word dw_SPACES		; SPACES
	.word dw_TYPE		; TYPE
	.word dw_EXIT		; EXIT



	;; word:  U.R
	;; alias: u_dot_r
	;; flags: DOCOL ROM CFT
	;; notes: U.R ( u +n -- )
	;;        Right-justify unsigned integer u in a field of +n characters.
	;;

	.word dw_to_r		; >R
	.word dw_bkt_number	; <#
	.word dw_number_s	; #S
	.word dw_number_bkt	; #>
	.word dw_r_from		; R>
	.word dw_OVER		; OVER
	.word dw_sub		; -
	.word dw_SPACES		; SPACES
	.word dw_TYPE		; TYPE
	.word dw_EXIT		; EXIT



	;; word:  U.
	;; alias: u_dot
	;; flags: DOCOL ROM CFT
	;; notes: U. ( u -- )
	;;        Display an unsigned integer in free format
	;;

	.word dw_bkt_number	; <#
	.word dw_number_s	; #S
	.word dw_number_bkt	; #>
	.word dw_SPACE		; SPACE
	.word dw_TYPE		; TYPE
	.word dw_EXIT		; EXIT

	

	;; word:  .
	;; alias: dot
	;; flags: DOCOL ROM CFT
	;; notes: . ( w -- )
	;;        Display a signed integer in free format
	;;
	;; src:   : . ( w -- ) BASE @ 10 XOR IF U. EXIT THEN str SPACE TYPE ;

	.word dw_BASE		; BASE
	.word dw_fetch		; @
	.word dw_doLIT		; 10
	.word 10
	.word dw_XOR		; XOR
	.word dw_if_branch	; ?branch
	.word _dot_else
	.word dw_u_dot		; U.
	.word dw_EXIT		; EXIT
_dot_else:
	.word dw__str		; $str
	.word dw_SPACE		; SPACE
	.word dw_TYPE		; TYPE
	.word dw_EXIT		; EXIT

	

	;; word:  @.
	;; alias: fetch-dot
	;; flags: DOCOL ROM CFT
	;; notes: @. ( addr -- )
	;;        Prints out the contents of a memory cell.
	;;
	;; src:   : @. ( a -- ) @ . ;

	.word dw_fetch		; @
	.word dw_dot		; .
	.word dw_EXIT		; EXIT

// End of file.
