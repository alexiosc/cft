// -*- asm -*-
//
// Core stack primitives


	
	;; word:  RP@
	;; alias: RP-fetch
	;; flags: CODE ROM
	;; notes: RP@ ( -- a )
	;;   Push current RP to data stack.

	LOAD RP
	PUSH (SP)
	NEXT
	


	;; word:  RP!
	;; alias: RP-store
	;; flags: CODE ROM
	;; notes: RP! ( a -- )
	;;   Set the value of the RP.

	POP (SP)
	STORE RP
	NEXT
	


	;; word:  SP@
	;; alias: SP-fetch
	;; flags: CODE ROM
	;; notes: SP@ ( -- a )
	;;   Push current SP to data stack.

	LOAD SP
	PUSH (SP)
	NEXT
	


	;; word:  SP!
	;; alias: SP-store
	;; flags: CODE ROM
	;; notes: SP! ( a -- )
	;;   Set the value of the SP.

	POP (SP)
	STORE SP
	NEXT
	


	;; word:  >R
	;; alias: to-R
	;; flags: CODE ROM
	;; notes: >R ( n -- )
	;;   Pop value from data stack, push onto return stack.

	POP (SP)
	PUSH (RP)
	NEXT
	


	;; word:  R>
	;; alias: R-from
	;; flags: CODE ROM
	;; notes: R> ( n -- )
	;;   Pop value from return stack, push onto data stack.

	POP (RP)
	PUSH (SP)
	NEXT
	


	;; word:  R@
	;; alias: R-fetch
	;; flags: CODE ROM
	;; notes: R@ ( -- w )
	;;   Copy top of return stack to data stack

	SPEEK (RP)
	PUSH (SP)
	NEXT
	


	;; word:  RDUP
	;; flags: CODE ROM
	;; notes: RDUP ( n -- )
	;;   Duplicate the top value on the return stack.

	SPEEK (RP)
	PUSH (RP)
	NEXT
	


	;; word:  RDROP
	;; flags: CODE ROM
	;; notes: RDROP ( -- )
	;;   Drops a value from the return stack.

	POP(RP)
	NEXT
	


	;; word:  DROP
	;; flags: CODE ROM
	;; notes: DROP ( w -- )
	;;   Discard from the data stack.

	DECM (SP)
	NEXT
	


	;; word:  DUP
	;; flags: CODE ROM
	;; notes: DUP ( w -- w w )
	;;   Duplicate the top item on the stack.

	SPEEK (SP)
	PUSH (SP)
	NEXT
	


	;; word:  SWAP
	;; flags: CODE ROM
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
	;; flags: CODE ROM
	;; notes: OVER ( w1 w2 -- w1 w2 w1 )
	;;   Duplicate the second item on the data stack.

	SPEEKn (SP,2)		; Get item 2 on the data stack
	PUSH (SP)		; And push it.
	NEXT



	;; word:  ?DUP
	;; alias: if-DUP
	;; flags: CODE ROM
	;; notes: ?DUP ( w -- w w | 0 )
	;;   If w is non-zero, duplicate it.

	SPEEK (SP)		; Get top item of stack
	SNZ			; Non-zero?
	NEXT			; No. Bail out.
	PUSH (SP)		; Yes. Push w.
	NEXT



	;; word:  ROT
	;; flags: CODE ROM
	;; notes: ROT ( w1 w2 w3 -- w2 w3 w1 )
	;;        Rotate topmost 3 items on data stack to the left.

	RADD(SP, SP, MINUS3)	; SP -= 3
	STORE TMP0

	RMOV(TMP1, I SP)	; Peek at the three top values and store them.
	RMOV(TMP2, I SP)
	RMOV(TMP3, I SP)

	RADD(SP, SP, MINUS3)	; SP -= 3

	RMOV(I SP, TMP2)	; [SP++] = w2
	RMOV(I SP, TMP3)	; [SP++] = w3
	RMOV(I SP, TMP1)	; [SP++] = w1

	NEXT



	;; word:  -ROT
	;; alias: not-ROT
	;; flags: CODE ROM
	;; notes: ROT ( w1 w2 w3 -- w3 w1 w2 )
	;;        Rotate topmost 3 items on data stack to the right.

	RADD(SP, SP, MINUS3)	; SP -= 3
	STORE TMP0

	RMOV(TMP1, I SP)	; w1: Peek at the three top values and store them.
	RMOV(TMP2, I SP)	; w2
	RMOV(TMP3, I SP)	; w3

	RADD(SP, SP, MINUS3)	; SP -= 3

	RMOV(I SP, TMP3)	; [SP++] = w2
	RMOV(I SP, TMP1)	; [SP++] = w3
	RMOV(I SP, TMP2)	; [SP++] = w1

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
	
	POP(SP)
	SNZ			; 0? Bail out.
	NEXT
	STORE TMP1

	LI 1			; Get stack[sp - (n + 1)]
	ADD TMP1
	NEG
	ADD SP
	STORE TMP2
	LOAD I TMP2		; Get the value
	STORE TMP3

	LOAD TMP1
	NEG
	STORE I0		; Loop counter

	
	
	NEXT


	
	
	;; word:  DEPTH
	;; flags: CODE ROM
	;; notes: DEPTH ( -- n )
	;;   Returns the number of elements on the stack (before
	;;   execution of DEPTH).

	LOAD I UP		; The SP0 register is at mem[UP+0]
	NEG
	ADD SP			; Top - bottom
	PUSH(SP)
	NEXT
	

	
	;; word:  RDEPTH
	;; flags: CODE ROM
	;; notes: RDEPTH ( -- n )
	;;   Returns the number of elements on the return stack (before
	;;   execution of DEPTH).

	LOADUP(1)		; The RP0 reg is at mem[UP+1]
	NEG
	ADD RP			; Top - bottom
	PUSH(SP)
	NEXT

	
	
	;; word:  PICK
	;; flags: CODE ROM
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



	;; word:  RPICK
	;; flags: CODE ROM
	;; notes: RPICK ( +n -- w )
	;;   Returns the nth-from-the top element on the return stack. 0 PICK
	;;   returns the top element.

	SPEEK(SP)
	INC
	NOT
	ADD RP
	STORE TMP1		; TMP1 <- SP - (n + 1)
	LOAD I TMP1
	SPOKE(SP)
	NEXT



// End of file.
