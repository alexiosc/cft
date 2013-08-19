// -*- asm -*-
//
// Comparison primitives

	;; word:  =
	;; alias: EQUALS
	;; flags: FFL_PRIMITIVE ROM
	;; notes: = ( a b -- flag )
	;;   flag is non-zero if a == b
	TRAP T_POP
	STORE R31
	TRAP T_POP
	XOR R31			; a XOR b
__fl_trueif0:
	SZA			; A == 0 => true
	JMP __fl_false		; A != 0 => false
__fl_true:
	LOAD MINUS1
	TRAP T_PUSH
	RTF
__fl_false:
	LI 0
	TRAP T_PUSH
	RTF
	

	;; word:  <
	;; alias: LESS_THAN
	;; flags: FFL_PRIMITIVE ROM
	;; notes: < ( a b -- flag )
	;;   flag is true if a < b
	TRAP T_POP		; a
	STORE R31
	TRAP T_POP		; b
	NEG
	ADD R31			; a - b
	JMP __fl_trueifneg
	
	
	;; word:  >
	;; alias: GREATER_THAN
	;; flags: FFL_PRIMITIVE ROM
	;; notes: > ( a b -- flag )
	;;   flag is true if a > b
	TRAP T_POP		; a
	STORE R31
	TRAP T_POP		; b
	NEG
	ADD R31			; a - b
	JMP __fl_trueifpos
	
	
	;; word:  0<
	;; alias: ZERO_LESS
	;; flags: FFL_PRIMITIVE ROM
	;; notes: 0< ( a -- flag )
	;;   
	TRAP T_POP
__fl_trueifneg:
	AND BIT15
__fl_trueifnot0:
	SNZ
	JMP __fl_false		; A = 0 => false
	JMP __fl_true		; A != 0 => true
	

	;; word:  0=
	;; alias: ZERO_EQUALS
	;; flags: FFL_PRIMITIVE ROM
	;; notes: 0= ( a -- flag )
	;;   
	TRAP T_POP
	JMP __fl_trueif0
	
	
	;; word:  0>
	;; alias: ZERO_GREATER
	;; flags: FFL_PRIMITIVE ROM
	;; notes: 0> ( a -- flag )
	;;   
	TRAP T_POP
__fl_trueifpos:
	AND BIT15
	JMP __fl_trueif0
	
	
	
	;; word:  MAX
	;; alias: MAX
	;; flags: FFL_PRIMITIVE ROM
	;; notes: MAX ( a b -- word )
	;;   word is a or b, whichever is greatest.
	TRAP T_POP		; b
	STORE R31
	TRAP T_POP		; a
	STORE R30

	NEG			; a - b
	ADD R31

	SNA			; b > a?
	JMP __fl_pushr31
__fl_pushr30:			; return b
	LOAD R30
	TRAP T_PUSH
	RTF
__fl_pushr31:			; return a
	LOAD R31
	TRAP T_PUSH
	RTF
	
	
	;; word:  MIN
	;; alias: MIN
	;; flags: FFL_PRIMITIVE ROM
	;; notes: MIN ( a b -- word )
	;;   word is a or b, whichever is lesser.
	TRAP T_POP		; b
	STORE R31
	TRAP T_POP		; a
	STORE R30

	NEG			; a - b
	ADD R31

	SNA			; b > a?
	JMP __fl_pushr30	; Return a
	JMP __fl_pushr31	; Return b

	
// End of file.
