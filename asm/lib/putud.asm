;;; -*- cftasm -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; put -- print numbers in various formats
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Subroutine:	 putd: print out a 16-bit unsigned decimal.
;;; 
;;; This routine prints 16-bit unsigned decimals without using full
;;; division. Instead, it implements a very limited form of BCD-converting
;;; division by iteratively subtracting 20,000, 10,000, 5,000, 2,000, ..., 50,
;;; 20, 10 from the original number, keeping track of the quotient.
;;;
;;; On the CFT, this is faster than a Double Dabble.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; putud -- convert unsigned word to base 10 string
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

putd:
.scope
.equ num R 15
.equ OUTPUT   dfp.PRINTC

putd:		SNA			; Is it negative?
		JMP        putud	; No. Just print it.
		NEG			; Negate it.
		STORE      num		; Store it
		LI         '-'		; '-'
		OUTPUT
		JMP        @putud+1	; R 15 is already set up, jump over STORE

		;; Fall through to putud
		
.endscope

;;; Subroutine:	 putud: print out a 16-bit unsigned decimal.
;;; 
;;; This routine prints 16-bit unsigned decimals without using full
;;; division. Instead, it implements a very limited form of BCD-converting
;;; division by iteratively subtracting 20,000, 10,000, 5,000, 2,000, ..., 50,
;;; 20, 10 from the original number, keeping track of the quotient.
;;;
;;; On the CFT, this is faster than a Double Dabble.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; putud -- convert unsigned word to base 10 string
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

putud:

;;; Algorithm:
;;;
;;; Store number as running modulo
;;; Running digit is '0'.
;;; while next subtrahend != 0:
;;;   if subtrahend == 1:
;;;      ship out running digit.
;;;      loop again
;;;   while num > subtrahend:
;;;      Subtract subtrahend from num
;;;      Add digit to running digit

;;; ship out running digit (last decade)
;;; ship out '0' + running modulo (units decade)
;;; DONE

.scope
.equ dd+      MBP I7
.equ buf+     MBD I7
.equ num      R 15
.equ subtr    R 14
.equ digitinc R 13
.equ printed  R 12			; used by ship_out_digit
.equ digit    R 11			; used by ship_out_digit

.equ OUTPUT   dfp.PRINTC

putud:		STORE      num		; number to convert (running modulo)
		LI         48		; Running digit is '0'
		STORE      digit
		STORE      printed	; leading zero suppression is also '0'

		LI         2
		STORE      digitinc
		LOAD       data		; Subtract 20000
		JSR        decade_div

		LI         1
		STORE      digitinc
		LOAD       @data+1	; Subtract 10000
		JSR        decade_div
		JSR        ship_out_digit

		LI         5
		STORE      digitinc
		LOAD       @data+2	; Subtract 5000
		JSR        decade_div

		LI         2
		STORE      digitinc
		LOAD       @data+3	; Subtract 2000
		JSR        decade_div

		LI         1
		STORE      digitinc
		LOAD       @data+4	; Subtract 1000
		JSR        decade_div
		JSR        ship_out_digit

		LI         5
		STORE      digitinc
		LOAD       @data+5	; Subtract 500
		JSR        decade_div

		LI         2
		STORE      digitinc
		LOAD       @data+6	; Subtract 200
		JSR        decade_div

		LI         1
		STORE      digitinc
		LOAD       @data+7	; Subtract 100
		JSR        decade_div
		JSR        ship_out_digit

		LI         5
		STORE      digitinc
		LOAD       @data+8	; Subtract 50
		JSR        decade_div

		LI         2
		STORE      digitinc
		LOAD       @data+9	; Subtract 20
		JSR        decade_div

		LI         1
		STORE      digitinc
		LOAD       @data+10	; Subtract 10
		JSR        decade_div
		JSR        ship_out_digit

		LI         48
		ADD        num
		OUTPUT
		RET

data:          .data -20000 -10000 -5000 -2000 -1000 -500 -200 -100 -50 -20 -10

;;; Algorithm:
;;;
;;; while num > subtr
;;;   num = num - subtr
;;;   
;;; 
;;; If digit == printed:
;;;   RETURN
;;; else:
;;;   Print digit
;;;   Store &3ff in printed
;;; DONE

decade_div:	STORE      subtr
loop_subtr:	CLL
		ADD        num
		SSL			; If L toggled: num >= subtr
		RET			; num < decade; try next subtrahend

		STORE      num		; Store the remainder back

		LOAD       digitinc	; Increment the digit
		ADD        digit
		STORE      digit

		LOAD       subtr
		JMP        loop_subtr

;;; Algorithm:
;;;
;;; Store '0' in printed (i.e. state: suppress leading zeres)
;;; If digit == printed:
;;;   RETURN
;;; else:
;;;   Print digit
;;;   Store &3ff in printed
;;; DONE

ship_out_digit: LOAD       digit
		XOR        printed
		SNZ
		RET
		LOAD       digit
		OUTPUT
		LI         &3ff
		STORE      printed
		LI         48
		STORE      digit
		RET

.endscope

;;; Subroutine:	 puth: print out a 16-bit hex number.
;;; 
;;; This routine prints a 16-bit number as 4 hexadecimal digits.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; puth -- convert unsigned word to four hex digits
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

puth:
.scope
.equ num R 15
.equ tmp R 14
.equ OUTPUT   dfp.PRINTC

puth:		STORE      num
		ROL        5		;  Get most significant nibble
		JSR        print_digit

		LOAD       num
		SWAB			; Fast way to get bits 8-11
		JSR        print_digit	; Second most significant nibble
		
		LOAD       num
		SHR        4
		JSR        print_digit	; Third most significant nibble
		
		LOAD       num		; Final digit
		
print_digit:	AND        nibble
		STORE      tmp
		LIA        digits
		ADD        tmp
		IND
		OUTPUT
		RET

nibble:		.data &f
digits:		.str "0123456789abcdef"
.endscope		

;;; End of file
