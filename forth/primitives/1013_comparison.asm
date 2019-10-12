// -*- asm -*-
//
// Core comparison primitives


	
	;; word:  FALSE
	;; flags: CODE ROM
	;; notes: FALSE ( -- f )
	;;   Push FALSE
	LI 0
	PUSH SP
	NEXT



	;; word:  TRUE
	;; flags: CODE ROM
	;; notes: TRUE ( -- t )
	;;   Push TRUE
	RPUSH(SP, MINUS1)	; Push &ffff
	NEXT



	;; word:  0<
	;; alias: zero-less
	;; flags: CODE ROM
	;; notes: 0< ( n -- f )
	;;   Push true if n is negative, false otherwise
	POP SP
	SNA			; Negative?
	JMP dw_FALSE		; No. Push 0
	JMP dw_TRUE		; Yes. Push 1

	

	;; word:  0=
	;; alias: zero-equals
	;; flags: CODE ROM
	;; notes: 0= ( n -- f )
	;;   Push true if n is zero, false otherwise
	POP SP
	SZA			; Zero?
	JMP dw_FALSE		; No. Push 0
	JMP dw_TRUE		; Yes. Push 1

	

	;; word:  0>
	;; alias: zero-greater
	;; flags: CODE ROM
	;; notes: 0> ( n -- f )
	;;   Push true if n is greter than zero, false otherwise
	POP SP
	SPA			; Greater than zero?
	JMP dw_FALSE		; No. Push 0
	JMP dw_TRUE		; Yes. Push 1

	

	;; word:  <
	;; alias: lt
	;; flags: CODE ROM
	;; notes: < ( w1 w2 -- f )
	;;   Push true if w1 < w2, false otherwise.
	RPOP(TMP0, SP)		; TMP0 = w2
	POP SP			; w1
	NEG
	ADD TMP0		; w2 - w1

	;; SNA: AC < 0: w1 > w2
	;; SZA: AC = 0: w1 = w2
	;; SPA: AC > 0: w1 < w2 ***

	SPA			; w1 < w2?
	JMP dw_FALSE		; No. (unequal)
	JMP dw_TRUE

	

	;; word:  <=
	;; alias: leq
	;; flags: CODE ROM
	;; notes: <= ( w1 w2 -- f )
	;;   Push true if w1 <= w2, false otherwise.
	RPOP(TMP0, SP)		; TMP0 = w2
	POP SP			; w1
	NEG
	ADD TMP0		; w2 - w1

	;; SNA: AC < 0: w1 > w2
	;; SZA: AC = 0: w1 = w2 ***
	;; SPA: AC > 0: w1 < w2 ***

	SNN			; w1 <= w2?
	JMP dw_FALSE		; No.
	JMP dw_TRUE		; Yes.

	

	;; word:  =
	;; alias: equal
	;; flags: CODE ROM
	;; notes: = ( w w -- f )
	;;   Push true if n is negative, false otherwise
	RPOP(TMP0, SP)		; TMP0 = w1
	POP SP			; w2

	XOR TMP0		; Compare
	
	SZA			; A == 0? (equal?)
	JMP dw_FALSE		; No. (unequal)
	JMP dw_TRUE
	


	;; word:  <>
	;; alias: not-equal
	;; flags: CODE ROM
	;; notes: = ( w w -- f )
	;;   Push true if n is negative, false otherwise
	RPOP(TMP0, SP)		; TMP0 = w1
	POP SP			; w2

	XOR TMP0		; Compare

	SNZ			; A != 0? (unequal?)
	JMP dw_FALSE		; No. (equal)
	JMP dw_TRUE
	


	;; word:  >=
	;; alias: geq
	;; flags: CODE ROM
	;; notes: >= ( w1 w2 -- f )
	;;   Push true if w1 >= w2, false otherwise.
	RPOP(TMP0, SP)		; TMP0 = w2
	POP SP			; w1
	NEG
	ADD TMP0		; w2 - w1

	;; SNA: AC < 0: w1 > w2 ***
	;; SZA: AC = 0: w1 = w2 ***
	;; SPA: AC > 0: w1 < w2

	SNP			; w1 >= w2?
	JMP dw_FALSE		; No. (unequal)
	JMP dw_TRUE

	

	;; word:  >
	;; alias: gt
	;; flags: CODE ROM
	;; notes: > ( w1 w2 -- f )
	;;   Push true if w1 > w2, false otherwise.
	RPOP(TMP0, SP)		; TMP0 = w2
	POP SP			; w1
	NEG
	ADD TMP0		; w2 - w1

	;; SNA: AC < 0: w1 > w2 ***
	;; SZA: AC = 0: w1 = w2
	;; SPA: AC > 0: w1 < w2

	SNA			; w1 > w2?
	JMP dw_FALSE		; No. (unequal)
	JMP dw_TRUE

	
	
	;; word:  MIN
	;; flags: CODE ROM
	;; notes: MIN ( w1 w2 -- w )
	;;   Pushes the minimum of the two numbers.
	RPOP(TMP0, SP)		; TMP0 = w1

	RPOP(TMP1, SP)		; TMP1 = w2
	NEG
	ADD TMP0		; w1 - w2

	SPA			; Positive AC? (= w2 is min)
	JMP dw_MIN_push_w1	; No. w1 is smaller. Push it.

dw_MIN_push_w2:			; Yes. w2 is smaller.
	RPUSH(SP, TMP1)
	NEXT

dw_MIN_push_w1:
	RPUSH(SP, TMP0)
	NEXT


	
	;; word:  MAX
	;; flags: CODE ROM
	;; notes: MIN ( w w -- w )
	;;   Pushes the minimum of the two numbers.
	RPOP(TMP0, SP)		; TMP0 = w1

	RPOP(TMP1, SP)		; TMP1 = w2
	NEG
	ADD TMP0		; w1 - w2

	SPA			; Positive AC? (= w1 is max)
	JMP dw_MIN_push_w2	; Push w2
	JMP dw_MIN_push_w1	; Push w1


	
	;; word:  WITHIN
	;; flags: CODE ROM
	;; notes: WITHIN ( u ul uh -- f )
	;;   TRUE if ul <= u <= uh
	RPOP (TMP0, SP)		; uh
	RPOP (TMP1, SP)		; ul
	POP (SP)		; u
	NEG
	STORE TMP2		; TMP2 = -u
	
	ADD TMP0		; uh - u
	SNN			; >=0? (i.e. u <= uh)
	JMP dw_FALSE		; No. Push FALSE and exit.

	LOAD TMP2
	ADD TMP1		; ul - u
	SNP			; <=0? (i.e ul <= u)
	JMP dw_FALSE		; No. Push FALSE end exit.

	JMP dw_TRUE		; Both checks succeeded. Push TRUE.


	
// End of file.	
