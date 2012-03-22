// -*- asm -*-

///////////////////////////////////////////////////////////////////////////////
//
// Numerical stuff
//
///////////////////////////////////////////////////////////////////////////////


//.page
	;; word:  BASE
	;; flags: PRIMITIVE ROM
	;; notes: BASE ( -- a )
	;;   The address of the BASE variable, which defines the current number
	;;   base.

	LIA BASE
	PUSH(SP)
	NEXT
	
	;; word:  DECIMAL
	;; flags: PRIMITIVE ROM
	;; notes: DECIMAL ( -- )
	;;   Set base 10.

	LI 10
	STORE BASE
	NEXT
	
	;; word:  HEX
	;; flags: PRIMITIVE ROM
	;; notes: HEX ( -- )
	;;   Set base 16.

	LI 16
	STORE BASE
	NEXT


	
	;; word:  $DIGIT?
	;; alias: _isdigit
	;; flags: PRIMITIVE ROM
	;; notes: DIGIT ( c base -- n true | false )
	;;   If c is a digit character in the specified base, return n, an
	;;   integer representation of the digit, and true. Otherwise, return
	;;   false.

	RPOP(TMP4, SP)		; TMP4 = base
	POP(SP)			; digit
	JSR _isdigit
	SNZ			; is it a valid digit?
	JMP _isdigit_false	; No.
	RPUSH(SP, TMP0)		; Yes. Push the integer representation.
	RPUSH(SP, MINUS1)	; Also push a true flag.
	NEXT
	
_isdigit_false:
	LI 0
	PUSH(SP)
	NEXT



	;; Subroutine: parse a digit of a number in the specified base.
	;;
	;; Inputs:
	;;   AC: the ASCII character to parase
	;;   TMP4: the base to parse it in.
	;;
	;; Outputs:
	;;   AC:   &ffff if the character was a valid digit, &0000 if not.
	;;   TMP0: if successful, an integer representation of the digit.
	;;         Otherwise, &ffff.
	;;
	;;  Algorithm:
	;;     
	;;     n = c - '0' # We get a large unsigned number if c < '0'
	;;     if n < 0:
	;;       return false
	;;     if n > 9:
	;;       if c < 'A':
	;;         return false
	;;       n = n - 7
	;;     if n < base:
	;;       return true
	;;     return false
 
_isdigit:
	STORE TMP0		; TMP0 = char

	ADD _isdigit_c		; n = char - '0'
	STORE TMP0
	SNN			; n < '0'?
	JMP _isdigit_no		;   return false

	ADD @_isdigit_c+1	; n > 9?
	SPA
	JMP _isdigit_09		; No, skip over the following bit.

	LOAD TMP0		; n = n - 17
	ADD @_isdigit_c+2
	SNN			; n < 'A'?
	JMP _isdigit_no		;  return false
	ADD @_isdigit_c+3	; n = n + 10
	STORE TMP0
	
_isdigit_09:
	NEG
	ADD TMP4		; n < base?
	SPA
	JMP _isdigit_no

	;; It's a digit, return true.
	LOAD MINUS1		; A = -1
	RET
	
_isdigit_no:
	;; Not a digit.
	LOAD MINUS1
	STORE TMP0
	LI 0
	RET
	
_isdigit_c:
	.word -48		; '0'
	.word -9
	.word -17		; '0' - 'A'
	.word 10
	

	;; word:  NUMBER?
	;; alias: NUMBER_
	;; flags: PRIMITIVE ROM
	;; notes: NUMBER ( a -- n true | a false )
	;;        If the packed string with address a is a valid number
	;;        literal, return its integer representation and
	;;        true. Otherwise, return the string address a and false.

	SPEEK(SP)		; The string address

_number:
	STORE I0		; I0 is the string pointer
	LI 0
	STORE TMP2		; This is where the number is formed.
	STORE TMP3		; Negative flag (starts off 0)
	RMOV(TMP4,BASE)		; TMP4 is the base
	LIA _number_prefix
	STORE TMP5		; The character handler (state machine)

