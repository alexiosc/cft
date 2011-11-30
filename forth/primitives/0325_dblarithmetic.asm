// -*- asm -*-
//
// Arithmetic primitives for double numbers.
//
// Double numbers are stored on the stack with the least
// significant 16bits pushed first. So: 10. .s -- 10 0.

	;; word:  D+
	;; alias: D-PLUS
	;; flags: FFL_PRIMITIVE ROM
	;; notes: D+ ( dw1 dw2 -- dw3 )
	;;   dw3 is the sum of dw1 and dw2.
	;; registers at __add32:
	;;   R31 = a_hi
	;;   R30 = a_lo
	;;   R29 = b_hi
	;;     A = b_lo (b_lo is not stored)

	TRAP T_POP		; a_hi
	STORE R31

        TRAP T_POP		; a_lo
	STORE R30
	
	TRAP T_POP		; b_hi
	STORE R29
	
	TRAP T_POP		; b_lo

dw_D_PLUS_work:
	CLL
	ADD R30			; a_lo + b_lo
	STORE R30

	LOAD R29
	SCL			; L = 1?
	INC
	ADD R31
	STORE R31

	LOAD R30
	TRAP T_PUSH		; Push low word

	LOAD R31		; Push high word
	TRAP T_PUSH
	
	RTF	; Return to Forth


	;; word:  DNEGATE
	;; flags: PRIMITIVE ROM
	;; notes: DNEGATE ( dw1 -- dw2 )
	;;   dw2 is the twos complement of double word 1.
	;; registers:
	;;   R31 = a_hi
	;;   R30 = a_lo
	;;   R29 = b_hi
	;;         b_lo (b_lo is not stored)

	TRAP T_POP		; a_hi
	NOT			; 1s' complement
	STORE R31

        TRAP T_POP		; a_lo
	NOT			; 1s' complement
	STORE R30

	LI 0			; Negate low word
	STORE R29
	LI 1
	JMP dw_D_PLUS_work	; And perform add32.
	
	
	;; word:  D-
	;; flags: DOCOL ROM
	;; notes: D- ( dw1 dw2 -- dw3 )
	;;   dw3 is the double result of dw1-dw2.
	.word dw_DNEGATE
	.word dw_D_PLUS
	.word dw_EXIT
	

	;; word:  D0=
	;; alias: D0-EQUALS
	;; flags: DOCOL ROM
	;; notes: D0= ( dw1 -- flag )
	;;   flag is true if d1 is zero.
	;;   : d0= 0 dup d= ;
	.word dw__LIT
	.word 0
	.word dw_DUP
	.word dw_D_EQUALS
	.word dw_EXIT
	

	;; word:  D=
	;; alias: D-EQUALS
	;; flags: FFL_PRIMITIVE ROM
	;; notes: D= ( dw1 dw2 -- flag )
	;;   flag is non-zero if dw1 == dw2
	TRAP T_POP		; a_hi
	STORE R31

        TRAP T_POP		; a_lo
	STORE R30
	
	TRAP T_POP		; b_hi
	STORE R29
	
	TRAP T_POP		; b_lo

	;; Compare the low words
	
	XOR R30			; a_lo == b_lo
	SZA			; A == 0
	JMP __fl_false

	;; Compare the high words

	LOAD R31
	XOR R29
	SZA			; A == 0
	JMP __fl_false
	JMP __fl_true


	;; word:  D<
	;; alias: D-LESS-THAN
	;; flags: FFL_PRIMITIVE ROM
	;; notes: D< ( dw1 dw2 -- flag )
	;;   flag is non-zero if dw1 < dw2
	;;
	;; algorithm:
	;;
	;;   if dw1_hi < dw2_hi:
	;;     return true
	;;   if dw1_hi > dw2_hi:
	;;     return false
	;;   igf dw1_lo < dw2_lo:
	;;     return true
	;;   return false
	TRAP T_POP		; a_hi
	STORE R31

        TRAP T_POP		; a_lo
	STORE R30
	
	TRAP T_POP		; b_hi
	STORE R29
	
	TRAP T_POP		; b_lo
	STORE R28

	;; Full comparison of a_hi and b_hi

