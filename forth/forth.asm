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


	.equ UTA	&0400	         ; Start of user task
	.equ UAS	256		 ; User area size
	.equ DSS	256		 ; Data stack size (cells)
	.equ RSS	256		 ; Return stack size (cells)
	.equ TIBS	256		 ; TIB size (cells)
	.equ BLKBS      1024		 ; Block buffer size (cells)

	.equ PADOFS      80	         ; PAD offset (cells from HERE)

	.equ UAADDR	UTA 		 ; Address of user area
	.equ DSADDR	@UAADDR+UAS	 ; Address of data stack
	.equ RSADDR	@DSADDR+DSS	 ; Address of return stack
	.equ TIBADDR	@RSADDR+RSS	 ; Address of TIB
	.equ BLKB0ADDR  @TIBADDR+TIBS    ; Address of 1st block buffer
	.equ BLKB1ADDR  @BLKB0ADDR+BLKBS ; Address of 1st block buffer
	.equ UDADDR     @BLKB1ADDR+BLKBS ; Start of user dictionary


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
.equ    TMPOUT  R &63		; Temporary (early development) tty out

;; Dual UART ports
.equ    DUART0     R &60	; DUART0 base address
.equ    DUART1     R &70	; DUART1 base address
.equ    DUART_IMR  5		; IMR (one per DUART)
.equ    DUART_ISR  5		; ISR (one per DUART)
.equ	UARTA	   0		; UART channel A offset
.equ	UARTB	   8		; UART channel B offset
.equ    UARTMR     0		; UART Mode Register (MR0/1/2, one per UART)
.equ    UARTSR     1		; UART Status Register (one per UART)
.equ    UARTCSR    1		; UART Clock Select Register (CSRA/B, one per UART)
.equ    UARTCR     2		; UART Command Register (CRA/B, one per UART)
.equ    UARTFIFO   3		; UART FIFO (TX/RX, two per UART)
.equ    UARTACR    4		; UART Aux Control Register (one per UART)

;; The Memory Banking Unit (MBU)

.equ    MBU        R &40        ; MBU Base. Valid values are MBU 0 to MBU 7
.equ    MBUEN      R &50	; Enable MBU by writing to &50-%53.

;; The IDE host adaptors

.equ    IDE0       R &a0	; Base address of host adaptor 0
.equ    IDE1       R &c0	; Base address of host adaptor 1



///////////////////////////////////////////////////////////////////////////////
//
// OS REGISTERS
//
///////////////////////////////////////////////////////////////////////////////

// TODO: Move these to 
	
// These are provisional and should be replaced by (emulated)
// UART registers

&0100:	
.reg	ISR	R @		; Address of the ISR
.reg	UISR	R @		; ISR user routines
.reg	INPFR	R @		; Input Flag Register
.reg	INPCH	R @		; Input Character

.reg    DSKUNIT R @		; The currently active disk unit.
	
.reg    SYSCFG  R @	  	; System config flags (see CFG_x equs below)
.reg    SYSMEM  R @         	; Number of 8kW banks of RAM (high byte) and ROM (low byte)
.reg    SYSIDE0 R @		; Base I/O address of IDE ports 0A and 0B.
.reg    SYSIDE1 R @		; Base I/O address of IDE ports 1A and 1B.

.reg    MBUB0   R @		; MBU backup: bank 0
.reg    MBUB1   R @		; MBU backup: bank 1
.reg    MBUB2   R @		; MBU backup: bank 2
.reg    MBUB3   R @		; MBU backup: bank 3
.reg    MBUB4   R @		; MBU backup: bank 4
.reg    MBUB5   R @		; MBU backup: bank 5
.reg    MBUB6   R @		; MBU backup: bank 6
.reg    MBUB7   R @		; MBU backup: bank 7

