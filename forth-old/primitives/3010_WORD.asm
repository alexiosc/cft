// -*- asm -*-
//
// The WORD primitive

	;; word:  WORD
	;; flags: FFL_PRIMITIVE ROM
	;; notes: WORD ( char -- addr )
	;;   lexes a string delimited by char. The starting address of the string
	;;   is placed on the stack.
	
	TRAP T_POP
	TRAP T_FORTH_WORD
	TRAP T_PUSH
	RTF

// End of file.
