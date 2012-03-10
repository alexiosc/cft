// -*- asm -*-
//
// Core arithmetic and logic

	;; word:  AND
	;; flags: FFL_PRIMITIVE ROM
	;; notes: AND ( w w -- w )
	;;   Bitwise AND
	POP1PEEK1 (SP)
	AND TMP1
	SPOKE0 (SP)
	NEXT


	
	;; word:  OR
	;; flags: FFL_PRIMITIVE ROM
	;; notes: OR ( w w -- w )
	;;   Bitwise OR
	POP1PEEK1 (SP)
	OR TMP1
	SPOKE0 (SP)
	NEXT


	
	;; word:  XOR
	;; flags: FFL_PRIMITIVE ROM
	;; notes: XOR ( w w -- w )
	;;   Bitwise XOR
	POP1PEEK1 (SP)
	XOR TMP1
	SPOKE0 (SP)
	NEXT


	
	;; word:  +
	;; alias: add
	;; flags: FFL_PRIMITIVE ROM
	;; notes: + ( w w -- w )
	;;   Addition
	POP1PEEK1 (SP)
	ADD TMP1
	SPOKE0 (SP)
	NEXT


	
	;; word:  -
	;; alias: sub
	;; flags: FFL_PRIMITIVE ROM
	;; notes: - ( w w -- w )
	;;   Subtraction
	POP1PEEK1 (SP)
	NEG
	ADD TMP1
	SPOKE0 (SP)
	NEXT


	
	;; word:  1+
	;; alias: inc
	;; flags: FFL_PRIMITIVE ROM
	;; notes: 1+ ( w -- w )
	;;   Increment by one
	SPEEK (SP)
	ADD PLUS1
	SPOKE0 (SP)
	NEXT
	
	
// End of file.
