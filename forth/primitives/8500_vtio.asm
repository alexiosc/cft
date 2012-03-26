// -*- asm -*-
//
// CFT-specific code.



	;; word:  vt.
	;; alias: vt_dot
	;; flags: DOCOL ROM CFT
	;; notes: vt. ( u -- )
	;;        Display an unsigned integer in free format
	;; code: : vt. ( u -- ) <# #S #> TYPE EXIT ;

	.word dw__ustr		; $ustr
	.word dw_TYPE		; TYPE
	.word dw_EXIT		; EXIT



	;; word:  <$VT
	;; alias: start_VT
	;; flags: DOCOL ROM CFT
	;; notes: <$VT ( -- )
	;;   Add a CSI sequence which starts a DEC VTxxx terminal directive.

	doLIT(27)		; 27
	.word dw_EMIT		; EMIT
	doLIT(91)		; 91
	.word dw_EMIT		; EMIT
	.word dw_EXIT



	;; word:  VT$>
	;; alias: end_VT
	;; flags: DOCOL ROM CFT
	;; notes: VT$> ( -- )
	;;   Ends a DEC VTxxx terminal directive.

	.word dw_EXIT

	

	;; word:  VTm$>
	;; alias: end_VTm
	;; flags: DOCOL ROM CFT
	;; notes: VTm$> ( -- )
	;;   Ends a CSI ... m sequence.

	doCHAR("m")		; 'm'
	.word dw_EMIT		; EMIT
	.word dw_end_VT		; VT$>
	.word dw_EXIT

	

	;; word:  vt.INK
	;; flags: DOCOL ROM CFT
	;; notes: INK ( w -- )
	;;   Set the foreground colour using the lower three bits of w.

	.word dw_start_VT	; <$VT
	doCHAR("3")		; same as DECIMAL 3 DIGIT
	.word dw_EMIT		; EMIT
	doLIT(7)		; 7
	.word dw_AND		; AND
	.word dw_DIGIT		; DIGIT \ no need to use expensive division
	.word dw_EMIT		; EMIT
	.word dw_end_VTm	; VTm$>
	.word dw_EXIT

	

	;; word:  vt.PAPER
	;; flags: DOCOL ROM CFT
	;; notes: PAPER ( w -- )
	;;   Set the background colour using the lower three bits of w.

	.word dw_start_VT	; <$VT
	doCHAR("4")		; same as DECIMAL 4 DIGIT
	.word dw_EMIT		; EMIT
	doLIT(7)		; 7
	.word dw_AND		; AND
	.word dw_DIGIT		; DIGIT \ no need to use expensive division
	.word dw_EMIT		; EMIT
	.word dw_end_VTm	; VTm$>
	.word dw_EXIT

	

	;; word:  vt.HOME
	;; flags: DOCOL ROM CFT
	;; notes: vt.HOME ( -- )
	;;   Moves the cursor to the home position, (1,1).

	.word dw_start_VT	; <$VT
	doCHAR("H")		; same as DECIMAL 3 DIGIT
	.word dw_EMIT		; EMIT
	.word dw_end_VT		; VT$>
	.word dw_EXIT

	

	;; word:  vt.GOTOXY
	;; flags: DOCOL ROM CFT
	;; notes: vt.GOTOXY ( x y -- )
	;;   Moves the cursor to the position (x,y), where position (1,1) is
	;;   the top-left corner of the terminal screen.
	;;
	;; code: vt.GOTOXY ( x y -- ) <$VT . 59 EMIT . 72 EMIT VT$> ;

	.word dw_start_VT	; <$VT
	.word dw_vt_dot		; .
	doCHAR(";")		; same as DECIMAL 3 DIGIT
	.word dw_EMIT		; EMIT
	.word dw_vt_dot		; .
	doCHAR("H")		; 
	.word dw_EMIT		; EMIT
	.word dw_end_VT		; VT$>
	.word dw_EXIT

	
	
	;; word:  vt.ERASE
	;; flags: DOCOL ROM CFT
	;; notes: vt.HOME ( w -- )
	;;   w = 0: erase below.
	;;   w = 1: erase above.
	;;   w = 2: erase all.

	.word dw_start_VT	; <$VT
	doLIT(3)		; 3
	.word dw_AND		; AND
	.word dw_DIGIT		; DIGIT \ no need to use expensive division
	.word dw_EMIT		; EMIT
	doCHAR("J")		; 
	.word dw_EMIT		; EMIT
	.word dw_end_VT		; VT$>
	.word dw_EXIT



	;; word:  vt.CLS
	;; flags: DOCOL ROM CFT
	;; notes: vt.CLS ( -- )
	;;   Clears the screen.
	;; 
	;; code:  : vt.cls ( -- ) vt.HOME 0 vt.ERASE ;

	.word dw_vt_HOME
	doLIT(0)
	.word dw_vt_ERASE
	.word dw_EXIT

	

// End of file.
