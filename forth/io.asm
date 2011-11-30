///////////////////////////////////////////////////////////////////////////////
//
// I/O Routines
//
///////////////////////////////////////////////////////////////////////////////


	;; trap_newline: print out a newline.
	;; A: ignored.
	;; Returns: nothing.
	;; Side effects: prints out ASCII 10 13 
_rom_nl:
	LI 10
	OUT TTY0 TTYDATA
	LI 13
	OUT TTY0 TTYDATA
	RTT

	
	;; Print a null- or neg-terminated string.
	;; A: address of string in memory.
	;; Returns: Address of terminating NULL, or of last character.
_rom_puts:
	STORE TIR0
_rom_putsl:
	LOAD I TIR0
	SNZ			; Skip if A != 0
	RTT
	PUTCHAR			; If negative, PUTCHAR ignores bit &8000
	SPA			; Skip if A > 0
	RTT
	JMP _rom_putsl

	;; Prints out hex.
	;; A: number to print out.
	;; Returns: nothing.
	;; Side effects: prints out 4-digit hex representation of A.

_rom_puth:
	STORE R31		; Store A.

	LOAD R buf
	STORE TIR0

	LOAD R31		; Take the parameter and roll it.
	RBL
	RNL
	STORE I TIR0		; Buffer nibble 4
	RNL
	STORE I TIR0		; Buffer nibble 3
	RNL
	STORE I TIR0		; Buffer nibble 2
	RNL
	STORE I TIR0		; Buffer nibble 1

	LOAD R buf		; Reset the index register to nibble 4
	STORE TIR0

	LOAD MINUS4		; Loop counter: TIR1 = -4
	STORE TIR1

	LIA _rom_puths		; Get the address of the hex digits
	STORE R30		; TR0 = _puthexs

_rom_puthl:			; Next nibble!
	LI &f
	AND I TIR0

	ADD R30			; Use indirection to get _puthexs[A]
	STORE R31
	LOAD I R31

	PUTCHAR			; Print out the character

	LOAD I TIR1		; TIR1++ (ignore A, do it for autoindex)
	LOAD TIR1		; A = TIR1
	SNZ
	RTT			; Done!

	JMP _rom_puthl
	
_rom_puths:
	.str "0123456789abcdef"


// End of file.
