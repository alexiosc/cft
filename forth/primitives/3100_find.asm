;; // -*- asm -*-
;; //
;; // Dictionary search

//.page
	
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

	;; COUNT OVER >R SWAP HASH R> ( a1 -- hash a1 ) \ Generate the hash
	.word dw_COUNT		; COUNT ( a1 len )
	.word dw_OVER		; OVER ( a1 len a1 )
	.word dw_to_R		; >R ( a1 len )
	.word dw_SWAP		; SWAP ( len a1 )
	.word dw_HASH		; HASH ( hash )
	.word dw_R_from		; R> ( hash a1 )

	.word dw_voc0		; voc0 ( hash a1 I va )

	;; ( hash a1 I va )
_find_loop:
	.word dw_SWAP		; SWAP ( hash a1 va I )
	.word dw_to_R		; >R ( hash a1 va )

	.word dw_voc_find	; ( hash a1 va ) voc.find ( hash a2 n )

	.word dw_DUP		; DUP ( hash a2 n n )
	.word dw_if_branch	; n == 0 ? ( hash a2 n )
	.word _find_nextvoc

	// ( hash a2 n ) \ Got it. Clean up and return
	.word dw_RDROP
	.word dw_ROT		; ( a2 n hash )
	.word dw_DROP		; ( a2 n )
	.word dw_EXIT

	// ( hash a2 0 ) \ Try the next vocabulary
_find_nextvoc:
	.word dw_DROP		; DROP ( hash a2 )
	.word dw_R_from		; R> ( hash a2 I )
	.word dw_voc_plus	; voc+ ( hash a2 I va )
	
	.word dw_DUP		; ?DUP ( hash a2 I va va )
	.word dw_if_branch	; if done... ( hash a2 I va )
	.word _find_fail	;    ... go to end ( )

	.word dw_branch		; loop again ( hash a2 I va )
	.word _find_loop

	;; ( hash a2 n ) \ Not found, return a2 0
_find_fail:
	.word dw_ROT		; ROT ( a2 n hash )
	.word dw_2DROP		; 2DROP ( a2 )
	doLIT(0)		; 0 ( a2 0 )
	.word dw_EXIT












	

;; 	.word dw_HEX
;; 	.word dw_CR
;; 	.word dw_dot_rs
;; 	.word dw_CR
	
;; 	;; COUNT OVER >R SWAP HASH R> ( a1 -- hash a1 ) \ Generate the hash
;; 	.word dw_COUNT		; COUNT ( a1 len )
;; 	.word dw_OVER		; OVER ( a1 len a1 )
;; 	.word dw_to_R		; >R ( a1 len )
;; 	.word dw_SWAP		; SWAP ( len a1 )
;; 	.word dw_HASH		; HASH ( hash )
;; 	.word dw_R_from		; R> ( hash a1 )

;; 	;; ( hash a1 ) voc0 SWAP R> ( hash a1 va ) \ Start looping vocabs
;; 	.word dw_voc0		; ( hash a1 1 va )
;; 	.word dw_SWAP		; ( hash a1 va 1 )
;; 	.word dw_to_R		; ( hash a1 va )

;; _find_next_voc:
;; 	;; ( hash a1 va ) voc_find DUP ( branch if 0 ) \ Look for the word
;; 	.word dw_voc_find	; ( hash a1 va ) voc.find ( hash a2 n )
;; 	.word dw_DUP		; DUP ( hash a2 n n )


;; 	.word dw_HEX
;; 	.word dw_CR
;; 	.word dw_dot_s
;; 	.word dw_CR
;; 	.word dw_dot_rs
;; 	.word dw_CR
;; 	.word dw_FAIL


;; 	.word dw_if_branch	;   ( hash a2 n ) \ is it zero?
;; 	.word _find_nfound

;; 	.word dw_FAIL

;; 	.word dw_HEX
;; 	.word dw_CR
;; 	.word dw_dot_rs
;; 	.word dw_CR
;; 	.word dw_FAIL
	
;; 	;; ( hash a2 n ) ROT DROP ( a2 n ) \ Got it.
;; 	.word dw_ROT            ; ROT ( a2 n hash )
;; 	.word dw_DROP		; DROP ( a2 n )
;; 	.word dw_RDROP		; RDROP ( a2 n )

;; 	.word dw_HEX
;; 	.word dw_CR
;; 	.word dw_dot_rs
;; 	.word dw_CR
;; 	.word dw_HALT
	
;; 	.word dw_EXIT

;; 	;; ( hash a2 n ) Not found. Try the next vocabulary.
;; _find_nfound:
;; 	.word dw_DROP		; DROP ( hash a2 )
;; 	.word dw_R_from		; R> ( hash a2 n i )
;; 	.word dw_voc_plus	; voc+ ( hash a2 n va )
;; 	.word dw_SWAP		; SWAP ( hash a2 va n )
;; 	.word dw_to_R		; >R ( hash a2 va )

;; 	;; ( hash a2 n va ) \ End of vocabulary stack?
;; 	.word dw_if_DUP		; ?DUP ( hash a2 va va | hash a2 0 )
;; 	.word dw_if_branch	; if done...
;; 	.word _find_fail	;    ... go to end ( )