_number_loop:
	LOAD I I0
	STORE TMP6		; Temporary copy of the cell
	SNZ			; Terminator?
	JMP _number_end		; Yes. Done.
	GETLOCHAR()		; Get the low character
	STORE TMP7		; Store character byte
	JSR I TMP5		; Process the character

	LOAD TMP6
	GETHICHAR()		; Get the high character
	SNZ			; Terminator?
	JMP _number_end		; Done
	STORE TMP7		; Store character byte
	JSR I TMP5		; Process the character
	JMP _number_loop	; Again

_number_end:
	LOAD TMP3		; Negative flag?
	SZA
	JMP _number_neg		; Yes.
	LOAD TMP2
	SPOKE(SP)		; No. Push the number as-is.
	LI 1
	PUSH(SP)
	NEXT
	
_number_neg:			; Negate and push the number
	LOAD TMP2
	NEG
	SPOKE(SP)
	LI 1
	PUSH(SP)
	NEXT


	;; Subroutine with three entry points, each of which handles a separate
	;; state of the digit lexer. The lexer parses the regular expression:
	;;
	;; &?[+-]?\d*
	;;
	;; I.e. an optional '&', followed by an optional '-' or '+', followed by
	;; zero or more digit characters valid for the current base.
	;;
	;; Inputs for all entry points:
	;; 
	;;   TMP2 = number so far
	;;   TMP3 = negative flag
	;;   TMP4 = base
	;;   TMP5 = state (points to character processor routine)
	;;   TMP7 = character to process
	;; 
	;; Side-effects:
	;;   TMP2-5 updated.

	;; State 1: base prefix
_number_prefix:
	;; no need to LOAD TMP7 here, number already in AC.
	XOR _number_prefixes	; Does it start with '&'?
	SZA
	JMP _number_sign	; No. Fall through to sign.

	;; Yes. Change the base and lexer state.
	LI 16
	STORE TMP4

	;; Use the number sign state for the next character
	LIA @_number_sign+1	; Skip 'LOAD TMP7' when entering
	STORE TMP5

	RET			; Get the next character

	;; State 2: sign
_number_sign:
	LOAD TMP7		; Load character
	XOR @_number_prefixes+1	; Is the character '-'?
	SNZ
	JMP _number_negate	; Yes. Negate.

	LOAD TMP7		; Temporary copy of char
	XOR @_number_prefixes+2	; Is the character '+'?
	SNZ
	JMP _number_nonegate	; Yes. Ignore it.

	;; Not a sign character. Switch to digit processing.
	LIA _number_digit
	STORE TMP5
	JMP _number_digit	; Try to process as a digit.

_number_negate:
	;; Negate the sign flag.
	LI 1
	STORE TMP3		 ; Set the negative flag.

_number_nonegate:
	;; Use the number digit state for all subsequent characters
	LIA _number_digit
	STORE TMP5

	RET			; Get the next character

	;; State 3: digits
_number_digit:
	RPUSH(RP, RETV)		; Push return address
	LOAD TMP7		; The character to check

	JSR _isdigit		; Convert.

	SNZ			; Bad character?
	JMP _number_bad		; Yes.

	;; The digit is good. Tack it to the number.
	;; First, Multiply the number by BASE
	RMOV(TMP15, TMP4)	; Smaller number
	RMOV(TMP14, TMP2)	; Usually larger number
	JSR I _number_mul	; Multiply
	;; Then, add the digit to it.
	RADD(TMP2, TMP13, TMP0)	; number = number * base + digit
	
	RPOP(RETV, RP)
	RET			; Return to saved address

_number_mul:
	.word _umul16

_number_bad:
	LI 0			; Push 0 (the string address is still on the stack)
	PUSH(SP)
	NEXT			; Bail out.
	
_number_prefixes:
	.str "&-+"




	

	

// End of file.
