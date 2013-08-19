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
	.word &000F	        ; const: PLUS15
	.word &007F	        ; const: PLUS127
	.word &0080	        ; const: PLUS128
	.word &0100	        ; const: PLUS256
	.word &8000	        ; const: BIT15
	.word &ffff	        ; const: MINUS1
	.word &fffe	        ; const: MINUS2
	.word &fffd	        ; const: MINUS3
	.word -99		; const: MS_4MHZ
	.word &ff80             ; const: VDUROWMASK

	.word 0			; End.

	;; Vector table values

_vtstart:
	.word TFORTH		; vector: TFORTH
_vtofs_NEXT:
	.word _NEXT		; vector: _NEXT
_vtofs_doLIST:
	.word _doLIST		; vector: _doLIST
_vtofs_doCOL:
	.word _doCOL		; vector: _doCOL
_vtofs_doVAR:
	.word _doVAR		; vector: _doVAR
_vtofs_doCONST:
	.word _doCONST		; vector: _doCONST
_vtofs_do2CONST:
	.word _do2CONST		; vector: _do2CONST
_vtofs_doUSER:
	.word _doUSER		; vector: _doUSER
_vtofs_doVOC:
	.word _doVOC		; vector: _doVOC
_vtofs_doDOES:
	.word _doDOES		; vector: _doDOES

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
	.word _voc_ROMForth 	; CURRENT: Vocabulary definitions are added to.
_uaofs_pCONTEXT:
	.word 2 		; CTXPTR: Vocabulary stack pointer (relative!)
_uaofs_CONTEXT:
	.word 0			; CONTEXT0: Vocabulary stack (8 cells)
	.word 0			; CONTEXT1
	.word 0 		; CONTEXT2
	.word 0 		; CONTEXT3
	.word 0			; CONTEXT4
	.word 0 		; CONTEXT5
	.word 0 		; CONTEXT6
	.word 0 		; CONTEXT7
_uaofs_CONTEXTEND:
	
	;; Standard user variables


_uaofs_STATE:
	.word FSF_INTERPRET	; STATE: Forth state
	.equ FSF_INTERPRET 0	; Interpreting
	.equ FSF_COMPILE   1	; Compiling

	;; (more or less) Standard user variables
_uaofs_BASE:
	.word 10	        ; BASE: the number base
_uaofs_cTIB:
	.word 0		        ; #TIB: character count in the TIB
_uaofs_TIB:
	.word TIBADDR	        ; TIB: Terminal input (and generic) buffer
_uaofs_ofsIN:
	.word 0			; >IN: input buffer pointer
_uaofs_SPAN:
	.word 0		    	; SPAN: character count received by EXPECT
_uaofs_HLD:
	.word 0			; HLD: pointer used in numeric output
_uaofs_BLK:
	.word 0			; BLK: the block currently being interpreted (0=TTY)
	
	;; CFT-Specific user variables
_uaofs_pBLK:
	.word 0			; >BLK: block buffer pointer.
_uaofs_cBLK:
	.word 0			; #BLK: length of current block (after trimming)
_uaofs_pLINE:
	.word 0			; >LINE: line buffer pointer.
_uaofs_cLINE:
	.word 0			; #LINE: length of current line.
_uaofs_BLKBUF:
	.word 0		        ; BLKBUF: pointer to current block buffer.
_uaofs_BLKBUF0:
	.word BLKB0ADDR	        ; BLKBUF0: pointer to first block buffer.
_uaofs_BLKBUF1:
	.word BLKB1ADDR		; BLKBUF1: pointer to second block buffer.
	
_uaofs_CSP:
	.word 0			; CSP: used for error checking (like eForth)
_uaofs_HANDLER:
	.word 0			; HANDLER: used in error reporting (ANS/eForth?)
_uaofs_DISKUNIT:
	.word 0			; I/O address base of currently selected disk
_uaofs_ROTOR:
	.word 0			; State of the rotor (progress indicator)
;; _uaofs_VDU_CA:
;; 	.word 0			; VDU: Cursor address
;; _uaofs_VDU_ATTR:
;; 	.word 0			; VDU: Current attribute
;; _uaofs_VDU_COLS:
;; 	.word 0			; VDU: current mode columns
;; _uaofs_VDU_ROWS:
;; 	.word 0			; VDU: current mode rows
;; _uaofs_VDU_SSZ:
;; 	.word 0			; VDU: current mode screen size
	
	;; CFT Vectors

	.word dw_rx_q		; '?KEY
