// -*- asm -*-
//
// Slightly more complex memory primitives than in core. Still in Assembly.

	;; word:  CELL-
	;; alias: cell-dec
	;; copy:  dec
	;; flags: FFL_PRIMITIVE ROM
	;; notes: CELL- ( a -- a )
	;;   Decrement memory address a by 1 cell.



	;; word:  CELL+
	;; alias: cell-inc
	;; copy:  inc
	;; flags: FFL_PRIMITIVE ROM
	;; notes: CELL+ ( a -- a )
	;;   Increment memory address a by 1 cell.



	;; word:  CELLS
	;; copy:  NOP
	;; flags: FFL_PRIMITIVE ROM
	;; notes: CELLS ( n -- n )
	;;   Converts number of words to number of cells. Identity on the CFT.



	;; word:  ALIGNED
	;; copy:  NOP
	;; flags: FFL_PRIMITIVE ROM
	;; notes: CELLS ( n -- n )
	;;   Aligns address. A NOP on the CFT.



	;; word:  ALLOT
	;; flags: FFL_PRIMITIVE ROM
	;; notes: ALLOT ( w -- )
	;;   Allots w words on the dictionary, changes HERE accordingly.
	POP (SP)		; Pop value
	ADD CP			; Add to CP
	STORE CP		; Store it
	NEXT



	;; word:  ,
	;; alias: comma
	;; flags: FFL_PRIMITIVE ROM
	;; notes: , ( w -- )
	;;   Allots space for w, then stores word at HERE 1-.

	POP (SP)		; Pop value
	STORE I CP		; CP autoincrements.
	NEXT
	


	;; word:  2!
	;; alias: two-store
	;; flags: FFL_PRIMITIVE ROM
	;; notes: 2! ( d a -- )
	;;   Stores the 32-bit integer d at address a (low) and a+1 (high).

	POP (SP)		; Pop the address
	STORE I0

	LOAD SP			; SP -= 2
	ADD MINUS2
	STORE SP
	STORE I1

	LOAD I I1		; Load low cell
	STORE I I0		; Store it at a (autoinc)

	LOAD I I1		; Load low cell
	STORE I I0		; Store it at a+1 (autoinc)

	NEXT



	;; word:  2@
	;; alias: two-fetch
	;; flags: FFL_PRIMITIVE ROM
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
