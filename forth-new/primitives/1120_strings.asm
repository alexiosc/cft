// -*- asm -*-
//
// String handling primitives.


	
	;; word:  BL
	;; flags: CONST ROM
	;; notes: bl ( -- 32 )
	;;        Pushes the codepoint of a space onto the stack.

	.word 32



	;; word:  >CHAR
	;; alias: to-char
	;; flags: CODE ROM
	;; notes: >CHAR ( c -- c )
	;;   Strips high bits and optionally converts non-printable ASCII
	;;   characters to dots.

	POP SP
	AND PLUS127		; Keep the lower 7 bits
	STORE TMP0
	
	LI 32			; Compare against ASCII 32
	NEG
	ADD TMP0
	SNN			; char >= 32?
	JMP _dw_to_char_fix	; No.

	LI 127			; Compare against ASCII 127
	XOR TMP0
	SNZ			; Is it 127?
	JMP _dw_to_char_fix	; Yes.
	
	LOAD TMP0		; No. Push it back.
	PUSH SP
	NEXT

_dw_to_char_fix:
	LI 46			; ASCII 46 = .
	PUSH SP
	NEXT
	
	
	
	;; word:  COUNT
	;; flags: CODE ROM
	;; notes: COUNT ( b -- b +n )
	;;        Pushes the length +n (in characters) of the packed,
	;;        null-terminated string at address b.

	POP SP
	JSR _strplen
	PUSH SP
	NEXT

_strplen:
	STORE I0		; I0 is the string pointer
	LI 0
	STORE TMP0		; TMP0 is the count

_strplen_loop:
	LOAD I I0
	SNZ			; Terminator?
	JMP _strplen_end1	; Done.

	AND BYTEHI		; Check the high 8 bits
	SNZ			; Terminator?
	JMP _strplen_end	; Done

	LINCn(TMP0, 2)		; TMP0 += 2

	JMP _strplen_loop	; Again
	
_strplen_end:
	ISZ TMP0		; TMP0 += 1
	RET
	
_strplen_end1:
	LOAD TMP0
	RET



	;; word:  >CCOUNT
	;; alias: to_CCOUNT
	;; flags: CODE ROM
	;; notes: >CCOUNT ( u -- u )
	;;        Returns the number of cells needed to store u bytes
	;;        of a packed string including its termination.

	POP SP
	SNA			; Special case: empty pstrings use 1 cell.
	INC
	OP1 CLL INC RBR		; L=0, AC++, AC>>1
	PUSH SP
	NEXT


	
	;; word:  CCOUNT
	;; flags: CODE ROM
	;; notes: CCOUNT ( b -- b +n )
	;;   Returns the number of cells used by the packed string b, including
	;;   that of its terminating null.

	POP SP
	JSR _strwplen
	PUSH SP
	NEXT

_strwplen:
	STORE I0		; I0 is the string pointer
	LI 0
	STORE TMP0		; TMP0 is the count

_strwplen_loop:
	ISZ TMP0		; TMP0++. Will never skip unless length >= 65536.
	
	LOAD I I0
	SNZ			; Terminator?
	JMP _strwplen_end	; Done.

	AND BYTEHI		; Check the high 8 bits
	SNZ			; Terminator?
	JMP _strwplen_end	; Done. No separate termination cell.

	JMP _strwplen_loop	; Loop again.

_strwplen_end:
	LOAD TMP0
	RET


	;; word:  CMOVE
	;; flags: CODE ROM
	;; notes: CMOVE ( addr1 addr2 u -- )
	;;   Copy u cells from addr1 to addr2.

	RPOP(TMP0, SP)		; Count (in cells)
	RPOP(I1, SP)		; Target address
	RPOP(I0, SP)		; Source address

	JSR _cmove_entry
	NEXT

_cmove_entry:
	RNEG(TMP0, TMP0)	; TMP0 = -TMP0
	SNZ			; Sanity check: exit if TMP0=0.
	RET
	
_cmove_loop:
	RMOV(I I1, I I0)	; mem[I0++] = mem[I1++]
	ISZ TMP0		; TMP0++
	JMP _cmove_loop		; Loop again.
	RET			; Exit if TMP1 == 0.

	

	;; word:  FILL
	;; flags: CODE ROM CFT
	;; notes: FILL ( a u c -- )
	;;   Fill c cells starting at address a with value u.

	RPOP(TMP0, SP)		; Count (in cells)
	RPOP(TMP1, SP)		; Value
	RPOP(I0, SP)		; Address
	JMP _cfill_entry

	

	;; word:  ERASE
	;; flags: CODE ROM
	;; notes: ERASE ( a u -- )
	;;        Fill c cells starting at address a with zeroes.

	RPOP(TMP0, SP)		; Count (in cells)
	LI 0
	STORE TMP1		; Value
	;; Fall-through.


	;; Subroutine: _cfill
	;; Inputs:
	;;   I0:   starting address
	;;   TMP0: count (in cells)
	;;   TMP1: value
	;; Outputs:
	;;   None.
	;; Side-effects:
	;;   I0:   last address + 1
	;;   TMP0: 0000

	
_cfill_entry:
	RNEG(TMP0, TMP0)	; TMP0 = -TMP0
	SNZ			; Sanity check: exit if TMP0=0.
	RET
	
_cfill_loop:
	RMOV(I I0, TMP1)	; mem[I0++] = TMP1
	ISZ TMP0		; TMP0++
	JMP _cfill_loop		; Loop again.
	RET			; Exit if TMP0 == 0.

	

	;; word:  $PACK
	;; alias: _pack
	;; flags: CODE ROM CFT
	;; notes: $PACK ( a1 a2 -- a3 a4 )
	;;        Converts an unpacked null-terminated string starting
	;;        at address a1 to a bit-packed representation at address
	;;        a2 which must be a buffer big enough for the conversion.
	;;        The word returns the last address read from (a3) and
	;;        written to (a4).

	RPOP(TMP0, SP)		; pop dst address
	RPOP(I0, SP)		; pop src address
	
