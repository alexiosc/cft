// -*- asm -*-
//
// Tokenising words.



	;; word:  blindex
	;; flags: CODE ROM CFT
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
	;; flags: CODE ROM
	;; notes: TOKEN ( -- )
	;;        Advances >IN past any white space.

	LOADUP(UAOFS_pIN)	; I0 := UP[>IN] (autoincrement reg)
	STORE I0
	
_blskip_loop:
	LOAD I I0		; Load mem[>IN], autoincrement.
	SNZ			; Zero?
	JMP _blskin_end
	
	ADD _minus32
	SPA			; <=32?
	JMP _blskip_loop	; Yes.

_blskin_end:
	LOAD I0
	ADD MINUS1		; Decrement >IN
	STORE I TMP0		; TMP0 still holds the address of >IN
	NEXT

	

	;; word:  $token
	;; alias: _token
	;; flags: CODE ROM
	;; notes: $token ( -- +u )
	;;        Parses a token, starting with the current position of the
	;;        TIB. Returns the length of the token in characters.

	LOADUP(UAOFS_pIN)	; I0 := UP[>IN] (autoincrement reg)
	STORE I0
	RPUSH(SP, I0)		; Push beginning of token.
	LI 0
	STORE TMP1		; Length counter
	
_token_loop:
	LOAD I I0		; Load mem[>IN], autoincrement.
	SNZ			; Zero?
	JMP _token_end		; Yes. Exit.
	
	ADD _minus32
	SPA			; >32?
	JMP _token_space	; No.

	ISZ TMP1		; Increment count
	JMP _token_loop		; Loop again.

_token_space:	
	;; It's a whitespace character. Null-terminate.
	LOAD I0
	ADD MINUS1		; Decrement >IN
	STORE I0
	LI 0
	STORE I I0		; [>IN++] = \0

	LOAD I0			; Save the index register value
	STORE I TMP0		; ... to the user variable

_token_end:
	RPUSH(SP, TMP1)		; Push length counter
	;; Also skip any trailing white space
	JMP _blskip_loop

_minus32:
	.word -32

	
	
// End of file.
	
