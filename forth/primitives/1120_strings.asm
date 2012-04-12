// -*- asm -*-
//
// String handling primitives.

	;; word:  BL
	;; flags: CODE ROM
	;; notes: bl ( -- 32 )
	;;   Pushes the codepoint of a space onto the stack.

	LI 32
	PUSH (SP)
	NEXT



	;; word:  >CHAR
	;; alias: to-char
	;; flags: CODE ROM
	;; notes: >CHAR ( c -- c )
	;;   Strips high bits and optionally converts non-printable ASCII
	;;   characters to dots.

	SPEEK (SP)
	AND PLUS127		; Keep the lower 7 bits
	STORE TMP1
	LI 32			; Compare against ASCII 32
	NEG
	ADD TMP1
	SNN			; char >= 32?
	JMP _dw_to_char_fix	; No.

	LI 127			; Compare against ASCII 127
	XOR TMP1
	SNZ			; Is it 127?
	JMP _dw_to_char_fix	; Yes.
	
	LOAD TMP1		; No. Push it back.
	SPOKE0 (SP)
	NEXT

_dw_to_char_fix:
	LI 46			; ASCII 46 = .
	SPOKE0 (SP)
	NEXT
	
	
	
	;; word:  COUNT
	;; flags: CODE ROM
	;; notes: COUNT ( b -- b +n )
	;;        Pushes the length +n (in characters) of the packed,
	;;        null-terminated string at address b.

	SPEEK (SP)
	JSR _strplen
	PUSH (SP)
	NEXT

_strplen:
	STORE I0		; I0 is the string pointer
	LI 0
	STORE TMP1		; TMP1 is the count

_strplen_loop:
	LOAD I I0
	SNZ			; Terminator?
	JMP _strplen_end1	; Done.

	AND BYTEHI		; Check the high 8 bits
	SNZ			; Terminator?
	JMP _strplen_end	; Done

	LINCn(TMP1, 2)		; TMP1 += 2

	JMP _strplen_loop	; Again
	
_strplen_end:
	ISZ TMP1		; TMP1 += 1
	RET
	
_strplen_end1:
	LOAD TMP1
	RET



	;; word:  >CCOUNT
	;; alias: to_CCOUNT
	;; flags: CODE ROM
	;; notes: >CCOUNT ( u -- u )
	;;        Returns the number of cells needed to store u bytes
	;;        of a packed string including its termination.

	SPEEK(SP)
	SNA			; Special case: empty pstrings use 1 cell.
	INC
	OP1 CLL INC RBR		; L=0, AC++, AC>>1
	SPOKE0(SP)
	NEXT


	
	;; word:  CCOUNT
	;; flags: CODE ROM
	;; notes: CCOUNT ( b -- b +n )
	;;   Returns the number of cells used by the packed string b, including
	;;   that of its terminating null.

	SPEEK (SP)
	JSR _strwplen
	PUSH (SP)
	NEXT

_strwplen:
	STORE I0		; I0 is the string pointer
	LI 0
	STORE TMP1		; TMP1 is the count

_strwplen_loop:
	ISZ TMP1		; TMP1++. Will never skip unless length >= 65536.
	
	LOAD I I0
	SNZ			; Terminator?
	JMP _strwplen_end	; Done.

	AND BYTEHI		; Check the high 8 bits
	SNZ			; Terminator?
	JMP _strwplen_end	; Done. No separate termination cell.

	JMP _strwplen_loop	; Loop again.

_strwplen_end:
	LOAD TMP1
	RET


	;; word:  CMOVE
	;; flags: CODE ROM
	;; notes: CMOVE ( addr1 addr2 u -- )
	;;   Copy u cells from addr1 to addr2.

	RPOP(TMP1, SP)		; Count (in cells)
	RPOP(I1, SP)		; Target address
	RPOP(I0, SP)		; Source address

	JSR _cmove
	NEXT

_cmove:
	RNEG(TMP1,TMP1)		; TMP1 = -TMP1
	SNZ			; Sanity check: exit if TMP1=0.
	RET
	
