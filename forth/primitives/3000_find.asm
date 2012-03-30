;; // -*- asm -*-
;; //
;; // Dictionary search

.page
	
	;; word:  FIND
	;; flags: DOCOL ROM
	;; notes: FIND ( a1 -- a2 n )
	;; 
	;;        a1 is the address of a packed string. The string contains a
        ;;        word name to be located in the currently active search order.
        ;;        If the word is not found, a2 is the string address a1, and n
        ;;        is zero.  If the word is found, a2 is the compilation address
        ;;        and n is set to one of two non- zero values.  If the word
        ;;        found has the immediate attribute, n is set to one.  If the
        ;;        word is non-immediate, n is set to minus one (true).

	.word dw_COUNT		; COUNT ( a1 len )
	.word dw_SWAP		; ( len a1 )
	.word dw__FIND		; $FIND
	.word dw_EXIT		; $EXIT


_find_hash_mask:	
	.word 7			; bit mask for the hash function
	
	;; word:  $FIND
	;; alias: _FIND
	;; flags: CODE ROM CFT
	;; notes: FIND ( n a1 -- a2 n )
	;; 
	;;        a1 is the address of a packed string, n its length in
        ;;        characters.  The string contains a word name to be located in
        ;;        the currently active search order.  If the word is not found,
        ;;        a2 is the string address a1, and n is zero.  If the word is
        ;;        found, a2 is the compilation address and n is set to one of
        ;;        two non- zero values.  If the word found has the immediate
        ;;        attribute, n is set to one.  If the word is non-immediate, n
        ;;        is set to minus one (true).
	;; 
	;;        The word uses a 3-bit hash to speed up searches. The hash is
        ;;        simply the length of a string XOR the codepoint of its first
        ;;        character. The lower three bits of this are used. This is
        ;;        quite easy to calculate and yields decent results, reducint
        ;;        the search space to approximately one eighth (in a perfect
        ;;        world).
	;; 
	;;        This word has a lot of allocated registers:
	;;
	;;        TMP0: stack macros, hash
	;;        TMP1: word code address
	;;        TMP2: link (loop register)
	;;        TMP3: hash to search for.
	;;        TMP4: dictionary flags | hash
	;;        TMP5: string ptr of the word to search for
	;;        I1:   autoinc copy of TMP5 for _pstrcmp
	;;        I2:   autoinc dict word name ptr for _pstrcmp

	RPOP(TMP5, SP)		; TMP5 = word to search for.
	POP(SP)			; AC = The length of the word in characters

	;;  Generate the hash: (strlen(s) ^ s[0]) & 7
	XOR I TMP5
	AND _find_hash_mask
	STORE TMP3

	;; Start going through the dictionary.

	// TODO: Make this search through all dictionaries
	LOADUP(UAOFS_CURRENT)
	STORE TMP2

	;; dict format:
	;;   link + 00: flags
	;;   link + 01: pointer to string
	;;   link + 02: link
	;;   link + 03: entry point

_find_loop:
	LOAD TMP2
	SNZ
	JMP _find_nfound

	STORE I0		; Use autoincrement for convenience
	RMOV(TMP4, I I0)	; TMP4 = mem[I0++] (flags)
	RMOV(I2, I I0)		; I0 = mem[I0++] (name pointer)
	RMOV(TMP2, I I0)	; TMP2 = mem[I0++] (link)
	RMOV(TMP1, I0)		; TMP1 = I0 (code)

	;; Compare hashes.
	LOAD TMP4		; bits 0..2 of the flags contain the hash
	XOR TMP3		; compare against the desired hash.
	AND _find_hash_mask     ; only check the least significant 3 bits.
	SZA			; zero == potential hit.
	JMP _find_loop		; No. Don't bother comparing strings. Loop again.

	;; The hashes match. Compare the string to ensure we have what we need.
	RMOV(I1, TMP5)		; Prepare for comparison
	JSR I _find_pstrcmp
	SNZ			; zero == found.
	JMP _find_found		; Yes, it's been found
	JMP _find_loop		; No. Loop again.

_find_pstrcmp:
	.word _pstrcmp		; string comparison routine

_find_found:
	RPUSH(SP, TMP1)		; Push the code address
	LOAD TMP4		; Check the flags.
	AND FFL_IMMEDIATE	; Immediate?
	SZA
	JMP _find_immediate	; Yes, it's immediate.
	RPUSH(SP, MINUS1)	; Non-immediate. Push -1.
	NEXT

_find_immediate:
	LI 1
	PUSH(SP)
	NEXT

_find_nfound:
	RPUSH(SP, TMP5)		; The string address
	LI 0			; Push 0
	PUSH(SP)
	NEXT

// End of file.
