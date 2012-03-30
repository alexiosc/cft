// -*- asm -*-
//
// Tokenising words.



	;; word:  $parse
	;; alias: _parse
	;; flags: CODE ROM CFT
	;; notes: $PARSE ( b c  -- b u )
	;; 	  Ignores any leading characters with codepoint c, then parses
        ;; 	  a token (starting at address b until the first codepoint c
	;;        is seen again. Returns the address of the token and its
	;;        length. Returns b=0 and u=0 if there is no more input.

	//DEBUGON
	RPOP(TMP1, SP)		; TMP1=c
	RPOP(I0, SP)		; I0=b

	LI 0
	STORE TMP2		; TMP2 = return address
	STORE TMP4		; TMP4 = return length

	;; Step 1. Skip over any leading instances of c.
_parse_loop0:
	LOAD I I0		; Load mem[I0], autoincrement.
	SNZ			; Zero?
	JMP _parse_end		; Yes. We're done.
	
	XOR TMP1		; Compare against c
	SNZ			; Equal?
	JMP _parse_loop0	; Yes. Loop.

	;; Step 2. Parse the token.
	RADD(TMP3, I0, MINUS1)  ; TMP3 = TIBP - 1 (keep pointer for later)
	LI 1
	STORE TMP4		; TMP4 = count (already one)

_parse_loop1:
	LOAD I I0		; Next character
	SNZ			; Zero?
	JMP _parse_end		; Done.

	XOR TMP1		; Compare against c
	SNZ			; Equal?
	JMP _parse_end		; Yes.

	ISZ TMP4		; Increment TMP4.
	JMP _parse_loop1	; Loop again.

_parse_end:
	RPUSH(SP, TMP3)		; Push address of token.
	RPUSH(SP, TMP4)		; Push length of token.
	//DEBUGOFF
	NEXT

	
	
	;; word:  PARSE
	;; flags: DOCOL ROM
	;; notes: PARSE ( c  -- b u )
	;; 	  Ignores any leading characters with codepoint c, then parses
        ;; 	  a token (starting at IN>) until the first codepoint c
	;;        is seen again. Returns the address of the token and its
	;;        length. Returns b=0 and u=0 if there is no more input.

	.word dw_pIN		; >IN ( c a )
	.word dw_fetch		; @ ( c b )
	.word dw_SWAP		; SWAP ( b c )
	.word dw__parse		; $parse ( b u )
	.word dw_2DUP		; DUP ( b u b u )
	.word dw_add		; + ( b u b+u )
	.word dw_inc		; 1+ ( b u b+u+1 )
	
	.word dw_pIN		; >IN ( b u b+u a )
	.word dw_store		; ! ( b u)
	.word dw_EXIT


	
// End of file.

