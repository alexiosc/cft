// -*- asm -*-
//
// Slightly more complex memory primitives than in core. Still in Assembly.

	
	
	;; word:  HERE
	;; flags: CODE ROM
	;; notes: HERE ( -- a )
	;;   Returns the address of the first available cell in the user dictionary.

	RPUSH(SP, CP)
	NEXT



	;; word:  PAD
	;; flags: CODE ROM
	;; notes: PAD ( -- a )
	;;   Returns the address of the first available cell for scratch use.

	LI 80
	ADD CP
	PUSH(SP)
	NEXT



	;; word:  @EXECUTE
	;; alias: fetch-EXECUTE
	;; flags: CODE ROM
	;; notes: @EXECUTE ( a -- )
	;;        If a is non-zero, assume it's a word address and execute it.
	;; code:  : @EXECUTE ( a -- ) @ ?DUP IF EXECUTE THEN ; \ Equivalent

	POP(SP)		   	; Get the address of the vector
	STORE TMP0		; Dereference the vector to get the address
	LOAD I TMP0		;    of the word to execute.
	SNZ			; Is it zero?
	NEXT			; Yes. Ignore it.
	STORE TMP0
	JMP I TMP0		; No. Jump to it.



	;; word:  2!
	;; alias: two-store
	;; flags: CODE ROM
	;; notes: 2! ( d a -- )
	;;   Stores the 32-bit integer d at address a (low) and a+1 (high).

	POP (SP)		; Pop the address
	STORE I0

	LOAD SP			; SP -= 2
	ADD MINUS2
	STORE SP
	STORE I1

	RMOV(I I0, I I1)	; Set both cells
	RMOV(I I0, I I1)

	NEXT



	;; word:  2@
	;; alias: two-fetch
	;; flags: CODE ROM
	;; notes: 2@ ( a -- d )
	;;   Fetches a 32-bit integer from address a.

	SPEEK (SP)
	STORE I0

	LOAD I I0		; Fetch low
	SPOKE0 (SP)

	LOAD I I0		; Fetch high
	PUSH (SP)

	NEXT



// End of file.
