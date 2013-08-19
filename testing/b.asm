;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

_idiv32_bit15:
        .word &8000

_idiv32:
        LOAD R 0		; Store return address
        STORE R &3ff


	RMOV(TMP14, TMP0)	; Store high word of dividend
	RMOV(TMP15, TMP2)	; Store divisor (high)
	RMOV(TMP12, TMP3)	; Store divisor (low)

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
	
_idiv32_nonegr:

	JSR _udiv32

	;; Check for division by zero
	SNZ
	JMP I R &3ff		; Bail out here.

	

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
	AND _idiv32_bit15	; Are the signs different?
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
        LI 1
        JMP I R &3ff            ; Saved return address.
