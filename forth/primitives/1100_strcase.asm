;; // -*- asm -*-
;; //
;; // Convert case of strings

/.page
	
	;; word:  pstrupper
	;; flags: FFL_PRIMITIVE ROM
	;; notes: pstrupper ( s -- s )
	;;        Convert all characters of a packed string to upper cas
	;;        in-place. Returns the address of the string.
	SPEEK(SP)
	STORE TMP1
	LIA _upcase	         ; Vector the character conversion routine
	STORE TMP2
	JMP _pstrmap


	
	// toupper map subroutine for pstrmap.
	//
	// Input:
	//  AC = character to modify
	//
	// Output
	//  AC = modified character.
_upcase:
	STORE TMP7		; For later.
	
	ADD _upcase_a		; c - 'a'
	SNN			; c < 'a'?
	JMP _upcase_unmod	; Yes: return character unmodified

	ADD _upcase_z		; c - 'a' + 'a' - 'z' == c - 'z'
	SNA			; c > 'z'?
	JMP _upcase_unmod	; Yes: return character unmodified

	LI &20			; ASCII case bit
	XOR TMP7		; lower case ^ &20 = upper case
	RET

_upcase_unmod:
	LOAD TMP7		; Return the character as-is.
	RET

_upcase_a:
	.word &ff9f		; -97: -ord('a')
_upcase_z:
	.word &ffe6		; -26: ord('a') - ord('z') - 1
	

_pstrmap:
_pstrmap_loop:
	;; Do two chars at a time.
	LOAD I TMP1
	SNZ			; Done?
	NEXT			; Yes.

	;; The 16-bit word is not &0000, so there's at least one character
	;; in there.
	GETLOCHAR()		; Extract the first character

	JSR I TMP2		; Call the supplied routine to act on it.
	STORE TMP4		; Store it back.
	
	LOAD I TMP1		; mem[TMP1] = mem[TMP1] & 0xff00 | TMP4
	AND BYTEHI
	OR TMP4
	STORE I TMP1		; Store it back.

	;; Now for the high word. First, is it null?
	//LOAD I TMP1
	GETHICHAR()
	SNZ			; Zero?
	NEXT			; Yes. Done

	JSR I TMP2		; Call the supplied routine to act on it.
	MAKEHICHAR()		; Shift it to the right position.
	STORE TMP4		; TMP4 = (map(c) << 8) & 0xff00

	LOAD I TMP1		; mem[TMP1] = mem[TMP1] & 0xff | TMP4
	AND BYTELO
	OR TMP4
	STORE I TMP1		; Store it back

	;; Process the next pair of characters.
	ISZ TMP1		; Increment TMP1
	JMP _pstrmap_loop	; Just in case.
	JMP _pstrmap_loop
	


	;; word:  pstrlower
	;; flags: FFL_PRIMITIVE ROM
	;; notes: pstrlower ( s -- s )
	;;        Convert all characters of a packed string to lower case in-place.
	;;        Returns the address of the string.
	SPEEK(SP)
	STORE TMP1
	LIA _dncase		; Vector the character conversion routine
	STORE TMP2
	JMP _pstrmap


	
	// toupper map subroutine for pstrmap.
	//
	// Input:
	//  AC = character to modify
	//
	// Output
	//  AC = modified character.
_dncase:
	STORE TMP7		; For later.
	
	ADD _dncase_A		; c - 'a'
	SNN			; c < 'a'?
	JMP _dncase_unmod	; Yes: return character unmodified

	ADD _dncase_A		; c - 'a' + 'a' - 'z' == c - 'z'
	SNA			; c > 'z'?
	JMP _dncase_unmod	; Yes: return character unmodified

	LI &20			; ASCII case bit
	XOR TMP7		; lower case ^ &20 = upper case
	RET

_dncase_unmod:
	LOAD TMP7		; Return the character as-is.
	RET

_dncase_A:
	.word &ffbf		; -65: -ord('A')
_dncase_Z:
	.word &ffe6		; -26: ord('A') - ord('Z') - 1
	

// End of file.
