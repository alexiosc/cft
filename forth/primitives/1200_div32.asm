// -*- asm -*-
//
// Division words

	;; word:  UD/MOD
	;; alias: UD-DIV-MOD
	;; flags: CODE ROM CFT
	;; notes: UD/MOD ( d1 d2 -- dr dq )
	;;   32-bit unsigned integer division. Calculates d1 / d2 and
	;;   returns the remainder dr and the quotient dq.
	RPOP(TMP2, SP)		; d2 high
	RPOP(TMP3, SP)		; d2 low

	RPOP(TMP7, SP)		; d1 high (temporarily)
	RPOP(TMP1, SP)		; d1 low
	RMOV(TMP0, TMP7)	; move d1 high to right register
	
	JSR _udiv32

	;; TODO: check for division by zero here (AC = 0 => error)

	RPUSH (SP, TMP5)	; quotient low
	RPUSH (SP, TMP4)	; quotient high

	RPUSH (SP, TMP1)	; remainder low
	RPUSH (SP, TMP0)	; remainder high
	
	NEXT
	

	
	;; word:  UM/MOD
	;; alias: UM-DIV-MOD
	;; flags: CODE ROM
	;; notes: UD/MOD ( d u -- dr dq )
	;;   Divide a 32-bit unsigned dividend d by a 16-bit unsigned divisor u.
	;;   Returns the remainder dr and the quotient dq.
	LI 0
	STORE TMP7		; divisor high = 0
	RPOP(TMP3, SP)		; u to divisor low

	RPOP(TMP2,SP)		; d1 high (temporarily)
	RPOP(TMP1, SP)		; d1 low
	RMOV(TMP0, TMP7)	; move d1 high to right register

	JSR _udiv32

	;; TODO: check for division by zero here (AC = 0 => error)

	RPUSH (SP, TMP5)	; quotient low
	RPUSH (SP, TMP4)	; quotient high

	RPUSH (SP, TMP1)	; remainder low
	RPUSH (SP, TMP0)	; remainder high
	
	NEXT
	

	;; A 32-bit unsigned division routine based on div16.
	;; Inputs (HI,LO)
	;;   TMP0,TMP1 = dividend (d1)
	;;   TMP2,TMP3 = divisor (d2)
	;; 
	;; Output:
	;;   TMP0,TMP1 = remainder
	;;   TMP4,TMP5 = quotient
	;;   AC = 0 => division by zero.
	;; 
	;; Registers:
	;;   TMP6,TMP7: shift mask
	;;   TMP8,TMP9: temporary

_udiv32_done:
        LI 1
        RET

_udiv32:
        ; Check for division by zero.
        LOAD TMP2
        OR TMP3
        SNZ
        RET                     ; Return with AC = 0

	RMOV(TMP6, _udiv32_rep) ; loop counter: 32 bits, 32 iterations

	LSET(TMP4, 0)           ; Modulo high = 0
        STORE TMP5              ; Modulo low = 0

_udiv32_nextbit:
        ISZ TMP6                ; TMP6++, skip if 0.
        JMP @+2
        JMP _udiv32_done        ; We're done.

        ; Magic: Shift left <TMP0,TMP1,TMP4,TMP5> 64-bit value (<modulo,quotient>)

        RSBL(TMP1, TMP1)        ; Shift first word.
        RRBL(TMP0, TMP0)        ; Roll subsequent for bit propagation.
        RRBL(TMP5, TMP5)        ; Roll subsequent for bit propagation.
        RRBL(TMP4, TMP4)        ; Roll subsequent for bit propagation.

_udiv32_compare:

        ; Calculate modulo - divisor (<TMP4,TMP5> - <TMP2,TMP3>)

        ; First, negate <TMP2,TMP3> (complement, then add <0,1>)
        RNEG32(TMP7,TMP8,TMP2,TMP3) ; <TMP7,TMP8> = -<TMP2,TMP3>

        ; Now, add module + (-divisor) (<TMP4,TMP5> + <TMP7,TMP8>)
        CLL
        RADD(TMP8, TMP8, TMP5)  ; Add low words. Keep the result for later.
        LOAD TMP7
        ADC(TMP4)               ; Add high words with carry.

