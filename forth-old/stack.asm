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
	;; Clobbers: TR0 TIR0
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
	HALT
	RTT

	;; Pop a value from a stack
	;;
	;; Expects:
	;;   curstack: pointer to the stack to operate on.
	;; Returns:
	;;   A- the value (if errno==ERR_SUCCESS)
	;; Clobbers:
	;;   TIR0 TR0
	
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
	HALT
	RTT


	;; Peek the top stack value without popping.
	;;
	;; Expects:
	;;   curstack: pointer to the stack to operate on.
	;; Returns:
	;;   A: the value (if errno==ERR_SUCCESS)
	
_rom_peek:
	LOAD R curstack
	STORE TIR0

	;; Is the stack empty?
	LOAD I TIR0		; Load the SP
	ADD MINUS1		; SP - 1
	XOR TIR0		; Compare against the *ADDRESS* of maxptr, i.e. curstack + 1
	SNZ
	JMP _rom_stack_empty	; Uses the code from _rom_pop

	;; Store the success flag before we read the value
	LI ERR_SUCCESS
	STORE R errno

	;; Decrement the SP
	LOAD I R curstack	; SP - 1
	ADD MINUS1
	STORE TR0
	LOAD I TR0
	RTT


	;; Peek the n-th stack value without popping.
	;;
	;; Expects:
	;;   A: the value to peek at. 0 is the topmost one.
	;;   curstack: pointer to the stack to operate on.
	;; Returns:
	;;   A: the value (if errno==ERR_SUCCESS)
	;;   TR0: the address in memory of the stack value.
	
_rom_npeek:
	INC
	NEG
	STORE R31		; Store -(A+1) for later

	LOAD R curstack
	STORE TIR0

	;; Does the stack contain enough elements?
	LOAD I TIR0		; Load the SP
	ADD R31			; Get SP - A - 1
	STORE TR0
	NEG

	ADD TIR0		; Compare against the *ADDRESS* of maxptr, i.e. curstack + 1
	SNA
	JMP _rom_stack_empty	; Not enough stack elements

	;; Store the success flag before we read the value
	LI ERR_SUCCESS
	STORE R errno

	;; Get the value
	LOAD I TR0
	RTT


// End of file.
