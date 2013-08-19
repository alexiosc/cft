///////////////////////////////////////////////////////////////////////////////
//
// The vector table
//
///////////////////////////////////////////////////////////////////////////////

init_vector_table:
	LIA rom_vector_table
	STORE IR0
	LIA R vector_table	; Equivalent to LI, but LIA for clarity
	STORE IR1
init_vector_loop:
	LOAD I IR0		; Autoindex
	SNZ
	RET
	STORE I IR1		; Also autoindex
	JMP init_vector_loop	; Again.

rom_vector_table:
	.word _rom_user_isr	; ISR vector
	.word _rom_nl		; Newline
	.word _rom_puts		; print string
	.word _rom_puth		; Print hex
	.word _rom_newstack	; Create a stack
	.word _rom_push		; Push a value onto a stack
	.word _rom_pop		; Pop a value from a stackCreate a stack
	.word _rom_peek		; Return the stack's top value without popping
	.word _rom_npeek 	; Return the stack's n-th topmost value without popping
	.word _rom_strlen       ; Length of a string
	.word _rom_strcpy       ; Copy a string
	.word _rom_upcase       ; Convert a string to upper case
	.word _rom_strcmp       ; Compare two strings
	.word _rom_strspn       ; String Span function (C strspn(), skip delimiter)
	.word _rom_strcspn      ; String Non-Span function (C strcspn(), find delimiter)
	.word _rom_strtok       ; String Tokeniser
	.word _rom_forth_word	; Tokenise a Forth word
	.word _rom_memcpy       ; Copy a block of memory
	.word _rom_newdictkey   ; Create a new dict key
	.word _rom_dictfind	; Find a dict key, return body
	.word _rom_digit	; Parse a digit
	.word _rom_mul16	; 16bit integer multiplication
	.word _rom_div16	; 16bit unsigned integer division
	.word _rom_neg32	; 32bit negation
	.word _rom_add32	; 32bit addition
	.word _rom_mul32	; 32bit integer multiplication
	.word _rom_div32	; 32bit unsigned integer division
	.word 0

;;; End of file.
