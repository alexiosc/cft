;; // -*- asm -*-
;; //
;; // The compiler


	
	;; word:  ALLOT
	;; flags: CODE ROM
	;; notes: ALLOT ( w -- )
	;;   Allots w words on the dictionary, changes HERE accordingly.

	POP (SP)		; Pop value
	ADD CP			; Add to CP
	STORE CP		; Store it
	NEXT


	
	;; word:  HERE!
	;; alias: HERE_store
	;; flags: CODE ROM
	;; notes: HERE! ( w -- )
	;;        Set HERE explicitly.

	RPOP (CP, SP)		; CP = Pop value
	NEXT



	;; word:  ,
	;; alias: comma
	;; flags: CODE ROM
	;; notes: , ( w -- )
	;;   Allots space for w, then stores word at HERE 1-.

	POP (SP)		; Pop value
	STORE I CP		; CP autoincrements.
	NEXT



	;; word:  [COMPILE]
	;; alias: bkt-COMPILE-bkt
	;; flags: DOCOL ROM IMMEDIATE
	;; notes: [COMPILE] ( -- )
	;;   	  Compiles the next word literally (even immediate words).

	.word dw_tick		; ' ( a )
	.word dw_comma		; , ( )
	.word dw_EXIT



	;; word:  COMPILE
	;; flags: DOCOL ROM
	;; notes: COMPILE ( -- )
	;;   	  Compiles the next word.

	.word dw_R_from		; R> ( a )
	.word dw_DUP		; DUP ( a a )
	.word dw_fetch		; @ ( a va )
	.word dw_comma		; , ( a )
	.word dw_cell_inc	; CELL+ ( a+1 )
	.word dw_to_R		; >R ( )
	.word dw_EXIT



	;; word:  LITERAL
	;; flags: DOCOL ROM IMMEDIATE
	;; notes: LITERAL ( -- )
	;;   	  Compiles doLIT, which puts a word on the stack.

	.word dw_COMPILE	; COMPILE
	.word dw_doLIT
	.word dw_comma		; , ( a )
	.word dw_EXIT



	;; word:  ,"
	;; alias: comma_str
	;; flags: DOCOL ROM
	;; notes: ," ( -- )
	;;   	  Parses a string and compiles its length followed by its packed,
	;;        null-terminated representation.

	;; CHAR " PARSE \ Parse a string
	doLIT(34)		; CHAR "
	.word dw_PARSE		; PARSE ( b u )

	;; Ensure a string was parsed correctly
	.word dw_DUP		; DUP ( b u u )
	.word dw_if_branch	; ( b u )
	.word _comma_quote_empty

	;; HERE 1+ $cPACK \ Pack the string starting at HERE+1.
	.word dw_HERE		; HERE ( b u a )
	.word dw_inc		; 1+ ( b u a+1 )
	.word dw__cPACK		; $cPACK ( a3 a4 )

	;; DUP HERE ! \ Store the a4 address (last packed string address + 1)
	.word dw_DUP		; DUP ( a3 a4 a4 )
	.word dw_HERE		; HERE ( a3 a4 a4 a )
	.word dw_store		; ! ( a3 a4 )

	;; HERE! DROP \ Update the dictionary pointer
	.word dw_HERE_store	; HERE! ( a3 )
	.word dw_DROP		; ( )

	.word dw_EXIT

