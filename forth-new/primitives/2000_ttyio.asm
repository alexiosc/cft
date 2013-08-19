;; // -*- asm -*-
;; //
;; // Astract mid-level I/O words.



	;; word:  CR
	;; flags: DOCOL ROM
	;; notes: CR ( -- )
	;;        EMIT a carriage return.
	;; code:  : CR ( -- ) 10 EMIT ;
	doLIT(10)
	.word dw_EMIT
	.word dw_EXIT

	

	;; word:  SPACE
	;; flags: DOCOL ROM
	;; notes: SPACE ( -- )
	;;        EMIT a carriage return.
	;; code:  : CR ( -- ) BL EMIT ;
	.word dw_BL
	.word dw_EMIT
	.word dw_EXIT

	

	;; word:  SPACES
	;; flags: CODE ROM
	;; notes: SPACES ( n -- )
	;;   EMITs n SPACEs.
	;;   TODO: Use 'EMIT
	;;   TODO: Define in terms of SPACE
	POP SP
	NEG
	STORE TMP9
	SNZ
	NEXT
_SPACES_loop:
	FORTH(dw_SPACE)
	ISZ TMP9
	JMP _SPACES_loop
	NEXT



	;; word:  ZEROES
	;; flags: CODE ROM
	;; notes: ZEROES ( n -- )
	;;   EMITs n '0'.
	;;   TODO: Use 'EMIT
	;;   TODO: Define in terms of SPACE

	POP SP
	NEG
	STORE TMP9
	SNZ
	NEXT
_ZEROES_loop:
	PUTC(48)
	ISZ TMP9
	JMP _ZEROES_loop
	NEXT


	
	;; word:  TYPE
	;; flags: CODE ROM
	;; notes: TYPE ( addr +n -- )
	;;   Print out n characters starting at address addr. Characters are
	;;   expected to be in the unpacked form (one character per cell).

	DEBUGON
	DUMP
	POP SP
	SNZ			; Sanity check
	FAIL
	//JMP _TYPE_end
	
	NEG
	STORE TMP9		; Save the negated count for looping
	PRINTH
	POP SP
	STORE I0		; Save the address
	
_TYPE_loop:
	//DUMP
	LOAD I I0		; Load character (autoincrement)

	;; Be 8-bit clean, output all 8 bits (well, all 16, but UARTs
	;; are 8-bit devices).
	//AND PLUS127		; This is EMIT.
	PUSH SP
	FORTH(dw_EMIT)

	ISZ TMP9		; Loop.
	PRINTA
	JMP _TYPE_loop

_TYPE_end:
	DEBUGOFF
	NEXT
	

	;; word:  type0
	;; flags: CODE ROM CFT
	;; notes: type0 ( addr -- )
	;;   Print out null-terminated string starting at address addr.
	;;   Characters are expected to be in the unpacked form (one
	;;   character per cell).
	;;   TODO: Use 'EMIT
	
	POP SP
	STORE I0		; Save the address
	
_TYPE0_loop:
	LOAD I I0		; Load character (autoincrement)

	SNZ
	JMP _TYPE0_end

	;; Be 8-bit clean, output all 8 bits (well, all 16, but UARTs
	;; are 8-bit devices).
	//AND PLUS127		; This is EMIT.
	PUSH SP
	FORTH(dw_EMIT)

	JMP _TYPE0_loop

_TYPE0_end:
	NEXT
	
	
	;; word:  typep0
	;; flags: CODE ROM CFT
	;; notes: typep0 ( a -- )
	;;        Prints out the packed, null-terminated string starting at a.

	POP SP
	STORE I0		; address

_typep0_loop:
	LOAD I I0		; Read characters
        SNZ			; Done?
        NEXT			; Yes
	STORE TMP9		; No.
	GETLOCHAR()
	PUSH SP
	FORTH(dw_EMIT)

	LOAD TMP9
	GETHICHAR()
	SNZ			; Are we done now?
	NEXT			; Yes
	PUSH SP
	FORTH(dw_EMIT)

	JMP _typep0_loop	; Loop again



	;; word:  TYPEp
	;; flags: CODE ROM CFT
	;; notes: TYPEp ( a n -- )
	;;        Prints out the first n characters of the packed string
	;;        starting at a. If the string is shorter than n characters,
	;;        the entire string is printed.

	POP SP
	ING
	STORE TMP9
	POP SP
	STORE I0		; address

_TYPEp_loop:
	ISZ TMP9		; Reached count limit?
	JMP @+2
	NEXT

	LOAD I I0		; Read characters
        SNZ			; Done?
        NEXT			; Yes
	STORE TMP8		; No.
	GETLOCHAR()
	PUSH SP
	FORTH(dw_EMIT)

	ISZ TMP9		; Reached count limit?
	JMP @+2
	NEXT

	LOAD TMP8
	GETHICHAR()
	SNZ			; Are we done now?
	NEXT			; Yes
	PUSH SP
	FORTH(dw_EMIT)

	JMP _TYPEp_loop		; Loop again


	
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


	;; word:  UEMIT
	;; flags: CODE ROM
	;; notes: UEMIT ( w -- )
	;;   Prints out c in UTF-8 encoding. All 16 bits of w are used and
	;;   encoded accordingly. Only the first 65,536 UCS codepoints may
	;;   be output, and they are encoded as one, two or three byte
	;;   sequences.
	;;   TODO: Use 'EMIT
	RPOP(TMP9, SP)		; TMP9 := w
	LOAD _uemitd
	AND TMP9
	SNZ
	JMP _uemit1b		; c & 0xff80 == 0 <==> single byte

	LOAD @_uemitd+1		; check for >2 bytes
	AND TMP9
	SNZ
	JMP _uemit2b		; c & 0xf800 == 0 <==> two-byte

	;; Three-byte sequence.
_uemit3b:
	;; first char, highest 4 bits.
	LOAD TMP9
	RNR			; >> 12
	RNR
	RNR
	STORE TMP2
	LI &f
	AND TMP2		; & 0x0f
	STORE TMP2
	LI &e0			; | 0xe0
	OR TMP2
	PUSH SP
	FORTH(dw_EMIT)

	;; second char, middle 6 bits.
	LOAD TMP9
	RNR			; >> 6
	RBR
	RBR
	STORE TMP2
	LI &3f			; & 0x3f
	AND TMP2
	STORE TMP2
	LI &80			; | 0x80
	OR TMP2
	PUSH(SP)
	FORTH(dw_EMIT)

	;; third char, low 6 bits.
	LI &3f			; & 0x3f
	AND TMP9
	STORE TMP2
	LI &80			; | 0x80
	OR TMP2
	PUSH SP
	FORTH(dw_EMIT)
		
	NEXT

	;; Two-byte sequence.
_uemit2b:
	;; first char, high 5 bits
	LOAD TMP9
	RNR			; >> 6
	RBR
	RBR
	STORE TMP2
	LI &1f			; & 0x1f (5 bits)
	AND TMP2
	STORE TMP2
	LI &c0			; | 0xc0
	OR TMP2
	PUSH(SP)
	FORTH(dw_EMIT)

	;; second char, low 6 bits.
	LI &3f			; & 0x3f (6 bits)
	AND TMP9
	STORE TMP2
	LI &80			; | 0x80
	OR TMP2
	PUSH(SP)
	FORTH(dw_EMIT)
		
	NEXT
	
	;; Single-byte sequence.
_uemit1b:
	LOAD TMP9
	PUSH SP
	FORTH(dw_EMIT)
	NEXT

_uemitd:
	.word &ff80		; Mask for >1 byte per char
	.word &f800		; >2 bytes per char


	
// End of file.
