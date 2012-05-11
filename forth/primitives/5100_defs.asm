;; // -*- asm -*-
;; //
;; // Defining words

	

	;; word:  CREATE
	;; flags: DOCOL ROM
	;; notes: CREATE ( -- )
	;;

	// TODO: code this
	.word dw_FAIL

	

	;; word:  DOES>
	;; flags: DOCOL ROM
	;; notes: DOES> ( -- )
	;;

	// TODO: code this
	.word dw_FAIL

	

	;; word:  VARIABLE
	;; flags: DOCOL ROM
	;; notes: VARIABLE ( -- )
	;;

	;; TOKEN ,HEAD \ Begin the entry head
	.word dw_TOKEN
	.word dw_comma_HEAD	; ( head )

	;; CURRENT , \ Compile the link to the previous definition.
	.word dw_CURRENT_fetch	; CURRENT@
	.word dw_fetch		; @
	.word dw_comma		; ( head )

	;; 'doVAR ,CFA \ Compile the code word. This needs some assembly.
	.word dw_tick_doVAR	; 'doVAR
	.word dw_comma_CFA	; ,CFA ( head )

	;; 0 , \ Allocate space for the variable value itself.
	doLIT(0)		; 0 ( head 0 )
	.word dw_comma		; , ( head )

	;; REVEAL \ Reveal the definition
	.word dw_REVEAL		; ( )

	;; \ Set variable flags
	doLIT(FFL_T_VAR)	; FFL_T_VAR (whatever it is)
	.word dw_WORDFLAG	; FLAGWORD ( )
	.word dw_EXIT

	

	;; word:  2VARIABLE
	;; flags: DOCOL ROM
	;; notes: 2VARIABLE ( -- )
	;;

	.word dw_VARIABLE
	doLIT(0)		; Store the high cell
	.word dw_comma
	.word dw_EXIT

	

	;; word:  CONSTANT
	;; flags: DOCOL ROM
	;; notes: CONSTANT ( u -- )
	;;

	;; TOKEN ,HEAD \ Begin the entry head
	.word dw_TOKEN
	.word dw_comma_HEAD	; ( u head )

	;; CURRENT , \ Compile the link to the previous definition.
	.word dw_CURRENT_fetch	; CURRENT@
	.word dw_fetch		; @
	.word dw_comma		; ( u head )

	;; 'doVAR ,CFA \ Compile the code word. This needs some assembly.
	.word dw_tick_doCONST	; 'doVAR
	.word dw_comma_CFA	; ,CFA ( u head )

	;; 0 , \ Allocate space for the const value itself.
	.word dw_SWAP		; 0 ( head u )
	.word dw_comma		; , ( head )

	;; REVEAL \ Reveal the definition
	.word dw_REVEAL		; ( )

	;; \ Set variable flags
	doLIT(FFL_T_CONST)	; FFL_T_CONST (whatever it is)
	.word dw_WORDFLAG	; FLAGWORD ( )
	.word dw_EXIT

	

	;; word:  2CONSTANT
	;; flags: DOCOL ROM
	;; notes: 2CONSTANT ( d -- )
	;;

	;; TOKEN ,HEAD \ Begin the entry head
	.word dw_TOKEN
	.word dw_comma_HEAD	; ( dl dh head )

	;; CURRENT , \ Compile the link to the previous definition.
	.word dw_CURRENT_fetch	; CURRENT@
	.word dw_fetch		; @
	.word dw_comma		; ( dl dh head )

	;; 'doVAR ,CFA \ Compile the code word. This needs some assembly.
	.word dw_tick_do2CONST	; 'doVAR
	.word dw_comma_CFA	; ,CFA ( dl dh head )

	;; -ROT SWAP , , \ Allocate space for the constant value itself.
	.word dw_not_ROT	; -ROT ( head dl dh )
	.word dw_SWAP		; SWAP ( head dh dl )
	.word dw_comma		; , ( head dh )
	.word dw_comma		; , ( head )

	;; REVEAL \ Reveal the definition
	.word dw_REVEAL		; ( )

	;; \ Set variable flags
	doLIT(FFL_T_CONST)	; FFL_T_CONST (whatever it is)
	.word dw_WORDFLAG	; FLAGWORD ( )
	.word dw_EXIT

	

;; // End of file.
