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
.include "trap_strings.asm"
.include "trap_memory.asm"

///////////////////////////////////////////////////////////////////////////////
//
// CONSTANTS (USED SO OFTEN THAT ZERO PAGE SPACE IS NEEDED)
//
///////////////////////////////////////////////////////////////////////////////

// Base address of the constant table (which is added
// automatically). Look in _generated_tables.asm.
.equ _const_table &1e0

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

.equ    UP0     R &030

// These registers form the user context (machine regs + user variables)

.equ 	IP 	R IP0
.equ 	SP 	R SP0
.equ 	RP 	R RP0
.equ 	CP 	R CP0

// The user area pointer. Note: because we make heavy use of page
// zero, values from the UA are copied to P0 registers for faster
// use.
	
&0300:				; Provisional address
USP0:	 .word	&beef			; User SP0
URP0:	 .word	&beef			; User RP0
UNP:	 .word	&beef			; User NP (start of user dictionary)
UCP:	 .word	&beef			; User CP (first free word of user dictionary)
UBASE:	 .word	&beef			; User BASE
	
UTKEY:	 .word	&beef			; User '?KEY (input source)
UTEMIT:	 .word	&beef			; User 'EMIT (output destination)
UTMP:	 .word	&beef			; User tmp
UINBUF:	 .word	&beef			; User inbuf
UTIB:	 .word	&beef			; User TIB
UCTX:	 .word	&beef			; User context pointer (vocab search order)
UCUR:	 .word	&beef			; User CURRENT
	
UTEXP:	 .word	&beef			; User 'EXPECT (lexer)
UTOK:	 .word	&beef			; User 'PROMPT

.equ    UP      R UP0
.equ    NP      R UNP
.equ    BASE    R UBASE


///////////////////////////////////////////////////////////////////////////////
//
// FORTH SYSTEM
//
///////////////////////////////////////////////////////////////////////////////


// Local assembly macros
.equ DEC 	ADD MINUS1

// CFT Code Fields are jump instructions
.equ CFA_doLIST JMP I R vec_doLIST
.equ CFA_doCOL 	JSR I R vec_doCOL
	
&e000:
cold:
	JSR init_tables

	// IP sentinel/parachute/trampoline
	LIA done
	STORE IP
	//PUSH (RP)
	
	// Try out things
	LOAD _test
	PUSH (SP)
	doLIST

done:	
	HALT

_test:
	.word dw_COLD_pfa


// Include the table initialisation code
.include "tables.asm"


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


// doCALL
_doCOL:
	LOAD IP			; Push the IP onto the return stack.
	PUSH (RP)
	LOAD R 0		; Load the return address (PC+1 before JSR, i.e. the PFA)
	STORE IP		; Save it as the new IP
	MACRO_NEXT()


	
	.equ FFL_IMMEDIATE &0001 ; Immediate word.
	.equ FFL_CMPLONLY  &0002 ; Only used while compiling.

	;; Forth dictionary flags (for the compiler's use only)
	.equ FFL_ROM       &4000 ; It's in the ROM.
	.equ FFL_CPH       &0800 ; Code point handler (_DOCOL, etc).
	.equ FFL_PRIMITIVE &1000 ; It's an assembly primitive.
	.equ FFL_DOCOL     &2000 ; It's a colon definition.
	.equ FFL_VARIABLE  &4000 ; It's a variable definition.
	.equ FFL_CFT       &8000 ; CFT-specific primitive.


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
	FAIL
	HALT
	//JMP I @+1
	//.word isr

// End of file.
