// -*- asm -*-
//
// Start the Forth vocabulary.


	;; vocabulary: Root


	;; word: ROM.ROOT
	;; flags: VOCABULARY ROM

	.word _voc_Root

	
	
	;; word: ROM.FORTH
	;; flags: VOCABULARY ROM

	.word _voc_ROMForth



	;; word:  ONLY
	;; flags: DOCOL ROM CFT
	;; notes: ONLY ( -- )
	;;        Clears the vocabulary stack and installs ROM.ROOT
	;;        as its first two entries.
	;; code:  : ONLY ( -- ) 2 pCONTEXT ! ['] ROM.ROOT DUP CONTEXT 2! ;

	;; 2 pCONTEXT ! \ Reset the vocabulary pointer
	doLIT(2)		; 2
	.word dw_pCONTEXT	; pCONTEXT
	.word dw_store		; !

	;; ['] ROM.BOOT DUP CONTEXT 2! \ Store ROM.BOOT as the first 2 entries.
	doLIT(dw_ROM_ROOT_pfa)	; **last ( va )
	.word dw_DUP		; DUP ( va va )
	.word dw_CONTEXT	; CONTEXT ( va va a )
	.word dw_two_store	; 2! ( )

	.word dw_EXIT

	
	



	;; word:  ORDER
	;; flags: DOCOL ROM CFT
	;; notes: ORDER ( -- )
	;;        Prints out the vocabulary search order.

	.word dw_voc0		; voc0 ( n a )

_order_loop:
	.word dw_dec		; 1- ( n a-1 )
	.word dw_to_NAME	; >NAME ( n na )
	.word dw_typep0		; TYPEP0 ( n )
	.word dw_SPACE		; SPACE ( n )

	.word dw_voc_plus	; voc+ ( n a | false )
	.word dw_if_DUP		; ?DUP ( n a a | false )
	.word dw_if_branch	; if done...
	.word _order_done	;    ... go to end ( )

	.word dw_branch		; loop again
	.word _order_loop

_order_done:
	.word dw_EXIT

	
	
	;; word:  WORDS
	;; flags: DOCOL ROM CFT
	;; notes: WORDS ( -- )
	;;        Prints out list of words.

	.word dw_CR		; CR ( )
	doLIT(0)
	.word dw_CONTEXT_fetch	; CONTEXT@ ( a )

_words_loop:
	.word dw_fetch		; @ ( a' )

	.word dw_DUP		; @ ( a' a' )
 	.word dw_if_branch	; ?branch ( a' )
	.word _words_end	;
	.word dw_inc		; 1+ ( a'+1 ) \ start + 1: word name ptr (pstr)
	.word dw_DUP		; DUP ( a'+1 a'+1 ) \ start + 1: word name ptr (pstr)
	.word dw_fetch		; @ ( a'+1 a'' ) \ string address
	.word dw_typep0		; TYPEP0 ( a'+1 )
	.word dw_SPACE		; SPACE

	;; Link to the next word
	.word dw_inc		; 1+ ( a'+2 ) \ start + 2: link.
	.word dw_branch		; branch
	.word _words_loop

_words_end:
	.word dw_DROP		; DROP ( )
	.word dw_EXIT


	
	;; word:  >RAM
	;; alias: to_RAM
	;; flags: CODE ROM CFT
	;; notes: >RAM ( -- )
	;;        Makes a copy of the current vocabulary definition to RAM,
	;;        so it can be extended. Vocabulary definitions are variables
	;;        and must be mutable.

	;; Get the address of the pointer to the top vocabulary.
	LOADUP(UAOFS_pCONTEXT)
	STORE TMP1
	LI UAOFS_CONTEXT
	ADD UP
	ADD MINUS1
	ADD TMP1
	STORE TMP1		; TMP1 = address of the top of the vocab stack
	RMOV(TMP3, I TMP1)	; TMP3 = PFA (soon-to-be last link)

	;; TMP1 = AC = vocab word PFA. Get to the HEAD.
	ADD _to_RAM_data
	STORE I0

	;; Now start copying. First, keep a copy of HERE.
	RMOV(TMP2, CP)

	;; 1. Copy the flags, clear the FFL_ROM bit.
	LOAD @_to_RAM_data+1
	AND I I0
	STORE I CP		; CP++ = mem[I0++] & ~FFL_ROM

	;; 2. Copy the string pointer as is.
	RMOV(I CP, I I0)	; CP++ = I0++

	;; 3. Set the link. The link is the current value in the vocab PFA.
	LOAD I I0		; Just to increment I0.
	RMOV(I CP, I TMP3)	; CP++ = PFA

	;; 4. Copy the CFA.
	RMOV(I CP, I I0)	; CP++ = I0++

	;; 5. Also update the address of the new head on the vocabulary stack.
	RMOV(I TMP1, CP)

	;; 6. Add the LAST pointer (which is the new head, in TMP2)
	RMOV(I CP, TMP2)

	// TODO: dictionary search fails after this. Chekc why!
	NEXT

_to_RAM_data:
	.word -4		; PFA-to-head offset
	.word @&ffff^FFL_ROM	; NOT FFL_ROM


	
	;; ;; Compile the string address.
	;; .word dw_to_NAME	; >NAME ( cp a va va name-addr )
	;; .word dw_comma		; , ( cp a va va )

	;; ;; Compile the link
	;; .word dw_fetch		; @ ( cp a va a )
	;; .word dw_DUP
	;; .word dw_PRINTA
	;; .word dw_comma		; , ( cp a va )

	;; ;; Compile the codeword
	;; .word dw_fetch		; @ ( cp a cfa )
	;; .word dw_DUP
	;; .word dw_PRINTH
	;; .word dw_comma		; , ( cp a )

	;; ;; Compile the value.
	;; .word dw_fetch		; @ ( cp cfa )
	;; .word dw_DUP
	;; .word dw_PRINTH
	;; .word dw_comma		; , ( cp )

	;; ;; And update the LAST pointer.

	.word dw_EXIT


	
// End of file.
