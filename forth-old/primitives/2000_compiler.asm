// -*- asm -*-
//
// Compiler primitives

	;; word:  _JMP
	;; flags: FFL_PRIMITIVE ROM CMPLONLY

	LOAD I IP		; Load the next word
	STORE IP		; Set the IP to it.
	RTF			; Return to Forth


	;; word:  _LIT
	;; flags: FFL_PRIMITIVE ROM CMPLONLY

	LOAD I IP		; Load the next word
	TRAP T_PUSH		; Push it onto the stack.
	RTF			; Return to Forth


	;; word:  _DOT_QUOTE
	;; flags: FFL_PRIMITIVE ROM CMPLONLY

__fl__dot_quote_loop:
	LOAD I IP		; Load the next word
	STORE R31

	SNN			; Terminating character?
	JMP __fl_dot_quote_end

	LOAD R31
	PUTCHAR
	JMP __fl__dot_quote_loop

__fl_dot_quote_end:
	AND NOTBIT15		; Print out the final character
	PUTCHAR
	RTF


// End of file.
