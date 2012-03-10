// -*- asm -*-

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
	

///////////////////////////////////////////////////////////////////////////////
//
// GENERIC REGISTERS
//
///////////////////////////////////////////////////////////////////////////////

.equ	R0	R &000
.equ	R1	R &001
.equ	R2	R &002
.equ	R3	R &003

.equ    I0      R &080
.equ    I1      R &081
.equ    I2      R &082
.equ    I3      R &083

.equ    TMP3    R &00c
.equ    TMP2    R &00d
.equ	TMP1	R &00e
.equ	TMP0	R &00f

///////////////////////////////////////////////////////////////////////////////
//
// CONSTANTS (USED SO OFTEN THAT ZERO PAGE SPACE IS NEEDED)
//
///////////////////////////////////////////////////////////////////////////////

.equ    PLUS1   R &7C
.equ 	MINUS1	R &7D
.equ 	MINUS2	R &7E
.equ 	MINUS3	R &7F

///////////////////////////////////////////////////////////////////////////////
//
// VECTOR TABLE
//
///////////////////////////////////////////////////////////////////////////////

// These are initialised at boot time to point to useful routines.

&0200:
_vector_table:
vec_NEXT:	.word &dead	; Address of NEXT
vec_doLIST:	.word &dead	; Address of doLIST
vec_doCOL:	.word &dead	; Address of doCOL
vec_EXIT:	.word &dead	; Address of EXIT

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

.equ	IP0	R &090
.equ    SP0     R &091
.equ    RP0     R &092
.equ    UP0     R &010

.equ 	IP 	IP0
.equ 	SP 	SP0
.equ 	RP 	RP0

.equ    UP      UP0


///////////////////////////////////////////////////////////////////////////////
//
// GENERIC MACROS
//
///////////////////////////////////////////////////////////////////////////////

// Macro: DECM (addr)
//
// Decrement the value at addr by one.
//
// Side effects:
//   mem[addr]--
//   AC = mem[addr]
//   L
.macro DECM (addr)
	LOAD %addr
	ADD MINUS1
	STORE %addr
.end

///////////////////////////////////////////////////////////////////////////////
//
// STACK MACROS
//
///////////////////////////////////////////////////////////////////////////////

// Please note: CFT stacks grow upwards.

// Macro: PUSH(stack)
//
// Stack must be an autoincrement location.
// Push AC onto the stack pointed to by stack. No checks are
// performed.

.macro PUSH (stack)
	STORE I %stack		; mem[%stack++] <- AC
.end

// Macro: POP0 (stack)
//
// Decrement a stack pointer. Save a the location of the top item in TMP0.
//
// Warnings:
//   No checks are performed.
//
// Side effects:
//   %stack--
//   TMP0 = %stack
//   L	
.macro POP0 (stack)
	DECM (%stack)		; POP0(%stack): %stack--
	STORE TMP0		; Store it elsewhere to avoid autoincrement.
.end

// Macro: POP (stack)
//
// Pop a value from a stack. Return it in AC.
//
// Warnings:
//   No checks are performed.
//
// Side effects:
//   %stack--
//   TMP0 = %stack
//   AC = mem[TMP0]
.macro POP (stack)
	POP0 (%stack)
	LOAD I TMP0		; And load value from stack
.end

// Macro: SPEEK (stack)
//
// Load the top value of a stack without popping.
//
// Warnings:
//   No checks are performed.
//
// Side effects:
//   TMP0 = %stack - 1
//   AC = mem[TMP0]
//   L	
.macro SPEEK (stack)
	LOAD %stack		; Find [%stack-1]
	ADD MINUS1
	STORE TMP0		; Store for indirection
	LOAD I TMP0		; AC <- mem[%stack-1]
.end
	
