// -*- asm -*-
//
// Double math

	;; word:  DNEGATE
	;; flags: FFL_PRIMITIVE ROM
	;; notes: NEGATE ( d -- -d )
	;;   Negate double-word d (two's complement)
	LOAD SP			; SP -= 3
	ADD MINUS2
	STORE SP

	LOAD I SP		; Low word
	NEG			; negate low word. Sets L if necessary.
	STORE TMP1

	LOAD I SP		; High word
	OP1 IFL INC		; if carry: high word++
	STORE TMP2

	LOAD SP			; SP -= 2
	ADD MINUS2
	STORE SP

	LOAD TMP1		; Store it back
	STORE I SP
	LOAD TMP2
	STORE I SP

	NEXT
	
	;; word:  D+
	;; flags: FFL_PRIMITIVE ROM
	;; notes: D+ ( d d -- d )
	;;   Add two double-words
	// TODO
	
// End of file.
