///////////////////////////////////////////////////////////////////////////////
//
// Memory routines
//
///////////////////////////////////////////////////////////////////////////////

	;; Copy TR0 words from TIR0 to TIR1.
	;;
	;; TR0: number of words to copy.
	;; TIR0: source
	;; TIR1: destination
_rom_memcpy:
	LOAD TR0
	SNZ
	RTT			; If TR = 0, we're done.
	ADD R MINUS1		; TR 0 - 1
	STORE TR0
	LOAD I TIR0		; Copy bytes
	STORE I TIR1
	JMP _rom_memcpy
	RTT

// End of file.
