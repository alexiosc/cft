///////////////////////////////////////////////////////////////////////////////
//
// String routines
//
///////////////////////////////////////////////////////////////////////////////

	;; Return the length of a string in words.
	;; 
	;; TIR0: pointer to string
	;;
	;; Returns:
	;;   A: length of string in words
	;;   TIR0: for null-terminated trings, the address of the 0. For neg
	;;     terminated strings, the address of the negative word plus 1.
	;; 
_rom_strlen:
	STORE R31
_rom_strlen_loop:
	LOAD TIR0
	LOAD I TIR0
	SNP			; Skip if A <= 0
	JMP _rom_strlen_loop

	SZA			; Is this a negative termination?
	LOAD I TIR0		; If so, abuse autoindex to add 1 to the length

	LOAD R31		; A = TIR0 - R31 - 1
	ING			; -(R31 + 1) = R31 - 1
	ADD TIR0		; TIR0 + R31 - 1
	RTT

	;; Copy a null- or neg-terminated string from one location to
	;; another. If the string is null-terminated, the null is copied too.
	;;
	;; TIR0: source
	;; TIR1: destination
	;;
	;; Returns:
	;;   TIR0: address of source string termination
	;;   TIR1: address of destination string termination
	;; 
_rom_strcpy:
	LOAD I TIR0
	STORE I TIR1
	SNP			; Skip if A <= 0
	JMP _rom_strcpy
	RTT

	;; Copy a null- or neg-terminated string from one location to
	;; another, converting lower case ASCII character to upper case.
	;;
	;; A: string source
	;;
	;; c - 'a'
	;; c - 'a' -('z' + 'a')
	;;
_rom_upcase:	
	STORE TR0

_rom_upcase_loop:
	LOAD I TR0

	AND NOTBIT15		; Ignore termination bit
	ADD _rom_upcase_a	; c - 'a'
	SNN			; c < 'a'?
	JMP _rom_upcase_next	; Yes: skip character

	ADD _rom_upcase_z	; c - 'a' + 'a' - 'z' == c - 'z'
	SNA			; c > 'z'?
	JMP _rom_upcase_next	; Yes: skip character

	;; Convert to lower case here. Thank the elder gods we're not
	;; using EBCDIC.
	LOAD I TR0
	AND _rom_upcase_m
	STORE I TR0

_rom_upcase_next:	
	;; Check for termination (neg or NULL)
	LOAD I TR0
	SPA			; Skip if A <= 0
	RTT

	LOAD TR0
	INC
	STORE TR0
	
	JMP _rom_upcase_loop	; Loop again.

_rom_upcase_a:
	.word &ff9f		; -97: -ord('a')
_rom_upcase_z:
	.word &ffe6		; -26: ord('a') - ord('z') - 1
_rom_upcase_m:
	.word &ffdf		; lower-to-upper ASCII mask


	;; Compare two null- or neg-terminated strings.
	;;
	;; TIR0: string A
	;; TIR1: string B
	;;
	;; Caution:
	;;   Both strings must be terminated the same way.
	;;
	;; Returns:
	;;   If strings A and B are equal:
	;;     A: 0
	;;     TIR0: address of string A termination
	;;     TIR1: address of string B termination
	;;
	;;   If strings A and B are unequal:
	;;     A: XOR of first non-equal characters.
	;;     TIR0: address of first difference in string A
	;;     TIR1: address of first difference in string B
	;;
_rom_strcmp:
	LOAD I TIR0
	STORE R31		; Store to check for string end later.
	XOR I TIR1		; Compare strings
	SZA			; Skip if A = 0
	RTT			; They're different. Return.
	LOAD R31		; End of string 1?
	SNP
	JMP _rom_strcmp		; Loop
	LI 0			; A=0 in case this is a neg-terminated string.
	RTT			; Return A = 0


	;; Return the address of the first character in the string at TIR0 that
	;; isn't TR1. Useful for skipping delimiters.
	;;
	;; TIR0: string A
	;; TR1:  the character to skip
	;;
	;; Returns:
	;;     A: address of first word in TIR0 that isn't TR1.
	;;     If the string consists entirely of TR1 characters, A = 0.
	;;
_rom_strspn:
	LOAD TIR0
	LOAD I TIR0		; Load character
	STORE R31		; Store for later checks

	;; Check for terminating NULLs.
	SNZ			; Terminating NULL?
	JMP _rom_strspn_fail	;   Yes, end here.

	AND NOTBIT15		; Ignore the terminating bit, if any.
	XOR TR1			; Is it the character we want?
	SNZ
	JMP _rom_strspn_y	; Yes.
	JMP _rom_strspn_n	; No.