_udiv32_does_it_fit:
	SNN			; Will it fit?
	JMP _udiv32_nextbit	; No. Try next bit.

_udiv32_it_fits:
	STORE TMP4 		; We already have the result of the subtraction. Store it.
        RMOV(TMP5,TMP8)         ; Transfer the low order word too.

	INC32(TMP0,TMP1)	; Add one to the quotient

	JMP _udiv32_nextbit     ; And loop again.
	
_udiv32_rep:
	.word -33		; Number of loop repetitions
	

	;; word:  D/MOD
	;; alias: D-DIV-MOD
	;; flags: CODE ROM CFT
	;; notes: D/MOD ( d1 d2 -- dr dq )
	;;   32-bit signed floored division. Uses udiv32, which it then
	;;   adjusts first for symmetric signed division, then for
	;;   floored division.
	
	RPOP(TMP2, SP)		; d2 high
	STORE TMP15		; Store for later
	RPOP(TMP3, SP)		; d2 low
	STORE TMP12		; Store for later

	RPOP(TMP7, SP)		; d1 high (temporarily)
	RPOP(TMP1, SP)		; d1 low
	RMOV(TMP0, TMP7)	; move d1 high to right register
	STORE TMP14		; and keep for later.


	;; Absolute values of the two arguments
	LOAD TMP0
	SNA
	JMP _idiv32_nonegn

	RNEG32(TMP0, TMP1, TMP0, TMP1)

_idiv32_nonegn:

	LOAD TMP2
	SNA
	JMP _idiv32_nonegr

	RNEG32(TMP2, TMP3, TMP2, TMP3)
	
	;; Perform the division itself.
_idiv32_nonegr:
	
	JSR _udiv32

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
	AND _idiv16_bit15	; Are the signs different? (uses idiv16 constant)
	STORE TMP13		; Keep this for later (for floored division)
	SNZ
	JMP _idiv32_nonegq

	RNEG32(TMP0, TMP1, TMP0, TMP1)	; Negate the quotient.

	;; Don't negate quotient
_idiv32_nonegq:
	;; The sign of the remainder is the same as the sign of the dividend.
	LOAD TMP14
	SNA
	JMP _idiv32_symmetric_done

	RNEG32(TMP4, TMP5, TMP4, TMP5) ; Negate the remainder to match.

_idiv32_symmetric_done:
_idiv32_flooored:

        ;; Up to here, we've done floored division. Now convert it to symmetric
        ;; division.
	;; 
	;; Discussion found at
	;; http://atariwiki.strotmann.de/wiki/Wiki.jsp?page=Signed%20Integer%20Division

        LOAD TMP4		; Load modulo
	OR TMP5			; Checking if it's zero. OR words together.
        SNZ
	JMP _idiv32_done	; It's zero: all's good. Exit.

	LOAD TMP13		; Non-zero if argument signs differ
	SNZ
	JMP _idiv32_done	; Equal signs: all done here. Exit.

        RADD(TMP1, TMP1, R MINUS1)  ; Quotient--
	RADC(TMP0, TMP0, R MINUS1)

        RADD(TMP5, TMP5, TMP12)	; modulo += divisor (low words)
        RADC(TMP4, TMP4, TMP15)	; modulo += divisor (high words)
	
_idiv32_done:
	RMOV(TMP15, TMP0)
	RPUSH (SP, TMP5)	; quotient low
	RPUSH (SP, TMP4)	; quotient high

	RPUSH (SP, TMP1)	; remainder low
	RPUSH (SP, TMP15)	; remainder high
	
	NEXT

//.page
	

// End of file.
