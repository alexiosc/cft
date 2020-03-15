;;; Simplistic line editor.
;;; Based on echo.asm.

.include "tty.asm"

.equ TTY0 &beef
.equ TTYDATA &cafe
.equ TTYPOLL &cafe

	;; Hardware registers

	.equ SUBRET  R &0000
	.equ TRAPRET R &0001
	.equ ISRRET  R &0002

	;; General purpose registers

	.equ R0	         R &0010
	.equ R1	         R &0011
	.equ R2	         R &0012
	.equ R3	         R &0013
	.equ R4	         R &0014
	.equ R5	         R &0015
	.equ R6	         R &0016
	.equ R7	         R &0017
	.equ R8	         R &0018
	.equ R9	         R &0019
	.equ R10         R &001a
	.equ R11         R &001b
	.equ R12         R &001c
	.equ R13         R &001d
	.equ R14         R &001e
	.equ R15         R &001f
	.equ R16         R &0020
	.equ R17         R &0021
	.equ R18         R &0022
	.equ R19         R &0023
	.equ R20         R &0024
	.equ R21         R &0025
	.equ R22         R &0026
	.equ R23         R &0027
	.equ R24         R &0028
	.equ R25         R &0029
	.equ R26         R &002a
	.equ R27         R &002b
	.equ R28         R &002c ; Scratch reg
	.equ R29         R &002d ; Scratch reg
	.equ R30         R &002e ; Scratch reg
	.equ R31         R &002f ; Scratch reg

	.equ MINUS1	 R &0030 ; 0xffff (-1)
	.equ MINUS2	 R &0031 ; 0xfffe (-2)
	.equ MINUS4	 R &0032 ; 0xfffc (-4)

	.equ IR0         R &0080
	.equ IR1         R &0081
	.equ IR2         R &0082
	.equ IR3         R &0083
	.equ IR4         R &0084
	.equ IR5         R &0085
	.equ IR6         R &0086
	.equ IR7         R &0087
	.equ IR8         R &0088
	.equ IR9         R &0089
	.equ IR10        R &008a
	.equ IR11        R &008b
	.equ IR12        R &008c
	.equ IR13        R &008d
	.equ IR14        R &008e
	.equ IR15        R &008f

	;; ROM registers and indices

	.equ LIPTR	R &00f7	; Line input pointer
	.equ RIR1	R &00f6
	.equ RIR2	R &00f5
	.equ RIR3	R &00f4
	.equ RIR4	R &00f3
	.equ RIR5	R &00f2
	.equ RIR6	R &00f1
	.equ RIR7	R &00f0
	
	;; TRAP registers

	.equ TR0	 R &0060
	.equ TR1	 R &0061
	.equ TR2	 R &0062
	.equ TR3	 R &0063

	.equ TIR0	 R &00f8
	.equ TIR1	 R &00f9
	.equ TIR2	 R &00fa
	.equ TIR3	 R &00fb

	;; ISR registers

	.equ ISRR0	 R &0070
	.equ ISRR1	 R &0071
	.equ ISRR2	 R &0072
	.equ ISRR3	 R &0073

	.equ ISRABKP     R &007d
	.equ ISRR0BKP    R &007e
	.equ ISRR1BKP    R &007f

	.equ IIR0	 R &00fc
	.equ IIR1	 R &00fd
	.equ IIR2	 R &00fe
	.equ IIR3	 R &00ff


	;; System vector and trap table

&0100:
vector_table:
	
vector_isr:	.word   &fff0
trap_nl:	.word	&fff0
trap_puts:	.word	&fff0
trap_puth:	.word	&fff0
trap_newstack:	.word	&fff0
trap_push:	.word	&fff0
trap_pop:	.word	&fff0


	;; Trap definitions for convenience

	.equ T_NL	I R trap_nl
	.equ T_PUTS	I R trap_puts
	.equ T_PUTH	I R trap_puth
	.equ T_NEWSTACK	I R trap_newstack
	.equ T_PUSH	I R trap_push
	.equ T_POP	I R trap_pop


	;; Useful macros for abstraction

	.equ PUTCHAR	OUT TTY0 TTYDATA ; Print out a character

	
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
	
	;; Hardware flags
	.equ HWF_EMU       &0001 ; We're running on the emulator

	;; Input flags
	.equ IFL_NEWCHAR   &0001 ; A new character was seen
	.equ IFL_CTRLC     &8000 ; Ctrl-C has been pressed

	;; Error codes
	.equ ERR_SUCCESS   &0000 ; No error
	.equ ERR_STKFULL   &0001 ; Stack full
	.equ ERR_STKEMPT   &0002 ; Stack empty

	;; PAGE 1 (user variables and stack)

