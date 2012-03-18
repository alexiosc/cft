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
	
	

	;; word:  2+
	;; alias: inc2
	;; flags: FFL_PRIMITIVE ROM
	;; notes: 2+ ( w -- w )
	;;   Increment by two
	SPEEK (SP)
	ADD PLUS2
	SPOKE0 (SP)
	NEXT
	
	

	;; word:  1-
	;; alias: dec
	;; flags: FFL_PRIMITIVE ROM
	;; notes: 1- ( w -- w )
	;;   Decrement by one
	SPEEK (SP)
	ADD MINUS1
	SPOKE0 (SP)
	NEXT
	
	

	;; word:  2-
	;; alias: dec2
	;; flags: FFL_PRIMITIVE ROM
	;; notes: 2- ( w -- w )
	;;   Decrement by two
	SPEEK (SP)
	ADD MINUS2
	SPOKE0 (SP)
	NEXT
	
	

	;; word:  >>1
	;; alias: shl1
	;; flags: FFL_PRIMITIVE ROM CFT
	;; notes: 2/ ( w -- w )
	;;   Shift right one bit. No sign extension.
	SPEEK (SP)
	SBR
	SPOKE0 (SP)
	NEXT
	
	

	;; word:  2/
	;; alias: 2div
	;; flags: FFL_PRIMITIVE ROM
	;; notes: 2/ ( w -- w )
	;;   Shift right one bit with sign extension.
	SPEEK (SP)

	CLL			; Clear L
	SNN			; Skip if non-negative
	SEL			; Set L for sign extension
	
	RBR			; Roll 1 bit right, L becomes bit 15.

	SPOKE0 (SP)
	NEXT
	
	

	;; word:  2*
	;; alias: 2mul
	;; flags: FFL_PRIMITIVE ROM CFT
	;; notes: 2* ( u -- u ) 
	;;   Shift left one bit.
	SPEEK (SP)
	SBL
	SPOKE0 (SP)
	NEXT
	
	

	;; word:  16/
	;; alias: 16div
	;; flags: FFL_PRIMITIVE ROM CFT
	;; notes: 16/ ( u -- u )
	;;   Shift right four bits (one nybble). No sign extension.
	SPEEK (SP)
	RNR
	AND PLUS0FFF		; Discard bits 12-15
	SPOKE0 (SP)
	NEXT
	
	

	;; word:  16*
	;; alias: 16mul
	;; flags: FFL_PRIMITIVE ROM CFT
	;; notes: 16* ( w -- w ) 
	;;   Shift left four bits.
	SPEEK (SP)
	SBL
	SPOKE0 (SP)
	NEXT
	
	

	;; word:  NOT
	;; flags: FFL_PRIMITIVE ROM
	;; notes: NOT ( w -- w )
	;;   Flip all bits in w, or negate in one's complement.
	SPEEK (SP)
	NOT
	SPOKE0 (SP)
	NEXT
	
	

	;; word:  ABS
	;; flags: FFL_PRIMITIVE ROM
	;; notes: ABS ( w -- w )
	;;   The absolute value of w
	SPEEK (SP)
	SNA			; Negative?
	NEXT			; No.
	NEG			; Negate it
	SPOKE0 (SP)		; And store it back
	NEXT
	
	
// End of file.