_cmove_loop:
	RMOV(I I1, I I0)	; mem[I0++] = mem[I1++]
	ISZ TMP1		; TMP1++
	JMP _cmove_loop		; Loop again.
	RET			; Exit if TMP1 == 0.

	

	;; word:  FILL
	;; flags: CODE ROM
	;; notes: FILL ( a u c -- )
	;;   Fill c cells starting at address a with value u.

	RPOP(TMP1, SP)		; Count (in cells)
	RPOP(TMP2, SP)		; Value
	RPOP(I0, SP)		; Address

	JSR _cfill
	NEXT

_cfill:
	RNEG(TMP1,TMP1)		; TMP1 = -TMP1
	SNZ			; Sanity check: exit if TMP1=0.
	RET
	
_cfill_loop:
	RMOV(I I0, TMP2)	; mem[I0++] = TMP2
	ISZ TMP1		; TMP1++
	JMP _cfill_loop		; Loop again.
	RET			; Exit if TMP1 == 0.

	

	;; word:  $PACK
	;; alias: _pack
	;; flags: CODE ROM CFT
	;; notes: $PACK ( a1 a2 -- a3 a4 )
	;;        Converts an unpacked null-terminated string starting
	;;        at address a1 to a bit-packed representation at address
	;;        a2 which must be a buffer big enough for the conversion.
	;;        The word returns the last address read from (a3) and
	;;        written to (a4).

	RPOP (R0, SP)		; pop dst address
	RPOP (I0, SP)		; pop src address
	
__pack_loop:
	RMOV(I R0, I I0)	; Copy Low byte
        SNZ			; Done?
        JMP __pack_end		; Yes

        LOAD I I0		; High byte
        SNZ			; Done?
        JMP __pack_end		; Yes
	MAKEHICHAR()		; Shift 8 bits left
        OR I R0			; Combine the two bytes
        STORE I R0

        ISZ R0			; Increment R0. Should never skip.

        JMP __pack_loop		; Loop again

__pack_end:
	RPUSH(SP, I0)		; Push the final source address.
	ISZ R0			;
	PUSH (SP)		; Push the final target address.

	NEXT


	;; word:  $cPACK
	;; alias: _cPACK
	;; flags: CODE ROM CFT
	;; notes: $PACK ( a1 c a2 -- a3 a4 )
	;;        Converts an unpacked string of length c cells starting
	;;        at address a1 to a bit-packed representation at address
	;;        a2 which must be a buffer big enough for the conversion.
	;;        The word returns the last address read from (a3) and
	;;        written to (a4).

	RPOP(TMP1, SP)		; TMP1 = dst address
	POP(SP)			; TMP2 = count
	ING			; TMP2 = -(TMP2 + 1)
	STORE TMP2
	RPOP(I0, SP)		; I0 = src address (autoincrement)
	
__cpack_loop:
	ISZ TMP2		; TMP2++. Zero?
        JMP __cpack_lo		; No. Skip
        JMP __cpack_end1	; Yes. End processing.

__cpack_lo:
	RMOV(I TMP1, I I0)	; Just copy the low byte

	ISZ TMP2		; TMP2++. Zero?
        JMP __cpack_hi		; No. Skip
        JMP __cpack_end		; Yes. End processing.
	
__cpack_hi:
        LOAD I I0		; High byte
	MAKEHICHAR()		; Shift 8 bits left
        OR I TMP1		; Combine the two bytes
        STORE I TMP1

        ISZ TMP1		; Increment TMP1. Should never skip.
        JMP __cpack_loop	; (but just in case...)
        JMP __cpack_loop	; Loop again

__cpack_end1:
	LI 0
	STORE I TMP1
	
