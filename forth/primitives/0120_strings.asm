// -*- asm -*-
//
// String handling primitives.

	;; word:  BL
	;; flags: FFL_PRIMITIVE ROM
	;; notes: bl ( -- 32 )
	;;   Pushes the codepoint of a space onto the stack.

	LI 32
	PUSH (SP)
	NEXT



	;; word:  >CHAR
	;; alias: to-char
	;; flags: FFL_PRIMITIVE ROM
	;; notes: >CHAR ( c -- c )
	;;   Strips high bits and optionally converts non-printable ASCII
	;;   characters to underscore.

	SPEEK (SP)
	AND PLUS127		; Keep the lower 7 bits
	STORE TMP1
	LI 32			; Compare against ASCII 32
	NEG
	ADD TMP1
	SNN			; char >= 32?
	JMP _dw_to_char_fix	; No.
	LOAD TMP1		; Yes. Push it back.
	SPOKE0 (SP)
	NEXT

_dw_to_char_fix:
	LI &5f			; ASCII 95 = &5f = _
	SPOKE0 (SP)
	NEXT
	
	
	
	;; word:  COUNT
	;; flags: FFL_PRIMITIVE ROM
	;; notes: COUNT ( b -- b +n )
	;;   Pushes the string address for b and its length in characters.

	SPEEK (SP)
	STORE ARG0

	LIA ARG0
	STORE ARGP
	TRAP vec_trap_strplen

	PRINTD
	PUSH (SP)
	NEXT



	;; word:  CMOVE
	;; flags: FFL_PRIMITIVE ROM
	;; notes: CMOVE ( addr1 addr2 u -- )
	;;   Copy u cells from addr1 to addr2.

	SPEEK (SP)
	STORE ARG0

	LIA ARG0
	STORE ARGP
	TRAP vec_trap_strplen

	PRINTD
	PUSH (SP)
	NEXT



// End of file.
