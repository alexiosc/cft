// -*- asm -*-
//
// Tokenising words.



	;; word:  blindex
	;; flags: FFL_PRIMITIVE ROM CFT
	;; notes: blindex ( b c -- b )
	;;        Given a string with address b and a character c, returns the first
	;;        address >= b containing a token separator character (anything <= 32).
	;;        Returns zero if the character could not be found.

	RPOP (TMP1, SP)		; character
	RPOP (I0, SP)		; address

_blindex_loop:
	LOAD I I0		; Check a character
	SNZ			; Is it the terminating null?
	JMP _blindex_ret0	; Yes. Wrap up.
	
	ADD _minus32		; Compare against 32
	SPA			; <= 32?
	JMP _blindex_done	; Yes. Done.
	JMP _blindex_loop	; No. Loop again.

_blindex_done:
	RPUSH(SP, I0)		; Return I0

_blindex_ret0:
	LI 0
	PUSH(SP)
	NEXT



	;; word:  blskip
	;; flags: FFL_PRIMITIVE ROM
	;; notes: TOKEN ( -- )
	;;        Advances >IN past any white space.

_blskip_loop:
	LOAD I TIBP		; Load mem[>IN], autoincrement.
	SNZ			; Zero?
	JMP _blskin_end
	
	ADD _minus32
	SPA			; <=32?
	JMP _blskip_loop	; Yes.

_blskin_end:	
	DECM(TIBP)		; Decrement >IN.
	NEXT

	

	;; word:  $token
	;; alias: _token
	;; flags: FFL_PRIMITIVE ROM
	;; notes: $token ( -- +u )
	;;        Parses a token, starting with the current position of the
	;;        TIB. Returns the length of the token in characters.

	RPUSH(SP, TIBP)		; Push beginning of token.
	LI 0
	STORE TMP1		; Length counter
	
_token_loop:
	LOAD I TIBP		; Load mem[>IN], autoincrement.
	SNZ			; Zero?
	JMP _token_end		; Yes. Exit.
	
	ADD _minus32
	SPA			; >32?
	JMP _token_space	; No.

	ISZ TMP1		; Increment count
	JMP _token_loop		; Loop again.

_token_space:	
	;; It's a whitespace character. Null-terminate.
	DECM(TIBP)		; Decrement >IN.
	LI 0
	STORE I TIBP		; Store a null.

_token_end:
	RPUSH(SP, TMP1)		; Push length counter
	;; Also skip any trailing white space
	JMP _blskip_loop

_minus32:
	.word -32


	
// End of file.
	
