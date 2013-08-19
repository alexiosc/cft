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



	;; word:  ."
	;; alias: dot-quote
	;; flags: DOCOL ROM CFT IMMEDIATE COMPILE
	;; notes: ." ( -- )
	;;        Used as ." foo". Compiles a bit-packed, null-terminated string
	;;        such that when executed, the address of the string is left on
	;;        the stack.

	doLIT(dw_doPSTR)	; [COMPILE] doPSTR ( a )
	.word dw_comma		; , ( )
	.word dw_comma_str	; ," ( )
	doLIT(dw_typep0)
	.word dw_comma		; ,
	.word dw_EXIT		; EXIT



	;; word:  "
	;; alias: quote
	;; flags: DOCOL ROM CFT IMMEDIATE COMPILE
	;; notes: ." ( -- )
	;;        Used as ." foo". Compiles a bit-packed, null-terminated string
	;;        such that when executed, the address of the string is left on
	;;        the stack.

	doLIT(dw_doPSTR)	; [COMPILE] doPSTR ( a )
	.word dw_comma		; , ( )
	.word dw_comma_str	; ," ( )
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
	;;        Ignores the remainder of the line.
	;; code:  : \ ( -- ) #TIB @ >IN ! ;

	doCHAR(10)		; 10
	.word dw_PARSE		; PARSE ( b u )
	.word dw_2DROP		; 2DROP ( )
	.word dw_EXIT		; EXIT



	;; word:  CHAR
	;; flags: DOCOL ROM CFT
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
	.word dw_2DROP		; 2DROP ( )
	.word dw_HERE		; HERE ( a )

	;; .word dw_DUP
	;; doLIT(8)
	;; .word dw_DUMP
	;; .word dw_DROP

	;; .word dw_DEBUGOFF
	;; .word dw_DUP
	;; .word dw_CCOUNT
	;; .word dw_dot_s
	;; .word dw_CR
	
	
	.word dw_EXIT		; EXIT



	;; word:  TOKEN
	;; flags: DOCOL ROM
	;; notes: TOKEN ( -- addr | 0 )
	;;        Parse a token and prepare it for dictionary search.
	;;        Return its address, or 0 if no more tokens are available.

	;; .word dw_pstate
	.word dw_BL		; BL
	.word dw_PARSE		; PARSE ( b u )

	.word dw_DUP		; DUP ( b u u )
	.word dw_if_branch	; ( b u )
	.word _token_empty

	.word dw_HERE		; HERE ( b u a )
	.word dw__cPACK		; $cPACK ( a3 a4 )
	.word dw_2DROP		; 2DROP ( )
	.word dw_HERE		; HERE ( a )
	.word dw_pstrupper	; pSTRUPPER ( a )

	.word dw_EXIT		; EXIT

_token_empty:
	.word dw_SWAP
	.word dw_DROP
	.word dw_EXIT



	;; word:  '
	;; alias: tick
	;; flags: DOCOL ROM
	;; notes: ' ( -- addr )
	;;        Return the address of the word represented by the next token.
	;;        If the word isn't found, raise an error.

	.word dw_TOKEN		; TOKEN ( addr )
	.word dw_FIND		; FIND ( addr f )
	.word dw_if_branch	; ?branch ( addr )
	.word _tick_fail
	.word dw_EXIT
	
_tick_fail:
	.word dw_THROW

	

// End of file.

