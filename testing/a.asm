// -*- asm -*-


	
_rom_idiv16_bit15:
        .word &8000

_rom_idiv16_done:
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
	AND _rom_idiv16_bit15	; Are the signs different?
	STORE TMP13		; Keep this for later (for floored division)
	SNZ
	JMP _rom_idiv16_nonegq

	RNEG(TR0, TR0)		; Negate the quotient.

	;; Don't negate quotient
_rom_idiv16_nonegq:
	;; The sign of the remainder is the same as the sign of the dividend.
	LOAD TMP14
	SNA
	JMP _rom_idiv16_symmetric_done

	RNEG(TR2, TR2)		; Negate the remainder to match.

_rom_idiv16_symmetric_done:

_rom_idiv16_flooored:

        ;; Up to here, we've done floored division. Now convert it to symmetric
        ;; division.
	;; 
	;; Discussion found at
	;; http://atariwiki.strotmann.de/wiki/Wiki.jsp?page=Signed%20Integer%20Division

        LOAD TR2                ; Load modulo
        SNZ
	JMP _idiv16_done	; It's zero: all's good. Exit.

	LOAD TMP13		; Non-zero if argument signs differ
	SNZ
	JMP _idiv16_done	; Equal signs: all done here. Exit.

        RADD(TR0, TR0, MINUS1)  ; Quotient--
        RADD(TR2, TR2, TMP15)	; modulo += divisor
	
_idiv16_done:
        LI 1
        RTT
