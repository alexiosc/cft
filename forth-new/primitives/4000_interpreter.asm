;; // -*- asm -*-
;; //
;; // INTERPRETER


	
	;; word:  .OK
	;; alias: dot-ok
	;; flags: DOCOL ROM CFT
	;; notes: .OK ( -- )
	;;   Print out the "ok " prompt.

	.word dw_STATE		; STATE
	.word dw_fetch		; @
	.word dw_if_branch
	.word _dot_ok_interpret
	
	.word dw_doLIT
	.word _dot_ok_compiled
	.word dw_typep0
	.word dw_EXIT
	
_dot_ok_interpret:
	.word dw_doLIT
	.word _dot_ok_prompt
	.word dw_typep0
	.word dw_EXIT

_dot_ok_prompt:	
	.strp " ok" 10 0

_dot_ok_compiled:	
	.strp " compiled" 10 0


	
	;; word:  _DONE
	;; alias: _DONE
	;; flags: DOCOL ROM CFT
	;; notes: _DONE ( -- )
	;;   	  Execution trampoline. Prints out "Done" and terminates.

	doLIT(1)
	.word dw_doABORT_str	; ABORT" trampoline"
	.word @+18
	.strp "trampoline error (bounce bounce)" 0


	
	;; word:  [
	;; alias: open-bkt
	;; flags: DOCOL ROM IMMEDIATE
	;; notes: [ ( -- )
	;;        Enter interpreter mode.

	doLIT(FSF_INTERPRET)	; FSF_INTERPRET
	.word dw_STATE		; STATE
	.word dw_store		; !

	doLIT(dw_EVAL_INTERPRET) ; EVAL.INTERPRET
	.word dw_tick_EVAL	; 'EVAL
	.word dw_store		; !

	.word dw_EXIT



	;; word:  EVAL.INTERPRET
	;; flags: DOCOL ROM
	;; notes: EVAL.INTERPRET ( a -- )
	;;        Interpret a token.

	// COUNT SWAP ( +n a ) \ Get the token length
	//.word dw_COUNT
	//.word dw_SWAP

	.word dw_FIND		; FIND ( word-addr u | token-addr FALSE )

	.word dw_if_DUP	        ; ?DUP ( token-addr u u | token-addr FALSE )
	.word dw_if_branch	; ( token-addr ) \ Not a word. Try a number
	.word _eval_interpret_num

	// DUP COMPILE-ONLY? ABORT" compile-only word" \ Check for a compilation-only word.
	.word dw_COMPILE_ONLYq
	.word dw_doABORT_str	; ABORT" compile-only word"
	.word @+10
	.strp "compile-only word" 0

	// EXECUTE \ Execute the word
	.word dw_EXECUTE
	.word dw_EXIT

_eval_interpret_num:
	.word dw_tick_NUMBER
	.word dw_fetch_EXECUTE
	.word dw_if_branch
	.word _eval_interpret_fail
	.word dw_EXIT
	
_eval_interpret_fail:
	.word dw_THROW
	.word dw_FAIL		; Should never reach this




	;; word:  ?STACK
	;; alias: qSTACK
	;; flags: DOCOL ROM IMMEDIATE
	;; notes: ?STACK ( -- )
	;;        Check for stack underflow, throw an exception if it's
	;;        detected.

	.word dw_DEPTH		; DEPTH
	.word dw_zero_less	; 0<

	.word dw_if_branch
	.word _underflow_ok

	;; SP0 @ SP! \ Reset the stack pointer
	.word dw_SP0
	.word dw_fetch
	.word dw_SP_store

	.word dw_doABORT_str	; ABORT" stack underflow"
	.word @+9
	.strp "stack underflow" 0

_underflow_ok:
	.word dw_EXIT


	
	;; word:  EVAL
	;; flags: DOCOL ROM
	;; notes: EVAL ( -- )
	;;        Forth interpreter loop.

_eval_loop:
	;; TOKEN ?DUP (branch)  \ Parse a token, skip if end encountered
	.word dw_TOKEN
	.word dw_if_DUP
	.word dw_if_branch
	.word _eval_end

	;; 'EVAL @EXECUTE \ Execute the interpreter or compiler on this token
	.word dw_tick_EVAL
	.word dw_fetch_EXECUTE

	;; ?STACK \ Check for stack underflow
	.word dw_qSTACK

	.word dw_branch
	.word _eval_loop

_eval_end:
	.word dw_EXIT



	;; word:  .READY
	;; alias: dot_READY
	;; flags: DOCOL ROM
	;; notes: .READY ( -- )
	;;        Print out the "Ready." prompt.

	.word dw_dot_str
	.word @+5
	.strp "Ready." 10 0
	.word dw_EXIT
	

	
	;; word:  INTERPRET
	;; flags: DOCOL ROM
	;; notes: INTERPRET ( -- )
	;;        Interpret a line of input.

	doLIT(dw_EVAL)
	.word dw_CATCH

	.word dw_if_DUP
	.word dw_if_branch
	.word _interpret_noerror

	;; \ Errors
	.word dw_typep0
	.word dw_dot_str
	.word @+4
	.strp "  ? " 0
	.word dw_QUIT		; NB: QUIT clears stacks etc, so this is a jump, not a call.

_interpret_noerror:
	.word dw_EXIT



	;; word:  QUIT
	;; flags: DOCOL ROM
	;; notes: QUIT ( -- )
	;;        Enter the main Forth loop.

	;; Disable debugging
	.word dw_DEBUGOFF

	;; TODO: Select default input device
	;; 0 BLK ! \ Deselect loading from blocks.
	doLIT(0)
	.word dw_BLK
	.word dw_store
	
	;; TIBADDR TIB ! \ Reset the TIB
	.word dw_TIBADDR
	.word dw_TIB
	.word dw_store

	;; RP0 @ RP! \ Clear the return stack
	.word dw_RP0
	.word dw_fetch
	.word dw_RP_store

	;; SP0 @ SP! \ Clear the data stack
	.word dw_SP0
	.word dw_fetch
	.word dw_SP_store

	;; Print out the Ready. prompt
	.word dw_tick_dot_READY
	.word dw_fetch_EXECUTE

	;; [ \ Set interpreter state.
	.word dw_open_bkt

_quit_loop:	
	;; '.PS1 @EXECUTE \ Print optional prompt.
	.word dw_tick_dot_PS1
	.word dw_fetch_EXECUTE

	;; QUERY \ Read one line of input
	.word dw_QUERY

	;; '.PS2 @EXECUTE \ Print optional prompt.
	.word dw_tick_dot_PS2
	.word dw_fetch_EXECUTE

	;; INTERPRET \ Interpret the line
	.word dw_INTERPRET

	;; Print ok prompt
	;; '.OK @EXECUTE
	.word dw_tick_dot_OK
	.word dw_fetch_EXECUTE


	;; Go again.
	.word dw_branch		; Loop again
	.word _quit_loop


;; // End of file.
