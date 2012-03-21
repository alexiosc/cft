// -*- asm -*-
//
// Division words
	
	

	;; word:  ab
	;; flags: DOCOL ROM CFT
	;; notes: ab ( -- a b )
	.word dw_doLIT
	.word 12345
	.word dw_doLIT
	.word 0

	.word dw_doLIT
	.word -4
	.word dw_doLIT
	.word -1

	.word dw_DUMPS

	.word dw_D_DIV_MOD

	.word dw_DUMPS
	.word dw_HALT

	.word dw_EXIT

	
	
	;; word:  U/MOD
	;; alias: U-DIV-MOD
	;; flags: FFL_PRIMITIVE ROM CFT
	;; notes: U/MOD ( u1 u2 -- ur uq )
	;;   16-bit unsigned integer division. Calculates u1 / u2 and
	;;   returns the remainder ur and the quotient uq.
	RPOP(TMP3, SP)		; u2
	RPOP(TMP1, SP)		; u1

	JSR _udiv16

	;; TODO: check for division by zero here (AC = 0 => error)

	RPUSH (SP, TMP5)	; modulo
	RPUSH (SP, TMP1)	; quotient
	
	NEXT



	;; Subroutine: div16
	;;
	;; Inputs:
	;;   TMP1: dividend
	;;   TMP3: divisor
	;;
	;; Outputs:
	;;   TMP1: quotient
	;;   TMP5: modulo
	;;   AC: 0 => division by zero.

_udiv16_done:
	LI 1
	RET

_udiv16:
        LOAD TMP3		; Check for division by zero
	SNZ
	RET			; Division by zero. Return 0.
	
	LOAD _udiv16_rep	; -17 => 16 bits
	STORE TMP0

	LI 0
	STORE TMP5		; modulo = 0

_udiv16_nextbit:
        ISZ TMP0		; Increment and check if done.
        JMP @+2
	JMP _udiv16_done

	;; Magic.
	RSBL(TMP1, TMP1)	; Shift left <TMP5,TMP1> (<modulo,quotient>)
	RRBL(TMP5, TMP5)

	;; Compare modulo and divisor
	LOAD TMP3		; Calculate modulo - divisor (TMP5 - TMP3)
	NEG
	ADD TMP5

	;; Will it fit?
	SNN			; Will it fit?
	JMP _udiv16_nextbit	; No. Try next bit.

	;; Yes, it fits.
	STORE TMP5 		; Update the modulo.

	LI 1			; The divisor fits in the divident. Add 1.
	ADD TMP1
	STORE TMP1

	JMP _udiv16_nextbit	; And go again.
	
_udiv16_rep:
	.word -17


	;; word:  /MOD
	;; alias: DIV-MOD
	;; flags: FFL_PRIMITIVE ROM CFT
	;; notes: /MOD ( u1 u2 -- ur uq )
	;;   Floored, 16-bit signed integer division. Calculates u1 / u2 and
	;;   returns the remainder ur and the quotient uq.
	;;
	;;   Wraps udiv16, and modifies its results for symmetric signed
	;;   division, then adjusts to obtain floored division as per the F83
	;;   standard.
	
	RPOP(TMP3, SP)		; u2 divisor
	RPOP(TMP1, SP)		; u1 dividend

	;; Check the sign of the dividend.
	STORE TMP14		; Store for later.
	SNA			; Negative?
	JMP _idiv16_testr	; No. Carry on.

	NEG
	STORE TMP1		; Negate it and store it back.

	;; Check the sign of the divisor.
_idiv16_testr:	
	RMOV(TMP15, TMP3)	; Load divisor, store for later.
	SNA			; Negative?
	JMP _idiv16_go		; No. Carry on.

	NEG
	STORE TMP3		; Negate it and store it back.

	;; ...and go divide. (unsigned division, of course)
_idiv16_go:
	JSR _udiv16

	;; TODO: check for division by zero here (AC = 0 => error)



	;; This is where symmetric signed division is implemented.
	;; Based on this, we calculate floored division results as per the F83
	;; standard.
	;;
	;; Symmetric division entails (based on unsigned results):
	;; 
	;;   * Flipping the sign of the quotient if the signs of the dividend
	;;     and divisor differ.
	;; 
	;;   * Flipping the sign of the remainder if the dividend is negative.
	;;
	;; Details found at http://www.bearcave.com/software/divide.htm

	DEBUGON
	;; Negate the quotient of the argument signs differ.
	LOAD TMP14
	XOR TMP15
	AND _idiv16_bit15	; Are the signs different?
	STORE TMP13		; Keep this for later (for floored division)
	SNZ
	JMP _idiv16_nonegq

	RNEG(TMP1, TMP1)		; Negate the quotient.

	;; Don't negate quotient
_idiv16_nonegq:
	;; The sign of the remainder is the same as the sign of the dividend.
	LOAD TMP14
	SNA
	JMP _idiv16_symmetric_done

	RNEG(TMP5, TMP5)	; Negate the remainder to match.

_idiv16_symmetric_done:
	DEBUGOFF
_idiv16_flooored:

        ;; Up to here, we've done floored division. Now convert it to symmetric
        ;; division.
	;; 

        LOAD TMP5		; Load modulo
        SNZ
        JMP _idiv16_done	; It's zero: all's good. Exit.

	LOAD TMP13		; Non-zero if argument signs differ
	SNZ
	JMP _idiv16_done	; Equal signs: all done here. Exit.

        RADD(TMP1, TMP1, MINUS1) ; Quotient--
        RADD(TMP5, TMP5, TMP15)	; modulo += divisor

_idiv16_done:
	RPUSH(SP, TMP5)		; modulo
	RPUSH(SP, TMP1)		; quotient
	NEXT

_idiv16_bit15:
	.word &8000


// End of file.
