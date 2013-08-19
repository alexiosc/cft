// -*- asm -*-
//
// Core arithmetic and logic

	;; word:  AND
	;; flags: CODE ROM
	;; notes: AND ( w w -- w )
	;;   Bitwise AND

	RPOP(TMP0, SP)
	POP SP
	AND TMP0
	PUSH SP
	NEXT


	
	;; word:  OR
	;; flags: CODE ROM
	;; notes: OR ( w w -- w )
	;;   Bitwise OR

	RPOP(TMP0, SP)
	POP SP
	OR TMP0
	PUSH SP
	NEXT


	
	;; word:  XOR
	;; flags: CODE ROM
	;; notes: XOR ( w w -- w )
	;;   Bitwise XOR

	RPOP(TMP0, SP)
	POP SP
	XOR TMP0
	PUSH SP
	NEXT


	
	;; word:  +
	;; alias: add
	;; flags: CODE ROM
	;; notes: + ( w w -- w )
	;;   Addition

	RPOP(TMP0, SP)
	POP SP
	ADD TMP0
	PUSH SP
	NEXT


	
	;; word:  -
	;; alias: sub
	;; flags: CODE ROM
	;; notes: - ( w1 w2 -- w )
	;;   Subtraction

	POP SP
	NEG
	STORE TMP0
	POP SP
	ADD TMP0
	PUSH SP
	NEXT
	
	

	;; word:  NEGATE
	;; alias: NEGATE
	;; flags: CODE ROM
	;; notes: NEGATE ( w -- -w ) 
	;;        Two's complement negation.

	POP SP
	NEG
	PUSH SP
	NEXT


	
	;; word:  1+
	;; alias: inc
	;; flags: CODE ROM
	;; notes: 1+ ( w -- w )
	;;   Increment by one

	POP SP
	ADD PLUS1
	PUSH SP
	NEXT
	
	

	;; word:  2+
	;; alias: inc2
	;; flags: CODE ROM
	;; notes: 2+ ( w -- w )
	;;   Increment by two

	POP SP
	ADD PLUS2
	PUSH SP
	NEXT
	
	

	;; word:  1-
	;; alias: dec
	;; flags: CODE ROM
	;; notes: 1- ( w -- w )
	;;   Decrement by one

	POP SP
	ADD MINUS1
	PUSH SP
	NEXT
	
	

	;; word:  2-
	;; alias: dec2
	;; flags: CODE ROM
	;; notes: 2- ( w -- w )
	;;   Decrement by two

	POP SP
	ADD MINUS2
	PUSH SP
	NEXT
	
	

	;; word:  >>1
	;; alias: shl1
	;; flags: CODE ROM CFT
	;; notes: 2/ ( w -- w )
	;;   Shift right one bit. No sign extension.

	POP SP
	SBR
	PUSH SP
	NEXT
	
	

	;; word:  2/
	;; alias: 2div
	;; flags: CODE ROM
	;; notes: 2/ ( w -- w )
	;;   Shift right one bit with sign extension.

	POP SP

	CLL			; Clear L
	SNN			; Skip if non-negative
	SEL			; Set L for sign extension
	
	RBR			; Roll 1 bit right, L becomes bit 15.

	PUSH SP
	NEXT
	
	

	;; word:  2*
	;; alias: 2mul
	;; flags: CODE ROM CFT
	;; notes: 2* ( u -- u ) 
	;;   Shift left one bit.

	POP SP
	SBL
	PUSH SP
	NEXT
	
	

	;; word:  16/
	;; alias: 16div
	;; flags: CODE ROM CFT
	;; notes: 16/ ( u -- u )
	;;   Shift right four bits (one nybble). No sign extension.

	POP SP
	RNR
	AND PLUS0FFF		; Discard bits 12-15
	PUSH SP
	NEXT
	
	

	;; word:  16*
	;; alias: 16mul
	;; flags: CODE ROM CFT
	;; notes: 16* ( w -- w ) 
	;;   Shift left four bits.

	POP SP
	RNL
	AND PLUSFFF0		; Discard bits 0-3
	PUSH SP
	NEXT
	
	

	;; word:  256*
	;; alias: 256mul
	;; flags: CODE ROM CFT
	;; notes: 256* ( w -- w ) 
	;;        Shift left eight bits.

	POP SP
	RNL
	RNL
	AND BYTEHI		; Discard bits 0-7
	PUSH SP
	NEXT
	
	

	;; word:  256/
	;; alias: 256div
	;; flags: CODE ROM CFT
	;; notes: 256/ ( w -- w ) 
	;;        Shift right eight bits.

	POP SP
	RNR
	RNR
	AND BYTELO		; Discard bits 0-7
	PUSH SP
	NEXT
	
	

	;; word:  NOT
	;; flags: CODE ROM
	;; notes: NOT ( w -- w )
	;;   Flip all bits in w, or negate in one's complement.

	POP SP
	NOT
	PUSH SP
	NEXT
	
	

	;; word:  ABS
	;; flags: CODE ROM
	;; notes: ABS ( w -- w )
	;;   The absolute value of w

	POP SP
	SNN			; Non-Negative?
	NEG			; No. Negate it
	PUSH SP
	NEXT


	
	;; word:  NOR
	;; flags: CODE ROM
	;; notes: NOR ( w w -- w )
	;;   	  Bitwise OR

	RPOP(TMP0, SP)
	POP SP
	OR TMP0
	NOT
	PUSH SP
	NEXT


	
	;; word:  NAND
	;; flags: CODE ROM
	;; notes: NAND ( w w -- w )
	;;        Bitwise OR

	RPOP(TMP0, SP)
	POP SP
	AND TMP0
	NOT
	PUSH SP
	NEXT


	
// End of file.
