// -*- asm -*-
//
// Purpose: some useful macros which depend on our particular setup.
//
///////////////////////////////////////////////////////////////////////////////	

	.equ DEC	ADD R MINUS1
	.equ NOP	OR ZERO
	.equ PAD	&beef ; Page padding. The value makes it detectable.
	
// End of file.