&0400:

_inpbuf0:
	.fill 80 0xbeef
_inpbufN:			; The end of the input buffer + 1

_buf:	.fill 16 0xbeef		; Generic 16-word buffer
	
&0500:				; The stack (grows up)
stack:

	;; Page 2 (program code)

&0800:	

	
	
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
	.str 10
	.str 0

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

	;; Use the init data table
	LIA reset_data
	STORE IR0

	LOAD I IR0
	STORE MINUS1		; -1
	LOAD I IR0
	STORE MINUS2		; -2
	LOAD I IR0
	STORE MINUS4		; -4

	LOAD I IR0
	STORE R buf
	
	LOAD I IR0
	STORE R inputbase	; Input buffer
	LOAD I IR0
	STORE R inputbufend	; Input buffer end + 1

	;; Set up the stack.
	LOAD I IR0		; Read the stack size
	STORE R0
	LOAD I IR0		; Read the stack base
	TRAP T_NEWSTACK

	JMP banner

reset_data:
	.word &ffff		; MINUS1
	.word &fffe		; MINUS2
	.word &fffc		; MINUS4
	.word _buf		; Address of the general purpose buffer
	.word _inpbuf0		; The address of the input buffer
	.word _inpbufN		; Last addr of input buffer
	;;
	.word 254		; The size of the stack (3 words needed for stack struct)
	.word stack		; The system stack pointer

	;; Print out the welcome banner (etc)
banner:	
	;; Say hello
	LIA boot_banner
	TRAP T_PUTS

	;; Detect hardware
	JSR describe_hw		; Read hardware flags and print them out

	;; Done. Say we're ready.
	JSR emit_ready

	;; Enable interrupts and input data
	SEI
	JMP input_line


	;; Echo input
input_line:
	LOAD R inputbase	; inputptr = inputbase
	STORE LIPTR
	LOAD LIPTR
	
input_loop:
	LI IFL_NEWCHAR		; Do we have a new character?
	AND R input_flags
	SNZ
	JMP input_loop

	LI IFL_NEWCHAR		; Clear the flag
	NOT
	AND R input_flags
	STORE R input_flags

	;; Return pressed?
	LI 13			; Is the character 13?
	XOR R last_inp_char
	SNZ
	JMP input_loop_nlcr

	;; Backspace or delete pressed?
	LI 8			; Is it 8 (BS)?
	XOR R last_inp_char
	SNZ
	JMP input_loop_del
	LI 127			; Is it 127 (DEL)?
	XOR R last_inp_char
	SNZ
	JMP input_loop_del

	;; Ctrl-C?
	LI 3			; Is it 3 (ETX/^C)?
	XOR R last_inp_char
	SNZ
	JMP input_loop_ctrlc

	;; Is it a printable character?
	LI 32
	NEG
	ADD R last_inp_char
	SNN			; If >= 32 (non-negative), it's printable
	JMP input_loop		; If not, go back.

	;; Is the line buffer full?
	LOAD LIPTR		; Is the line buffer full?
	XOR R inputbufend
	SNZ
	JMP input_buffer_full

	;; All good, add the character!
	LOAD R last_inp_char	; Otherwise, load the character
	STORE I R LIPTR		; Add it to the buffer, autoincrement
	PUTCHAR			; ...and output it.

	JMP input_loop

input_loop_nlcr:
	TRAP T_NL
	LI 0
	STORE I R LIPTR		; Null-terminate the input buffer

	LOAD I R inputbase	; Empty string?
	SNZ
	JMP said_nothing		; Yes.

	LIA @+7
	TRAP T_PUTS
	
	LOAD R inputbase
	TRAP T_PUTS
	TRAP T_NL

said_nothing:
	JSR emit_ready
	JMP input_line

	.str "You said: " 0

	;; This gets called by the input service routine when a Ctrl-C
	;; has been seen.

input_loop_del:
	LOAD R LIPTR		; Load the input pointer
	XOR R inputbase		; Are we at the beginning of the buffer?
	SZA
	JMP input_loop_dodel
	LI 7
	PUTCHAR
	JMP input_loop

