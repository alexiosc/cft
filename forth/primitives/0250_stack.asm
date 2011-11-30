// -*- asm -*-
//
// Define the NAME primitive

	;; word:  DROP
	;; flags: FFL_PRIMITIVE ROM
	;; notes: DROP ( word -- )
	;;   Drops a word from the stack
	TRAP T_POP
	RTF			; Return to Forth
	

	;; word:  DUP
	;; flags: FFL_PRIMITIVE ROM
	;; notes: DUP ( word -- word word )
	;;   Duplicates the top word on the stack.
	TRAP T_PEEK
	TRAP T_PUSH
	RTF			; Return to Forth

	
	;; word:  ?DUP
	;; alias: question-dup
	;; flags: FFL_PRIMITIVE ROM
	;; notes: ?DUP ( word -- word word )
	;;   Duplicates the top word on the stack if it is non-zero
	TRAP T_PEEK
	SZA
	TRAP T_PUSH
	RTF			; Return to Forth

	
	;; word:  SWAP
	;; flags: FFL_PRIMITIVE ROM
	;; notes: DUP ( word1 word2 -- word2 word1 )
	;;   Swaps the top two words on the stack.
	TRAP T_POP
	STORE R31		; word2
	TRAP T_POP
	STORE R30		; word1

	LOAD R31		; word2
	TRAP T_PUSH
	LOAD R30		; word1
	TRAP T_PUSH
	
	RTF			; Return to Forth

	
	;; word:  SP@
	;; alias: sp-fetch
	;; flags: FFL_PRIMITIVE ROM
	;; notes: SP@ ( -- word )
	;;   Pushes the address of the data stack pointer onto the stack itself.
	LOAD I R dstack		; Load the stack pointer
	TRAP T_PUSH		; Push
	RTF			; Return to Forth

	
	;; word:  SPMAX
	;; alias: SPMAX
	;; flags: FFL_PRIMITIVE ROM
	;; notes: SPMAX ( -- word )
	;;   Pushes the maximum address of the data stack pointer onto the stack itself.
	LOAD R dstack		; Load the stack pointer
	INC
	STORE TR0
	LOAD I TR0
	TRAP T_PUSH		; Push
	RTF			; Return to Forth

	
	;; word:  OVER
	;; alias: OVER
	;; flags: FFL_PRIMITIVE ROM
	;; notes: OVER ( a b -- a b a )
	;;   Push onto the stack the second topmost value.
	LI 1
	TRAP T_NPEEK
	TRAP T_PUSH
	RTF			; Return to Forth
	

	;; word:  PICK
	;; alias: PICK
	;; flags: FFL_PRIMITIVE ROM
	;; notes: PICK ( +n -- a )
	;;   Pushes the nth topmost value of the data stack back onto the stack.
	;;   0 PICK is equivalent to DUP.
	;;   1 PICK is equivalent to OVER.
	LI 1
	TRAP T_NPEEK
	TRAP T_PUSH
	RTF			; Return to Forth
	

	;; word:  ROT
	;; alias: ROT
	;; flags: FFL_PRIMITIVE ROM
	;; notes: ROT ( a b c -- b c a )
	;;   Rotates the topmost three stack values so that the third
	;;   topmost value becomes the top.
	;; 
	LI 2			; Verify stack depth and get the first number
	TRAP T_NPEEK
	STORE R31
	LOAD TR0		; SP-2 is the address of a
	ADD PLUS1
	STORE TIR0
	
	LOAD I TIR0		; Read b
	STORE R30
	LOAD I TIR0		; Read c
	STORE R29

	LOAD TR0
	STORE TIR0

	LOAD R30		; Store b in position SP-2
	STORE I TIR0
	LOAD R29		; Store c in position SP-1
	STORE I TIR0
	LOAD R31		; Store a in position SP
	STORE I TIR0
	RTF			; Return to Forth
	

	;; word:  ROLL
	;; alias: ROLL
	;; flags: FFL_PRIMITIVE ROM
	;; notes: ROLL ( n -- )
	;;   The n-th stack value (not counting n itself) is removed from the
	;;   stack and placed to the top. Values on top of the n-th one are moved
	;;   one down to accommodate this. For example, a b c d 2 ROLL gives a c d
	;;   b. 0 ROLL does nothing.
	;;

	TRAP T_POP		; Get the n value.
	STORE R30

	TRAP T_NPEEK		; Peek the stack and validate n
	STORE R29		; Store for later.

	LOAD TR0		; Address of the nth value
	STORE TIR1		; Store target address

	INC
	STORE TIR0		; Store source address

	LOAD R30
	STORE TR0		; Number of words to copy

	TRAP T_MEMCPY		; Copy TR0 words from TIR0 to TIR1.
	LOAD R29
	STORE I TIR1

	RTF			; Return to Forth
	

	;; word:  DEPTH
	;; alias: DEPTH
	;; flags: FFL_PRIMITIVE ROM
	;; notes: DEPTH ( -- n )
	;;   n is the number of 16-bit words on the data stack before n was pushed onto it.
	;;
	LOAD R dstack		; Subtract the start address of the stack from the SP.
	NEG
	ADD I R dstack
	ADD MINUS2		; The first two words in a stack are for housekeeping
	TRAP T_PUSH
	RTF			; Return to Forth
	

	
	;; word:  CLDSTACK
	;; alias: CLDSTACK
	;; flags: FFL_PRIMITIVE ROM
	;; notes: CLDSTACK ( -- )
	;;   Clears the data stack.
	;;
	LOAD R dstack
	ADD PLUS2
	STORE I R dstack
	RTF			; Return to Forth
	

// End of file.