__pack_loop:
	RMOV(I TMP0, I I0)	; Copy Low byte
        SNZ			; Done?
        JMP __pack_end		; Yes

        LOAD I I0		; High byte
        SNZ			; Done?
        JMP __pack_end		; Yes
	MAKEHICHAR()		; Shift 8 bits left
        OR I TMP0		; Combine the two bytes
        STORE I TMP0

        ISZ TMP0		; Increment TMP0. Should never skip.
        JMP __pack_loop		; Loop again
        JMP __pack_loop		; Loop again (sanity check)

__pack_end:
	RPUSH(SP, I0)		; Push the final source address.
	ISZ TMP0		;
	PUSH SP			; Push the final target address.
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

	RPOP(TMP0, SP)		; TMP0 = dst address
	POP SP			; TMP1 = count
	ING			; TMP1 = -(TMP1 + 1)
	STORE TMP1
	RPOP(I0, SP)		; I0 = src address (autoincrement)
	
__cpack_loop:
	ISZ TMP1		; TMP1++. Zero?
        JMP __cpack_lo		; No. Skip
        JMP __cpack_end1	; Yes. End processing.

__cpack_lo:
	RMOV(I TMP0, I I0)	; Just copy the low byte

	ISZ TMP1		; TMP1++. Zero?
        JMP __cpack_hi		; No. Skip
        JMP __cpack_end		; Yes. End processing.
	
__cpack_hi:
        LOAD I I0		; High byte
	MAKEHICHAR()		; Shift 8 bits left
        OR I TMP0		; Combine the two bytes
        STORE I TMP0

        ISZ TMP0		; Increment TMP1. Should never skip.
        JMP __cpack_loop	; (but just in case...)
        JMP __cpack_loop	; Loop again

__cpack_end1:
	LI 0
	STORE I TMP0
	
__cpack_end:
	RPUSH(SP, I0)		; Push the final source address.
	ISZ TMP0		;
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

	RPOP(TMP0, SP)		; address
	ADD PLUS1
	PUSH SP			; push the incremented address.

	LOAD I TMP0		; Load character at TMP1
	GETHICHAR()
	PUSH SP			; Push the high character

	LOAD I TMP0
	GETLOCHAR()
	PUSH SP			; Push the low character

	NEXT
	


//.page

	;; word:  S@
	;; alias: s-fetch
	;; flags: CODE ROM CFT
	;; notes: S@ ( a n -- c )
	;;        Returns the character c at position n of packed string a.
	;;        No checking is performed.

	RPOP (TMP0, SP)		; position
	RPOP (TMP1, SP)		; address

	;; cell position: u >> 1
	;; bit position: u & 1 ? 0xff00 /* MSB */ : 0xff /* LSB */
	RSBR (TMP0, TMP0)	; TMP1 = TMP1 >> 1
	SSL			; L = 1? (odd index?)
	JMP _s_fetch_even	; No. Even index.

_s_fetch_odd:	
	;; fetching odd bytes (most significant)
	RADD (TMP1, TMP1, TMP0)	; TMP2 += TMP1
	LOAD I TMP1
	GETHICHAR()		; (AC>>8) & 0xff
	PUSH SP
	NEXT

_s_fetch_even:
	RADD (TMP1, TMP2, TMP0)	; TMP2 += TMP1
	LOAD I TMP1
	AND BYTELO		; AC & 0xff
	PUSH SP
	NEXT			; Done.


	;; word:  S!
	;; alias: s-store
	;; flags: CODE ROM CFT
	;; notes: S@ ( a n c -- )
	;;        Stores character c at position n of string at address a.
	;;        No checking is performed. n=0 is the first character.


	RPOP (TMP2, SP)		; character
	RPOP (TMP0, SP)		; position
	RPOP (TMP1, SP)		; address

	;; cell position: u >> 1
	;; bit position: u & 1 ? 0xff00 /* MSB */ : 0xff /* LSB */
	RSBR (TMP0, TMP0)	; TMP0 = TMP0 >> 1
	SSL			; L = 1? (odd index?)
	JMP _s_store_even	; No. Even index.

s_store_odd:
	;; storing odd bytes (most significant)
	RADD (TMP1, TMP1, TMP0)	; TMP1 += TMP1
	RAND (I TMP1, I TMP1, BYTELO) ; mask high 8 bits
	LOAD TMP2
	MAKEHICHAR()
	OR I TMP1		; TMP1 |= shifted char
	STORE I TMP1		; store it
	NEXT

_s_store_even:
	RADD (TMP1, TMP1, TMP0)	; TMP1 += TMP0
	RAND (I TMP1, I TMP1, BYTEHI) ; mask lo 8 bits
	LOAD TMP2
	AND BYTELO		; character & 0xff00
	OR I TMP1		; TMP1 |= shifted char
	STORE I TMP1		; store it
	NEXT

	

	;; word:  do$
	;; alias: do_str
	;; flags: CODE ROM CFT
	;; notes: doSTR ( -- addr )
	;; 	  Allows string handling in high-level words. Puts the address
        ;;        of the string on the stack, and adjusts the return address
        ;;        (the first item on the return stack) to skip over it. The
        ;;        string must have been compiled with ,$.

	RPOP(TMP0, RP)

	LI 1
	ADD TMP0		; Get the string address
	PUSH SP			; Push it onto the data stack

	LOAD I TMP0		; Load the new IP
	PUSH RP		        ; And store it back on the return stack

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
