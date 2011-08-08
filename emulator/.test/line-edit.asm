;;; Simplistic line editor.
;;; Based on echo.asm.

	;; Hardware registers

	.equ __subret__  R &0000
	.equ __trapret__ R &0001
	.equ __isrret__  R &0002

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

	.equ IR0	 R &0070
	.equ IR1	 R &0071
	.equ IR2	 R &0072
	.equ IR3	 R &0073

	.equ ISRA        R &007d
	.equ ISRR0       R &007e
	.equ ISRR1       R &007f

	.equ IIR0	 R &00fc
	.equ IIR1	 R &00fd
	.equ IIR2	 R &00fe
	.equ IIR3	 R &00ff

	;; System trap table

&0300:
trap_nl:	.word	_newline
trap_puts:	.word	_puts
trap_puth:	.word	_puthex

	;; Trap definitions for convenience

	.equ T_NL	I R trap_nl
	.equ T_PUTS	I R trap_puts
	.equ T_PUTH	I R trap_puth


	;; PAGE 1 (system variables)


	
	;; Useful macros for abstraction

	.equ PUTCHAR	OUT TTY0 TTYDATA ; Print out a character


;;; Programs usually start on page 2 (0800)
&0800:
	;;  TODO: INIT HERE

	;; Print "Ready" prompt
	LOAD banner
	TRAP T_PUTS
	LOAD prompt
	TRAP T_PUTS

	SEI

tight:	JMP tight
	
banner:	.word boot_banner
prompt:	.word ready_prompt




	;;
	;; TRAPS
	;; 


&c000:

	;; trap_newline: print out a newline.
	;; A: ignored.
	;; Returns: nothing.
	;; Side effects: prints out ASCII 10 13 
_newline:
	LI 10
	OUT TTY0 TTYDATA
	LI 13
	OUT TTY0 TTYDATA
	RTT

	
	;; Print a null-terminated string.
	;; A: address of string in memory.
	;; Returns: Address of terminating NULL.
_puts:	
	STORE TIR0
_putsl:	LOAD I TIR0
	SNZ
	RTT
	PUTCHAR
	JMP _putsl

	;; Prints out hex.
	;; A: number to print out.
	;; Returns: nothing.
	;; Side effects: prints out 4-digit hex representation of A.

_puthex:
	STORE R31		; Store A.

	LIA _puthexmb
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

	LIA _puthexmb		; Reset the index register to nibble 4
	STORE TIR0

	LOAD _puthexm4		; Loop counter: TIR1 = -4
	STORE TIR1

	LIA _puthexs		; Get the address of the hex digits
	STORE R30		; TR0 = _puthexs


_puthexl:			; Next nibble!
	LI &f
	AND I TIR0

	ADD R30			; Use indirection to get _puthexs[A]
	STORE R31
	LOAD I R31

	PUTCHAR			; Print out the character

	LOAD I TIR1		; TIR1++ (ignore A, do it for autoincrement)
	LOAD TIR1		; A = TIR1
	SNZ
	RTT			; Done!

	JMP _puthexl
	
_puthexs:
	.str "0123456789abcdef"
_puthexm4:
	.word &fffc		; -4 twos complement
_puthexmb:			; Shift buffer (4 words)
	.str "xxxx"




///////////////////////////////////////////////////////////////////////////////
//
// 8k ROM IMAGE
//
///////////////////////////////////////////////////////////////////////////////

&e000:

boot_banner:	
	.word &cafe
	.str "CFT CPU" 10
	.str "(c) 2011 Alexios Chouchoulas" 10
	.str "This is free software (GPL license)." 10
	.str 10
	.str 0

ready_prompt:
	.str "Ready" 10 0

	;; Interrupt Service Routine (ISR)

&f000:
isr:
	;; ISR entry code
	
	STORE ISRA		; Save A
	LOAD R 0		; Save &0000
	STORE ISRR0
	LOAD R 1		; Save &0001
	STORE ISRR1

next_tty0:
	IN TTY0 TTYPOLL		; Is there anything to input?
	SNZ			; If zero:
	JMP done_tty0		;   No input. We're done.
	IN TTY0 TTYDATA		; Read data.
	STORE IR0		; Store it for later

	LI 13			; Is the character 10?
	XOR IR0
	SNZ			; Is it 10? (NL)
	JMP nlcr

	LOAD IR0		; Otherwise, load the character
	OUT TTY0 TTYDATA	; ...and output it to echo.

	JMP next_tty0		; See if there's more input.

nlcr:	LI 10
	OUT TTY0 TTYDATA
	LI 13
	OUT TTY0 TTYDATA

done_tty0:	

	;; ISR exit code
	
	LOAD ISRR1		; Restore &0001
	STORE R 1
	LOAD ISRR0		; Restore &0000
	STORE R 0
	LOAD ISRA		; Restore A
	SEI			; Re-enable interrupts
	RTI			; Return

	;; Reset vector
&fff0:  JMP [@+1]
	.word 0x0800

	;; ISR vector
&fff8:  JMP [@+1]
	.word 0xf000

;;; End of file.
