// -*- asm -*-

	;; These ones don't need to be here, they just need to be on
	;; the same page as the arithmetic words they alias.

	;; word:  CELL-
	;; alias: cell-dec
	;; copy:  dec
	;; flags: CODE ROM
	;; notes: CELL- ( a -- a )
	;;   Decrement memory address a by 1 cell.



	;; word:  CELL+
	;; alias: cell-inc
	;; copy:  inc
	;; flags: CODE ROM
	;; notes: CELL+ ( a -- a )
	;;   Increment memory address a by 1 cell.



	;; word:  CELLS
	;; copy:  NOP
	;; flags: CODE ROM
	;; notes: CELLS ( n -- n )
	;;   Converts number of words to number of cells. Identity on the CFT.



	;; word:  ALIGNED
	;; copy:  NOP
	;; flags: CODE ROM
	;; notes: CELLS ( n -- n )
	;;   Aligns address. A NOP on the CFT.



	;; word:  LOBYTE
	;; flags: CODE ROM CFT
	;; notes: CELLS ( n -- n )
	;;        Gets the low order byte of a 16-bit cell value.

	SPEEK(SP)		; Pop
	GETLOCHAR()		; Get the low character (byte)
	SPOKE0(SP)		; Write it back.
	NEXT



	;; word:  HIBYTE
	;; flags: CODE ROM CFT
	;; notes: CELLS ( n -- n )
	;;        Gets the high order byte of a 16-bit cell value.

	SPEEK(SP)		; Pop
	GETHICHAR()		; Get the high character (byte)
	SPOKE0(SP)		; Write it back.
	NEXT
	



// End of file.
