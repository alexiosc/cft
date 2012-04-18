// -*- asm -*-
//
// CFT-specific code.



	;; word:  ESC
	;; flags: DOCOL ROM CFT
	;; notes: ESC ( -- )
	;;        Emits an ESC character (codepoint 27).
	;; code: : ESC ( -- ) 27 EMIT ;

	doLIT(27)
	.word dw_EMIT
	.word dw_EXIT



	;; word:  vt.
	;; alias: vt_dot
	;; flags: DOCOL ROM CFT
	;; notes: vt. ( u -- )
	;;        Display an unsigned integer in free format
	;; code: : vt. ( u -- ) <# #S #> TYPE EXIT ;

	.word dw__Ustr		; $ustr
	.word dw_TYPE		; TYPE
	.word dw_EXIT		; EXIT



	;; word:  vt.c
	;; alias: vt_dot_c
	;; flags: DOCOL ROM CFT
	;; notes: vt. ( u -- )
	;;        Display an unsigned integer in free format
	;; code: : vt. ( u -- ) HEX <# # # #> TYPE EXIT ;

	.word dw_HEX		; HEX
	.word dw_bkt_number	; <#
	.word dw_number		; #
	.word dw_number		; #
	.word dw_number_bkt	; #>
	.word dw_TYPE		; TYPE
	.word dw_EXIT		; EXIT



	;; word:  <$VT
	;; alias: start_VT
	;; flags: DOCOL ROM CFT
	;; notes: <$VT ( -- )
	;;        Add a CSI sequence which starts a DEC VTxxx terminal directive.

	.word dw_DECIMAL
	.word dw_ESC		; ESC
	doLIT(91)		; 91
	.word dw_EMIT		; EMIT
	.word dw_EXIT



	;; word:  VT$>
	;; alias: end_VT
	;; flags: DOCOL ROM CFT
	;; notes: VT$> ( -- )
	;;        Ends a DEC VTxxx terminal directive.

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

	

	;; word:  vt.BRIGHT
	;; flags: DOCOL ROM CFT
	;; notes: INK ( -- )
	;;   Set the foreground colour using the lower three bits of w.

	.word dw_start_VT	; <$VT
	doCHAR("1")		; same as DECIMAL 3 DIGIT
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



	;; word:  vt.SETRGB
	;; flags: DOCOL ROM CFT
	;; notes: vt.SETRGB ( r g b i -- )
	;;        Set color index i to RGB triplet <r,g,b>. Only the lower 8
	;;        bits of r, g and b are used.
	;; TODO: Improve this. It's too long.

	.word dw_dot_str	; ." ( r g b i )
	.word @+5
	.strp 27 "]4;" 0	;

	.word dw_DECIMAL	; DECIMAL
	.word dw_LOBYTE		; LOBYTE
	.word dw_vt_dot		; vt. ( r g b )

	.word dw_to_R		; >R ( r g )
	.word dw_to_R		; >R ( r )

	.word dw_dot_str	; ."
	.word @+5
	.strp ";rgb:" 0		;

	;; Output r
	.word dw_HEX		; HEX
	.word dw_LOBYTE		; LOBYTE
	.word dw_vt_dot_c	; vt.c ( )
	doCHAR("/")		; CHAR /
	.word dw_EMIT

	;; Output g
	.word dw_R_from		; R> ( g )
	.word dw_LOBYTE		; LOBYTE
	.word dw_vt_dot_c	; vt.c ( )
	doCHAR("/")		; CHAR /
	.word dw_EMIT

	;; Output b
	.word dw_R_from		; R> ( b )
	.word dw_LOBYTE		; LOBYTE
	.word dw_vt_dot_c	; vt.c ( )
	.word dw_ESC		; ESC
	doLIT(92)
	.word dw_EMIT

	.word dw_EXIT



	;; word:  vt.FG
	;; flags: DOCOL ROM CFT
	;; notes: vt.FG ( u -- )
	;;        Set foreground in an 88-colour or 256-colour setup.

	.word dw_start_VT	; <$VT

	.word dw_dot_str	; ." 38;5;"
	.word @+5
	.strp "38;5;" 0

	.word dw_LOBYTE		; LOBYTE
	.word dw_vt_dot		; vt. \ output u

	.word dw_end_VTm	; VTm$> \ end sequence.
	.word dw_EXIT



	;; word:  vt.BG
	;; flags: DOCOL ROM CFT
	;; notes: vt.BG ( u -- )
	;;        Set background in an 88-colour or 256-colour setup.

	.word dw_start_VT	; <$VT

	.word dw_dot_str	; ." 38;5;"
	.word @+4
	.strp "48;5;" 0

	.word dw_LOBYTE		; LOBYTE
	.word dw_vt_dot		; vt. \ output u

	.word dw_end_VTm	; VTm$> \ end sequence.

	.word dw_EXIT

	

// End of file.
