;; // -*- asm -*-
;; //
;; // Error frames


	
	;; word:  CATCH
	;; flags: DOCOL ROM
	;; notes: CATCH ( a -- error | 0 )
	;;   	  Execute a in an error frame.

	;; SP@ R> \ Save the stack pointer on the return stack.
	.word dw_SP_fetch	; SP@ ( a sp )
	.word dw_to_R		; >R ( a )

	;; HANDLER @ >R \ Save the current handler on the return stack
	.word dw_HANDLER	; HANDLER ( a va )
	.word dw_fetch		; @ ( a handler )
	.word dw_to_R		; >R ( a )

	;; RP@ HANDLER ! \ Save the handler frame pointer in HANDLER
	.word dw_RP_fetch	; RP@ ( a rp )
	.word dw_HANDLER	; HANDLER ( a rp handler )
	.word dw_store		; ! ( a  )

	;; Execute the specified word.
	.word dw_EXECUTE	; EXECUTE ( )

	;; Normal return.
	.word dw_R_from		; R> ( handler )
	.word dw_HANDLER	; HANDLER ( handler va )
	.word dw_store		; ! ( )
	.word dw_RDROP		; RDROP ( )

	;; Push a no-error flag.
	doLIT(0)

	.word dw_EXIT		; Exit.


	
	;; word:  THROW
	;; flags: DOCOL ROM
	;; notes: THROW ( error -- error )
	;;   	  Reset system to current local error frame and update error
	;;        flag.

	;; Latest error handler -> stack.
	;; HANDLER @ RP! ( error )
	.word dw_HANDLER
	.word dw_fetch
	.word dw_RP_store

	;; Restore latest error handler frame
	;; R> HANDLER ! ( error )
	.word dw_R_from
	.word dw_HANDLER
	.word dw_store

	;; R> SWAP >R
	.word dw_R_from
	.word dw_SWAP
	.word dw_to_R

	;; Restore the stack pointer.
	.word dw_SP_store
	.word dw_DROP
	.word dw_R_from

	.word dw_EXIT


	
	;; word:  pNULL
	;; flags: VARIABLE ROM
	;; notes: pNULL ( -- a )
	;;   	  The address of an empty string. This string is empty if
	;;        interpreted as a counted string, as an unpacked null-
	;;        terminated string, or as a bit-packed null-terminated
	;;        string.

	.word @+1
	.word 0


	
	;; word:  ABORT
	;; flags: DOCOL ROM
	;; notes: ABORT ( -- )
	;;   	  Abort execution.

	.word dw_pNULL
	.word dw_THROW


	
	;; word:  ABORT"
	;; alias: ABORT_str
	;; flags: DOCOL ROM COMPILE
	;; notes: ABORT" ( f -- )
	;;

	.word dw_if_branch	; ( f ) ?branch ( )
	.word _abort_str_no
	.word dw_do_str		; do$ ( a )
	.word dw_THROW		; THROW ( )
	
_abort_str_no:
	.word dw_do_str		; do$ ( a )
	.word dw_DROP		; DROP ( )
	.word dw_EXIT

	// TODO: implement this after do$

	

;; // End of file.
