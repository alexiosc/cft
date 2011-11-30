// -*- asm -*-

&0100:
_x:	.word 0
divd:	.word 0
dvdr:	.word 0

	.equ TR0a R &0100
	.equ TR1a R &0101
	.equ TR2a R &0102
	.equ TR3 R &0103

	.equ TR0b R &0200
	.equ TR1b R &0201
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

/	LOAD foo
/	STORE TR1b
/	LOAD @foo+1
/	STORE TR1a
/	LOAD @foo+2
/	STORE TR2b
/	LOAD @foo+3
/	STORE TR2a
/
/	CLL CPL
/	LOAD TR2a
/	NEG
/	ADD TR1a
/	STORE TMPa
/
/	LOAD TR2b		; Calculate modulo - divisor (TR2 - TR1)
/	SCL
/	INC
/	NEG
/	ADD TR1b
/	STORE TMPb
/
/	LOAD TMPb
/	PRINTH
/	LOAD TMPa
/	PRINTH
/
/	HALT
/
/foo:
/	.word &1234 		; TR1b
/	.word &0000		; TR1a
/	.word &0001		; TR2b
/	.word &0001		; TR2a

/	DEBUGOFF
	
	LOAD mydivna		; Low Dividend (left hand side)
	STORE TR0a
	LOAD mydivnb		; High Dividend (left hand side)
	STORE TR0b

	LOAD mydvdra		; Low Divider (right hand side)
	STORE TR1a
	LOAD mydvdrb		; High Divider (right hand side)
	STORE TR1b

	TRAP _rom_div32

	LOAD TR0b		; High Quotient
	PRINTH
	LOAD TR0a		; Low Quotient
	PRINTH

	LOAD TR2b		; High Modulo
	PRINTH
	LOAD TR2a		; Low Modulo
	PRINTH

	HALT


_rom_div32:
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

compare_low:		      ; Calculate modulo - divisor (TR2 - TR1)

	; If mod >= y (TR2b:TR2a >= TR1b:TR1a)
	CLL
	LOAD TR1b	      ; Compare the high words
	NEG
	ADD TR2b
	SSL
	JMP nextbit		; mod < y. Next bit.
	SZA
	JMP subtract

compare_high:	

	CLL
	LOAD TR1a		; Compare the low words
	NEG
	ADD TR2a
	SSL
	JMP nextbit		; mod < y. Next bit.

subtract:	

	SEL         ; Set carry
	LOAD TR1a   ; Negate low word
	NEG         ; Two's complement
	STORE TMPa

	LOAD TR1b   ; Negate high word
	IFL INC     ; Propagate carry
	NEG         ; Two's complement
	STORE TMPb

	CLL         ; Clear carry
	LOAD TR2a   ; Load low A
	ADD TMPa    ; A = A + -B
	STORE TMPa  ; Store it

	LOAD TR2b   ; Load high A
	IFL INC     ; Propagate carry
	ADD TMPb    ; Add to high B
	STORE TMPb    ; Store it.

	//DEBUGOFF
	//LOAD TR0b
	//PRINTH
	//LOAD TR0a
	//PRINTH
	//LOAD TR2b
	//PRINTH
	//LOAD TR2a
	//PRINTH
	//LOAD TMPb
	//PRINTH
	//LOAD TMPa
	//PRINTH
	//DEBUGON
	//LOAD TMPb

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
mydivnb:  .word &f234
mydivna:  .word &5678
mydvdrb:  .word &0000
mydvdra:  .word &0001
	
// End of file.
