// -*- asm -*-

///////////////////////////////////////////////////////////////////////////////
//
// CONSTANT, VECTOR ETC. TABLES
//
///////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////
//
// INITIALISATION SUBROUTINE
//
///////////////////////////////////////////////////////////////////////////////

// Initialise constants
init_tables:
	LIA _init_table
	STORE I0

	LIA R _const_table
	STORE I1

init_tables_loop1:
	LOAD I I0
	SNZ
	JMP init_tables_end1
	STORE I I1
	JMP init_tables_loop1

init_tables_end1:


// Initialise vectors

	LIA R _vector_table
	STORE I1
	
init_tables_loop2:
	LOAD I I0
	SNZ
	JMP init_tables_end2
	STORE I I1
	JMP init_tables_loop2

init_tables_end2:
	

// Initialise the user area
// TODO: Move this elsewhere

	LOAD I I0
	STORE SP
	LOAD I I0
	STORE RP
	LOAD I I0
	STORE NP
	STORE CP		; At start, CP=NP.
	LOAD I I0
	STORE BASE

	RET			; Done.

_init_table:
	;; Constant table values
	
	.word &00FF	        ; const: BYTELO
	.word &FF00	        ; const: BYTEHI
	.word &0001	        ; const: PLUS1
	.word &0002	        ; const: PLUS2
	.word &0003	        ; const: PLUS3
	.word &007F	        ; const: PLUS127
	.word &ffff	        ; const: MINUS1
	.word &fffe	        ; const: MINUS2
	.word &fffd	        ; const: MINUS3

	.word 0			; End.

	;; Vector table values

	.word _trap_strpack	; vector: trap_strpack
	.word _trap_strplen	; vector: trap_strplen
	.word _trap_memcpy 	; vector: trap_memcpy
	.word _trap_memrcpy 	; vector: trap_memcpy
	
	.word _NEXT		; vector: _NEXT
	.word _doLIST		; vector: _doLIST
	.word _doCOL		; vector: _doCOL
	.word _EXIT		; vector: _EXIT

	.word 0			; End.

	;; Initialise user area
	
	.word &0400	        ; Initial data stack addr
	.word &0500	        ; Initial return stack addr
	.word &0600		; Start of user dictionary
	.word 10		; Default BASE

// End of file.
