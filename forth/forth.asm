// -*- asm -*-

// The very basics
.include "../asm/io.asm"
.include "../asm/debugging.asm"
.include "../asm/testing.asm"

///////////////////////////////////////////////////////////////////////////////
//
// CONFIGURATION
//
///////////////////////////////////////////////////////////////////////////////


	.equ UTA	&0400	        ; Start of user task
	.equ UAS	256		; User area size
	.equ DSS	256		; Data stack size (cells)
	.equ RSS	256		; Return stack size (cells)
	.equ TIBS	256		; TIB size (cells)

	.equ PADOFS      80	        ; PAD offset (cells from HERE)

	.equ UAADDR	UTA 		; Address of user area
	.equ DSADDR	@UAADDR+UAS	; Address of data stack
	.equ RSADDR	@DSADDR+DSS	; Address of return stack
	.equ TIBADDR	@RSADDR+RSS	; Address of TIB
	.equ UDADDR     @TIBADDR+TIBS	; Start of user dictionary


// Allocate general registers in page zero, between &00-%30 and
// &80-&90 (auto-increment).
.include "registers.asm"

// Macros. I love'em.
.include "macro_generic.asm"
.include "macro_stack.asm"
.include "macro_forth.asm"

// OS services
//.include "trap_strings.asm"
//.include "trap_memory.asm"

///////////////////////////////////////////////////////////////////////////////
//
// CONSTANTS (USED SO OFTEN THAT ZERO PAGE SPACE IS NEEDED)
//
///////////////////////////////////////////////////////////////////////////////

// Base address of the constant table (which is added
// automatically). Look in _generated_tables.asm.
.equ _const_table &1e0
.equ _maxlinelen 128

///////////////////////////////////////////////////////////////////////////////
//
// VECTOR TABLE
//
///////////////////////////////////////////////////////////////////////////////

// These are initialised at boot time to point to useful routines.

&0200:				; Provisional address
_vector_table:

	// The constant, vector, etc tables
	.include "_generated_tables.asm"
	

	
///////////////////////////////////////////////////////////////////////////////
//
// DEFINES
//
///////////////////////////////////////////////////////////////////////////////

.equ    NULL    &0000		; The null pointer
.equ    TMPOUT  R &81		; Temporary (early development) tty out
.equ    FPSR    R &0		; I/O: front panel Switch Register
.equ    FPDSR   R &1		; I/O: front panel DIP Switch Register
.equ    FPOR    R &2		; I/O: front panel output register lights
.equ    HWTYPE  R &2		; I/O: hardware type register

///////////////////////////////////////////////////////////////////////////////
//
// OS REGISTERS
//
///////////////////////////////////////////////////////////////////////////////

// These are provisional and should be replaced by (emulated)
// UART registers
.equ	ISR	R &0100		; Address of the ISR
.equ	UISR	R &0101		; ISR user routines
.equ	INPFR	R &0102		; Input Flag Register
.equ	INPCH	R &0103		; Input CHaracter

///////////////////////////////////////////////////////////////////////////////
//
// FORTH REGISTERS
//
///////////////////////////////////////////////////////////////////////////////

// Note: these must be updated on context switches.

.equ	IP0	R &090
.equ    SP0     R &091
.equ    RP0     R &092
.equ    CP0     R &093
//.equ    TIBP0   R &094

// These registers form the user context (machine regs + user variables)

.equ 	IP 	R IP0
.equ 	SP 	R SP0
.equ 	RP 	R RP0
.equ 	CP 	R CP0
//.equ 	TIBP 	R TIBP0

// The user area pointer. Note: because we make heavy use of page
// zero, values from the UA are copied to P0 registers for faster
// use.
	
&0300:				; Provisional address
UP0:		.word   &beef			; User UP (start of user area)
;; USPBOT:	 	.word	&beef			; User SPBOT
;; URPBOT:	 	.word	&beef			; User RPBOT
;; UNP:		.word	&beef			; User NP (start of user dictionary)
;; UCP:		.word	&beef			; User CP (first free word of user dictionary)
;; ULAST:	 	.word	&beef			; User LAST (first free word of user dictionary)
;; UBASE:	 	.word	&beef			; User BASE
;; UTIB:	 	.word	&beef			; User TIB (char count + terminal input buffer)
;; UHLD:	 	.word	&beef			; HOLD pointer

