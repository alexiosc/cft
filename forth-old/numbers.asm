///////////////////////////////////////////////////////////////////////////////
//
// Numerical stuff
//
///////////////////////////////////////////////////////////////////////////////

	;; Parse a digit of a number in the current numbase.
	;; 
	;; A: the ASCII character to parse
	;;
	;; Returns:
	;;   A: &ffff if the character was a valid digit, &0000 if not.
	;;   TR0: if successful, an integer representation of the digit.
	;;   Otherwise, &ffff.
	;;
	;; Clobbers: TR0
	;; 
	;;   Algorithm:
	;;     
	;;     n = c - '0' # We get a large unsigned number if c < '0'
	;;     if n < 0:
	;;       return false
	;;     if n > 9:
	;;       if c < 'A':
	;;         return false
	;;       n = n - 7
	;;     if n < base:
	;;       return true
	;;     return false

_rom_digit:
	STORE TR0

	ADD _rom_digit_c	; n = char - '0'
	STORE TR0
	SNN			; n < '0'?
	JMP _rom_digit_no	;   return false

	ADD @_rom_digit_c+1	; n > 9?
	SPA
	JMP _rom_digit_09	; No, skip over the following bit.

	LOAD TR0		; n = n - 17
	ADD @_rom_digit_c+2
	SNN			; n < 'A'?
	JMP _rom_digit_no	;  return false
	ADD @_rom_digit_c+3	; n = n + 10
	STORE TR0
	
_rom_digit_09:
	NEG
	ADD R numbase		; n < base?
	SPA
	JMP _rom_digit_no

	;; It's a digit, return true.
	LOAD MINUS1		; A = -1
	RTT
	
_rom_digit_no:
	;; Not a digit.
	LOAD MINUS1
	STORE TR0
	LI 0
	RTT
	
_rom_digit_c:
	.word -48
	.word -9
	.word -17
	.word 10
	

// End of file.