.reg    IDEDCR  R @		; Last IDE disk: Device Control Register
.equ    IDEASR  IDEDCR		; Last IDE disk: Alternate Status Register (=IDEDCR)
.reg    IDEDATA R @		; Last IDE disk: Data register
.reg    IDEERR  R @		; Last IDE disk: Error register
.reg    IDESCR  R @		; Last IDE disk: Sector Count register
.reg    IDELBA0 R @		; Last IDE disk: LBA0/Sector number register
.reg    IDELBA1 R @		; Last IDE disk: LBA1/Cylinder low register
.reg    IDELBA2 R @		; Last IDE disk: LBA2/Cylinder high register
.reg    IDELBA3 R @		; Last IDE disk: LBA3/Drive/Head Register
.equ    IDEDHR  IDELBA3		; Last IDE disk: LBA3/Drive/Head Register (=IDELBA3)
.reg    IDESR   R @		; Last IDE disk: Status register
.equ    IDECMD  IDESR		; Last IDE disk: Command register (=IDESR)
.reg    IDEDHRB R @ 		; Lase IDE disk: DHR register base value (LBA | drive num)
.reg    IDECURU R @	        ; Last IDE disk: current unit

.reg    HD0SZLO R @		; HD 0 size in sectors, low word
.reg    HD0SZHI R @		; HD 0 size in sectors, high word
.reg    HD1SZLO R @		; HD 1 size in sectors, low word
.reg    HD1SZHI R @		; HD 1 size in sectors, high word
.reg    HD2SZLO R @		; HD 2 size in sectors, low word
.reg    HD2SZHI R @		; HD 2 size in sectors, high word
.reg    HD3SZLO R @		; HD 3 size in sectors, low word
.reg    HD3SZHI R @		; HD 3 size in sectors, high word

.equ    CFG_MBU  #---------------1 ; MBU is present.
.equ    CFG_RTC  #--------------1- ; RTC is present.
.equ    CFG_NVR  #--------------1- ; NVRAM is present (currently same as RTC)
.equ    CFG_HD0  #-------------1-- ; IDE HD0 (IDE0A) is present.
.equ    CFG_HD1  #------------1--- ; IDE HD1 (IDE0B) is present.
.equ    CFG_HD2  #-----------1---- ; IDE HD2 (IDE1A) is present.
.equ    CFG_HD3  #----------1----- ; IDE HD3 (IDE1B) is present.

	
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
UP0:		.word   &beef	; User UP (start of user area)

.equ    UP      R UP0



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
blkbuf0:

&0c00:
blkbuf1:

&1000:
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

	
	
// Macro: CFA_do2CONST(pfa)
//
// Execute a Forth constant or similar word defined at %pfa and below.
//
// Side effects:
//   None for this macro, but executing the Forth word may have lots.

.macro CFA_do2CONST(pfa)
	CFA_doX(2CONST, pfa)
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


	
		
&c000:
__origin:
	;; ROM header.
	.word &0cf7		; Magic (CFT)
	.word @-1		; Origin addr.

	.word 1			; Number of programs
	.word 0			; Reserved

	;; Program #1
	
	.strp "CFT Forth ROM 0.1            " 0
	;;     112233445566778899aabbccddeef  f
	;;     NB: MUST BE THIS LENGTH!

	.word init		; Entry point

	;; End of header.
	
init:
	JSR init_tables
	JSR init_serial
	JSR init_isr

run:	
	// IP sentinel/parachute/trampoline
	LOAD @forth+1
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
	.word dw__DONE_pfa


	;; This is the very brief TFORTH trap. It lives in page 0 for
	;; speed. It allows FORTH words to be called from Assembly.

TFORTH:
	RPUSH(RP, IP)		; Save the IP

	RMOV(TMP0, I RTTV)     ; Get the address of the Forth word
	ISZ RTTV	       ; Get the address of the return address.
	RPUSH(RP, RTTV)
	LIA TFORTH_pret
	STORE IP
	JMP I TMP0	       ; Jump right into the inner interpreter

TFORTH_ret:	
	;; This is where we re-emerge.
	RPOP(RTTV, RP)	        ; Restore the return address
	RPOP(IP, RP)	        ; Restore the IP
	RTT		        ; And jump to it.
	
TFORTH_pret:
	.word TFORTH_ret

	
	
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


	
// The doVAR handler.
//
// The PFA of the word is in the RETV register (&0000). Put that value on the
// stack, as it's the address of the variable itself.
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
	LOAD RETV
	PUSH(SP)
	NEXT

	