__cpack_end:
	RPUSH(SP, I0)		; Push the final source address.
	ISZ TMP1		;
	PUSH (SP)		; Push the final target address.

	NEXT


	;; word:  2CHARS
	;; flags: CODE ROM CFT
	;; notes: 2CHARS ( a -- a c2 c1 )
	;;        Given an address a of a packed string cell, this splits the
	;;        cell value at a into two bytes c2 (high, second character)
	;;        and c1 (low, first character) and pushes them onto the stack
	;;        in this order. Useful in processing packed strings. The
	;;        address u is increased by one and also pushed onto the
	;;        stack. A c1 or c2 value of 0 signifies the end of the string.

	RPOP(TMP1, SP)		; address
	ADD PLUS1
	PUSH(SP)		; push the incremented address.

	LOAD I TMP1		; Load character at TMP1
	GETHICHAR()
	PUSH(SP)		; Push the high character

	LOAD I TMP1
	GETLOCHAR()
	PUSH(SP)		; Push the low character

	NEXT
	


	;; word:  S@
	;; alias: s-fetch
	;; flags: CODE ROM CFT
	;; notes: S@ ( b u -- c )
	;;        Returns the character c at position u of packed string b.
	;;        No checking is performed.

	RPOP (TMP1, SP)		; position
	RPOP (TMP2, SP)		; address

	;; cell position: u >> 1
	;; bit position: u & 1 ? 0xff00 /* MSB */ : 0xff /* LSB */
	RSBR (TMP1, TMP1)	; TMP1 = TMP1 >> 1
	SSL			; L = 1? (odd index?)
	JMP _s_fetch_even	; No. Even index.

_s_fetch_odd:	
	;; fetching odd bytes (most significant)
	RADD (TMP2, TMP2, TMP1)	; TMP2 += TMP1
	LOAD I TMP2
	GETHICHAR()		; (AC>>8) & 0xff
	PUSH (SP)
	NEXT

_s_fetch_even:
	RADD (TMP2, TMP2, TMP1)	; TMP2 += TMP1
	LOAD I TMP2
	AND BYTELO		; AC & 0xff
	PUSH (SP)
	NEXT			; Done.

	

	;; word:  S!
	;; alias: s-store
	;; flags: CODE ROM CFT
	;; notes: S@ ( b u c -- )
	;;        Stores character c at position u of string at address b.
	;;        No checking is performed.


	RPOP (TMP3, SP)		; character
	RPOP (TMP1, SP)		; position
	RPOP (TMP2, SP)		; address

	;; cell position: u >> 1
	;; bit position: u & 1 ? 0xff00 /* MSB */ : 0xff /* LSB */
	RSBR (TMP1, TMP1)	; TMP1 = TMP1 >> 1
	SSL			; L = 1? (odd index?)
	JMP _s_store_even	; No. Even index.

s_store_odd:
	;; storing odd bytes (most significant)
	RADD (TMP2, TMP2, TMP1)	; TMP2 += TMP1
	RAND (I TMP2, I TMP2, BYTELO) ; mask high 8 bits
	LOAD TMP3
	MAKEHICHAR()
	OR I TMP2		; TMP2 |= shifted char
	STORE I TMP2		; store it
	NEXT

_s_store_even:
	RADD (TMP2, TMP2, TMP1)	; TMP2 += TMP1
	RAND (I TMP2, I TMP2, BYTEHI) ; mask lo 8 bits
	LOAD TMP3
	AND BYTELO		; character & 0xff00
	OR I TMP2		; TMP2 |= shifted char
	STORE I TMP2		; store it
	NEXT

	

	;; word:  do$
	;; alias: do_str
	;; flags: CODE ROM CFT
	;; notes: doSTR ( -- addr )
	;; 	  Allows string handling in high-level words. Puts the address
        ;;        of the string on the stack, and adjusts the return address
        ;;        (the first item on the return stack) to skip over it. The
        ;;        string must have been compiled with ,$.

	SPEEK(RP)
	STORE TMP1		; The location of the jump destination.

	LI 1
	ADD TMP1		; Get the string address
	PUSH(SP)		; Push it onto the data stack

	LOAD I TMP1		; Load the new IP
	SPOKE0(RP)		; And store it back on the return stack

	NEXT

	

	;; word:  .$
	;; alias: dot_str
	;; flags: DOCOL ROM CFT COMPILE
	;; notes: .$ ( -- )
	;; 	  Prints out a string previously compiled with ,$.
	
	.word dw_do_str		; do$
	.word dw_typep0		; TYPEp0
	.word dw_EXIT



// End of file.