_rom_strspn_fail:
	LI 0			; Return 0.
	RTT

_rom_strspn_y:
	LOAD R31		; Check for terminating high bit.
	SNN
	JMP _rom_strspn_fail	; End of neg-terminated string. End here.
	JMP _rom_strspn		; No, loop again.

_rom_strspn_n:
_rom_strcspn_y:			; (the strcspn routine uses this code too.)
	LOAD TIR0 		; Non-delimiter found. Return its address.
	ADD MINUS1		; TIR0 has autincremented, so decrement it.
	RTT


	;; Return the address of the first character in the string at TIR0 that
	;; *IS* TR1. Useful for lexing non-whitespace.
	;;
	;; TIR0: string A
	;; TR1:  the character to find
	;;
	;; Returns:
	;;     A: address of first occurence of TR1 in TIR0.
	;;     If the string consists entirely of non-delimiter characters, A = 0.
	;;
_rom_strcspn:
	LOAD I TIR0		; Load character
	STORE R31		; Store for later checks

	;; Check for terminating NULLs.
	SNZ			; Terminating NULL?
	JMP _rom_strspn_fail	;   Yes, end here. (use strspn's code)

	AND NOTBIT15		; Ignore the terminating bit, if any.
	XOR TR1			; Is it the delimiter?
	SNZ
	JMP _rom_strcspn_y	; Yes.
	JMP _rom_strcspn_n	; No.

_rom_strcspn_n:
	LOAD R31		; Check for terminating high bit.
	SNN
	JMP _rom_strspn_fail	; End of neg-terminated string. End here.
	JMP _rom_strcspn	; No, loop again.


	;; Copy characters from the string in TIR0 to TIR1 until the character
	;; specified in TR1 is found. Ensures the string in TIR1 is terminated.
	;; Useful for tokenisation.
	;;
	;; TIR0: source
	;; TIR1: destination
	;; TR1:  token delimiter
	;;
	;; Returns:
	;;     A: address of first occurence of TR1 in TIR0.
	;;     If the string consists entirely of non-delimiter characters, A = 0.
	;;
_rom_strtok:
	LOAD I TIR0		; Load character
	STORE R31		; Store for later checks

	;; Check for terminating NULLs.
	SNZ			; Terminating NULL?
	JMP _rom_strspn_fail	;   Yes, end here. (use strspn's code)

	AND NOTBIT15		; Ignore the terminating bit, if any.
	XOR TR1			; Is it the delimiter?
	SNZ
	JMP _rom_strtok_del	; Delimiter seen.
	JMP _rom_strtok_tok	; Token character seen.

_rom_strtok_del:
	;; Neg-terminate the last character of the output buffer.
	LOAD TIR1		; Load pointer
	ADD MINUS1		; Decrease it (it's an autoincrement reg)
	STORE R31		; Store it temporarily
	LOAD I R31		; Load the last character
	OR BIT15		; Set terminating bit.
	STORE I R31		; Write the character.

	LOAD TIR0		; First occurence of TR1 in TIR0.
	ADD MINUS1
	
	RTT			; Done.
	
_rom_strtok_tok:
	LOAD R31		; Check for terminating high bit.
	STORE I TIR1		; Copy it to the output buffer
	SNN
	JMP _rom_strspn_fail	; End of neg-terminated string. End here.
	JMP _rom_strtok		; No, loop again.



	;; Tokenise a Forth word.
	;;
	;; A: the delimiter
	;;
	;; Returns:
	;;     A: address of first occurence of TR1 in TIR0.
	;;     If the string consists entirely of non-delimiter characters,
	;;     A points to an empty string.
	;; 
	;; Side-effects:
	;;     The position in the input stream is affected by this routine.

_rom_forth_word:
	STORE TR1		; Store the delimiter

	LOAD TRAPRET		; Save return value
	STORE R29

	LOAD LIPTR		; Set up the source
	STORE TIR0

	LOAD CP			; Set up the target
	STORE TIR1

	;; Step 1. Skip leading delimiter
	TRAP T_STRSPN
	SNZ
	JMP _rom_forth_word_fail ; We only saw delimiters, no token.

	;; Step 2. Found the starting address of the word. Use STRTOK to copy it.
	STORE TIR0
	TRAP T_STRTOK

	;; Update the input pointer
	STORE LIPTR

	;; Return the start of the token string.
	LOAD CP
	JMP I R29		; Return to saved return address.

_rom_forth_word_fail:
	;; End of input has been reached. Return the address of the register that
	;; holds 0x8000. This is an empty neg-terminated string.
	LIA ZERO
	JMP I R29		; Return to saved return address.

// End of file.
