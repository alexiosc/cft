;; // -*- asm -*-
;; //
;; // Flow control


	
	;; word:  <MARK
	;; alias: pre-MARK
	;; flags: DOCOL ROM COMPILE
	;; notes: <MARK ( -- a )
	;;   	  Control flow mark.
	
	.word dw_HERE		; HERE
	.word dw_EXIT		; Exit.


	
	;; word:  <RESOLVE
	;; alias: pre-RESOLVE
	;; flags: DOCOL ROM COMPILE
	;; notes: <RESOLVE ( a -- )
	;;   	  Resolve control flow mark.
	
	.word dw_comma		; ,
	.word dw_EXIT		; Exit.


	
	;; word:  >MARK
	;; alias: post-MARK
	;; flags: DOCOL ROM COMPILE
	;; notes: >MARK ( -- a )
	;;   	  Control flow mark.
	
	.word dw_HERE		; HERE
	doLIT(0)		; 0
	.word dw_comma		; HERE
	.word dw_EXIT		; Exit.


	
	;; word:  >RESOLVE
	;; alias: post-RESOLVE
	;; flags: DOCOL ROM COMPILE
	;; notes: >RESOLVE ( a -- )
	;;   	  Resolve control flow mark.

	.word dw_dot_s
	.word dw_CR
	.word dw_HERE		; HERE
	.word dw_SWAP		; SWAP
	.word dw_store		; !
	.word dw_EXIT		; Exit.


	
	;; word:  IF
	;; flags: DOCOL ROM IMMEDIATE COMPILE
	;; notes: IF ( -- a ) \ Compile semantics
	;;        IF ( f -- ) \ Runtime semantics
	;;        Compile the beginning of an IF structure

	doLIT(dw_if_branch)	; [COMPILE] if_branch
	.word dw_comma		; ,
	.word dw_post_MARK	; >MARK
	.word dw_EXIT


	
	;; word:  THEN
	;; flags: DOCOL ROM IMMEDIATE COMPILE
	;; notes: THEN ( a -- ) \ Compile semantics
	;;        THEN ( -- ) \ Runtime semantics
	;;        Compile the THEN part of an IF...THEN...ELSE structure

	.word dw_post_RESOLVE
	.word dw_EXIT


	
	;; word:  ELSE
	;; flags: DOCOL ROM IMMEDIATE COMPILE
	;; notes: ELSE ( a -- a ) \ Compile semantics
	;;        ELSE ( -- ) \ Runtime semantics
	;;        Compile the ELSE part of an IF...THEN...ELSE structure
	;; code:  : ELSE ( a -- a ) ( -- ) [COMPILE] AHEAD SWAP [COMPILE] THEN ; IMMEDIATE

	doLIT(dw_AHEAD)		; [COMPILE] AHEAD
	.word dw_comma
	.word dw_SWAP		; SWAP
	doLIT(dw_THEN)		; [COMPILE] THEN
	.word dw_comma
	.word dw_EXIT


	
	;; word:  AHEAD
	;; flags: DOCOL ROM IMMEDIATE COMPILE
	;; notes: AHEAD ( -- a ) \ Compile semantics
	;;        AHEAD ( -- ) \ Runtime semantics
	;; code:  : AHEAD ( -- a ) ( -- ) COMPILE branch >MARK ; IMMEDIATE

	.word dw_COMPILE
	.word dw_branch
	.word dw_post_MARK
	.word dw_EXIT


	
	;; word:  FOR
	;; flags: DOCOL ROM IMMEDIATE COMPILE
	;; notes: FOR ( -- a ) \ Compile semantics
	;;        FOR ( -- ) \ Runtime semantics
	;; code:  : FOR ( -- a ) ( -- ) COMPILE >R <MARK ; IMMEDIATE

	.word dw_COMPILE
	.word dw_to_R
	.word dw_pre_MARK
	.word dw_EXIT


	
	;; word:  BEGIN
	;; flags: DOCOL ROM IMMEDIATE COMPILE
	;; notes: BEGIN ( -- a ) \ Compile semantics
	;;        BEGIN ( -- ) \ Runtime semantics
	;; code:  : BEGIN ( -- a ) ( -- ) <MARK ; IMMEDIATE

	.word dw_pre_MARK
	.word dw_EXIT


	
	;; word:  NEXT
	;; flags: DOCOL ROM IMMEDIATE COMPILE
	;; notes: NEXT ( a -- ) \ Compile semantics
	;;        NEXT ( -- ) \ Runtime semantics
	;; code:  : NEXT ( a -- ) ( -- ) ( what goes here? ) ; IMMEDIATE

	// TODO: Implement this
	.word dw_FAIL


	
	;; word:  UNTIL
	;; flags: DOCOL ROM IMMEDIATE COMPILE
	;; notes: UNTIL ( a -- ) \ Compile semantics
	;;        UNTIL ( -- ) \ Runtime semantics
	;; code:  : UNTIL ( a -- ) ( -- ) [COMPILE] ?branch <RESOLVE ; IMMEDIATE

	doLIT(dw_if_branch)	; [COMPILE] ?branch
	.word dw_comma
	.word dw_pre_RESOLVE	; <RESOLVE
	.word dw_EXIT


	
	;; word:  AGAIN
	;; flags: DOCOL ROM IMMEDIATE COMPILE
	;; notes: AGAIN ( a -- ) \ Compile semantics
	;;        AGAIN ( -- ) \ Runtime semantics
	;; code:  : AGAIN ( a -- ) ( -- ) COMPILE branch <RESOLVE ; IMMEDIATE

	.word dw_COMPILE
	.word dw_branch
	.word dw_pre_RESOLVE
	.word dw_EXIT


	
	;; word:  REPEAT
	;; flags: DOCOL ROM IMMEDIATE COMPILE
	;; notes: REPEAT ( a a -- ) \ Compile semantics
	;;        REPEAT ( -- ) \ Runtime semantics
	;; code:  : REPEAT ( a a -- ) ( -- ) [COMPILE] AGAIN >RESOLVE ; IMMEDIATE

	.word dw_bkt_COMPILE_bkt
	.word dw_AGAIN
	.word dw_post_RESOLVE
	.word dw_EXIT


	
	;; word:  AFT
	;; flags: DOCOL ROM IMMEDIATE COMPILE
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
	;; flags: DOCOL ROM IMMEDIATE COMPILE
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


	
	;; word:  DO
	;; flags: DOCOL ROM IMMEDIATE
	;; notes: DO ( -- sys ) \ compile-time semantics
	;;        DO ( w2 w1 -- w1 ) \ runtime semantics
	;;        Starts a DO-LOOP loop which will run once, or w2-w1+1,
	;;        whichever is greatest. The end of the loop body is
	;;        signalled with LOOP.
	;; code:  : DO ( -- sys ) [COMPILE] >R BEGIN ; IMMEDIATE

	doLIT(dw_to_R)		; [COMPILE] >R
	.word dw_comma		; ,
	.word dw_BEGIN		; BEGIN ( -- sys )
	.word dw_EXIT


	
	;; word:  LOOP
	;; flags: DOCOL ROM IMMEDIATE
	;; notes: LOOP ( sys -- ) \ compile-time semantics
	;;        Terminates a DO-LOOP loop.
	;; code:  : LOOP ( sys -- ) [COMPILE] doLOOP >RESOLVE ; IMMEDIATE

	doLIT(dw_doLOOP)	; [COMPILE] doLOOP
	.word dw_comma		; ,
	.word dw_UNTIL		; >RESOLVE ( )
	.word dw_EXIT


	
	;; word:  doLOOP
	;; flags: CODE ROM CFT IMMEDIATE
	;; notes: doLOOP ( w2 -- w2 u ) \ compile-time semantics
	;;        Compile-time behaviour of LOOP. w2 is the last value of the loop
	;;        counter. u is 0 if the last value has not yet been reached, non-
	;;        zero otherwise.

	POP RP			; Increment the loop counter (on Return Stack)
	ADD PLUS1
	PUSH RP
	STORE TMP0		; Keep it in TMP0 for now.

	SPEEK(SP)		; Peek w2 on the data stack
	XOR TMP0		; counter == w2?
	SZA
	JMP _doLOOP_notdone	; No.

	;; We're done. Clean up and tell ?branch not to.
	POP RP			; Drop the loop counter from the RS.
	POP SP		        ; Drop w2 from the DS
	LI 1
	PUSH SP		        ; Push 1.
	NEXT

