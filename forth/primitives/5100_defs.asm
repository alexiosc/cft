;; // -*- asm -*-
;; //
;; // Defining words


	
	;; word:  DTP
	;; flags: CONST ROM
	;; notes: DTP ( -- a )
	;;        The address of the DOES> jumptable register.
	
	.word @DTP&&3ff


	
	;; word:  DTPMAX
	;; alias: DTPMAX
	;; flags: CONST ROM
	;; notes: DTPMAX ( -- +n )
	;;        The maximum value of the DTP (plus one).
	
	.word _does_table_end


	
	;; word:  DTP?
	;; alias: DTPq
	;; flags: DOCOL ROM
	;; notes: DTP? ( -- )
	;;        Abort if the DOES> jumptable is out of space.
	;; code:  : DTP? ( -- ) DTP @ DTPMAX >= ABORT" DOES> jumptable full" ;

	.word dw_DTP
	.word dw_fetch
	.word dw_DTPMAX
	.word dw_geq
	.word dw_doABORT_str	; ABORT" unmatched quote"
	.word @+12
	.strp "DOES> jumptable full" 0
	.word dw_EXIT



	;; word:  >DTP
	;; alias: to_DTP
	;; flags: CODE ROM CFT
	;; notes: >DTP ( n -- a )
	;;        Stores n at the next available DOES> table register. Returns the value of that register.

	RPOP(TMP1, SP)		; Peek TOS
	LOAD DTP		; Get current value of DTP
	OR _to_DTP_data		; Add the instruction template
	PUSH SP			; Push it back
	RMOV(I DTP, TMP1)	; mem[DTP++] = TMP1
	NEXT
_to_DTP_data:
	.word JSR I R		; The base of the CFA (instruction without operand)

	

	;; word:  DOES>
	;; flags: DOCOL ROM IMMEDIATE COMPILE
	;; notes: DOES> ( -- )
	;;

	// TODO: code this
	.word dw_HERE		; TODO: adjust it
	doLIT(4)
	.word dw_add		; 3 + (one cell after the code we compile here)

	.word dw_to_DTP		; >DTP ( cfa )
	doLIT(dw_doLIT)	        ; [COMPILE] doLIT ( cfa ) \ +0: LITERAL
	.word dw_comma
	.word dw_comma		; , ( ) \                     +1: cfa
	doLIT(dw_WORDCFA)	; [COMPILE] WORDCFA
	.word dw_comma		; \                           +2: WORDCFA
	doLIT(dw_EXIT)		; [COMPILE] EXIT
	.word dw_comma		; \                           +3: EXIT

	;; This is HERE+3, which is where the DOES> CFA JSRs to.
	doLIT(TRAP I R vec_doDOES) ; Compile assembly: TRAP I R vec_DOCOL
	.word dw_comma
	
	.word dw_EXIT



	;; word:  ,ENTRY
	;; alias: comma_ENTRY
	;; flags: DOCOL ROM CFT
	;; notes: ,ENTRY ( cfa -- head )
	;;        Start a new dictionary entry using the specified CFA. Return
        ;;        the new entry's head.
	
	;; TOKEN ,HEAD \ Begin the entry head
	.word dw_TOKEN
	.word dw_comma_HEAD	; ( cfa head )

	;; CURRENT , \ Compile the link to the previous definition.
	.word dw_CURRENT_fetch	; CURRENT@
	.word dw_fetch		; @
	.word dw_comma		; ( cfa head )

	;; ( cfa head ) ,CFA ( ) \ Compile the code word.
	.word dw_SWAP		; SWAP ( head cfa )
	.word dw_comma_CFA	; ,CFA ( head )

	.word dw_EXIT

	

	;; word:  USER
	;; flags: DOCOL ROM
	;; notes: USER ( +n -- )
	;;        Create a user variable with the given offset.

	.word dw_tick_doUSER	; 'doUSER
	.word dw_comma_ENTRY	; ,ENTRY ( head )

	;; SWAP , \ Compile the provided offset.
	.word dw_SWAP		; SWAP ( head n )
	.word dw_comma		; , ( head )

	;; REVEAL \ Reveal the definition
	.word dw_REVEAL		; ( )

	;; \ Set variable flags
	doLIT(FFL_T_USER)	; FFL_T_USER (whatever it is)
	.word dw_WORDFLAG	; FLAGWORD ( )
	.word dw_EXIT

	

	;; word:  CREATE
	;; flags: DOCOL ROM
	;; notes: CREATE ( -- )
	;;

	.word dw_tick_doVAR	; 'doVAR ( cfa )
	.word dw_comma_ENTRY	; ,ENTRY ( head )
	
	;; REVEAL \ Reveal the definition
	.word dw_REVEAL		; ( )

	;; \ Set variable flags
	doLIT(FFL_T_VAR)	; FFL_T_VAR (whatever it is)
	.word dw_WORDFLAG	; FLAGWORD ( )
	.word dw_EXIT



	;; word:  VARIABLE
	;; flags: DOCOL ROM
	;; notes: VARIABLE ( -- )
	;;

	.word dw_CREATE		; CREATE
	doLIT(0)		; 0 ( head 0 )
	.word dw_comma		; , ( head )
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

	.word dw_tick_doCONST	; 'doCONST ( u cfa )
	.word dw_comma_ENTRY	; ,ENTRY ( u head )

	;; 0 , \ Allocate space for the const value itself.
	.word dw_SWAP		; SWAP ( head u )
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

	.word dw_tick_do2CONST	; 'doCONST ( d cfa )
	.word dw_comma_ENTRY	; ,ENTRY ( d head )


	;; ( dl dh head ) -ROT SWAP , , \ Allocate space for the constant value itself.
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
