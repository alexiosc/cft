// -*- asm -*-

///////////////////////////////////////////////////////////////////////////////
//
// FORTH SYSTEM
//
///////////////////////////////////////////////////////////////////////////////


	;; Useful macros for abstraction

	.equ NULL       0
	.equ PUTCHAR	OUT TTY0 TTYDATA ; Print out a character

	;; Forth dictionary flags
	.equ FFL_IMMEDIATE &0001 ; Immediate word.
	.equ FFL_CMPLONLY  &0002 ; Only used while compiling.

	;; Forth dictionary flags (for the compiler's use only)
	.equ FFL_ROM       &4000 ; It's in the ROM.
	.equ FFL_CPH       &0800 ; Code point handler (_DOCOL, etc).
	.equ FFL_PRIMITIVE &1000 ; It's an assembly primitive.
	.equ FFL_DOCOL     &2000 ; It's a colon definition.
	.equ FFL_VARIABLE  &4000 ; It's a variable definition.
	.equ FFL_CFT       &8000 ; CFT-specific primitive.

	;; Return from Primitive
	.equ RTF	JMP I F_NEXT


	;; Global variables
&0200:
hardware_flags:	.word   &0000
buf:		.word   &0000	; Pointer to a general purpose buffer
last_inp_char:	.word	&0000
input_flags:	.word   &0000
inputbase:	.word	&0000	; First addr of the input buffer
inputbufend:	.word   &0000	; Last addr of the input buffer
errno:		.word   &0000	; Error codes
curstack:	.word   &0000
dstack:		.word   &0000	; The data stack
rstack:		.word   &0000	; The return stack
numbase:	.word   &0000   ; The numeric conversion base
convbuf:	.word   &0000   ; Conversion routine buffer.
convptr:	.word   &0000   ; Conversion routine pointer.
	
	;; Hardware flags
	.equ HWF_EMU       &0001 ; We're running on the emulator

	;; Input flags
	.equ IFL_NEWCHAR   &0001 ; A new character was seen
	.equ IFL_CTRLC     &8000 ; Ctrl-C has been pressed

	;; Error codes
	.equ ERR_SUCCESS   &0000 ; No error
	.equ ERR_STKFULL   &0001 ; Stack full
	.equ ERR_STKEMPT   &0002 ; Stack empty
	.equ ERR_DIV0      &0003 ; Division by zero
	.equ ERR_NFOUND    &0004 ; Dictionary key not found
	.equ ERR_BADNUM    &0005 ; Number invalid

	;; PAGE 1 (user variables and stack)

&0400:

_inpbuf0:
	.fill 80 0xbeef
_inpbufN:			; The end of the input buffer + 1

_buf:	.fill 16 0xbeef		; Generic 16-word buffer
	
&0500:				; The data stack (grows up)
_dstack:

&0600:				; The return stack (grows up)
_rstack:

	;; Page 2 (Dictionary starts here)
&0800:
__dict:

	
	
///////////////////////////////////////////////////////////////////////////////
//
// 8k ROM IMAGE
//
///////////////////////////////////////////////////////////////////////////////

&e000:
	.word &cf70		; Magic (CFT0)
	
boot_banner:
	.str 10 10 10 10
	.str "CFT CPU Boot ROM v0.1" 10
	.str "(c) 2011 Alexios Chouchoulas" 10
	.str "This is free software (GPL license)." 10
	.strn 10

///////////////////////////////////////////////////////////////////////////////
//
// Reset initialisation code
//
///////////////////////////////////////////////////////////////////////////////

	
reset:
	;; Initialisation code

	;; Copy the vector table from ROM to RAM.
	JSR init_vector_table

	LI 0
	STORE R last_inp_char
	STORE R input_flags

	;; Constants. CAUTION: These are calculated incrementally.
	;; MIND THE SEQUENCE!
	CLA
	STORE ZERO		; 0
	NOT
	STORE MINUS1		; -1
	CLL RBL
	STORE MINUS2		; -2
	CLL RBL
	STORE MINUS4		; -4
	LI 1
	STORE PLUS1		; 1
	LI 2
	STORE PLUS2		; 2
	LI 4
	STORE PLUS4		; 4
	CLL RNR
	STORE BIT15		; &8000
	NOT			; Note: this is not on the table.
	STORE NOTBIT15		; &7fff

	;; Use the init data table
	LIA reset_data
	STORE IR0

	LOAD I IR0
	STORE R buf
	
	LOAD I IR0
	STORE R inputbase	; Input buffer
	LOAD I IR0
	STORE R inputbufend	; Input buffer end + 1

	;; Set up the return stack.
	LOAD I IR0		; Read the dstack size
	STORE R0
	LOAD I IR0		; Read the dstack base
	TRAP T_NEWSTACK
	LOAD R curstack
	STORE R rstack		; Store the address for later

	;; Set up the data stack.
	LOAD I IR0		; Read the dstack size
	STORE R0
	LOAD I IR0		; Read the dstack base
	TRAP T_NEWSTACK
	LOAD R curstack
	STORE R dstack		; Store the address for later

	;; Set up initial pointers
	LOAD I IR0		; Read the initial value of CP
	STORE CP
	LOAD I IR0		; Load last ROM entry
	STORE LASTENTRY		; last dict entry = 0

	;; Set up the BASE.
	LI 10			; Default BASE
	STORE R numbase

	;; Set up the NEXT and EXIT primitives, we call them from all over
	;; the place.
	LOAD I IR0
	STORE F_NEXT
	LOAD I IR0
	STORE F_EXIT
	LOAD I IR0
	STORE F_HALT

	JMP banner

	

reset_data:
	.word _buf		; Address of the general purpose buffer
	.word _inpbuf0		; The address of the input buffer
	.word _inpbufN		; Last addr of input buffer
	;;
	.word 254		; The size of the stack (2 words needed for stack struct)
	.word _rstack		; The return stack pointer
	;;
	.word 254		; The size of the data stack (2 words needed for stack struct)
	.word _dstack		; The data stack pointer
	;; 
	.word &0800		; Initial value of HERE
	.word dw_NOP_head	; Last entry in the ROM Forth dictionary (manually maintained for now)
	;;
	.word dw_NEXT_pfa	; Assembly code for the NEXT primitive
	.word dw_EXIT_pfa	; Assembly code for the EXIT primitive
	.word dw_HALT		; Entry point for the HALT primitive

	;; Print out the welcome banner (etc)
banner:	
	;; Say hello
	LIA boot_banner
	TRAP T_PUTS

	;; Enable interrupts to input data
	SEI

	;; Print out a description of the hardware
	IHWF			; Read the hardware flags
	STORE R hardware_flags	; Store it for later

	LIA describe_hws	; Print out the text
	TRAP T_PUTS

	LOAD R hardware_flags
	TRAP T_PUTH

	LI HWF_EMU		; HWF_EMU set?
	AND R hardware_flags
	SZA
	JMP describe_hw1p

describe_hw2:
	TRAP T_NL
	LOAD I R31
	JMP forth
	
describe_hw1p:
	LIA @+3
	TRAP T_PUTS
	JMP describe_hw2
	.strn " Emulator"
	
describe_hws:
	.strn "Hardware type: "

	;; Start the Forth interpreter
forth:

	LI &001
	STORE TR0
	PRINTHI
	LI &184
	STORE TR1
	PRINTLO

	LI &000
	STORE TR2
	PRINTHI
	LI &007
	STORE TR3
	PRINTLO

	//DEBUGON
	TRAP T_DIV32
	DEBUGOFF

	LOAD R30
	PRINTHI
	LOAD R31
	PRINTLO

	LOAD TR0
	PRINTHI
	LOAD TR1
	PRINTLO

	LOAD R errno
	PRINTD

	HALT
	

	;; LI 0
	;; STORE TR2
	;; LI &9
	;; STORE TR3

	;; TRAP T_MUL32

	;; LOAD R29
	;; PRINTH
	;; LOAD R30
	;; PRINTH
	;; HALT



	
	LIA forth_quit
	TRAP T_DICTFIND
	STORE FIR0

	;; Store the PFA
	LOAD FIR0
	INC			; The fpa is head + 1
	STORE PFA

	LOAD I FIR0		;JMP mem[IP++]
	STORE FIR0
	//DEBUGON
	JMP I FIR0

	;; And that's it. We never get back here.

forth_quit:	.strn "QUIT"
ready_prompt:	.strn "Ready" 10

	
// End of file.
