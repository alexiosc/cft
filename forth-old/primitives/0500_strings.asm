// -*- asm -*-
//
// String handling

	;; word:  LEN
	;; alias: LEN
	;; flags: FFL_PRIMITIVE ROM
	;; notes: LEN ( addr -- word )
	;;   
	;;   Word is the length of the string starting at addr.
	TRAP T_POP		; Get the address
	STORE TIR0
	TRAP T_STRLEN		; Count the length
	TRAP T_PUSH		; Push the length
	RTF			; Return to Forth macro-instruction
	
// End of file.
