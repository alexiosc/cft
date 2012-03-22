;; // -*- asm -*-
;; //
;; // More complex TTY I/O, both F83 and CFT.
	
	;; word:  EMIT
	;; flags: FFL_PRIMITIVE ROM
	;; notes: CR ( c -- )
	;;   Prints out c. The least significant 7 bits are output as per F83.
	;;   TODO: Use 'EMIT
	POP(SP)
	AND PLUS127
	PUTCHAR
	NEXT



	;; word:  CR
	;; flags: FFL_PRIMITIVE ROM
	;; notes: CR ( -- )
	;;   EMIT a carriage return.
	;;   TODO: Use 'EMIT
	PUTC(10)
	NEXT


	;; word:  SPACE
	;; flags: FFL_PRIMITIVE ROM
	;; notes: SPACE ( -- )
	;;   EMIT a space.
	;;   TODO: Use 'EMIT
	PUTC(32)
	NEXT


	;; word:  SPACES
	;; flags: FFL_PRIMITIVE ROM
	;; notes: SPACES ( n -- )
	;;   EMITs n SPACEs.
	;;   TODO: Use 'EMIT
	;;   TODO: Define in terms of SPACE
	POP(SP)
	NEG
	STORE TMP0
_SPACES_loop:
	PUTC(32)
	ISZ TMP0
	JMP _SPACES_loop
	NEXT


	
	;; word:  TYPE
	;; flags: FFL_PRIMITIVE ROM
	;; notes: TYPE ( addr +n -- )
	;;   Print out n characters starting at address addr. Characters are
	;;   expected to be in the unpacked form (one character per cell).
	;;   TODO: Use 'EMIT

	POP(SP)
	NEG
	STORE TMP1		; Save the negated count for looping
	POP(SP)
	STORE I0		; Save the address
	
_TYPE_loop:
	LOAD I I0		; Load character (autoincrement)

	AND PLUS127		; This is EMIT.
	PUTCHAR

	ISZ TMP1		; Loop.
	JMP _TYPE_loop

	NEXT

	
	;; word:  type0
	;; flags: FFL_PRIMITIVE ROM CFT
	;; notes: type0 ( addr -- )
	;;   Print out null-terminated string starting at address addr.
	;;   Characters are expected to be in the unpacked form (one
	;;   character per cell).
	;;   TODO: Use 'EMIT
	
	POP(SP)
	STORE I0		; Save the address
	
_TYPE0_loop:
	LOAD I I0		; Load character (autoincrement)

	SNZ
	JMP _TYPE0_end

	AND PLUS127		; This is EMIT.
	PUTCHAR

	JMP _TYPE0_loop

_TYPE0_end:
	NEXT

	
	;; word:  typep0
	;; flags: FFL_PRIMITIVE ROM CFT
	;; notes: typep0 ( a -- )
	;;        Prints out the packed, null-terminated string starting at a.

	POP (SP)
	STORE I0		; address

_typep0_loop:
	LOAD I I0		; Read characters
        SNZ			; Done?
        NEXT			; Yes
	STORE TMP0		; No.
	GETLOCHAR()
	PUTCHAR			; Print it.

	LOAD TMP0
	GETHICHAR()
	SNZ			; Are we done now?
	NEXT			; Yes
	PUTCHAR			; Print it.

	JMP _typep0_loop	; Loop again



// End of file.
