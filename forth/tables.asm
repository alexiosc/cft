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

	RMOV(UP, I I0)
	RMOV(SP, I I0)
	STORE R USPBOT		; At start SP0 = S0
	RMOV(RP, I I0)
	STORE R URPBOT		; At start, RP0 = RP
	RMOV(NP, I I0)
	STORE CP		; At start, CP=NP.
	RMOV(TIB, I I0)
	RMOV(LAST, I I0)
	LI 10
	STORE BASE		; BASE = 10 at boot time.

	RET			; Done.

_init_table:
	;; Constant table values
	
	.word &00FF	        ; const: BYTELO
	.word &0FFF	        ; const: PLUS0FFF
	.word &FFF0	        ; const: PLUSFFF0
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

	//.xword _trap_strpack	; vector: trap_strpack
	//.xword _trap_strplen	; vector: trap_strplen
	//.xword _trap_printps	; vector: trap_printps
	//.xword _trap_strpcmp	; vector: trap_strpcmp
	//.xword _trap_memcpy 	; vector: trap_memcpy
	//.xword _trap_memrcpy 	; vector: trap_memcpy

	.word _NEXT		; vector: _NEXT
	.word _doLIST		; vector: _doLIST
	.word _doCOL		; vector: _doCOL
	.word _EXIT		; vector: _EXIT

	.word 0			; End.

	;; Initialise user area

	.word &0400		; UP: Start of user area
	.word &0400	        ; SP: Initial data stack addr
	.word &0500	        ; RP: Initial return stack addr
	.word &0700		; CP/NP: Start of user dictionary
	.word &0600		; #TIB (256 bytes, also used as generic buffer)
	.word __lastromlink	; Initial LAST

// End of file.
