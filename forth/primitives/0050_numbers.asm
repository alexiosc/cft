// -*- mode: asm; tab-width: 20; comment-column: 40 -*-
//
// Numbers, base conversion, etc.

	;; word:  BASE
	;; flags: VARIABLE ROM
	;; notes: BASE ( -- addr )
	;;   Puts the address of the BASE variable on the stack.
	;;
	;;   Expects: rstack: the IP to go to. No increment.
	.word numbase


	;; word:  DIGIT?
	;; alias: DIGIT-QUESTION
	;; flags: PRIMITIVE ROM
	;; notes: DIGIT? ( c -- flag )
	;;   Flag is true if c represents the ASCII character of a valid
	;;   digit in the current BASE.
	TRAP T_POP
	TRAP T_DIGIT
	TRAP T_PUSH
	RTF
	

	;; word:  DIGIT
	;; flags: PRIMITIVE ROM
	;; notes: DIGIT ( c -- n )
	;;   n is the number represented by the digit c in the current BASE.
	;;   If the digit is not valid, n is -1.
	TRAP T_POP
	TRAP T_DIGIT
	LOAD TR0
	TRAP T_PUSH
	RTF
	

	;; word:  _NUMBER
	;; flags: PRIMITIVE ROM
	;; notes: DIGIT ( addr -- n )
	;;   parses a number from the string in addr and pushes it onto the stack.
	;;   Uses the current BASE.
	//LI 32
	//TRAP T_FORTH_WORD

	TRAP T_POP
	STORE TIR0		; Store the char pointer for parsing
	STORE TR0
	LI 0
	STORE R29
	STORE R27		; R27 == 1 ==> negative number

	;; Is the first character + or -?
	LI 45			; '-'?
	XOR I TR0
	SNZ
	JMP _fl__NUM_neg

	LI 43			; '+'?
	XOR I TR0
	SNZ
	JMP _fl__NUM_pos

_fl__NUM_parse:	LOAD I TIR0
	SNZ
	JMP _fl__NUM_done	; NULL termination
	STORE R28

	LOAD R numbase	; Multiply the partial sum by BASE
	STORE TR0
	LOAD R29	; Partial sum
	STORE TR1
	TRAP T_MUL16	; Multiply
	LOAD TR2
	STORE R29	; Store it.

	LOAD R28
	AND NOTBIT15	; Process the character
	TRAP T_DIGIT
	SNZ	; Ensure the digit is valid
	JMP _fl__NUM_error	;   and bail out if it isn't.

	LOAD TR0
	ADD R29	; Add it to the partial sum
	STORE R29
	//PRINTD

	LOAD R28	; Neg termination
	SPA
	JMP _fl__NUM_done

	JMP _fl__NUM_parse

_fl__NUM_neg:	LI 1	; Set the negative flag
	STORE R27	; Store it for later

_fl__NUM_pos:	LOAD I TIR0
	JMP _fl__NUM_parse

_fl__NUM_done:	LOAD R27	; Did we see a '-' prefix earlier?
	SZA
	JMP _fl__NUM_negate	; Yes.
	
	LOAD R29



_fl__NUM_push:	TRAP T_PUSH
	LOAD MINUS1
	TRAP T_PUSH
	RTF

_fl__NUM_negate:	LOAD R29
	NEG
	JMP _fl__NUM_push
	
_fl__NUM_error:	LI ERR_BADNUM
	STORE R errno
	LI 0
	TRAP T_PUSH
	RTF
	
// End of file.
