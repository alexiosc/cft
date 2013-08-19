// -*- asm -*-

&0100:
_x:	.word 0
prod:	.word &1234
mulr:	.word &24
mulnd:	.word &11

	.equ TR0 R &0100
	.equ TR1 R &0101
	.equ TR2 R &0102

	;; Reset vector
&fff0:
reset:
	JMP I @+1
	.word start

	.equ PUTCHAR	OUT TTY0 TTYDATA ; Print out a character

&e000:
start:
	LOAD mymulr
	STORE TR0
	LOAD mymulnd
	STORE TR1
	
	TRAP _rom_mul16

	LOAD TR2
	PRINTH
	HALT

_rom_mul16:
	LI 0
	STORE TR2		; TR2 = product = 0

_rom_mul16_loop:
	LOAD TR0		; a == 0?
	SNZ
	RTT			; Then we're done.

	SBR			; L = A & 1, A = A >> 1
	STORE TR0
	SSL			; L == 0?
	JMP _rom_mul16_noadd

	LOAD TR1		; prod += b
	ADD TR2
	STORE TR2

_rom_mul16_noadd:
	LOAD TR1		; b <<= 1
	SBL
	STORE TR1

	JMP _rom_mul16_loop	; Loop again

	
minus_16: .word -16
mymulr:	  .word &24
mymulnd:  .word &11
	
// End of file.