;; // TODO	
;; UTKEY:	 	.word	&beef			; User '?KEY (input source)
;; UTEMIT:	 	.word	&beef			; User 'EMIT (output destination)
;; UTMP:	 	.word	&beef			; User tmp
;; UINBUF:	 	.word	&beef			; User inbuf
;; UCTX:	 	.word	&beef			; User context pointer (vocab search order)
;; UCUR:	 	.word	&beef			; User CURRENT
	
;; UTEXP:		 .word	&beef			; User 'EXPECT (lexer)
;; UTOK:		 .word	&beef			; User 'PROMPT

.equ    UP      R UP0
;; .equ    SPBOT   R USPBOT
;; .equ    RPBOT   R URPBOT
;; .equ    NP      R UNP
;; .equ    BASE    R UBASE
;; .equ	LAST    R ULAST
;; .equ	TIB     R UTIB
;; .equ	HLD     R UHLD

	
///////////////////////////////////////////////////////////////////////////////
//
// MEMORY MAP
//
///////////////////////////////////////////////////////////////////////////////

&0400:
user_area:

&0500:
data_stack:

&0600:
ret_stack:

&0700:
tib:

&0800:
user_dict:


///////////////////////////////////////////////////////////////////////////////
//
// FORTH SYSTEM
//
///////////////////////////////////////////////////////////////////////////////


// Local assembly macros
.equ DEC 	ADD MINUS1
// TODO: This must go away, EMIT to be used everywhere	
.equ PUTCHAR	OUT TMPOUT

	
// CFT Code Fields

// Macro: CFA_doLIST(pfa)
//
// Execute a Forth word defined at %pfa and below using the doLIST codeword.
//
// Side effects:
//   None for this macro, but executing the Forth word may have lots.

.macro CFA_doLIST(pfa)
	JMP I R vec_doLIST
.end

	
	
// Macro: CFA_doX(x, pfa)
//
// Execute a Forth word defined at %pfa and below using the codeword do%x.  To
// store the PFA without using extra memory, we abuse the JSR instruction,
// which stores the address of the next cell in memory to location &0000.  The
// do%x handler takes the address at this location and uses it in whatever way
// it needs to.
//
// Side effects:
//   None for this macro, but executing the Forth word may have lots.

.macro CFA_doX(x, pfa)
	JSR I R vec_do%x	; CFA_doX(%x, %pfa)
.end

	
	
// Macro: CFA_doCOL(pfa)
//
// Execute a Forth doCOL word defined at %pfa and below.
//
// Side effects:
//   None for this macro, but executing the Forth word may have lots.

.macro CFA_doCOL(pfa)
	CFA_doX(COL, pfa)
.end

	
	
// Macro: CFA_doVAR(pfa)
//
// Execute a Forth variable or variable-like word defined at %pfa and below.
//
// Side effects:
//   None for this macro, but executing the Forth word may have lots.

.macro CFA_doVAR(pfa)
	CFA_doX(VAR, pfa)
.end

	
	
// Macro: CFA_doCONST(pfa)
//
// Execute a Forth constant or similar word defined at %pfa and below.
//
// Side effects:
//   None for this macro, but executing the Forth word may have lots.

.macro CFA_doCONST(pfa)
	CFA_doX(CONST, pfa)
.end

	
	
// Macro: CFA_doUSER(pfa)
//
// Execute a Forth user variable or similar word defined at %pfa and below.
//
// Side effects:
//   None for this macro, but executing the Forth word may have lots.

.macro CFA_doUSER(pfa)
	CFA_doX(USER, pfa)
.end

	
	
// Macro: CFA_doVOC(pfa)
//
// Execute a Forth vocabulary word.
//
// Side effects:
//   None for this macro, but executing the Forth word may have lots.

.macro CFA_doVOC(pfa)
	CFA_doX(VOC, pfa)
.end


	
		
&e000:
init:
	JSR init_tables
	JSR init_serial
	JSR init_isr

run:	
	// IP sentinel/parachute/trampoline
	LIA @forth+1
	STORE IP
	PUSH (RP)
	
	// Jump into Forth
	LOAD forth
	PUSH (SP)
	doLIST

done:
	HALT			; Halt.
	JMP init		; When resumed, init again.

forth:
	.word dw_COLD_pfa
	.word dw__DONE



