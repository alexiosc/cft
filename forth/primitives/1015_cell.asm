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

	POP SP	                ; Pop
	GETLOCHAR()		; Get the low character (byte)
	PUSH SP
	NEXT



	;; word:  HIBYTE
	;; copy:  256div
	;; flags: CODE ROM CFT
	;; notes: CELLS ( n -- n )
	;;        Gets the high order byte of a 16-bit cell value.

	;; SPEEK(SP)		; Pop
	;; GETHICHAR()		; Get the high character (byte)
	;; SPOKE0(SP)		; Write it back.
	;; NEXT



	;; word:  ><
	;; alias: byte-swap
	;; flags: CODE ROM CFT
	;; notes: >< ( n -- n )
	;;        Swaps the top and bottom 8 bits of the value n.

	RPOP (TMP0, SP)		; TMP0 = n

	RNR			; High byte -> low byte
	RNR
	AND BYTELO
	STORE TMP1

	LOAD TMP0		; Low byte -> high byte
	RNL
	RNL
	AND BYTEHI

	OR TMP1			; Put them together
	PUSH SP
	NEXT




// End of file.
