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


//.equ	EM	&c000		; Top of memory (48kW)
//.equ	USIZE	64		; User area size
//.equ	RTSIZE	128		; Return stack/TIB size
//.equ	RPP	@EM-256		; Start of return stack.
//.equ	TIBB	@RPP-RTSIZE	; Size of terminal Input Buffer (TIB)
//.equ    SPP     @TIBB-8		; Start of user stack
//.equ    UPP     @EM-256		; Start of user area
//.equ    NAMEE   @EM-256		; Start of user area


// Allocate general registers in page zero, between &00-%30 and
// &80-&90 (auto-increment).
.include "registers.asm"

// Macros. We love'em.
.include "macro_generic.asm"
.include "macro_stack.asm"

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
	

	
//vec_NEXT:	.word &dead	; Address of NEXT
//vec_doLIST:	.word &dead	; Address of doLIST
//vec_doCOL:	.word &dead	; Address of doCOL
//vec_EXIT:	.word &dead	; Address of EXIT

///////////////////////////////////////////////////////////////////////////////
//
// DEFINES
//
///////////////////////////////////////////////////////////////////////////////

.equ    NULL    &0000		; The null pointer
.equ    TMPOUT  R &81		; Temporary (early development) tty out

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
.equ    TIBP0   R &094

// These registers form the user context (machine regs + user variables)

.equ 	IP 	R IP0
.equ 	SP 	R SP0
.equ 	RP 	R RP0
.equ 	CP 	R CP0
.equ 	TIBP 	R TIBP0

// The user area pointer. Note: because we make heavy use of page
// zero, values from the UA are copied to P0 registers for faster
// use.
	
&0300:				; Provisional address
UP0:		.word   &beef			; User UP (start of user area)
USP0:	 	.word	&beef			; User SP0
URP0:	 	.word	&beef			; User RP0
UNP:		.word	&beef			; User NP (start of user dictionary)
UCP:		.word	&beef			; User CP (first free word of user dictionary)
ULAST:	 	.word	&beef			; User LAST (first free word of user dictionary)
UBASE:	 	.word	&beef			; User BASE
UTIB:	 	.word	&beef			; User TIB (char count + terminal input buffer)
UHLD:	 	.word	&beef			; HOLD pointer

// TODO	
UTKEY:	 	.word	&beef			; User '?KEY (input source)
UTEMIT:	 	.word	&beef			; User 'EMIT (output destination)
UTMP:	 	.word	&beef			; User tmp
UINBUF:	 	.word	&beef			; User inbuf
UCTX:	 	.word	&beef			; User context pointer (vocab search order)
UCUR:	 	.word	&beef			; User CURRENT
	
UTEXP:		 .word	&beef			; User 'EXPECT (lexer)
UTOK:		 .word	&beef			; User 'PROMPT

.equ    UP      R UP0
.equ    NP      R UNP
.equ    BASE    R UBASE
.equ	LAST    R ULAST
.equ	TIB     R UTIB
.equ	HLD     R UHLD


///////////////////////////////////////////////////////////////////////////////
//
// FORTH SYSTEM
//
///////////////////////////////////////////////////////////////////////////////


// Local assembly macros
.equ DEC 	ADD MINUS1
.equ PUTCHAR	OUT TMPOUT

// CFT Code Fields are jump instructions
.equ CFA_doLIST JMP I R vec_doLIST
.equ CFA_doCOL 	JSR I R vec_doCOL
	
&e000:
cold:
	JSR init_tables
	JSR init_isr

	//TRAP vec_trap_printps
	//.word @+1
	//.word bootstr

	//JSR printdict
	JMP run

foobar:	.word &1000

//bootstr:	.strp 10 10 27 "[0;33m" 27 "#3 CFT " 10 27 "#4 CFT " 10 10 27 "[0m16-bit Mini-Computer" 10 "CFT Booted." 10 "Available words:" 10 0
//str2:	.strp "This is another test" 0

run:	
	// IP sentinel/parachute/trampoline
	LIA _done
	STORE IP
	PUSH (RP)
	
	// Try out things
	LOAD _test
	PUSH (SP)
	doLIST

done:
	HALT

_test:
	.word dw_COLD_pfa
_done:
	.word dw_dot_done

printdict:
	// Print out dictionary
	LI 0
	STORE TMP3
	
	LIA ARG0
	STORE ARGP
	
	LOAD LAST
	STORE R0		; Save pointer

printdict_loop:	
	LOAD R0
	SNZ
	JMP printdict_end
	
	ADD PLUS1		; Skip over flags
	STORE R1		; Store the string pointer
	ADD PLUS1
	STORE R0		; Store the link

	LOAD I R1		; Indirection
	STORE R2
	//TRAP vec_trap_printps
	.word @R2^R
	.word 0

	ISZ TMP3
	
	LI 32
	PUTCHAR

	LOAD I R0
	STORE R0
	JMP printdict_loop

printdict_end:
	LI 10
	PUTCHAR
	LOAD TMP3
	PRINTD
	LI 10
	PUTCHAR
	PUTCHAR
	PUTCHAR
	RET


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
	//PRINTA
	//JSR I printstack
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


// doCALL
_doCOL:
	LOAD IP			; Push the IP onto the return stack.
	PUSH (RP)
	LOAD R 0		; Load the return address (PC+1 before JSR, i.e. the PFA)
	STORE IP		; Save it as the new IP
	MACRO_NEXT()


	
	;; Input flags
	.equ IFL_NEWCHAR   &0001 ; A new character was seen
	.equ IFL_CTRLC     &8000 ; Ctrl-C has been pressed

	;; Dictionary flags. Basic flags MUST be below &400.
	.equ FFL_HASHMASK  &0007 ; 3 bits of hash data
	.equ FFL_IMMEDIATE &0010 ; Immediate word.
	.equ FFL_CMPLONLY  &0020 ; Compile-only.
	.equ FFL_RESERVED  &0040 ;   [the third standard Forth flag]

	;; Forth dictionary flags (for the compiler's use only -- high bits)
	.equ FFL_ROM       &4000 ; It's in the ROM.
	.equ FFL_CPH       &0800 ; Code point handler (_DOCOL, etc).
	.equ FFL_PRIMITIVE &1000 ; It's an assembly primitive.
	.equ FFL_DOCOL     &2000 ; It's a colon definition.
	.equ FFL_VARIABLE  &4000 ; It's a variable definition.
	.equ FFL_CFT       &8000 ; CFT-specific primitive.


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
	.word cold

	;; ISR vector
&fff8:
__isrvec:
	JMP I ISR

// End of file.