// Macro: SPEEKn (stack)
//
// Load the n-th-from-the-top value of a stack without popping.
//
// Warnings:
//   No checks are performed.
//   n must be 1, 2 or 3.
//
// Side effects:
//   TMP0 = %stack - n
//   AC = mem[TMP0]
//   L	
.macro SPEEKn (stack, n)
	LOAD %stack		; Find [%stack-1]
	ADD MINUS%n
	STORE TMP0		; Store for indirection
	LOAD I TMP0		; AC <- mem[%stack-1]
.end
	
// Macro: SPOKE (stack)
//
// Directly modify the top value of a stack.
//
// Warnings:
//   No checks are performed.
//
// Side effects:
//   TMP0 = %stack - 1
//   mem[TMP0] = AC
//   TMP1 = AC
//   L	
.macro SPOKE (stack)
	STORE TMP1		; Keep a copy of AC
	LOAD %stack		; Find [%stack-1]
	ADD MINUS1
	STORE TMP0		; Store for indirection
	LOAD TMP1		; Get initial AC again
	STORE I TMP0		; mem[%stack-1] <- AC
.end

// Macro: SPOKE0 (stack)
//
// Directly modify the top value of a stack.
//
// Preconditions:
//
//   MUST come after SPEEK(stack) and TMP0 MUST NOT be modified.
//
// Warnings:
//   No checks are performed.
//
// Side effects:
//   mem[TMP0] = AC
.macro SPOKE0 (stack)
	STORE I TMP0		; mem[%stack-1] <- AC
.end

	
// Macro: SPOKEn (stack, n)
//
// Directly modify the top value of a stack.
//
// Warnings:
//   No checks are performed.
//   n must be 1, 2, or 3.
//
// Side effects:
//   TMP0 = %stack - 1
//   mem[TMP0] = AC
//   TMP1 = AC
//   L	
.macro SPOKEn (stack, n)
	STORE TMP1		; Keep a copy of AC
	LOAD %stack		; Find [%stack-1]
	ADD MINUS%n
	STORE TMP0		; Store for indirection
	LOAD TMP1		; Get initial AC again
	STORE I TMP0		; mem[%stack-1] <- AC
.end

	
// Macro: POP1PEEK1 (stack)
//
// Prepare for a Forth binary op. The op would pop two values, operate
// on them, and push the result at the end. Instead, we pop one value,
// and peek the other one. The TOP of the stack is returned in AC. The
// second top-most value (first pushed) is in TMP1. TMP0 points to the
// now-topmost value of the stack.
//
// Warnings:
//   No checks are performed.
//   This must be used in conjunction with POKE0().
//
// Side effects:
//   TMP0 = %stack - 1
//   AC = first pop() (actually the peek)
//   TMP1 = second pop()
//   L
.macro POP1PEEK1 (stack)
	LOAD %stack		; POP1PEEK1(%stack)
	ADD MINUS2
	STORE %stack		; %stack <- %stack - 2
	STORE TMP0		; TMP0 <- %stack

	LOAD I %stack		; second item (autoincrement)
	STORE TMP1
	LOAD I TMP0		; first item (no autoincrement)
.end

	

// Macro: POP2 (stack)
//
// Prepare for a Forth binary op. The op would pop two values and push
// nothing. The first value is in AC, the second in TMP0.
//
// Warnings:
//   No checks are performed.
//
// Side effects:
//   TMP0 = %stack - 1
//   TMP2 = %stack - 2
//   AC = first pop()
//   TMP1 = second pop()
//   L
.macro POP2 (stack)
	LOAD %stack		; POP1PEEK1(%stack)
	ADD MINUS1
	STORE TMP0		; TMP0 <- %stack-1

	ADD MINUS1
	STORE TMP2		; TMP2 <- %stack-1
	STORE %stack

	LOAD I TMP0
	STORE TMP1

	LOAD I TMP2
.end

	

