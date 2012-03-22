// -*- asm -*-
//
// Utility words



	;; word:  .s
	;; alias: dot_s
	;; flags: DOCOL ROM
	;; notes: .s ( -- )
	;;        Prints out the stack non-destructively.
	;; src:   DEPTH FOR AFT R@ PICK . THEN NEXT;

	.word dw_DEPTH		; DEPTH              ( d )     ( )
_dot_s_loop:
	.word dw_DUP		; DUP                ( d d )   ( )
	.word dw_to_r		; >R                 ( d )     ( d )
	.word dw_if_branch	;   ?branch ( FOR )  ( )       ( d )
	.word _dot_s_end
	.word dw_r_from		; R>                 ( d )     ( )
	.word dw_dec 		; 1-                 ( d )     ( )
	.word dw_DUP		; DUP                ( d d )   ( )
	.word dw_to_r		; >R                 ( d )     ( d )
	.word dw_PICK		; PICK               ( w )     ( d )
	.word dw_dot 		; .                  ( )       ( d )
	.word dw_r_from		;   R>               ( d )     ( )
	.word dw_branch		;   THEN NEXT        ( d )
	.word _dot_s_loop
_dot_s_end:
	.word dw_RDROP		; RDROP
  	.word dw_EXIT		; EXIT



	;; word:  .BASE
	;; alias: dot_BASE
	;; flags: DOCOL ROM
	;; notes: .BASE ( -- )
	;;        Prints out the base.
	;; src:   BASE @ DECIMAL DUP . BASE !

	.word dw_BASE
	.word dw_fetch
	.word dw_DECIMAL
	.word dw_DUP
	.word dw_dot
	.word dw_BASE
	.word dw_store
	.word dw_EXIT

	
	
;; 	RMOV(I0, R USP0)

;; 	PUTC(10)
;; 	PUTC(10)
;; 	RSUB(TMP0, SP, R USP0)
;; 	PRINTD

;; _dumps_loop:
;; 	LOAD I0
;; 	XOR SP
;; 	SNZ
;; 	JMP _dumps_done

;; 	LOAD I I0
;; 	PRINTH
;; 	JMP _dumps_loop

;; _dumps_done:	
;; 	PUTC(10)
;; 	PUTC(10)
;; 	NEXT

