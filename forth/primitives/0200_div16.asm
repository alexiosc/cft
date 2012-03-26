// -*- asm -*-
//
// Division words
	
	

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
	;; TODO: optimise for division by powers of two (and ideally 10)

	;; Check for division by zero.
        LOAD TMP3		; Check for division by zero
	SNZ
	RET			; Division by zero. Return 0.

	;; Check for division by 2.
	LI 2
	XOR TMP3
	SNZ
	JMP _ushr1
	
	;; Check for division by 16.
	LI 16
	XOR TMP3
	SNZ
	JMP _ushr4
	
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

	;; Optimised 16-bit division by 2 and 16.
	;; 
	;; Inputs:
	;;   TMP1: dividend
	;;   TMP3: divisor
	;;
	;; Outputs:
	;;   TMP1: quotient
	;;   TMP5: modulo
	;;   AC: 0 => division by zero.

_ushr1:
	LOAD TMP1
	CLL RBR
	STORE TMP1
	CLA RBL			; Roll-in value of L.
	STORE TMP5
	LI 0
	RET
	
_ushr4:
	LI &f
	AND TMP1
	STORE TMP5		; Modulo = (TMP1 & 0xf)

	LOAD TMP1

	LOAD TMP1
	RNR
	AND PLUS0FFF		; Quotient = (TMP1 >> 4) & 0xfff)
	STORE TMP1
	LI 0
	RET
	


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


	;; word:  /
	;; alias: DIV
	;; flags: DOCOL ROM CFT
	;; notes: / ( u1 u2 -- u )
	;;   16-bit signed integer division. Calculates u1 / u2 and
	;;   returns the remainder ur and the quotient uq.
	.word dw_DIV_MOD	; /MOD
	.word dw_SWAP		; SWAP
	.word dw_DROP		; DROP
	.word dw_EXIT



// End of file.
