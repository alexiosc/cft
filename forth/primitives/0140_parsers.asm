// -*- asm -*-
//
// Tokenising words.



	;; word:  .(
	;; alias: dot-paren
	;; flags: DOCOL ROM CFT IMMEDIATE
	;; notes: .( ( -- )
	;;        Used as .( foo). Prints out the string inside the
        ;;        parentheses. The space is not part of the string.
	;; code:  : .( 41 PARSE TYPE ; IMMEDIATE

	doCHAR(")")		; 41
	.word dw_PARSE		; PARSE
	.word dw_TYPE		; TYPE
	.word dw_EXIT		; EXIT



	;; word:  (
	;; alias: comment
	;; flags: DOCOL ROM CFT IMMEDIATE
	;; notes: ( ( -- )
	;;        Ignores characters until the closing ) is seen. Used
	;;        for comments.
	;; code:  : .( 41 PARSE ; IMMEDIATE

	doCHAR(")")		; 41
	.word dw_PARSE		; PARSE ( b u )
	.word dw_2DROP		; 2DROP ( )
	.word dw_EXIT		; EXIT



	;; word:  \
	;; alias: line_comment
	;; flags: DOCOL ROM CFT IMMEDIATE
	;; notes: \ ( -- )
	;;        Ignores the remainder of the input buffer.
	;;        Null-terminates the input buffer.

	doLIT(0)		; 0  ( 0 ) 
	.word dw_DUP		; DUP ( 0 0 )
	.word dw_TIB		; TIB ( 0 0 va )
	.word dw_fetch		; @ ( 0 0 tib-addr )
	.word dw_two_store	; 2! ( )
	
	.word dw_TIB		; TIB ( va )
	.word dw_fetch		; @ ( tib-addr )
	.word dw_pIN		; >IN ( tib-addr a )
	.word dw_store		; ! ( ) \ >IN <- TIB
	.word dw_EXIT		; EXIT



	;; word:  CHAR
	;; flags: DOCOL ROM CFT IMMEDIATE
	;; notes: CHAR ( -- c )
	;;        Parse a space-delimited token and return its first character.

	.word dw_BL		; BL
	.word dw_PARSE		; PARSE
	.word dw_DROP		; DROP
	.word dw_c_fetch	; C@ ( which is really @ here)
	.word dw_EXIT		; EXIT



	;; word:  WORD
	;; flags: DOCOL ROM CFT IMMEDIATE
	;; notes: WORD ( c -- a )
	;;        Parse a c-delimited token and pack it into a bit-packed
	;;        string. Return its starting address (which will be HERE).

	.word dw_PARSE		; PARSE ( b u )
	.word dw_HERE		; HERE ( b u a )
	.word dw__cPACK		; $cPACK ( a3 a4 )
	.word dw_HERE		; HERE ( b u a )
	.word dw_EXIT		; EXIT

	
	

// End of file.
	
