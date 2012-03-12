// -*- asm -*-
//
// Core comparison primitives

	;; word:  FALSE
	;; flags: FFL_PRIMITIVE ROM
	;; notes: FALSE ( -- f )
	;;   Push FALSE
	LI 0
	PUSH (SP)
	NEXT



	;; word:  TRUE
	;; flags: FFL_PRIMITIVE ROM
	;; notes: TRUE ( -- f )
	;;   Push TRUE
	LOAD MINUS1
	PUSH (SP)
	NEXT



	;; word:  0<
	;; alias: zero-less
	;; flags: FFL_PRIMITIVE ROM
	;; notes: 0< ( n -- f )
	;;   Push true if n is negative, false otherwise
	SPEEK (SP)
	SNA			; Negative?
	JMP dw_FALSE		; No. Push 0
	JMP dw_TRUE		; Yes. Push 1

	

	;; word:  0=
	;; alias: zero-equals
	;; flags: FFL_PRIMITIVE ROM
	;; notes: 0= ( n -- f )
	;;   Push true if n is zero, false otherwise
	SPEEK (SP)
	SZA			; Zero?
	JMP dw_FALSE		; No. Push 0
	JMP dw_TRUE		; Yes. Push 1

	

	;; word:  0>
	;; alias: zero-greater
	;; flags: FFL_PRIMITIVE ROM
	;; notes: 0> ( n -- f )
	;;   Push true if n is greter than zero, false otherwise
	SPEEK (SP)
	SPA			; Greater than zero?
	JMP dw_FALSE		; No. Push 0
	JMP dw_TRUE		; Yes. Push 1

	

	;; word:  <
	;; alias: less-than
	;; flags: FFL_PRIMITIVE ROM
	;; notes: < ( w1 w2 -- f )
	;;   Push true if w1 < w2, false otherwise.
	POP1PEEK1 (SP)

	NEG
	ADD TMP1		; Subtract

	SNA			; Negative A?
	JMP dw_FALSE		; No. (unequal)
	JMP dw_TRUE

	

	;; word:  <=
	;; alias: less-than-or-equal
	;; flags: FFL_PRIMITIVE ROM
	;; notes: <= ( w1 w2 -- f )
	;;   Push true if w1 <= w2, false otherwise.
	POP1PEEK1 (SP)

	NEG
	ADD TMP1		; Subtract

	SNP			; A <= 0?
	JMP dw_FALSE		; No.
	JMP dw_TRUE		; Yes.

	

	;; word:  =
	;; alias: equal
	;; flags: FFL_PRIMITIVE ROM
	;; notes: = ( w w -- f )
	;;   Push true if n is negative, false otherwise
	POP1PEEK1 (SP)

	XOR TMP1		; Compare
	SZA			; A == 0? (equal?)
	JMP dw_FALSE		; No. (unequal)
	JMP dw_TRUE
	


	;; word:  >=
	;; alias: greater-than-or-equal
	;; flags: FFL_PRIMITIVE ROM
	;; notes: >= ( w1 w2 -- f )
	;;   Push true if w1 >= w2, false otherwise.
	POP1PEEK1 (SP)

	NEG
	ADD TMP1		; Subtract

	SNN			; Positive A?
	JMP dw_FALSE		; No. (unequal)
	JMP dw_TRUE

	

	;; word:  >
	;; alias: greater-than
	;; flags: FFL_PRIMITIVE ROM
	;; notes: > ( w1 w2 -- f )
	;;   Push true if w1 > w2, false otherwise.
	POP1PEEK1 (SP)

	NEG
	ADD TMP1		; Subtract

	SPA			; Positive A?
	JMP dw_FALSE		; No. (unequal)
	JMP dw_TRUE

	
	
	;; word:  MIN
	;; flags: FFL_PRIMITIVE ROM
	;; notes: MIN ( w w -- w )
	;;   Pushes the minimum of the two numbers.
	POP1PEEK1 (SP)

	NEG
	ADD TMP1		; Subtract

	SNA			; Negative AC?
	JMP dw_MIN_push_tmp1	; No. TMP1 is smaller. Push it.
dw_MIN_push_AC:	
	PUSH (SP)
	NEXT
dw_MIN_push_tmp1:
	LOAD TMP1
	PUSH (SP)
	NEXT


	
	;; word:  MAX
	;; flags: FFL_PRIMITIVE ROM
	;; notes: MIN ( w w -- w )
	;;   Pushes the minimum of the two numbers.
	POP1PEEK1 (SP)

	NEG
	ADD TMP1		; Subtract

	SPA			; Negative AC?
	JMP dw_MIN_push_tmp1	; No. TMP1 is greater. Push it.
	JMP dw_MIN_push_AC	; Yes. Push AC.


	
	;; word:  WITHIN
	;; flags: FFL_PRIMITIVE ROM
	;; notes: WITHIN ( u ul uh -- f )
	;;   TRUE if ul <= u <= uh
	POP (SP)
	STORE TMP1		; uh
	POP (SP)
	STORE TMP2		; ul
	SPEEK (SP)
	STORE TMP3		; u

	NEG
	STORE TMP3		; TMP3 = -u
	ADD TMP1		; uh - u
	SNN			; >=0? (i.e. u <= uh)
	JMP dw_FALSE		; No. Push FALSE and exit.

	LOAD TMP3
	ADD TMP2		; ul - u
	SNP			; <=0? (i.e ul <= u)
	JMP dw_FALSE		; No. Push FALSE end exit.

	JMP dw_TRUE		; Both checks succeeded. Push TRUE.


	
// End of file.	
