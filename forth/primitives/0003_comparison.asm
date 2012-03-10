// -*- asm -*-
//
// Core comparison primitives

	;; word:  0<
	;; alias: zero-less
	;; flags: FFL_PRIMITIVE ROM
	;; notes: 0< ( n -- f )
	;;   Push true if n is negative, false otherwise
	SPEEK (SP)
	SNA			; Negative?
	JMP zero_less_no	; No
	LI 1			; Yes
	JMP zero_less_end	; Push 1
zero_less_no:
	LI 0			; Push 0
zero_less_end:
	PUSH (SP)
	NEXT
	

// End of file.	
