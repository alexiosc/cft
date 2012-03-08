// -*- asm -*-

&0100:
_x:	.word 0
divd:	.word 0
dvdr:	.word 0

	.equ TR0 R &0100
	.equ TR1 R &0101
	.equ TR2 R &0102
	.equ TR3 R &0103

	;; Reset vector
&fff0:
reset:
	JMP I @+1
	.word start

	.equ PUTCHAR	OUT TTY0 TTYDATA ; Print out a character

&e000:
start:
	NOP
	/LOAD a
	/PRINTH
	/ADD b
	/PRINTH
	/HALT

	;; If x2 > x1: print difference
	;; A = x2 - x1
	;; If positive: print
	
	;; x2 > x1? 
	LOAD x1
	NEG
	ADD x2
	SCL
	PRINTH
	//HALT
	
x2:	.word &f000
x1:	.word &f000
	


neg32:
	SEL         ; Set carry
	LOAD bl     ; Negate low word
	NEG         ; Two's complement
	STORE R xl
	PRINTH

	LOAD bh     ; Negate high word
	IFL INC     ; Propagate carry
	NEG         ; Two's complement
	STORE R xh
	PRINTH

sub32:
	CLL         ; Clear carry
	LOAD al     ; Load low A
	ADD R xl    ; A = A + -B
	STORE R xl  ; Store it
	PRINTH

	LOAD ah     ; Load high A
	IFL INC     ; Propagate carry
	ADD R xh    ; Add to high B
	STORE R xh  ; Store it.
	PRINTH


	HALT

a:	.word &f000
b:	.word &8000

ah:	.word &791a
al:	.word &2b3c
bh:	.word &f000
bl:	.word &f005

&100:
xl:	.word &dead
xh:	.word &beef

// End of file.
