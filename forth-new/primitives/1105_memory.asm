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
	PUSH SP
	NEXT



	;; word:  @EXECUTE
	;; alias: fetch-EXECUTE
	;; flags: CODE ROM
	;; notes: @EXECUTE ( a -- )
	;;        If a is non-zero, assume it's a word address and execute it.
	;; code:  : @EXECUTE ( a -- ) @ ?DUP IF EXECUTE THEN ; \ Equivalent

	POP SP		   	; Get the address of the vector
	STORE TMP0		; Dereference the vector to get the address
	LOAD I TMP0		;    of the word to execute.
_fetch_execute:
	SNZ			; Is it zero?
	NEXT			; Yes. Ignore it.
	JMPII TMP0		; Jump into.



	;; word:  2!
	;; alias: two-store
	;; flags: CODE ROM
	;; notes: 2! ( d a -- )
	;;   Stores the 32-bit integer d at address a (low) and a+1 (high).

	RPOP (I0, SP)		; Pop the address
	RPOP (I I0, SP)		; Store d high
	RPOP (I I0, SP)		; Store d low
	NEXT



	;; word:  2@
	;; alias: two-fetch
	;; flags: CODE ROM
	;; notes: 2@ ( a -- d )
	;;   Fetches a 32-bit integer from address a.

	RPOP (I0, SP)		; Address
	RPUSH (SP, I I0)	; Push low
	RPUSH (SP, I I0)	; Push high
	NEXT



	;; word:  +FLAG!
	;; alias: set_FLAG_store
	;; flags: CODE ROM
	;; notes: +FLAG! ( u a -- )
	;;        The value at address a is ORred with u in-place.

	RPOP(TMP0, SP)		; TMP0 = a
	POP SP			; u

	OR I TMP0		; u | mem[a]
	STORE I TMP0		; mem[a] = u | mem[a]
	NEXT



	;; word:  -FLAG!
	;; alias: clear_FLAG_store
	;; flags: CODE ROM
	;; notes: -FLAG! ( u a -- )
	;;        The value at address a is ANDed with (NOT u) in-place.

	RPOP(TMP0, SP)		; TMP0 = a
	POP SP			; u
	XOR MINUS1		; ~u (faster than NOT)

	AND I TMP0		; ~u & mem[a]
	STORE I TMP1		; mem[a] = mem[a] & ~u
	NEXT



// End of file.
