;; // -*- asm -*-
;; //
;; // Dictionary search

.page
	
	;; word:  FIND
	;; flags: FFL_PRIMITIVE ROM
	;; notes: FIND ( a1 -- a2 n )
	;; 
	;;        a1 is the address of a packed string.  The
        ;;        string contains a word name to be located in the
        ;;        currently active search order.  If the word is not
        ;;        found, a2 is the string address a1, and n is
        ;;        zero.  If the word is found, a2 is the
        ;;        compilation address and n is set to one of two non-
        ;;        zero values.  If the word found has the immediate
        ;;        attribute, n is set to one.  If the word is
        ;;        non-immediate, n is set to minus one (true).

	RPOP(TMP5, SP)		; TMP5 = word to search for.

	LOAD LAST
	STORE TMP2

_find_loop:
	DEBUGON
	LOAD TMP2
	PRINTA
	SNZ
	JMP _find_nfound

	LOAD I TMP2		; Load the flags
	STORE TMP4		; TMP4 = flags

	LOAD TMP2
	ADD PLUS1		; Skip over flags
	STORE TMP3		; Store the string pointer
	
	ADD PLUS1
	STORE TMP2		; Get the link
	LOAD I TMP2		; Indirection
	STORE TMP2

	//SUCCESS
	//PRINTA
	ADD PLUS1
	STORE TMP1		; The code point
	PRINTA

	LOAD I TMP3		; Indirection
	STORE I2		; This is now the string.
	DEBUGOFF

	;; Compare the string to find (TMP1) against the one in TMP3.
	RMOV(I1, TMP5)		; Prepare for comparison
	JSR I _find_pstrcmp
	//PRINTD

	SNZ			; zero == found.
	JMP _find_found		; Yes, it's been found
	JMP _find_loop		; No. Loop again.

_find_pstrcmp:
	.word _pstrcmp		; string comparison routine

_find_found:
	SUCCESS
	SUCCESS
	RPUSH(SP, TMP1)		; Push the code address
	PRINTA
	HALT

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
	RPUSH(SP, I1)		; The string address
	LI 0
	PUSH(SP)
	NEXT

// End of file.
