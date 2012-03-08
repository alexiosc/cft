// -*- asm -*-

&0100:
_x:	.word 0
divd:	.word 0
dvdr:	.word 0

	.equ TR0a R &0100
	.equ TR1 R &0101
	.equ TR2a R &0102
	.equ TR3 R &0103

	.equ TR0b R &0200
	.equ TR2b R &0202

	.equ TMPa R &0301
	.equ TMPb R &0302
	
	.equ TR3 R &0103

	;; Reset vector
&fff0:
reset:
	JMP I @+1
	.word start

	.equ PUTCHAR	OUT TTY0 TTYDATA ; Print out a character

&e000:
start:
	//DEBUGOFF

	LOAD mydivna		; Low Dividend (left hand side)
	STORE TR0a
	LOAD mydivnb		; High Dividend (left hand side)
	STORE TR0b

	LOAD mydvdr		; Low Divider (right hand side)
	STORE TR1

	TRAP _rom_div3216

	LOAD TR0b		; High Quotient
	PRINTH
	LOAD TR0a		; Low Quotient
	PRINTH

	LOAD TR2b		; High Modulo
	PRINTH
	LOAD TR2a		; Low Modulo
	PRINTH

	HALT


_rom_div3216:
	LOAD minus32		; 16 bits
	STORE TR3

	LI 0
	STORE TR2a		; modulo = 0
	STORE TR2b		; modulo = 0

nextbit:
	LOAD TR3		; Check loop iterations
	//PRINTD
	SNA			; Done?
	RTT			;   Yes. Return
	INC
	STORE TR3

	;; Shift left <TR2b,TR2A,TR0b,TR0a> 64-bit value (<modulo,quotient>)
	LOAD TR0a
	SBL
	STORE TR0a
	LOAD TR0b
	RBL
	STORE TR0b
	LOAD TR2a
	RBL
	STORE TR2a
	LOAD TR2b
	RBL
	STORE TR2b

compare_high:		      ; Calculate modulo - divisor (TR2 - TR1)

	;; Since Y (TR1) is 16-bit, any non-zero high word means mod >
	;; Y (TR2 > TR1).
	LOAD TR2b	      ; Compare the high words
	SNZ
	JMP subtract

compare_low:	

	CLL
	LOAD TR1		; Compare the low words
	NEG
	ADD TR2a
	SSL
	JMP nextbit		; mod < y. Next bit.

subtract:

	;; subtract Y (TR1) from MOD (TR2b:TR2a).
	SEL         ; Set carry
	LOAD TR1   ; Negate low word
	NEG         ; Two's complement
	ADD TR2a
	STORE TMPa

	LOAD TR2b   ; Load high A
	IFL INC     ; Propagate carry
	STORE TMPb    ; Store it.


will_it_fit:
	SNN			; Will it fit?
	JMP nextbit		; No. Try next bit.

it_fits:
	LOAD TMPb
	STORE TR2b 		; We already have the result of the subtraction. Store it.
	LOAD TMPa
	STORE TR2a

	CLL
	LI 1
	ADD TR0a
	STORE TR0a

	CLA SCL
	LI 1
	ADD TR0b
	STORE TR0b

	JMP nextbit
	

minus32:  .word -32
mydivnb:  .word &1234
mydivna:  .word &5678
mydvdr:   .word &0001

	
// End of file.