///////////////////////////////////////////////////////////////////////////////
//
// INNER INTERPRETER
//
///////////////////////////////////////////////////////////////////////////////

_inner_interpreter:

// Jump to the next Forth instruction. Used at the end of all Forth words.
.equ	NEXT	JMP I R vec_NEXT
.equ	doLIST	JMP I R vec_doLIST
.equ	EXIT	JMP I R vec_EXIT

// Assembler macro: NEXT ( -- ) Machine semantics: PC <- mem[mem[IP++]]
.macro MACRO_NEXT()
	LOAD I IP		; mem[IP++] contains the next pointer to jump to
	STORE TMP0		; Save for dereferencing
	JMP I TMP0		; Dereference and jump
.end


// doLIST ( a -- ) // Run an address list
_doLIST:
	LOAD IP
	PUSH (RP)		; Push the IP onto the Return Stack (RP)
	POP (SP)		; Pop the new value of the IP from the Data Stack
	STORE IP
_NEXT:				; This makes the expanded NEXT macro available.
	MACRO_NEXT()

// TODO: This must be a code word (make a dictionary entry for it)
// doEXIT ( -- ) // Terminate execution of a colon definition
_EXIT:
	POP (RP)
	MACRO_NEXT()

_eo_inner_interpreter:


// doCOL
_doCOL:
	LOAD IP			; Push the IP onto the return stack.
	PUSH (RP)
	LOAD RETV		; Load the return address (PC+1 before JSR, i.e. the PFA)
	STORE IP		; Save it as the new IP
	MACRO_NEXT()


	
// The doVAR and doCONST handler.
//
// The PFA of the word is in the RETV register (&0000). Load the address
// stored there and put it on the stack.
//
// Note, since we don't modify the IP, we never really ENTER this
// word like we ENTER (aka doCOL) a column definition. doVAR words behave
// like special CODE words, and like CODE words, they're terminated with
// a call to NEXT.
//
// Also note that this doubles as the CONST handler. The only difference
// is one of semantics. A variable holds an address (a 16-bit value), while
// a constant holds a 16-bit value.
_doVAR:
_doCONST:
	LOAD RETV
	STORE TMP0
	LOAD I TMP0
	PUSH(SP)
	NEXT

	
	
// The doUSER handler.
//
// The PFA of the word is in the RETV register (&0000). Load the value
// stored there, use it as an offset into the user area, then push the
// address onto the stack.
//	
// Note, since we don't modify the IP, we never really ENTER this
// word like we ENTER (aka doCOL) a column definition. doVAR words behave
// like special CODE words, and like CODE words, they're terminated with
// a call to NEXT
_doUSER:
	LOAD RETV		; The PFA is in RETV
	STORE TMP0		; Store for indirection
	LOAD I TMP0		; Indirection
	ADD UP			; UP[RETV]
	PUSH(SP)
	NEXT

	
	
// The doVOC handler.
//
// The PFA of the word is in the RETV register (&0000). The value
// stored there is the dictionary LINK to the last defined word in the vocabulary.
// Load it, and store it to the top of the dictionary stack.
//	
// Note, since we don't modify the IP, we never really ENTER this
// word like we ENTER (aka doCOL) a column definition. doVAR words behave
// like special CODE words, and like CODE words, they're terminated with
// a call to NEXT

_doVOC:
	LOADUP(UAOFS_pCONTEXT)	; Load the context stack pointer
	STORE TMP1		; Store for later

	LI UAOFS_CONTEXT	; Load the base of the context stack.
	ADD TMP1		; ... + the current context pointer
	ADD UP			; ... + the user area pointer
	ADD MINUS1		; ... -1.
	STORE TMP2		; Store it again.

	RMOV(I TMP1, RETV)	; mem[TMP2] = PFA
	NEXT




