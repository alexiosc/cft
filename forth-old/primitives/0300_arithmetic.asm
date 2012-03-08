// -*- asm -*-
//
// Arithmetic primitives

	;; word:  +
	;; alias: PLUS
	;; flags: FFL_PRIMITIVE ROM
	;; notes: PLUS ( a b -- sum )
	;;   sum is the sum of a and b.

	TRAP T_POP		; b
	STORE R31
	TRAP T_POP		; a
	ADD R31
	TRAP T_PUSH
	RTF			; Return to Forth
	
	;; word:  1+
	;; alias: ONE-PLUS
	;; flags: FFL_PRIMITIVE ROM
	;; notes: 1+ ( a -- b )
	;;   b is a + 1.

	TRAP T_POP		; a
	INC
	TRAP T_PUSH
	RTF			; Return to Forth
	
	;; word:  2+
	;; alias: TWO-PLUS
	;; flags: FFL_PRIMITIVE ROM
	;; notes: 2+ ( a -- b )
	;;   b is a + 2.

	TRAP T_POP		; a
	ADD PLUS2		; a+2
	TRAP T_PUSH
	RTF			; Return to Forth
	
	;; word:  -
	;; alias: MINUS
	;; flags: FFL_PRIMITIVE ROM
	;; notes: PLUS ( a b -- sum )
	;;   sum is the sum of a and b.

	TRAP T_POP		; b
	NEG			; -b
	STORE R31
	TRAP T_POP		; a
	ADD R31
	TRAP T_PUSH
	RTF			; Return to Forth
	
	;; word:  1-
	;; alias: ONE-MINUS
	;; flags: FFL_PRIMITIVE ROM
	;; notes: 1- ( a -- b )
	;;   b is a -1.

	TRAP T_POP		; a
	ADD MINUS1		; a - 1
	TRAP T_PUSH
	RTF			; Return to Forth
	

	;; word:  2-
	;; alias: TWO-MINUS
	;; flags: FFL_PRIMITIVE ROM
	;; notes: 2- ( a -- b )
	;;   b is a - 2.

	TRAP T_POP		; a
	ADD MINUS2		; a - 2
	TRAP T_PUSH
	RTF			; Return to Forth
	

	;; word:  2/
	;; alias: TWO-DIVIDE
	;; flags: FFL_PRIMITIVE ROM
	;; notes: 2/ ( a -- b )
	;;   b is floor(a / 2).
	TRAP T_POP		; a
	CLL
	SNN
	CPL			; if A < 0: L=1
	RBR			; roll 1 bit right
	TRAP T_PUSH
	RTF			; Return to Forth
	

	;; word:  2*
	;; alias: TWO-TIMES
	;; flags: FFL_PRIMITIVE ROM
	;; notes: 2* ( a -- b )
	;;   b is a * 2
	TRAP T_POP		; a
	CLL RBL
	TRAP T_PUSH
	RTF

	
	;; word:  NEGATE
	;; flags: FFL_PRIMITIVE ROM
	;; notes: NEGATE ( a -- nega )
	;;   nega is the twos complement of a.

	TRAP T_POP		; a
	NEG			; -a
	TRAP T_PUSH
	RTF			; Return to Forth
	

	;; word:  *
	;; alias: times
	;; flags: FFL_PRIMITIVE ROM
	;; notes: * ( w1 w2 -- w3 )
	;;   w3 is the least-significant 16 bits of the arithmetic
	;;   product of w1 times w2.

	TRAP T_POP		; b
	STORE TR1
	TRAP T_POP		; a
	STORE TR0

	TRAP T_MUL16		; Multiply

	LOAD TR2
	TRAP T_PUSH
	
	RTF			; Return to Forth
	

	;; word:  /
	;; alias: divide
	;; flags: FFL_PRIMITIVE ROM
	;; notes: / ( w1 w2 -- w3 )
	;;   Divide w1 / w2 and leave the quotient w3 on the stack.

	TRAP T_POP		; b
	STORE TR1
	TRAP T_POP		; a
	STORE TR0

	TRAP T_DIV16		; Divide

	LOAD TR2
	TRAP T_PUSH
	
	RTF			; Return to Forth
	

	;; word:  /MOD
	;; alias: divide-mod
	;; flags: FFL_PRIMITIVE ROM
	;; notes: /MOD ( w1 w2 -- w3 w4 )
	;;   Divide w1 / w2. Leave the remainder (w4) and quotient (w3) on the stack.

	TRAP T_POP		; b
	STORE TR1
	TRAP T_POP		; a
	STORE TR0

	TRAP T_DIV16		; Divide

	LOAD TR0		; Push modulo
	TRAP T_PUSH
	LOAD TR2		; Push quotient
	TRAP T_PUSH

	RTF			; Return to Forth
	

	;; word:  MOD
	;; alias: mod
	;; flags: FFL_PRIMITIVE ROM
	;; notes: MOD ( w1 w2 -- w3 )
	;;   w3 is the 16-modulo of the 16-bit integer division w1/w2.

	TRAP T_POP		; b
	STORE TR1
	TRAP T_POP		; a
	STORE TR0

	TRAP T_DIV16		; Divide

	LOAD TR0		; Push modulo
	TRAP T_PUSH

	RTF			; Return to Forth
	

	;; word:  ABS
	;; alias: abs
	;; flags: FFL_PRIMITIVE ROM
	;; notes: ABS ( w1 -- w2 )
	;;   w2 is the absolute value of w1.

	TRAP T_POP
	STORE TR0

	SPA			; A < 0?
	NEG			; Yes. Negate.

	TRAP T_PUSH
	RTF			; Return to Forth
	

// End of file.