_doLOOP_notdone:
	;; We're not done yet. Push 0 onto the stack. ?branch branches on zero.
	LI 0
	PUSH SP	                ; Push 0 onto the stack. (?branch will loop again)
	NEXT


	
	;; word:  I
	;; flags: CODE ROM
	;; notes: I ( -- u )
	;;        Returns the innermost loop counter.

	POP RP			; Easiest way
	PUSH RP
	PUSH SP
	NEXT

	
	
	;; word:  J
	;; flags: CODE ROM
	;; notes: J ( -- u )
	;;        Returns the second-innermost loop counter.

	SPEEKn(RP, 2)
	PUSH SP
	NEXT

	
	
	;; word:  K
	;; flags: CODE ROM
	;; notes: K ( -- u )
	;;        Returns the third-innermost loop counter.

	SPEEKn(RP, 3)
	PUSH SP
	NEXT

	
	
	;; word:  +LOOP
	;; alias: plus_LOOP
	;; flags: CODE ROM
	;; notes: +LOOP ( n -- )
	;;        n is added to the loop index.  If the new index was
        ;;        incremented across the boundary between limit-1 and limit
        ;;        then the loop is terminated and loop control parameters are
        ;;        discarded.  When the loop is not terminated, execution
        ;;        continues to just after the corresponding DO .  sys is
        ;;        balanced with its corresponding DO .

	;; TODO: code this.
	FAIL




;; // End of file.
