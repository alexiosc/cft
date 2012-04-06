;; // -*- asm -*-
;; //
;; // More complex TTY I/O, both F83 and CFT.


	
	;; word:  EMIT
	;; flags: CODE ROM
	;; notes: EMIT ( c -- )
	;;   Prints out c. The least significant 7 bits are output as per F83.
	;;   TODO: Use 'EMIT
	POP(SP)
	AND PLUS127
	PUTCHAR
	NEXT



	;; word:  UEMIT
	;; flags: CODE ROM
	;; notes: UEMIT ( w -- )
	;;   Prints out c in UTF-8 encoding. All 16 bits of w are used and
	;;   encoded accordingly. Only the first 65,536 UCS codepoints may
	;;   be output, and they are encoded as one, two or three byte
	;;   sequences.
	;;   TODO: Use 'EMIT
	RPOP(TMP1, SP)		; TMP1 := w
	LOAD _uemitd
	AND TMP1
	SNZ
	JMP _uemit1b		; c & 0xff80 == 0 <==> single byte

	LOAD @_uemitd+1		; check for >2 bytes
	AND TMP1
	SNZ
	JMP _uemit2b		; c & 0xf800 == 0 <==> two-byte

	;; Three-byte sequence.
_uemit3b:
	;; first char, highest 4 bits.
	LOAD TMP1
	RNR			; >> 12
	RNR
	RNR
	STORE TMP2
	LI &f
	AND TMP2		; & 0x0f
	STORE TMP2
	LI &e0			; | 0xe0
	OR TMP2
	PUTCHAR

	;; second char, middle 6 bits.
	LOAD TMP1
	RNR			; >> 6
	RBR
	RBR
	STORE TMP2
	LI &3f			; & 0x3f
	AND TMP2
	STORE TMP2
	LI &80			; | 0x80
	OR TMP2
	PUTCHAR

	;; third char, low 6 bits.
	LI &3f			; & 0x3f
	AND TMP1
	STORE TMP2
	LI &80			; | 0x80
	OR TMP2
	PUTCHAR
		
	NEXT

	;; Two-byte sequence.
_uemit2b:
	;; first char, high 5 bits
	LOAD TMP1
	RNR			; >> 6
	RBR
	RBR
	STORE TMP2
	LI &1f			; & 0x1f (5 bits)
	AND TMP2
	STORE TMP2
	LI &c0			; | 0xc0
	OR TMP2
	PUTCHAR

	;; seocnd char, low 6 bits.
	LI &3f			; & 0x3f (6 bits)
	AND TMP1
	STORE TMP2
	LI &80			; | 0x80
	OR TMP2
	PUTCHAR
		
	NEXT
	
	;; Single-byte sequence.
_uemit1b:
	LOAD TMP1
	PUTCHAR
	NEXT

_uemitd:
	.word &ff80		; Mask for >1 byte per char
	.word &f800		; >2 bytes per char


	
	;; word:  CR
	;; flags: CODE ROM
	;; notes: CR ( -- )
	;;   EMIT a carriage return.
	;;   TODO: Use 'EMIT
	PUTC(10)
	NEXT

	

	;; word:  SPACE
	;; flags: CODE ROM
	;; notes: SPACE ( -- )
	;;   EMIT a space.
	;;   TODO: Use 'EMIT
	PUTC(32)
	NEXT

	

	;; word:  SPACES
	;; flags: CODE ROM
	;; notes: SPACES ( n -- )
	;;   EMITs n SPACEs.
	;;   TODO: Use 'EMIT
	;;   TODO: Define in terms of SPACE
	POP(SP)
	NEG
	STORE TMP0
	SNZ
	NEXT
_SPACES_loop:
	PUTC(32)
	ISZ TMP0
	JMP _SPACES_loop
	NEXT


	
	;; word:  ZEROES
	;; flags: CODE ROM
	;; notes: ZEROES ( n -- )
	;;   EMITs n '0'.
	;;   TODO: Use 'EMIT
	;;   TODO: Define in terms of SPACE
	POP(SP)
	NEG
	STORE TMP0
	SNZ
	NEXT
_ZEROES_loop:
	PUTC(48)
	ISZ TMP0
	JMP _ZEROES_loop
	NEXT


	
	;; word:  TYPE
	;; flags: CODE ROM
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

	;; Be 8-bit clean, output all 8 bits (well, all 16, but UARTs
	;; are 8-bit devices).
	//AND PLUS127		; This is EMIT.
	PUTCHAR

	ISZ TMP1		; Loop.
	JMP _TYPE_loop

	NEXT
	
	
	;; word:  type0
	;; flags: CODE ROM CFT
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

	;; Be 8-bit clean, output all 8 bits (well, all 16, but UARTs
	;; are 8-bit devices).
	//AND PLUS127		; This is EMIT.
	PUTCHAR

	JMP _TYPE0_loop

_TYPE0_end:
	NEXT

	
	;; word:  typep0
	;; flags: CODE ROM CFT
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


	
	;; word:  NUF?
	;; alias: NUF_if
	;; flags: DOCOL ROM
	;; notes: NUF? ( -- f )
	;;   Similar to the eForth NUF? word. If a key is waiting in the input
	;;   buffer, wait for another key. If that key is CR (actually, any
	;;   ASCII control char), return true. Else return false.

	.word dw_rx_q		; RX? ( -- f )
	.word dw_if_branch	; ?branch ( )
	.word _nuf_false	;   FALSE + EXIT

	.word dw_rx		; RX ( c ) \ read first char
	.word dw_DROP		; DROP ( ) \ drop it
	.word dw_rx		; RX ( c c ) \ receive another char
	.word dw_doLIT		; 10 (\n)
	.word 32
	.word dw_geq		; >=

	.word dw_if_branch	; ?branch
	.word _nuf_true

_nuf_false:	
	.word dw_FALSE		; FALSE
	.word dw_EXIT		; EXIT
_nuf_true:	
	.word dw_TRUE		; TRUE
	.word dw_EXIT		; EXIT


// End of file.
