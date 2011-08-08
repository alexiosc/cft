// -*- asm -*-
//
// I/O primitives

	;; word:  EMIT
	;; flags: FFL_PRIMITIVE ROM
	;; notes: EMIT ( word -- )
	;;   Outputs the character specified by word.
	TRAP T_POP
__fl_emit:	
	PUTCHAR
	RTF			; Return to Forth
	

	;; word:  CR
	;; flags: FFL_PRIMITIVE ROM
	;; notes: CR ( -- )
	;;   Outputs a carriage return.
	LI 10
	JMP __fl_emit
	

	;; word:  SPACE
	;; flags: FFL_PRIMITIVE ROM
	;; notes: SPACE ( -- )
	;;   Outputs a space.
	LI 32
	JMP __fl_emit
	

	;; word:  SPACES
	;; flags: FFL_PRIMITIVE ROM
	;; notes: SPACE ( num -- )
	;;   Outputs num spaces.
	TRAP T_POP
	NEG
	STORE IR0
__dw_spaces_loop:
	LOAD I IR0
	LOAD IR0
	SZA
	RTF			; Return to Forth
	LI 32
	PUTCHAR
	JMP __dw_spaces_loop
	

	;; word:  PUTS
	;; flags: FFL_PRIMITIVE ROM CFT
	;; notes: CFT ( addr -- )
	;;   Prints out the string that starts at addr.
	TRAP T_POP		; address
	TRAP T_PUTS
	RTF
	

	;; word:  SPACES
	;; word:  TYPE
	;; flags: FFL_PRIMITIVE ROM
	;; notes: TYPE ( addr num -- )
	;;   Prinaaat num characters starting at address addr.
	TRAP T_POP		; num
	NEG			; -(num-1)
	STORE IR0

	TRAP T_POP		; addr
	STORE IR1

__dw_type_loop:
	LOAD I IR0		; Autoindex (abused)
	LOAD IR0
	SNP
	RTF			; Return to Forth
	LOAD I IR1		; Load character
	PUTCHAR
	JMP __dw_type_loop
	

	;; word:  KEY
	;; flags: FFL_PRIMITIVE ROM
	;; notes: KEY ( -- word )
	;;   Word is the last character input.
_dw_key_loop:
	LI IFL_NEWCHAR		; Do we have a new character?
	AND R input_flags
	SNZ
	JMP _dw_key_loop

	LI IFL_NEWCHAR		; Clear the flag
	NOT
	AND R input_flags
	STORE R input_flags

	LOAD R last_inp_char
	TRAP T_PUSH

	RTF			; Return to Forth
	

	;; word:  ?KEY
	;; alias: have-key
	;; flags: FFL_PRIMITIVE ROM
	;; notes: KEY ( -- flag )
	;;   Flag is 1 if a key has been pressed, 0 otherwise.
	LI IFL_NEWCHAR		; Do we have a new character?
	AND R input_flags
	SNZ
	JMP _dw_have_key_not
	LI 1
_dw_have_key_done:
	TRAP T_PUSH
	RTF
_dw_have_key_not:
	LI 0
	JMP _dw_have_key_done
	RTF			; Return to Forth
	
// End of file.
