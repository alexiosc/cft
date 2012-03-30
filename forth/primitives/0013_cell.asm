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



// End of file.
