;; // -*- asm -*-
;; //
;; // INTERPRETER


	
	;; word:  .OK
	;; alias: dot-ok
	;; flags: FFL_DOCOL ROM CFT
	;; notes: .OK ( -- )
	;;   Print out the "ok " prompt

	.word dw_doPSTR
	.word @+4
	.strp 10 "ok " 0
	.word dw_typep0
	.word dw_EXIT


	
	;; word:  .DONE
	;; alias: dot-done
	;; flags: FFL_DOCOL ROM CFT
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