dw_D_LESS_THAN_work:
	LOAD R29		; Full comparison of a_hi and b_hi
	NEG
	ADD R31			; a - b
	SNN			; a_hi < b_hi?
	JMP __fl_true		;   Yes. Return true.

	SZA			; a_hi == b_hi?
	JMP __fl_false		;   no. Return false.

	;; a_hi == b_hi. Compare a_lo and b_lo

	LOAD R28
	NEG
	ADD R30			; a - b
	SNN			; a_lo < b_lo?
	JMP __fl_true		;   Yes. Return true.

	JMP __fl_false		; No. Return false.



	;; word:  D>
	;; alias: D-GREATER-THAN
	;; flags: FFL_PRIMITIVE ROM
	;; notes: D> ( dw1 dw2 -- flag )
	;;   flag is non-zero if dw1 > dw2
	TRAP T_POP		; a_hi
	STORE R29

        TRAP T_POP		; a_lo
	STORE R28
	
	TRAP T_POP		; b_hi
	STORE R31
	
	TRAP T_POP		; b_lo
	STORE R30

	JMP dw_D_LESS_THAN_work

	
	;; word:  DMAX
	;; flags: PRIMITIVE ROM
	;; notes: DMIN ( dw1 dw2 -- dw3 )
	;;   dw3 is the maximum of dw1 and dw2.
	;;   : d0= 0 dup d= ;
	TRAP T_POP		; a_hi
	STORE R31

        TRAP T_POP		; a_lo
	STORE R30
	
	TRAP T_POP		; b_hi
	STORE R29
	
	TRAP T_POP		; b_lo
	STORE R28

__fl_max32:
	LOAD R29		; Full comparison of a_hi and b_hi
	NEG
	ADD R31			; a - b
	SNN			; a_hi < b_hi?
	JMP __fl_max32b		;   a < b. Return b.

	SZA			; a_hi == b_hi?
	JMP __fl_max32a		;   a > b. Return a.

	;; a_hi == b_hi. Compare a_lo and b_lo

	LOAD R28
	NEG
	ADD R30			; a - b
	SNN			; a_lo < b_lo?
	JMP __fl_max32b		;   a < b. Return b.

	JMP __fl_max32a		; a >= b. Return a.

__fl_max32a:			; Push A
	LOAD R28
	TRAP T_PUSH		; Push low
	LOAD R29
	TRAP T_PUSH		; Push high
	RTF
	
__fl_max32b:			; Push B
	LOAD R30
	TRAP T_PUSH		; Push low
	LOAD R31
	TRAP T_PUSH		; Push high
	RTF
	

	;; word:  DMIN
	;; flags: PRIMITIVE ROM
	;; notes: DMIN ( dw1 dw2 -- dw3 )
	;;   dw3 is the minimum of dw1 and dw2.
	TRAP T_POP		; a_hi
	STORE R29

        TRAP T_POP		; a_lo
	STORE R28
	
	TRAP T_POP		; b_hi
	STORE R31
	
	TRAP T_POP		; b_lo
	STORE R30

	JMP __fl_max32


	;; word:  D2*
	;; alias: D-TWO-TIMES
	;; flags: PRIMITIVE ROM
	;; notes: D2* ( dw1 -- dw2 )
	;;   Multiplies dw1 by two using a left shift.
	TRAP T_POP
	STORE R31
	TRAP T_POP
	CLL RBL			; L = 0 => shift.
	STORE R30
	LOAD R31
	RBL			; left roll (using L)
	STORE R31
	

	;; word:  D*
	;; alias: D-TIMES
	;; flags: FFL_PRIMITIVE ROM
	;; notes: D* ( dw1 dw2 -- dw3 )
	;;   dw3 is the product of dw1 and dw2.
	;; registers at __add32:
	;;   R31 = a_hi
	;;   R30 = a_lo
	;;   R29 = b_hi
	;;     A = b_lo (b_lo is not stored)

	TRAP T_POP		; Pop A (high)
	STORE R31
        TRAP T_POP		; Pop A (low)
	STORE TR1
	
	TRAP T_POP		; Pop B (high)
	STORE TR2
	TRAP T_POP		; Pop A (low)
	STORE TR3

	LOAD R31
	STORE TR0		; POP clobbers TR0

	TRAP T_MUL32

	LOAD R30		; Push the product (lo, then high)
	TRAP T_PUSH
	LOAD R29
	TRAP T_PUSH

	RTF
	
	;; word:  D/MOD
	;; alias: D-DIVIDE
	;; flags: FFL_PRIMITIVE ROM
	;; notes: / ( dw1 dw2 -- dw3 dw4 )
	;;   Divide w1 / w2 and leave the remainder (dw4) and quotient (dw3)
	;;   on the stack.

	TRAP T_POP		; b
	STORE TR1
	TRAP T_POP		; a
	STORE TR0

	TRAP T_DIV32		; Divide

	LOAD TR2
	TRAP T_PUSH
	
	RTF			; Return to Forth
	

// End of file.
	
