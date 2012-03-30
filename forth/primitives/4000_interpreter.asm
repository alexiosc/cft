;; // -*- asm -*-
;; //
;; // INTERPRETER

	;; word:  .OK
	;; alias: dot-ok
	;; flags: DOCOL ROM CFT
	;; notes: .OK ( -- )
	;;   Print out the "ok " prompt

	.word dw_doLIT
	.word _dot_ok_prompt
	.word dw_typep0
	.word dw_EXIT
_dot_ok_prompt:	
	.strp 10 "ok " 0


	
	;; word:  .DONE
	;; alias: dot-done
	;; flags: DOCOL ROM CFT
	;; notes: .DONE ( -- )
	;;   Execution trampoline. Prints out "Done" and terminates.
	;; TODO: Make it run ABORT and restart the interpreter.

	.word dw_doPSTR
	.word @+5
	.strp "Done." 10 0
	.word dw_typep0
	.word dw_HALT
	.word dw_EXIT

	
;; // End of file.