input_loop_dodel:
	LI 8
	PUTCHAR
	LI 32
	PUTCHAR
	LI 8
	PUTCHAR
	LOAD R MINUS1		; Decrement the input buffer pointer
	ADD R LIPTR
	STORE R LIPTR
	JMP input_loop

input_loop_ctrlc:
	LI IFL_CTRLC		; Set the IFL_CTRLC input flag
	OR R input_flags
	STORE R input_flags

	LI 0
	STORE R I inputbase	; inputbuf[0] = 0

	LIA @+3			; Three word down
	TRAP T_PUTS

	JMP input_line

	.str "^C" 10 0

input_buffer_full:
	LI 7			; BEL
	PUTCHAR
	JMP input_loop


	;; Print out a description of the hardware

describe_hw:
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
	RET
	
describe_hw1p:
	LIA @+3
	TRAP T_PUTS
	JMP describe_hw2
	.str " Emulator" 0
	
describe_hws:
	.str "Hardware type: " 0


	;; Print out the Ready prompt.
emit_ready:
	LIA @+3
	TRAP T_PUTS
	RET
	.str "Ready" 10 0

	




///////////////////////////////////////////////////////////////////////////////
//
// TRAPS
//
///////////////////////////////////////////////////////////////////////////////

	;; trap_newline: print out a newline.
	;; A: ignored.
	;; Returns: nothing.
	;; Side effects: prints out ASCII 10 13 
_rom_newline:
	LI 10
	OUT TTY0 TTYDATA
	LI 13
	OUT TTY0 TTYDATA
	RTT

	
	;; Print a null-terminated string.
	;; A: address of string in memory.
	;; Returns: Address of terminating NULL.
_rom_puts:	
	STORE TIR0
_rom_putsl:
	LOAD I TIR0
	SNZ
	RTT
	PUTCHAR
	JMP _rom_putsl

	;; Prints out hex.
	;; A: number to print out.
	;; Returns: nothing.
	;; Side effects: prints out 4-digit hex representation of A.

_rom_puthex:
	STORE R31		; Store A.

	LOAD R buf
	STORE TIR0

	LOAD R31		; Take the parameter and roll it.
	RBL
	RNL
	STORE I TIR0		; Buffer nibble 4
	RNL
	STORE I TIR0		; Buffer nibble 3
	RNL
	STORE I TIR0		; Buffer nibble 2
	RNL
	STORE I TIR0		; Buffer nibble 1

	LOAD R buf		; Reset the index register to nibble 4
	STORE TIR0

	LOAD _rom_puthexm4	; Loop counter: TIR1 = -4
	STORE TIR1

	LIA _rom_puthexs	; Get the address of the hex digits
	STORE R30		; TR0 = _puthexs

_rom_puthexl:			; Next nibble!
	LI &f
	AND I TIR0

	ADD R30			; Use indirection to get _puthexs[A]
	STORE R31
	LOAD I R31

	PUTCHAR			; Print out the character

	LOAD I TIR1		; TIR1++ (ignore A, do it for autoindex)
	LOAD TIR1		; A = TIR1
	SNZ
	RTT			; Done!

	JMP _rom_puthexl
	
_rom_puthexs:
	.str "0123456789abcdef"
_rom_puthexm4:
	.word &fffc		; -4 twos complement


///////////////////////////////////////////////////////////////////////////////
//
// STACK-RELATED TRAPS
//
///////////////////////////////////////////////////////////////////////////////

	;; Create a stack
	;;
	;; Inputs:
	;;   A: Stack base address (grows downwards)
	;;   R0: Size of stack in words.
	;; 
	;; Produces:
	;;   [A]: stack pointer = A + 2
	;;   [A+1]: max stack pointer =  A + R0 + 1
	;;   [A+2]: datum 0
	;;   [A+3]: datum 1
	;;   ...
	;;   [A + R0 + 1]: last datum
	;;
	;; Errors:
	;;    ERR_SUCCESS: done.

_rom_newstack:
	STORE R curstack	; Activate this stack
	STORE TIR0		; Index register

	LI 2			; A + 2
	ADD TIR0		;   (not autoindexing)
	STORE I TIR0		; Autoindexing: TIR0 = A + 1

	LOAD R0			; A + R0 + 1 = R0 + TIR0
	ADD TIR0		;
	STORE I TIR0		; Autoindexing