;; 	;; ( hash a2 va ) \ Loop again
;; 	.word dw_branch		;   loop again
;; 	.word _find_next_voc


;; 	;; ( hash a2 0 ) \ Couldn't find it.
;; _find_fail:
;; 	.word dw_HEX
;; 	.word dw_CR
;; 	.word dw_dot_rs
;; 	.word dw_CR
;; 	.word dw_dot_s
	
;; 	.word dw_ROT		; ROT ( a2 0 hash )
;; 	.word dw_DROP		; DROP ( a2 0 )
;; 	.word dw_RDROP		; RDROP ( a2 n )
;; 	.word dw_EXIT		; $EXIT
	


.page


_find_hash_mask:	
	.word 7			; bit mask for the hash function


	
	;; word:  voc.find
	;; flags: CODE ROM CFT
	;; notes: voc.find ( hash a1 va -- hash a2 n )
	;;
	;;        va is a pointer to vocabulary to search (an indirect address
	;;        as yielded by, e.g. CONTEXT@).
	;;        a1 is the address of a packed string; hash is its dictionary
	;;        hash (as calculated by HASH). The string contains a word name to be located in
        ;;        the specified vocabulary.  If the word is not found,
        ;;        a2 is the string address a1, and n is zero.  If the word is
        ;;        found, a2 is the word's compilation address and n is set to one of
        ;;        two non- zero values.  If the word found has the immediate
        ;;        attribute, n is set to one.  If the word is non-immediate, n
        ;;        is set to minus one (true).
	;;
	;;        ==Dictionary Hashes==
	;; 
	;;        The word uses a 3-bit hash to speed up searches. The hash is
        ;;        simply the length of a string XOR the codepoint of its first
        ;;        character. The lower three bits of this are used. This is
        ;;        quite easy to calculate and yields decent results, reducint
        ;;        the search space to approximately one eighth (in a perfect
        ;;        world).
	;;
	;;        ==Register Allocation==
	;; 
	;;        This word has a lot of allocated registers:
	;;
	;;        TMP0: stack macros, hash
	;;        TMP1: word code address
	;;        TMP2: link (loop register)
	;;        TMP3: hash to search for.
	;;        TMP4: dictionary flags | hash
	;;        TMP5: string ptr of the word to search for
	;;        TMP6: the hash of the word to search for.
	;;        I1:   autoinc copy of TMP5 for _pstrcmp
	;;        I2:   autoinc dict word name ptr for _pstrcmp

	RPOP(TMP2, SP)		; TMP2 = vocabulary address (to be dereferenced)
	RPOP(TMP5, SP)		; TMP5 = word to search for.
	RPOP(TMP3, SP)	   	; TMP3 = hash
	//PRINTH

	;; Start going through the dictionary.

	RMOV (TMP2, I TMP2)	; TMP2 = mem[TMP2] (address of last word in vocab)
	STORE TMP2

	;; dict format:
	;;   link + 00: flags
	;;   link + 01: pointer to string
	;;   link + 02: link
	;;   link + 03: entry point

_vocfind_loop:
	LOAD TMP2
	SNZ
	JMP _vocfind_nfound

	STORE I0		; Use autoincrement for convenience
	//PRINTA
	RMOV(TMP4, I I0)	; TMP4 = mem[I0++] (flags)
	//PRINTH
	RMOV(I2, I I0)		; I0 = mem[I0++] (name pointer)
	RMOV(TMP2, I I0)	; TMP2 = mem[I0++] (link)
	RMOV(TMP1, I0)		; TMP1 = I0 (code)

	;; Compare hashes.
	LOAD TMP4		; bits 0..2 of the flags contain the hash
	XOR TMP3		; compare against the desired hash.
	AND _find_hash_mask     ; only check the least significant 3 bits.
	SZA			; zero == potential hit.
	JMP _vocfind_loop       ; No. Don't bother comparing strings. Loop again.

	;; The hashes match. Compare the string to ensure we have what we need.
	RMOV(I1, TMP5)		; Prepare for comparison
	JSR I _vocfind_pstrcmp
	SNZ			; zero == found.
	JMP _vocfind_found	; Yes, it's been found
	JMP _vocfind_loop	; No. Loop again.

_vocfind_pstrcmp:
	.word _pstrcmp		; string comparison routine

_vocfind_found:
	RPUSH(SP, TMP3)		; Push the hash
	RPUSH(SP, TMP1)		; Push the code address

	;; LI FFL_COMPILE		; Check for compile-only words.
	;; AND TMP4		; Check the flags.
	;; SZA
	;; JMP _vocfind_cplonly	; Yes, it's compile-only.

	LI FFL_IMMEDIATE	; Check for immediate words.
	AND TMP4		; Check the flags.
	SZA
	JMP _vocfind_immediate	; Yes, it's immediate.

	RPUSH(SP, MINUS1)	; It's a plain word. Push -1.
	NEXT

_vocfind_immediate:
	LI 1
	PUSH(SP)
	NEXT

_vocfind_cplonly:
	LI 2
	PUSH(SP)
	NEXT

_vocfind_nfound:
	RPUSH(SP, TMP3)		; Push the hash
	RPUSH(SP, TMP5)		; The string address
	LI 0			; Push 0
	PUSH(SP)
	NEXT


	
// End of file.
