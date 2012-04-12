;; // -*- asm -*-
;; //
;; // dictionary tools


	
	;; word:  >FLAGS@
	;; alias: to_FLAGS_fetch
	;; flags: DOCOL ROM CFT
	;; notes: >FLAGS ( a -- u )
	;;        Given the PFA of a word, return its flags.

	doLIT(4)		; 4
	.word dw_sub		; -
	.word dw_fetch		; @
	.word dw_EXIT


	
	;; word:  >CFA
	;; alias: to_CFA
	;; flags: DOCOL ROM CFT
	;; notes: >CFA ( a -- a )
	;;        Given the PFA of a word, return its CFA.

	.word dw_dec		; 1-
	.word dw_EXIT


	
	;; word:  >LINK@
	;; alias: to_LINK_fetch
	;; flags: DOCOL ROM CFT
	;; notes: >LINK@ ( a -- a | f )
	;;        Given the PFA of a word, return the head address of the word
	;;        preceding it in the vocabulary. If this is the first word in
	;;        the vocabulary, false (zero) is returned.

	.word dw_dec2		; 2-
	.word dw_fetch		; @
	.word dw_EXIT


	
	;; word:  >NAME
	;; alias: to_NAME
	;; flags: DOCOL ROM CFT
	;; notes: >NAME ( a -- a )
	;;        Given the PFA of a word, return the address of its name string.

	doLIT(2)		; 3
	.word dw_sub		; -
	.word dw_fetch		; @ \ dereference
	.word dw_EXIT
	
		
	
;; // End of file.
