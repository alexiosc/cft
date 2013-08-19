// -*- asm -*-
//
// Core stack primitives


	
	;; word:  RP@
	;; alias: RP-fetch
	;; flags: CODE ROM
	;; notes: RP@ ( -- a )
	;;   Push current RP to data stack.

	LOAD RP
	PUSH SP
	NEXT
	


	;; word:  RP!
	;; alias: RP-store
	;; flags: CODE ROM
	;; notes: RP! ( a -- )
	;;   Set the value of the RP.

	POP SP
	STORE RP
	NEXT
	


	;; word:  SP@
	;; alias: SP-fetch
	;; flags: CODE ROM
	;; notes: SP@ ( -- a )
	;;   Push current SP to data stack.

	LOAD SP
	PUSH SP
	NEXT
	


	;; word:  SP!
	;; alias: SP-store
	;; flags: CODE ROM
	;; notes: SP! ( a -- )
	;;   Set the value of the SP.

	POP SP
	STORE SP
	NEXT
	


	;; word:  >R
	;; alias: to-R
	;; flags: CODE ROM
	;; notes: >R ( n -- )
	;;   Pop value from data stack, push onto return stack.

	POP SP
	PUSH RP
	NEXT
	


	;; word:  R>
	;; alias: R-from
	;; flags: CODE ROM
	;; notes: R> ( n -- )
	;;   Pop value from return stack, push onto data stack.

	POP RP
	PUSH SP
	NEXT
	


	;; word:  R@
	;; alias: R-fetch
	;; flags: CODE ROM
	;; notes: R@ ( -- w )
	;;   Copy top of return stack to data stack

	POP RP
	PUSH RP
	PUSH SP
	NEXT
	


	;; word:  RDUP
	;; flags: CODE ROM
	;; notes: RDUP ( n -- )
	;;   Duplicate the top value on the return stack.

	POP RP
	PUSH RP
	PUSH RP
	NEXT
	


	;; word:  RDROP
	;; flags: CODE ROM
	;; notes: RDROP ( -- )
	;;   Drops a value from the return stack.

	POP RP
	NEXT
	


	;; word:  DROP
	;; flags: CODE ROM
	;; notes: DROP ( w -- )
	;;   Discard from the data stack.

	POP SP
	NEXT
	


	;; word:  DUP
	;; flags: CODE ROM
	;; notes: DUP ( w -- w w )
	;;   Duplicate the top item on the stack.

	POP SP
	PUSH SP
	PUSH SP
	NEXT
	


	;; word:  SWAP
	;; flags: CODE ROM
	;; notes: SWAP ( w1 w2 -- w2 w1 )
	;;   Swap the top two items on the stack.

	RPOP(TMP0, SP)
	RPOP(TMP1, SP)

	RPUSH(SP, TMP0)
	RPUSH(SP, TMP1)
	NEXT
	


	;; word:  OVER
	;; flags: CODE ROM
	;; notes: OVER ( w1 w2 -- w1 w2 w1 )
	;;   Duplicate the second item on the data stack.

	RPOP(TMP0, SP)		; w2
	RPOP(TMP1, SP)		; w1

	RPUSH(SP, TMP1)		; ( w1 )
	RPUSH(SP, TMP0)		; ( w1 w2 )
	RPUSH(SP, TMP1)		; ( w1 w2 w1 )
	NEXT



	;; word:  ?DUP
	;; alias: if-DUP
	;; flags: CODE ROM
	;; notes: ?DUP ( w -- w w | 0 )
	;;   If w is non-zero, duplicate it.

	POP SP
	SZA
	PUSH SP			; Non-zero. Duplicate
	PUSH SP			; Otherwise, push it back
	NEXT

	

	;; word:  ROT
	;; flags: CODE ROM
	;; notes: ROT ( w1 w2 w3 -- w2 w3 w1 )
	;;        Rotate topmost 3 items on data stack to the left.

	RPOP(TMP2, SP)		; w3
	RPOP(TMP1, SP)		; w2
	RPOP(TMP0, SP)		; w1

	RPUSH(SP, TMP1)		; w2
	RPUSH(SP, TMP2)		; w3
	RPUSH(SP, TMP0)		; w1

	NEXT



	;; word:  -ROT
	;; alias: not-ROT
	;; flags: CODE ROM
	;; notes: -ROT ( w1 w2 w3 -- w3 w1 w2 )
	;;        Rotate topmost 3 items on data stack to the right.

	RPOP(TMP2, SP)		; w3
	RPOP(TMP1, SP)		; w2
	RPOP(TMP0, SP)		; w1

	RPUSH(SP, TMP2)		; w3
	RPUSH(SP, TMP0)		; w1
	RPUSH(SP, TMP1)		; w2

	NEXT



	;; word:  ROLL
	;; flags: CODE ROM
	;; notes: ROLL ( +n -- )
	;;        The +nth stack value, not counting +n itself is first removed
        ;;        and then transferred to the top of the stack, moving the
        ;;        remaining values into the vacated position.  {0..the number
        ;;        of elements on the stack-1}
	;;	
	;;        2 ROLL is equivalent to ROT
	;;        0 ROLL is a null operation

	;; TODO: complete this.
	FAIL


	
	
	;; word:  DEPTH
	;; flags: CODE ROM
	;; notes: DEPTH ( -- n )
	;;   Returns the number of elements on the stack (before
	;;   execution of DEPTH).

	LOAD I UP		; The SP0 register is at mem[UP+0]
	NEG
	ADD SP			; Top - bottom
	PUSH SP
	NEXT
	

	
	;; word:  RDEPTH
	;; flags: CODE ROM
	;; notes: RDEPTH ( -- n )
	;;   Returns the number of elements on the return stack (before
	;;   execution of DEPTH).

	LOADUP(1)		; The RP0 reg is at mem[UP+1]
	NEG
	ADD RP			; Top - bottom
	PUSH SP
	NEXT

	
	
	;; word:  PICK
	;; flags: CODE ROM
	;; notes: PICK ( +n -- w )
	;;   Returns the nth-from-the top element on the stack. 0 PICK
	;;   returns the top element.

	POP SP			; SP now points to top of stack + 1
	ING			; -(n+1), offset the +1
	ADD SP			; SP - (n + 1)
	STORE TMP0		; TMP0 <- SP - (n + 1)
	LOAD I TMP0
	PUSH SP
	NEXT



	;; word:  RPICK
	;; flags: CODE ROM
	;; notes: RPICK ( +n -- w )
	;;   Returns the nth-from-the top element on the return stack. 0 PICK
	;;   returns the top element.

	POP SP
	ING			; -(n+1), offset the +1
	ADD RP			; RP - (n + 1)
	STORE TMP0		; TMP0 <- RP - (n + 1)
	LOAD I TMP0
	PUSH SP
	NEXT

	

// End of file.
