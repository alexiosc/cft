// -*- asm -*-
//
// Define the NOP primitive

	;; word:  OK
	;; flags: ROM PRIMITIVE

	;; primitive code follows.

	;; Print out an OK prompt

	;; End of primitive
__forth_ok:
	LIA @+3
	TRAP T_PUTS
	RTF
	.strn "  ok" 10


// End of file.