_comma_quote_empty:
	.word dw_doABORT_str	; ABORT" unmatched quote"
	.word 8
	.strp "unmatched quote" 0



	;; word:  ABORT"
	;; alias: ABORT_str
	;; flags: DOCOL ROM IMMEDIATE
	;; notes: ABORT" ( -- )
	;;   	  Compile a doABORT" that aborts execution with a string error message.

	.word dw_COMPILE
	.word dw_doABORT_str
	.word dw_comma_str
	.word dw_EXIT

	

	;; word:  HASH
	;; alias: HASH
	;; flags: DOCOL ROM CFT
	;; notes: HASH ( u a -- u )
	;;        Calculates a dictionary hash. The hash is the
	;;        first character at address a XOR the length u. Only the first 3 bits
	;;        are used.
	;; code:  ,HASH ( u a -- u ) @ XOR 7 AND , ;

	;;  Generate the hash: (strlen(s) ^ s[0]) & 7
	;; XOR I TMP5		; AC = len ^ s[0]
	;; AND _find_hash_mask	; AC = AC & 7
	;; STORE TMP3

	.word dw_fetch
	.word dw_XOR
	doLIT(FFL_HASHMASK)
	.word dw_AND
	.word dw_EXIT

	

	;; word:  ,HEAD
	;; alias: comma_HEAD
	;; flags: DOCOL ROM CFT
	;; notes: ,HEAD ( a -- head )
	;;        Compile the head of a new definition. Return its address.
	;; code:  : ,HEAD ( a -- a ) CCOUNT DUP ALLOT DUP >R OVER HASH , R> ;

	.word dw_COUNT		; COUNT ( name len )
	.word dw_DUP		; DUP ( name len len )
	.word dw_to_CCOUNT	; >CCOUNT ( name len cells )
	.word dw_ALLOT		; ALLOT ( name len ) \ Allocate space for the string

	;; HERE now points to the head of the new entry. REVEAL will need this.
	.word dw_HERE		; DUP ( name len head )
	.word dw_to_R		; >R ( name len )

	;; Compile the flags and dictionary hash value.
	.word dw_OVER		; OVER ( name len name )
	.word dw_HASH		; HASH ( name hash )
	.word dw_comma		; , ( name )

	;; Compile the name string pointer
	.word dw_comma		; ,

	;; Return the head pointer
	.word dw_R_from		; R> ( head )
	.word dw_EXIT


	
	;; word:  ,CFA
	;; alias: comma_CFA
	;; flags: DOCOL ROM CFT
	;; notes: ,CFA ( a -- )
	;;        Compile a jump to a vectored codeword at address a.
	;; code:  : ,CFA ( a -- a ) CCOUNT DUP ALLOT DUP >R OVER ,HASH , R> ;

	doLIT(&7c00)		; CFT Assembly: JSR I R
	.word dw_OR		; OR
	.word dw_comma		; ,
	.word dw_EXIT		; EXIT


	
	;; word:  REVEAL
	;; flags: DOCOL ROM CFT
	;; notes: REVEAL ( a -- )
	;;        Link the dictionary entry at address a to the CURRENT vocabulary.
	;; code:  : REVEAL ( a -- ) CURRENT@ ! ;

	.word dw_CURRENT_fetch	; CURRENT@
	.word dw_store		; !
	.word dw_EXIT		; EXIT


	
	;; word:  WORDFLAG
	;; flags: DOCOL ROM CFT
	;; notes: WORDFLAG ( u -- )
	;;        Or u with the flags of the most recently defined word.
	;; code:  : WORDFLAG ( u -- ) CURRENT@ DUP @

	.word dw_CURRENT_fetch	; CURRENT@ ( u a )
	.word dw_fetch
	.word dw_set_FLAG_store ; +FLAG! ( )
	.word dw_EXIT		; EXIT


	
	;; word:  IMMEDIATE
	;; flags: DOCOL ROM CFT
	;; notes: IMMEDIATE ( -- )
	;;        Set the IMMEDIATE flag for the recently defined word.

	doLIT(FFL_IMMEDIATE)
	.word dw_WORDFLAG
	.word dw_EXIT		; EXIT


	
	;; word:  COMPILE-ONLY
	;; flags: DOCOL ROM CFT
	;; notes: COMPILE-ONLY ( -- )
	;;        Set the COMPILE-ONLY flag for the recently defined word.

	doLIT(FFL_COMPILE)
	.word dw_WORDFLAG
	.word dw_EXIT		; EXIT


	
	;; word:  'doCOL
	;; alias: tick_doCOL
	;; flags: CONST ROM CFT
	;; notes: 'doCOL ( a -- )
	;;        The address of the doCOL CFA.

	.word @_vector_table+VTOFS_doCOL


	
	;; word:  'doVAR
	;; alias: tick_doVAR
	;; flags: CONST ROM CFT
	;; notes: 'doVAR ( a -- )
	;;        The address of the doVAR CFA.

	.word @_vector_table+VTOFS_doVAR


	
	;; word:  'doCONST
	;; alias: tick_doCONST
	;; flags: CONST ROM CFT
	;; notes: 'doCONST ( a -- )
	;;        The address of the doCONST CFA.

	.word @_vector_table+VTOFS_doCONST

	

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

	;; 0 , \ Allocate space for the variable value itself.
	.word dw_SWAP		; 0 ( head u )
	.word dw_comma		; , ( head )

	;; REVEAL \ Reveal the definition
	.word dw_REVEAL		; ( )

	;; \ Set variable flags
	doLIT(FFL_T_CONST)	; FFL_T_CONST (whatever it is)
	.word dw_WORDFLAG	; FLAGWORD ( )
	.word dw_EXIT

	

	;; word:  EVAL.COMPILE
	;; flags: DOCOL ROM
	;; notes: EVAL.COMPILE ( a -- )
	;;        Compile a token

	.word dw_FIND		; FIND ( word-addr u | token-addr FALSE )

	.word dw_if_DUP	        ; ?DUP ( token-addr u u | token-addr FALSE )
	.word dw_if_branch	; ( token-addr ) \ Not a word. Try a number
	.word _eval_compile_num

	;; 1 = \ Check for immediate words (FIND returns 1)
	doLIT(1)		; 1 ( token-addr u 1 )
	.word dw_equal		; = ( token-addr f )
	.word dw_if_branch	; branch... ( token-addr )
	.word _eval_compile_word

	;; ( token-addr ) EXECUTE \ The word is immediate. Execute it.
	.word dw_EXECUTE
	.word dw_EXIT

