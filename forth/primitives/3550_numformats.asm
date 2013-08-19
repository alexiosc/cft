;; // -*- asm -*-
;; //
;; // rudimentary line editing and terminal buffering

	

	;; word:  _N$
	;; alias: _Nstr
	;; flags: DOCOL ROM CFT
	;; notes: _N$ ( u -- b u )
	;;        Converts an integer to an unpacked string. Returns the string
	;;        address and length.

	.word dw_DUP		; DUP ( u u )
	.word dw_to_R		; >R ( u )
	.word dw_ABS		; ABS ( u )
	.word dw_U_bkt_number	; U<# ( u 0 )
	.word dw_number_s	; #S ( 0 0 )
	.word dw_R_from		; R> ( 0 0 u )
	.word dw_N_to_D		; N>D ( 0 0 d )
	.word dw_SIGN		; SIGN ( 0 0 )
	.word dw_number_bkt	; #> ( )
	.word dw_EXIT		; EXIT

	

	;; word:  _U$
	;; alias: _Ustr
	;; flags: DOCOL ROM CFT
	;; notes: _U$ ( u -- b u )
	;;        Converts an unsigned integer to a string. Returns the string
	;;        address and length.

	.word dw_U_to_D		; U>D ( d )
	.word dw_branch
	.word _DUstr_jumpin

	

	;; word:  $DUstr
	;; alias: _DUstr
	;; flags: DOCOL ROM CFT
	;; notes: $DUstr ( d -- b u )
	;;        Converts an unsigned double integer to a string. Returns the string
	;;        address and length.

_DUstr_jumpin:	
	.word dw_bkt_number	; <#
	.word dw_number_s	; #S
	.word dw_number_bkt	; #>
	.word dw_EXIT		; EXIT

	

	;; word:  _D$
	;; alias: _Dstr
	;; flags: DOCOL ROM CFT
	;; notes: D$str ( d -- b u )
	;;        Converts a double integer to a signed string. Returns the string
	;;        address and length.

	.word dw_2DUP		; 2DUP ( dl dh dl dh )
	.word dw_to_R		; >R ( dl dh dl ) ( dh )
	.word dw_to_R		; >R ( dl dh ) ( dh dl )
	.word dw_DABS		; ABS ( dl dh )
	.word dw_bkt_number	; <# ( dl dh)
	.word dw_number_s	; #S ( 0 0 )
	.word dw_R_from		; R> ( 0 0 dl )
	.word dw_R_from		; R> ( 0 0 dl dh )
	.word dw_SIGN		; SIGN ( 0 0 )
	.word dw_number_bkt	; ># ( )
	.word dw_EXIT		; EXIT

	

	;; word:  BINARY
	;; flags: CODE ROM CFT
	;; notes: BINARY ( -- )
	;;   Set base 2.

	LSTOREUP(UAOFS_BASE, 2)
	NEXT

	

	;; word:  OCTAL
	;; flags: CODE ROM CFT
	;; notes: OCTAL ( -- )
	;;   Set base 8.

	LSTOREUP(UAOFS_BASE, 8)
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
	.word dw__Nstr		; _N$
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
	.word dw__Nstr		; _N$
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
	doLIT(0)		; 0 \ set high cell
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
	doLIT(0)		; 0 \ set high cell
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
	;; code:  : U. ( u -- ) 0 DU. ;

	doLIT(0)
	.word dw_branch
	.word _DU_dot_jumpin



	;; word:  DU.
	;; alias: DU_dot
	;; flags: DOCOL ROM CFT
	;; notes: DU. ( d -- )
	;;        Display an unsigned double integer in free format
	;;

_DU_dot_jumpin:	
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
	.word dw__Nstr		; _N$
	.word dw_SPACE		; SPACE
	.word dw_TYPE		; TYPE
	.word dw_EXIT		; EXIT

	

	;; word:  D.
	;; alias: D_dot
	;; flags: DOCOL ROM CFT
	;; notes: D. ( d -- )
	;;        Display a signed double integer in free format
	;;
	;; src:   : D. ( w -- ) BASE @ 10 XOR IF U. EXIT THEN $str SPACE TYPE ;

	.word dw_BASE		; BASE
	.word dw_fetch		; @
	.word dw_doLIT		; 10
	.word 10
	.word dw_XOR		; XOR
	.word dw_if_branch	; ?branch
	.word _d_dot_else
	.word dw_DU_dot		; DU.
	.word dw_EXIT		; EXIT
_d_dot_else:
	.word dw__Dstr		; D$str
	.word dw_SPACE		; SPACE
	.word dw_TYPE		; TYPE
	.word dw_EXIT		; EXIT

	
	
// End of file.
