// -*- asm -*-
//
// Variables.

 
;; SP0         ( -- a, pointer to bottom of the data stack.)
;; RP0         ( -- a, pointer to bottom of the return stack.)
;; '?KEY       ( -- a, execution vector of ?KEY.  Default to ?rx.)
;; 'EMIT       ( -- a, execution vector of EMIT.  Default to tx!)
;; 'EXPECT     ( -- a, execution vector of EXPECT.  Default to 'accept'.)
;; 'TAP        ( -- a, execution vector of TAP.  Defulat the kTAP.)
;; 'ECHO       ( -- a, execution vector of ECHO.  Default to tx!.)
;; 'PROMPT     ( -- a, execution vector of PROMPT.  Default to '.ok'.)
;; BASE        ( -- a,.radix base for numeric I/O.  Default to 10.)
;; tmp         ( -- a, a temporary storage location used in parse and find.)
;; SPAN        ( -- a, hold character count received by EXPECT.)
;; >IN         ( -- a, hold the character pointer while parsing input stream.)
;; #TIB        ( -- a, hold the current count and address of the terminal input        buffer. Terminal Input Buffer used one cell after #TIB.)
;; CSP         ( -- a, hold the stack pointer for error checking.)
;; 'EVAL       ( -- a, execution vector of EVAL. Default to EVAL.)
;; 'NUMBER     ( -- a, address of number conversion.  Default to NUMBER?.)
;; HLD         ( -- a, hold a pointer in building a numeric output string.)
;; HANDLER     ( -- a, hold the return stack pointer for error handling.)
;; CONTEXT     ( -- a, a area to specify vocabulary search order.  Default to          FORTH. Vocabulary stack, 8 cells follwing CONTEXT.)
;; CURRENT     ( -- a, point to the vocabulary to be extended.  Default to FORTH.
;;             Vocabulary link uses one cell after CURRENT.)
;; CP          ( -- a, point to the top of the code dictionary.)
;; NP          ( -- a, point to the bottom of the name dictionary.)
;; LAST        ( -- a, point to the last name in the name dictionary.)
	
	;; word:  HLD
	;; flags: DOCOL ROM
	;; notes: HLD ( -- a )
	;;        Returns the address of the HLD pointer.

	.word dw_doLIT
	.word UHLD
	.word dw_EXIT


	
	;; word:  LAST
	;; flags: DOCOL ROM
	;; notes: HLD ( -- a )
	;;        Returns the address of the HLD pointer.

	.word dw_doLIT
	.word LAST
	.word dw_EXIT


	
// End of file.