_eval_compile_word:
	;; (token-addr) , \ Non-immediate word. Compile it.
	.word dw_comma		; ,
	.word dw_EXIT
	
_eval_compile_num:
	;; ( token-addr ) 'NUMBER @EXECUTE ,
	.word dw_tick_NUMBER	; 'NUMBER ( token-addr )
	.word dw_fetch_EXECUTE	; @EXECUTE ( num true | token-addr false )
	.word dw_if_branch
	.word _eval_compile_fail
	doLIT(dw_doLIT_pfa)	; [COMPILE] doLIT
	.word dw_comma
	.word dw_comma		; , ( )
	.word dw_EXIT
	
_eval_compile_fail:
	.word dw_THROW		; ( token-addr )
	.word dw_FAIL		; Should never reach this


	
	;; word:  ]
	;; alias: close-bkt
	;; flags: DOCOL ROM IMMEDIATE
	;; notes: ] ( -- )
	;;        Enter compiler mode.

	doLIT(FSF_COMPILE)	; FSF_COMPILE
	.word dw_STATE		; STATE
	.word dw_store		; !

	doLIT(dw_EVAL_COMPILE)	; EVAL.COMPILE
	.word dw_tick_EVAL	; 'EVAL
	.word dw_store		; !

	.word dw_EXIT

	

	;; word:  :
	;; alias: colon
	;; flags: DOCOL ROM
	;; notes: : ( -- head )
	;;        Begins compilation of the next token.
	;;        Leaves the head of the word definition on the stack.

	;; TOKEN ,HEAD \ Begin the entry head
	.word dw_TOKEN
	.word dw_comma_HEAD	; ( head )

	;; CURRENT , \ Compile the link to the previous definition.
	.word dw_CURRENT_fetch	; CURRENT@
	.word dw_fetch		; @
	.word dw_comma		; ( head )

	;; 'doVAR ,CFA \ Compile the code word. This needs some assembly.
	.word dw_tick_doCOL	; 'doCOL
	.word dw_comma_CFA	; ,CFA ( head )

	;; Switch to the compiler
	.word dw_close_bkt	; ] ( head )

	.word dw_EXIT

	

	;; word:  ;
	;; alias: semicolon
	;; flags: DOCOL ROM IMMEDIATE COMPILE
	;; notes: ; ( -- )
	;;        Ends compilation and returns to the interpreter.

	doLIT(dw_EXIT)		; COMPILE EXIT ( a )
	.word dw_comma		; , ( )
	.word dw_open_bkt	; [ ( ) \ Enter the interpreter
	.word dw_REVEAL		; REVEAL ( ) \ link the last definition
	.word dw_EXIT



;; // End of file.
