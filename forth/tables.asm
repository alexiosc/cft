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

	RMOV(UP, I I0)		; Load the user area base addr
	STORE I1		; Store for indexing
	STORE UP		; Also set the UP reg while we're at it

	LOAD I I0
	STORE TMP0		; How many entries to copy

_uacopy_loop:
	RMOV(I I1, I I0)	; Copy one cell
	ISZ TMP0		; Loop again?
	JMP _uacopy_loop	; Yes.

	;; Now initialise the essential registers from the user area.

	RMOV(I1, UP)		; Start indexing.

	RMOV(SP, I I1)		; Initialise SP
	RMOV(RP, I I1)		; Initialise RP
	RMOV(CP, I I1)		; Initialise CP

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

	.word _NEXT		; vector: _NEXT
	.word _doLIST		; vector: _doLIST
	.word _doCOL		; vector: _doCOL
	.word _doVAR		; vector: _doVAR
	.word _doCONST		; vector: _doCONST
	.word _doUSER		; vector: _doUSER
	.word _EXIT		; vector: _EXIT

	.word 0			; End.

	;; Initialise user area

_ua_table:
	.word UAADDR		; UP: Start of user area
	.word NEG_UATLEN	; number of entries following this

_uastart:	
	;; User area: these show the memory structure of a user task. Temporary
        ;; copies are used for task switching, because CFT needs critical
        ;; pointers to be in Page Zero. When task switching, the Page Zero
        ;; registers SP, RP, VP etc are copied to SP1, RP1, VP1, and then
        ;; replaced when the task is entered again.
	
_uaofs_SP0:
	.word DSADDR	        ; SP0: Initial data stack addr
_uaofs_RP0:
	.word RSADDR	    	; RP0: Initial return stack addr
_uaofs_CP0:
	.word UDADDR		; CP: Start of user dictionary

_uatmp:
	.word 0		        ; IP1: Temporary copy of Instruction Pointer
	.word DSADDR	        ; SP1: Temporary copy of data stack addr
	.word RSADDR	    	; RP1: Temporary copy of return stack addr
	.word UDADDR		; CP1: Temporary copy of CP
	.word UAADDR		; UP1: Temporary copy of UP register

	;; The Vocabulary Stack

_uaofs_CURRENT:
	.word _voc_Forth 	; CURRENT: Vocabulary definitions are added to.
_uaofs_pCONTEXT:
	.word _voc_Forth 	; CTXPTR: Vocabulary stack pointer (relative!)
_uaofs_CONTEXT:
	.word _voc_Forth;Root	; CONTEXT0: Vocabulary stack (8 cells)
	.word _voc_Forth	; CONTEXT1
	.word 0 		; CONTEXT2
	.word 0 		; CONTEXT3
	.word 0			; CONTEXT4
	.word 0 		; CONTEXT5
	.word 0 		; CONTEXT6
	.word 0 		; CONTEXT7

	;; Standard user variables


_uaofs_STATE:
	.word FSF_INTERPRET	; STATE: Forth state
	.equ FSF_INTERPRET 0	; Interpreting
	.equ FSF_COMPILE   1	; Compiling
	
_uaofs_BASE:
	.word 10	        ; BASE: the number base
_uaofs_cTIB:
	.word 0		        ; #TIB: character count in the TIB
_uaofs_TIB:
	.word TIBADDR	        ; TIB: Terminal input (and generic) buffer
_uaofs_pIN:
	.word 0			; >IN: input buffer pointer
_uaofs_SPAN:
	.word 0		    	; SPAN: character count received by EXPECT
_uaofs_HLD:
	.word 0			; HLD: pointer used in numeric output

	;; Local user variables

_uaofs_CSP:
	.word 0			; CSP: used for error checking (like eForth)
_uaofs_HANDLER:
	.word 0			; HANDLER: used in error reporting (ANS/eForth?)
	
	;; CFT Vectors

	.word dw_rx_q		; '?KEY
	.word dw_EMIT		; 'EMIT
_uaofs_READY:
	.word dw_dot_READY	; '.READY
_uaofs_PROMPT:
	.word 0			; '.PROMPT
_uaofs_OK:
	.word dw_dot_ok		; '.OK
_uaofs_EVAL:
	.word 0			; 'EVAL vector (EVAL.INTERPRET or EVAL.COMPILE)
_uaofs_NUMBER:
	.word dw_NUMBERq	; 'NUMBER
_uaofs_EOBq:
	.word dw_EOTIBq		; 'EOB?
	
_uaend:
	;; Calculate the length of the user area table.
	.equ NEG_UATLEN @_uastart-_uaend

	;; The offset in the user area of the temporary register file.
	.equ UA_TMPOFS @_uatmp-_uastart

	.equ UAOFS_SP0 @_uaofs_SP0-_uastart
	.equ UAOFS_RP0 @_uaofs_RP0-_uastart

	;; Offsets of other variables
	.equ UAOFS_CURRENT @_uaofs_CURRENT-_uastart
	.equ UAOFS_pCONTEXT @_uaofs_pCONTEXT-_uastart
	.equ UAOFS_CONTEXT @_uaofs_CONTEXT-_uastart
	
	.equ UAOFS_STATE @_uaofs_STATE-_uastart
	.equ UAOFS_BASE @_uaofs_BASE-_uastart
	.equ UAOFS_cTIB @_uaofs_cTIB-_uastart
	.equ UAOFS_TIB @_uaofs_TIB-_uastart
	.equ UAOFS_pIN @_uaofs_pIN-_uastart
	.equ UAOFS_HLD @_uaofs_HLD-_uastart
	.equ UAOFS_SPAN @_uaofs_HLD-_uastart

	.equ UAOFS_CSP @_uaofs_CSP-_uastart
	.equ UAOFS_HANDLER @_uaofs_HANDLER-_uastart

	.equ UAOFS_READY @_uaofs_READY-_uastart
	.equ UAOFS_PROMPT @_uaofs_PROMPT-_uastart
	.equ UAOFS_OK @_uaofs_OK-_uastart

	.equ UAOFS_EVAL @_uaofs_EVAL-_uastart
	.equ UAOFS_NUMBER @_uaofs_NUMBER-_uastart

	.equ UAOFS_EOBq @_uaofs_EOBq-_uastart
	

// End of file.
