;; // -*- asm -*-
;; //
;; // Compare strings
	
	;; word:  pstrcmp
	;; flags: FFL_PRIMITIVE ROM
	;; notes: pstrcmp ( s1 s2 -- n )
	;;   Compare two packed strings and return a number indicating their
	;;   lexicographical order. If n == 0, s1 == s2. If n < 0, s1 < s2.
	;;   If n > 0, s1 > s2.
	RPOP(I2,SP)		; s2
	RPOP(I1,SP)		; s1

	JSR _pstrcmp

	PUSH(SP)		; AC=0 already.
	NEXT
	

	// Subroutine to compare two null-terminated packed strings.
	//
	// Input:
	//   I1: string pointer 1
	//   I2: string pointer 2
	//
	// Output:
	//   AC: 0 => s1 == s2
	//       <0 => s1 < s2
	//       >0 => s1 > 22
	//
	// Side effects:
	//   TMP9
	//   TMP8
	//   TMP7

_pstrcmp:
_pstrcmp_loop:
	;; Compare two chars at a time.
	LOAD I I1
	STORE TMP9		; Store to check for termination later
	XOR I I2		; Compare 2 characters at a time
	SZA			; Equal?
	JMP _pstrcmp_unequal	; Unequal.

	;; Equal 16-bit word: is it a termination word?
	LOAD TMP9		; Equal, but is this the end of the string?
	SNZ
	JMP _pstrcmp_done	; The whole word is zero (and equal). Success.

	;; Is the high byte a termination byte?
	GETHICHAR()
	SNZ
	JMP _pstrcmp_done	; The high byte is zero, the words are equal.

	;; The 16-bit words are equal, but not the end of the string. Go again.
	JMP _pstrcmp_loop

_pstrcmp_done:
	RET

_pstrcmp_unequal:
	;; The strings are unequal at this position. Find out the details.
	;; First, get the second character. The first is already in TMP9.
	DECM(I2)
	LOAD I I2
	STORE TMP8		; We'll need this later

	;; Now, compare the low (first) bytes.
	LOAD TMP9
	GETLOCHAR()
	STORE TMP7

	LOAD TMP8
	GETLOCHAR()
	NEG
	ADD TMP7		; Find out the difference

	SZA			; Are the low bytes equal?
	JMP _pstrcmp_done	; No. Found the difference, return it.

	;; The difference must be in the high bytes. Return it.
	LOAD TMP9
	GETHICHAR()
	STORE TMP7

	LOAD TMP8
	GETHICHAR()
	NEG
	ADD TMP7		; Calculate the difference.
	JMP _pstrcmp_done	; Return it.


	
// End of file.