_uaofs_EMIT:	
	.word dw_TTY_EMIT		; 'EMIT
_uaofs_INSRC:
	.word dw_INSRC		; 'INSRC
_uaofs_READY:
	.word dw_dot_READY	; '.READY
_uaofs_PS1:
	.word 0			; '.PS1
_uaofs_PS2:
	.word 0			; '.PS2
_uaofs_OK:
	.word dw_dot_ok		; '.OK
_uaofs_EVAL:
	.word 0			; 'EVAL vector (EVAL.INTERPRET or EVAL.COMPILE)
_uaofs_NUMBER:
	.word dw_NUMBERq	; 'NUMBER
_uaofs_EOBq:
	.word dw__EOBq		; 'EOB?
_uaofs_EOLq:
	.word dw__EOLq		; 'EOL?
	
_uaend:

	;; Vector table offets
	.equ VTOFS_NEXT @_vtofs_NEXT-_vtstart
	.equ VTOFS_doLIST @_vtofs_doLIST-_vtstart
	.equ VTOFS_doCOL @_vtofs_doCOL-_vtstart
	.equ VTOFS_doVAR @_vtofs_doVAR-_vtstart
	.equ VTOFS_doCONST @_vtofs_doCONST-_vtstart
	.equ VTOFS_do2CONST @_vtofs_do2CONST-_vtstart
	.equ VTOFS_doUSER @_vtofs_doUSER-_vtstart
	.equ VTOFS_doVOC @_vtofs_doVOC-_vtstart
	.equ VTOFS_doDOES @_vtofs_doDOES-_vtstart
	
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
	.equ VSS @_uaofs_CONTEXTEND-_uaofs_CONTEXT
	
	.equ UAOFS_STATE @_uaofs_STATE-_uastart
	.equ UAOFS_BASE @_uaofs_BASE-_uastart
	.equ UAOFS_cTIB @_uaofs_cTIB-_uastart
	.equ UAOFS_TIB @_uaofs_TIB-_uastart
	.equ UAOFS_ofsIN @_uaofs_ofsIN-_uastart
	.equ UAOFS_HLD @_uaofs_HLD-_uastart
	.equ UAOFS_SPAN @_uaofs_SPAN-_uastart

	.equ UAOFS_BLK @_uaofs_BLK-_uastart
	.equ UAOFS_pBLK @_uaofs_pBLK-_uastart
	.equ UAOFS_cBLK @_uaofs_cBLK-_uastart
	.equ UAOFS_pLINE @_uaofs_pLINE-_uastart
	.equ UAOFS_cLINE @_uaofs_cLINE-_uastart
	.equ UAOFS_BLKBUF @_uaofs_BLKBUF-_uastart
	.equ UAOFS_BLKBUF0 @_uaofs_BLKBUF0-_uastart
	.equ UAOFS_BLKBUF1 @_uaofs_BLKBUF1-_uastart

	.equ UAOFS_CSP @_uaofs_CSP-_uastart
	.equ UAOFS_HANDLER @_uaofs_HANDLER-_uastart
	.equ UAOFS_DISKUNIT @_uaofs_DISKUNIT-_uastart
	.equ UAOFS_ROTOR @_uaofs_ROTOR-_uastart
	;; .equ UAOFS_VDU_CA @_uaofs_VDU_CA-_uastart
	;; .equ UAOFS_VDU_ATTR @_uaofs_VDU_ATTR-_uastart
	;; .equ UAOFS_VDU_COLS @_uaofs_VDU_COLS-_uastart
	;; .equ UAOFS_VDU_ROWS @_uaofs_VDU_ROWS-_uastart
	;; .equ UAOFS_VDU_SSZ @_uaofs_VDU_SSZ-_uastart

	.equ UAOFS_EMIT @_uaofs_EMIT-_uastart
	.equ UAOFS_INSRC @_uaofs_INSRC-_uastart
	.equ UAOFS_READY @_uaofs_READY-_uastart
	.equ UAOFS_PS1 @_uaofs_PS1-_uastart
	.equ UAOFS_PS2 @_uaofs_PS2-_uastart
	.equ UAOFS_OK @_uaofs_OK-_uastart

	.equ UAOFS_EVAL @_uaofs_EVAL-_uastart
	.equ UAOFS_NUMBER @_uaofs_NUMBER-_uastart

	.equ UAOFS_EOBq @_uaofs_EOBq-_uastart
	.equ UAOFS_EOLq @_uaofs_EOLq-_uastart
	

// End of file.
