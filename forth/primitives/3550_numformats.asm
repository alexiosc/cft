;; // -*- asm -*-
;; //
;; // rudimentary line editing and terminal buffering

	

	;; word:  $str
	;; alias: _str
	;; flags: DOCOL ROM CFT
	;; notes: $str ( u -- b u )
	;;        Converts an integer to a signed string. Returns the string
	;;        address and length.

	.word dw_DUP		; DUP
	.word dw_to_R		; >R
	.word dw_ABS		; ABS
	.word dw_bkt_number	; <#
	.word dw_number_s	; #S
	.word dw_R_from		; R>
	.word dw_SIGN		; SIGN
	.word dw_number_bkt	; >#
	.word dw_EXIT		; EXIT

	

	;; word:  $ustr
	;; alias: _ustr
	;; flags: DOCOL ROM CFT
	;; notes: $str ( u -- b u )
	;;        Converts an unsigned integer to a string. Returns the string
	;;        address and length.

	.word dw_bkt_number	; <#
	.word dw_number_s	; #S
	.word dw_number_bkt	; #>
	.word dw_EXIT		; EXIT

	

	;; word:  BINARY
	;; flags: CODE ROM CFT
	;; notes: BINARY ( -- )
	;;   Set base 2.

	LSTOREUP(UAOFS_BASE, 2)
	NEXT


	
	;; word:  DECIMAL
	;; flags: CODE ROM
	;; notes: DECIMAL ( -- )
	;;   Set base 10.

	LSTOREUP(UAOFS_BASE, 10)
	NEXT


	
	;; word:  HEX
	;; flags: CODE ROM
	;; notes: HEX ( -- )
	;;   Set base 16.

	LSTOREUP(UAOFS_BASE, 16)
	NEXT



	;; word:  .R
	;; alias: dot_r
	;; flags: DOCOL ROM CFT
	;; notes: .R ( n +n -- )
	;;        Right-justify signed integer n in a field of +n characters.
	;;

	.word dw_to_R		; >R
	.word dw__str		; $str
	.word dw_R_from		; >R
	.word dw_OVER		; OVER
	.word dw_sub		; -
	.word dw_SPACES		; SPACES
	.word dw_TYPE		; TYPE
	.word dw_EXIT		; EXIT



	;; word:  .0R
	;; alias: dot_0r
	;; flags: DOCOL ROM CFT
	;; notes: .0R ( n +n -- )
	;;        Zero-pad a signed integer n to a length of +n characters.
	;;

	.word dw_to_R		; >R
	.word dw__str		; $str
	.word dw_R_from		; >R
	.word dw_OVER		; OVER
	.word dw_sub		; -
	.word dw_ZEROES		; ZEROES
	.word dw_TYPE		; TYPE

	.word dw_EXIT		; EXIT



	;; word:  U.R
	;; alias: u_dot_r
	;; flags: DOCOL ROM CFT
	;; notes: U.R ( u +n -- )
	;;        Right-justify unsigned integer u in a field of +n characters.
	;;

	.word dw_to_R		; >R
	.word dw_bkt_number	; <#
	.word dw_number_s	; #S
	.word dw_number_bkt	; #>
	.word dw_R_from		; R>
	.word dw_OVER		; OVER
	.word dw_sub		; -
	.word dw_SPACES		; SPACES
	.word dw_TYPE		; TYPE
	.word dw_EXIT		; EXIT



	;; word:  U.0R
	;; alias: u_dot_0r
	;; flags: DOCOL ROM CFT
	;; notes: U.R ( u +n -- )
	;;        Zero-fill unsigned integer u to a length of +n characters.
	;;

	.word dw_to_R		; >R ( u )
	.word dw_bkt_number	; <#
	.word dw_number_s	; #S
	.word dw_number_bkt	; #> ( a n )
	.word dw_R_from		; R> ( a n u )
	.word dw_OVER		; OVER ( a n u n )
	.word dw_sub		; - ( a n pad )
	.word dw_ZEROES		; ZEROES ( a n )
	.word dw_TYPE		; TYPE ( )

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
	;; src:   : . ( w -- ) BASE @ 10 XOR IF U. EXIT THEN $str SPACE TYPE ;

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