_rom_stack_okay:
	LI ERR_SUCCESS		; Clear the error
	STORE R errno
	RTT


	;; Push a value onto a stack
	;;
	;; A: value
	;; curstack: pointer to the stack to operate on.
_rom_push:
	STORE TR0		; Store the value
	LOAD R curstack
	STORE TIR0

	;; Is the stack full?
	LOAD I TIR0		; Load the SP (and increment)
	XOR I TIR0		; Compare against the maxptr
	SNZ
	JMP _rom_stack_full

	;; Store it.
	LOAD I R curstack	; This is the SP
	STORE TIR0		; Store it for autoindex
	LOAD TR0		; Value to push
	STORE I TIR0		; mem[TIR0] = TR0

	;; Autoindex has incremented TIR0 (the SP). Store it.
	LOAD TIR0
	STORE I R curstack	; Store it back

	;; Done
	JMP _rom_stack_okay

_rom_stack_full:
	LI ERR_STKFULL
	STORE R errno
	RTT

	;; Pop a value from a stack
	;;
	;; Expects:
	;;   curstack: pointer to the stack to operate on.
	;; Returns:
	;;   A- the value (if errno==ERR_SUCCESS)
	
_rom_pop:
	LOAD R curstack
	STORE TIR0

	;; Is the stack empty?
	LOAD I TIR0		; Load the SP
	ADD MINUS1		; SP - 1
	XOR TIR0		; Compare against the *ADDRESS* of maxptr, i.e. curstack + 1
	SNZ
	JMP _rom_stack_empty

	;; Decrement the SP
	LOAD I R curstack	; SP - 1
	ADD MINUS1
	STORE I R curstack

	;; Store the success flag before we read the value
	LI ERR_SUCCESS
	STORE R errno

	;; Read the value.
	LOAD I R curstack	; SP
	STORE TR0
	LOAD I TR0		; A = mem[SP]

	RTT

_rom_stack_empty:
	LI ERR_STKEMPT
	STORE R errno
	RTT


///////////////////////////////////////////////////////////////////////////////
//
// Interrupt Service Routine (ISR)
//
///////////////////////////////////////////////////////////////////////////////

isr:
	;; ISR entry code
	
	STORE ISRABKP		; Save A
	LOAD R 0		; Save &0000
	STORE ISRR0BKP
	LOAD R 1		; Save &0001
	STORE ISRR1BKP

isr_tty0_loop:
	IN TTY0 TTYPOLL		; Is there anything to input?
	SNZ			; If zero:
	JMP isr_done_tty0	;   No input. We're done.

	LI IFL_NEWCHAR		; We have input. Set the IFL_NEWCHAR flag.
	OR R input_flags
	STORE R input_flags
	
	IN TTY0 TTYDATA		; Read data.
	STORE R last_inp_char	; Store it for later

	JMP isr_tty0_loop	; Read more characters

isr_done_tty0:

	;; Invoke user ISR
	JSR I R vector_isr

	;; ISR exit code
	LOAD ISRR1BKP		; Restore &0001
	STORE R 1
	LOAD ISRR0BKP		; Restore &0000
	STORE R 0
	LOAD ISRABKP		; Restore A
	SEI			; Re-enable interrupts
	RTI			; Return

	;; The ISR also JSRs to the vector_isr user function.
	;; At startup, this vector points here.

_rom_vector_isr:
	RET


///////////////////////////////////////////////////////////////////////////////
//
// The vector table
//
///////////////////////////////////////////////////////////////////////////////

init_vector_table:
	LIA rom_vector_table
	STORE IR0
	LIA R vector_table	; Equivalent to LI, but LIA for clarity
	STORE IR1
init_vector_loop:
	LOAD I IR0		; Autoindex
	SNZ
	RET
	STORE I IR1		; Also autoindex
	JMP init_vector_loop	; Again.

rom_vector_table:
	.word _rom_vector_isr	; ISR vector
	.word _rom_newline	; Newline
	.word _rom_puts		; print string
	.word _rom_puthex	; Print hex
	.word _rom_newstack	; Create a stack
	.word _rom_push		; Push a value onto a stack
	.word _rom_pop		; Pop a value from a stackCreate a stack
	.word 0



///////////////////////////////////////////////////////////////////////////////
//
// CPU Vectors
//
///////////////////////////////////////////////////////////////////////////////

	;; Reset vector
&fff0:  JMP I @+1
	.word reset

	;; ISR vector
&fff8:  JMP I @+1
	.word isr

;;; End of file.