// The doCONST handler.
//
// The PFA of the word is in the RETV register (&0000). Load the value
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
_doCONST:
	LOAD I RETV
	PUSH(SP)
	NEXT

	

// The do2CONST handler.
//
// The PFA of the word is in the RETV register (&0000). Load the value stored
// at mem[PFA] and mem[PFA+1} and leave them on the stack in that order. [PFA]
// is the low order cell of a double constant, [PFA+1] is the high order cell.
//
// Note, since we don't modify the IP, we never really ENTER this
// word like we ENTER (aka doCOL) a column definition. doVAR words behave
// like special CODE words, and like CODE words, they're terminated with
// a call to NEXT.
//
// Also note that this doubles as the CONST handler. The only difference
// is one of semantics. A variable holds an address (a 16-bit value), while
// a constant holds a 16-bit value.
_do2CONST:
	LOAD I RETV
	PUSH(SP)

	ISZ RETV
	LOAD I RETV
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

	RMOV(I TMP2, RETV)	; mem[TMP2] = PFA
	NEXT




///////////////////////////////////////////////////////////////////////////////	


	

	;; Input flags
	.equ IFL_NEWCHAR   &0001 ; A new character was seen
	.equ IFL_CTRLC     &8000 ; Ctrl-C has been pressed


	;; Dictionary flags. Basic flags MUST be below &400.
	.equ FFL_HASHMASK  #--------'-----111 ; 3 bits of hash data
	
	.equ FFL_IMMEDIATE #--------'----1--- ; Immediate word.
	.equ FFL_COMPILE   #--------'---1---- ; Compile-only.
	.equ FFL_RSVD0020  #--------'--1----- ;   RESERVED
	.equ FFL_RSVD0040  #--------'-1------ ;   RESERVED
	.equ FFL_RSVD0080  #--------'1------- ;   RESERVED

	;; Forth dictionary flags (for the compiler's use only -- high bits)

	.equ FFL_TYPE_MASK #-----111'-------- ; Word type flag (used for SEE, among others)
	.equ FFL_T_CODE    #-----000'-------- ;   Type: machine code
	.equ FFL_T_DOCOL   #-----001'-------- ;   Type: doCOL or equivalent
	.equ FFL_T_VAR     #-----010'-------- ;   Type: doVAR (address)
	.equ FFL_T_CONST   #-----011'-------- ;   Type: doCONST (value) or equivalent
	.equ FFL_T_USER    #-----100'-------- ;   Type: doUSER (UA ofs) or equivalent
	.equ FFL_T_DATA    #-----101'-------- ;   Type: raw data
	.equ FFL_T_RSVD6   #-----110'-------- ;   RESERVED
	.equ FFL_T_RSVD7   #-----111'-------- ;   RESERVED

	.equ FFL_RSVD0800  #----1---'-------- ; RESERVED
	.equ FFL_RSVD1000  #---1----'-------- ; RESERVED
	.equ FFL_RSVD2000  #--1-----'-------- ; RESERVED
	.equ FFL_ROM       #-1------'-------- ; It's in the ROM.
	.equ FFL_CFT       #1-------'-------- ; CFT-specific word.


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
	IN TTY0 TTYSR		; Is there anything to input?
	AND isr_ttycs_rxrdy	; Check RxRDY bit
	SNZ			; If zero:
	JMP isr_done_tty0	;   No input. We're done.

	LI IFL_NEWCHAR		; We have input. Set the IFL_NEWCHAR flag.
	OR R INPFR
	STORE R INPFR
	
	IN TTY0 TTYFIFO		; Read data.
	STORE R INPCH		; Store it for later
	//PRINTC

	;; TODO: move this elsewhere
	;; Halt on ^C
	LI 3
	XOR R INPCH
	SNZ
	HALT

	JMP isr_tty0_loop	; Read more characters

isr_ttycs_rxrdy:
	.word &0001

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
	.word @__origin+&13	; Boot first ROM partition

	;; ISR vector
&fff8:
__isrvec:
	JMP I ISR

// End of file.
