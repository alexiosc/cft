// -*- asm -*-
//
// Stack handling for double numbers
	;; word:  2DROP
	;; flags: CODE ROM
	;; notes: 2DROP ( w1 w2 -- )
	;;   Discard two items from the data stack.

	LDECn (SP,2)
	NEXT
	


	;; word:  2DUP
	;; flags: CODE ROM
	;; notes: 2DUP ( w1 w2 -- w1 w2 w1 w2 )
	;;   Duplicate pair-wise the two top items on the stack.

	LOAD SP			; SP -= 3
	ADD MINUS2
	STORE SP
	STORE TMP0

	RMOV(TMP1, I SP)	; Peek at the two top values and store them.
	RMOV(TMP2, I SP)	; Peek at the two top values and store them.

	RPUSH(SP, TMP1)
	RPUSH(SP, TMP2)

	NEXT
	


	;; word:  2OVER
	;; flags: CODE ROM
	;; notes: 2OVER ( w1l w1h w2l w2h -- w1l w1h w2l w2h w1l w1h )
	;;        Duplicate pair-wise the second-to-top items on the stack.
	;;        Works like OVER with two double numbers at the top of the
	;;        stack.

	// TODO: complete this.
	FAIL
	LOAD SP			; SP -= 5
	ADD MINUS2
	STORE SP
	STORE TMP0

	RMOV(TMP1, I SP)	; Peek at the two top values and store them.
	RMOV(TMP2, I SP)	; Peek at the two top values and store them.

	RPUSH(SP, TMP1)
	RPUSH(SP, TMP2)

	NEXT


	;; TODO: DMIN DMAX D0= D2/ D< D<= DU<



// End of file.