// Macro: POP2r (stack)
//
// Prepare for a Forth binary op. The op would pop two values and push
// nothing. The first value is in TMP0, the second in AC. Useful for
// indirection in Forth ( w a -- ) words.
//
// Warnings:
//   No checks are performed.
//
// Side effects:
//   TMP0 = %stack - 1
//   TMP2 = %stack - 2
//   TMP1 = first pop()
//   AC = second pop()
//   L
.macro POP2r (stack)
	LOAD %stack		; POP2(%stack)
	ADD MINUS1
	STORE TMP0		; TMP0 <- %stack-1

	ADD MINUS1
	STORE TMP2		; TMP2 <- %stack-1
	STORE %stack

	LOAD I TMP2
	STORE TMP1

	LOAD I TMP0
.end

	

///////////////////////////////////////////////////////////////////////////////
//
// FORTH SYSTEM
//
///////////////////////////////////////////////////////////////////////////////


// CFT Code Fields are jump instructions
.equ CFA_doLIST JMP I R vec_doLIST
.equ CFA_doCOL JSR I R vec_doCOL
	
&e000:
cold:
	JSR init_constants

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
	.word dw_TEST_pfa


///////////////////////////////////////////////////////////////////////////////
//
// INITIALISATION SUBROUTINE
//
///////////////////////////////////////////////////////////////////////////////

// Initialises constants etc.
init_constants:
	//LIA _init_table
	//STORE I0

	LIA _init_table
	STORE I0

	LOAD I I0
	STORE PLUS1
	LOAD I I0
	STORE MINUS1
	LOAD I I0
	STORE MINUS2
	LOAD I I0
	STORE MINUS3
	LOAD I I0
	STORE SP
	LOAD I I0
	STORE RP

	// The rest initialises the vector table
	LIA R _vector_table	; Equivalent to LI, but LIA for clarity
	STORE I1
	
init_vector_loop:
	LOAD I I0		; Autoindex
	SNZ			; If AC==0:
	RET
	STORE I I1		; Also autoindex
	JMP init_vector_loop	; Again.

_init_table:
	.word &0001	        ; PLUS1
	.word &ffff	        ; MINUS1
	.word &fffe	        ; MINUS2
	.word &fffd	        ; MINUS3
	.word &0400	        ; Initial data stack addr
	.word &0500	        ; Initial return stack addr

	;; Vector table values
	.word _NEXT		; NEXT vector
	.word _doLIST		; doLIST vector
	.word _doCOL		; doCOL vector
	.word _EXIT		; EXIT vector
	
	.word 0			; End.

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


///////////////////////////////////////////////////////////////////////////////
//
// I/O SUBROUTINES
//
///////////////////////////////////////////////////////////////////////////////

// TODO


// According to http://www.offete.com/files/zeneForth.htm, the eForth
// kernel makes do with 32 primitives:
//
// . BYE (we don't need this, there's nothing outside of the Forth system)
// . ?rx (console input)
// . tx! (console output)
// . !io (serial I/O init)
//
// . doLIT (execute literal)
// * doLIST (execute address list)
// * next (step IP)
// . ?branch (branch if zero)
// . branch (always branch)
// . EXECUTE (execute word)
// * EXIT (end execution of colon definition)
// . ! (store to memory)
// . @ (load from memory)
// [ C! (can't implement) ]
// [ C@ (can't implement) ]
//
// RP@, RP!, R>, R@, >R
//
// SP@, SP!, DROP, DUP, SWAP, OVER
//
// 0<, AND, OR, XOR, UM+
//
// Of these, many are superfluous if we have an assembler.
	
	.equ FFL_IMMEDIATE &0001 ; Immediate word.
	.equ FFL_CMPLONLY  &0002 ; Only used while compiling.

	;; Forth dictionary flags (for the compiler's use only)
	.equ FFL_ROM       &4000 ; It's in the ROM.
	.equ FFL_CPH       &0800 ; Code point handler (_DOCOL, etc).
	.equ FFL_PRIMITIVE &1000 ; It's an assembly primitive.
	.equ FFL_DOCOL     &2000 ; It's a colon definition.
	.equ FFL_VARIABLE  &4000 ; It's a variable definition.
	.equ FFL_CFT       &8000 ; CFT-specific primitive.

// End of file.
