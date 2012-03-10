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
	LOAD I TMP0		; AC <- mem[SP-1]
	STORE TMP2		; Temporary copy

	LOAD SP
	ADD MINUS2
	STORE TMP1		; TMP1 <- SP-2
	LOAD I TMP1		; AC <- mem[SP-2]
	STORE I TMP0		; mem[SP-1] = mem[SP-2]

	LOAD TMP2
	STORE I TMP1		; mem[SP-2] = TMP2

	NEXT
	


	;; word:  OVER
	;; flags: FFL_PRIMITIVE ROM
	;; notes: OVER ( w1 w2 -- w1 w2 w1 )
	;;   Duplicate the second item on the data stack.
	SPEEKn (SP,2)		; Get item 2 on the data stack
	PUSH (SP)		; And push it.
	NEXT


// End of file.
