// -*- asm -*-
//
// Purpose: define Forth registers
//
///////////////////////////////////////////////////////////////////////////////	

	.equ CP          R &0090 ; Forth Compilation pointer.
	.equ IP		 R &0091 ; Forth Interpreter pointer.
	.equ DOCOLPC	 R &0092 ; DOCOL uses this as its PC.
	.equ FIR0	 R &0093 ; Index register 0
	.equ FIR1	 R &0094 ; Index register 1

	.equ LASTENTRY   R &0040 ; Pointer to head of last dictionary entry
	.equ PFA         R &0041 ; Temporary storage for the PFA pointer

	.equ F_NEXT	 R &0042  ; Next instruction
	.equ F_EXIT	 R &0043  ; Exit DOCOL definition
	.equ F_HALT	 R &0044  ; Forth HALT definition


// End of file.
