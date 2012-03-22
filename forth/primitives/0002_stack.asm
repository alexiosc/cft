// -*- asm -*-
//
// Core stack primitives

	;; word:  RP@
	;; alias: rp-at
	;; flags: FFL_PRIMITIVE ROM
	;; notes: RP@ ( -- a )
	;;   Push current RP to data stack.
	LOAD RP
	PUSH (SP)
	NEXT
	


	;; word:  RP!
	;; alias: rp-store
	;; flags: FFL_PRIMITIVE ROM
	;; notes: RP! ( a -- )
	;;   Set the value of the RP.
	POP (SP)
	STORE RP
	NEXT
	


	;; word:  SP@
	;; alias: sp-at
	;; flags: FFL_PRIMITIVE ROM
	;; notes: SP@ ( -- a )
	;;   Push current SP to data stack.
	LOAD SP
	PUSH (SP)
	NEXT
	


	;; word:  SP!
	;; alias: sp-store
	;; flags: FFL_PRIMITIVE ROM
	;; notes: SP! ( a -- )
	;;   Set the value of the SP.
	POP (SP)
	STORE SP
	NEXT
	


	;; word:  >R
	;; alias: to-r
	;; flags: FFL_PRIMITIVE ROM
	;; notes: >R ( n -- )
	;;   Pop value from data stack, push onto return stack.
	POP (SP)
	PUSH (RP)
	NEXT
	


	;; word:  R>
	;; alias: r-from
	;; flags: FFL_PRIMITIVE ROM
	;; notes: R> ( n -- )
	;;   Pop value from return stack, push onto data stack.
	POP (RP)
	PUSH (SP)
	NEXT
	


	;; word:  R@
	;; alias: r-fetch
	;; flags: FFL_PRIMITIVE ROM
	;; notes: R@ ( -- w )
	;;   Copy top of return stack to data stack
	SPEEK (RP)
	PUSH (SP)
	NEXT
	


	;; word:  RDUP
	;; flags: FFL_PRIMITIVE ROM
	;; notes: RDUP ( n -- )
	;;   Duplicate the top value on the return stack.
	SPEEK (RP)
	PUSH (RP)
	NEXT
	


	;; word:  DROP
	;; flags: FFL_PRIMITIVE ROM
	;; notes: DROP ( w -- )
	;;   Discard from the data stack.
	DECM (SP)
	NEXT
	


	;; word:  2DROP
	;; flags: FFL_PRIMITIVE ROM
	;; notes: 2DROP ( w1 w2 -- )
	;;   Discard two items from the data stack.
	LDECn (SP,2)
	NEXT
	


	;; word:  DUP
	;; flags: FFL_PRIMITIVE ROM
	;; notes: DUP ( w -- w w )
	;;   Duplicate the top item on the stack.
	SPEEK (SP)
	PUSH (SP)
	NEXT
	


	;; word:  SWAP
	;; flags: FFL_PRIMITIVE ROM
	;; notes: SWAP ( w1 w2 -- w2 w1 )
	;;   Duplicate the top item on the stack.
	LOAD SP
	ADD MINUS1
	STORE TMP0		; Store for indirection
	RMOV(TMP2, I TMP0)	; Temporary copy

	LOAD SP
	ADD MINUS2
	STORE TMP1		; TMP1 <- SP-2
	
	RMOV (I TMP0, I TMP1)	; mem[SP-1] = mem[SP-2]
	RMOV(I TMP1, TMP2)	; mem[SP-2] = TMP2

	NEXT
	


	;; word:  OVER
	;; flags: FFL_PRIMITIVE ROM
	;; notes: OVER ( w1 w2 -- w1 w2 w1 )
	;;   Duplicate the second item on the data stack.
	SPEEKn (SP,2)		; Get item 2 on the data stack
	PUSH (SP)		; And push it.
	NEXT



	;; word:  ?DUP
	;; alias: if-dup
	;; flags: FFL_PRIMITIVE ROM
	;; notes: ?DUP ( w -- w w | 0 )
	;;   If w is non-zero, duplicate it.
	SPEEK (SP)		; Get top item of stack
	SNZ			; Non-zero?
	NEXT			; No. Bail out.
	PUSH (SP)		; Yes. Push w.
	NEXT



	;; word:  ROT
	;; flags: FFL_PRIMITIVE ROM
	;; notes: ROT ( w1 w2 w3 -- w2 w3 w1 )
	;;   If w is non-zero, duplicate it.
	LOAD SP			; SP -= 3
	ADD MINUS3
	STORE SP
	STORE TMP0

	RMOV(TMP1, I SP)	; Peek at the three top values and store them.
	RMOV(TMP2, I SP)
	RMOV(TMP3, I SP)

	LOAD SP			; SP -= 3
	ADD MINUS3
	STORE SP

	RMOV(I SP, TMP2)	; [SP++] = w2
	RMOV(I SP, TMP3)	; [SP++] = w3
	RMOV(I SP, TMP1)	; [SP++] = w1

	NEXT

	
	;; word:  2DUP
	;; flags: FFL_PRIMITIVE ROM
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

	

	;; word:  DEPTH
	;; flags: FFL_PRIMITIVE ROM
	;; notes: DEPTH ( -- n )
	;;   Returns the number of elements on the stack (before
	;;   execution of DEPTH).

	LOAD SP0		; Bottom of stack
	NEG
	ADD SP			; Top - bottom
	PUSH(SP)
	NEXT
	

	
	;; word:  PICK
	;; flags: FFL_PRIMITIVE ROM
	;; notes: PICK ( +n -- w )
	;;   Returns the nth-from-the top element on the stack. 0 PICK
	;;   returns the top element.

	SPEEK(SP)
	INC
	NOT
	ADD SP
	STORE TMP1		; TMP1 <- SP - (n + 1)
	LOAD I TMP1
	SPOKE(SP)
	NEXT



// End of file.
