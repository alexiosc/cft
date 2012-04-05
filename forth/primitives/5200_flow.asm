;; // -*- asm -*-
;; //
;; // Flow control


	
	;; word:  <MARK
	;; alias: pre-MARK
	;; flags: DOCOL ROM
	;; notes: <MARK ( -- a )
	;;   	  Control flow mark.
	
	.word dw_HERE		; HERE
	.word dw_EXIT		; Exit.


	
	;; word:  <RESOLVE
	;; alias: pre-RESOLVE
	;; flags: DOCOL ROM
	;; notes: <RESOLVE ( a -- )
	;;   	  Resolve control flow mark.
	
	.word dw_comma		; HERE
	.word dw_EXIT		; Exit.


	
	;; word:  >MARK
	;; alias: post-MARK
	;; flags: DOCOL ROM
	;; notes: >MARK ( -- a )
	;;   	  Control flow mark.
	
	.word dw_HERE		; HERE
	doLIT(0)		; 0
	.word dw_comma		; HERE
	.word dw_EXIT		; Exit.


	
	;; word:  >RESOLVE
	;; alias: post-RESOLVE
	;; flags: DOCOL ROM
	;; notes: >RESOLVE ( a -- )
	;;   	  Resolve control flow mark.
	
	.word dw_HERE		; HERE
	.word dw_SWAP		; SWAP
	.word dw_store		; !
	.word dw_EXIT		; Exit.


	
	;; word:  IF
	;; flags: DOCOL ROM IMMEDIATE
	;; notes: IF ( -- a ) \ Compile semantics
	;;        IF ( f -- ) \ Runtime semantics
	;;        Compile the beginning of an IF structure

	.word dw_COMPILE
	.word dw_if_branch
	.word dw_post_MARK
	.word dw_EXIT


	
	;; word:  THEN
	;; flags: DOCOL ROM IMMEDIATE
	;; notes: THEN ( a -- ) \ Compile semantics
	;;        THEN ( -- ) \ Runtime semantics
	;;        Compile the THEN part of an IF...THEN...ELSE structure

	.word dw_post_RESOLVE
	.word dw_EXIT


	
	;; word:  ELSE
	;; flags: DOCOL ROM IMMEDIATE
	;; notes: ELSE ( a -- a ) \ Compile semantics
	;;        ELSE ( -- ) \ Runtime semantics
	;;        Compile the ELSE part of an IF...THEN...ELSE structure
	;; code:  : ELSE ( a -- a ) ( -- ) [COMPILE] AHEAD SWAP [COMPILE] THEN ; IMMEDIATE

	.word dw_bkt_COMPILE_bkt
	.word dw_AHEAD
	.word dw_SWAP
	.word dw_bkt_COMPILE_bkt
	.word dw_THEN
	.word dw_EXIT


	
	;; word:  AHEAD
	;; flags: DOCOL ROM IMMEDIATE
	;; notes: AHEAD ( -- a ) \ Compile semantics
	;;        AHEAD ( -- ) \ Runtime semantics
	;; code:  : AHEAD ( -- a ) ( -- ) COMPILE branch >MARK ; IMMEDIATE

	.word dw_COMPILE
	.word dw_branch
	.word dw_post_MARK
	.word dw_EXIT


	
	;; word:  FOR
	;; flags: DOCOL ROM IMMEDIATE
	;; notes: FOR ( -- a ) \ Compile semantics
	;;        FOR ( -- ) \ Runtime semantics
	;; code:  : FOR ( -- a ) ( -- ) COMPILE >R <MARK ; IMMEDIATE

	.word dw_COMPILE
	.word dw_to_R
	.word dw_pre_MARK
	.word dw_EXIT


	
	;; word:  BEGIN
	;; flags: DOCOL ROM IMMEDIATE
	;; notes: BEGIN ( -- a ) \ Compile semantics
	;;        BEGIN ( -- ) \ Runtime semantics
	;; code:  : BEGIN ( -- a ) ( -- ) <MARK ; IMMEDIATE

	.word dw_pre_MARK
	.word dw_EXIT


	
	;; word:  NEXT
	;; flags: DOCOL ROM IMMEDIATE
	;; notes: NEXT ( a -- ) \ Compile semantics
	;;        NEXT ( -- ) \ Runtime semantics
	;; code:  : NEXT ( a -- ) ( -- ) ( what goes here? ) ; IMMEDIATE

	// TODO: Implement this
	.word dw_FAIL


	
	;; word:  UNTIL
	;; flags: DOCOL ROM IMMEDIATE
	;; notes: UNTIL ( a -- ) \ Compile semantics
	;;        UNTIL ( -- ) \ Runtime semantics
	;; code:  : UNTIL ( a -- ) ( -- ) COMPILE ?branch <RESOLVE ; IMMEDIATE

	.word dw_COMPILE
	.word dw_if_branch
	.word dw_pre_RESOLVE
	.word dw_EXIT


	
	;; word:  AGAIN
	;; flags: DOCOL ROM IMMEDIATE
	;; notes: AGAIN ( a -- ) \ Compile semantics
	;;        AGAIN ( -- ) \ Runtime semantics
	;; code:  : AGAIN ( a -- ) ( -- ) COMPILE branch <RESOLVE ; IMMEDIATE

	.word dw_COMPILE
	.word dw_branch
	.word dw_pre_RESOLVE
	.word dw_EXIT


	
	;; word:  REPEAT
	;; flags: DOCOL ROM IMMEDIATE
	;; notes: REPEAT ( a a -- ) \ Compile semantics
	;;        REPEAT ( -- ) \ Runtime semantics
	;; code:  : REPEAT ( a a -- ) ( -- ) [COMPILE] AGAIN >RESOLVE ; IMMEDIATE

	.word dw_bkt_COMPILE_bkt
	.word dw_AGAIN
	.word dw_post_RESOLVE
	.word dw_EXIT


	
	;; word:  AFT
	;; flags: DOCOL ROM IMMEDIATE
	;; notes: AFT ( a -- a a ) \ Compile semantics
	;;        AFT ( -- ) \ Runtime semantics
	;; code:  : AFT ( a -- a a ) ( -- ) DROP [COMPILE] AHEAD [COMPILE] BEGIN SWAP ; IMMEDIATE

	.word dw_DROP
	.word dw_bkt_COMPILE_bkt
	.word dw_AHEAD
	.word dw_bkt_COMPILE_bkt
	.word dw_BEGIN
	.word dw_SWAP
	.word dw_EXIT


	
	;; word:  WHEN
	;; flags: DOCOL ROM IMMEDIATE
	;; notes: WHEN ( a a -- a a a ) \ Compile semantics
	;;        WHEN ( -- ) \ Runtime semantics
	;; code:  : WHEN ( a a -- a a a ) ( -- ) [COMPILE] IF OVER ; IMMEDIATE

	.word dw_bkt_COMPILE_bkt
	.word dw_IF
	.word dw_OVER
	.word dw_EXIT


	
	;; word:  WHILE
	;; flags: DOCOL ROM IMMEDIATE
	;; notes: WHILE ( a -- a a ) \ Compile semantics
	;;        WHILE ( -- ) \ Runtime semantics
	;; code:  : WHILE ( a -- a a ) ( -- ) [COMPILE] IF SWAP ; IMMEDIATE

	.word dw_bkt_COMPILE_bkt
	.word dw_IF
	.word dw_SWAP
	.word dw_EXIT
	



;; // End of file.