///////////////////////////////////////////////////////////////////////////////	


	

	;; Input flags
	.equ IFL_NEWCHAR   &0001 ; A new character was seen
	.equ IFL_CTRLC     &8000 ; Ctrl-C has been pressed


	;; Dictionary flags. Basic flags MUST be below &400.
	.equ FFL_HASHMASK  &0007 ; 3 bits of hash data
	
	.equ FFL_IMMEDIATE &0010 ; Immediate word.
	.equ FFL_COMPILE   &0020 ; Compile-only.
	.equ FFL_RSVD0040  &0040 ;   RESERVED
	.equ FFL_RSVD0080  &0080 ;   RESERVED

	;; Forth dictionary flags (for the compiler's use only -- high bits)

	.equ FFL_TYPE_MASK &0700 ; Word type flag (used for SEE, among others)
	.equ FFL_T_CODE    &0000 ;   Type: machine code
	.equ FFL_T_DOCOL   &0100 ;   Type: doCOL or equivalent
	.equ FFL_T_VAR     &0200 ;   Type: doVAR (address)
	.equ FFL_T_CONST   &0300 ;   Type: doCONST (value) or equivalent
	.equ FFL_T_USER    &0400 ;   Type: doUSER (UA ofs) or equivalent
	.equ FFL_T_DATA    &0500 ;   Type: raw data
	.equ FFL_T_RSVD6   &0600 ;   RESERVED
	.equ FFL_T_RSVD7   &0700 ;   RESERVED

	.equ FFL_RSVD0800  &0800 ; RESERVED
	.equ FFL_RSVD1000  &1000 ; RESERVED
	.equ FFL_RSVD2000  &2000 ; RESERVED
	.equ FFL_ROM       &4800 ; It's in the ROM.
	.equ FFL_CFT       &8000 ; CFT-specific word.


///////////////////////////////////////////////////////////////////////////////
//
// I/O
//
///////////////////////////////////////////////////////////////////////////////

init_serial:
	LI 0
	STORE INPFR
	STORE INPCH
	RET
	

///////////////////////////////////////////////////////////////////////////////
//
// ISR
//
///////////////////////////////////////////////////////////////////////////////

// Interrupt structure
//
// The ISR (label isr) is the interrupt handler. It resides in ROM and
// includes code to save and restore registers. Within, it calls the USR
// routine which does all the dirty work.
//
// The default UISR is a single RET instruction. To save memory, it
// shares a RET instruction with the init_isr routine.
//
// Both of these routines are vectored (registers ISR and UISR) and may be
// changed to point to routines in RAM.


// Subroutine to initialise the interrupt subsystem.
init_isr:
	LIA isr			; Set the ISR
	STORE ISR

	LIA uisr_default	; Set the default user ISR
	STORE UISR

	SEI			; Enable interrupts

uisr_default:
	RET


// TODO: This routine is not reentrant! Use a small stack to save its
// return address or the machine will hang if an interrupt is received
// between the SEI and RTI instructions.

// Interrupt Service Routine (ISR)
isr:
	;; ISR entry code
	
	STORE ISRABKP		; Save A
	LOAD R 0		; Save &0000
	STORE ISRR0BKP
	LOAD R 1		; Save &0001
	STORE ISRR1BKP

// This code should be moved elsewhere.
isr_tty0_loop:
	IN TTY0 TTYPOLL		; Is there anything to input?
	SNZ			; If zero:
	JMP isr_done_tty0	;   No input. We're done.

	LI IFL_NEWCHAR		; We have input. Set the IFL_NEWCHAR flag.
	OR R INPFR
	STORE R INPFR
	
	IN TTY0 TTYDATA		; Read data.
	STORE R INPCH		; Store it for later
	//PRINTC

	;; TODO: move this elsewhere
	;; Halt on ^C
	LI 3
	XOR R INPCH
	SNZ
	HALT

	JMP isr_tty0_loop	; Read more characters

isr_done_tty0:

	;; Invoke user ISR
	JSR I UISR

	;; ISR exit code
	LOAD ISRR1BKP		; Restore &0001
	STORE R 1
	LOAD ISRR0BKP		; Restore &0000
	STORE R 0
	LOAD ISRABKP		; Restore A
	SEI			; Re-enable interrupts
	RTI			; Return


// Include the table initialisation code
.include "tables.asm"


///////////////////////////////////////////////////////////////////////////////
//
// FORTH DICTIONARY
//
///////////////////////////////////////////////////////////////////////////////

.include "_generated_primitives.asm"


///////////////////////////////////////////////////////////////////////////////
//
// THE PROCESSOR VECTORS
//
///////////////////////////////////////////////////////////////////////////////

	;; Reset vector
&fff0:
__bootvec:
	JMP I @+1
	.word init

	;; ISR vector
&fff8:
__isrvec:
	JMP I ISR

// End of file.
