// -*- asm -*-
//
// Things that deal with flow control, the return stack, etc.


	;; word:  BEGIN
	;; alias: BEGIN
	;; flags: FFL_PRIMITIVE ROM CMPLONLY
	;; notes: BEGIN ( -- )
	;;   Pushes the current cell pointer on the return stack.
	LOAD R rstack		; Select the return stack
	STORE R curstack
	LOAD IP
	ADD MINUS1		; Get the address of the call to BEGIN itself.
	TRAP T_PUSH		; And push it onto the

	LOAD R dstack		; Select the return stack again
	STORE R curstack

	RTF			; Return to Forth
	

	;; word:  AGAIN
	;; alias: AGAIN
	;; flags: FFL_PRIMITIVE ROM CMPLONLY
	;; notes: BEGIN ( -- )
	;;   Pushes the current cell pointer on the return stack.
	LOAD R rstack		; Select the return stack
	STORE R curstack
	TRAP T_POP		; Pop the IP
	STORE IP		; And store it back.

	LOAD R dstack		; Select the return stack again
	STORE R curstack

	RTF			; Return to Forth
	

	
	;; word:  _IF
	;; alias: _IF
	;; flags: FFL_PRIMITIVE ROM CMPLONLY
	;; notes: _IF ( -- )
	;;   Sets the IP to the value in the next word, iff the top of the stack is zero.
	LOAD I IP		; Branch value
	STORE R31
	TRAP T_POP
	SZA			; If the value == 0.._
	RTF			; Go back and execute the part after the _IF.
	LOAD R31
	STORE IP
	RTF

	
	;; word:  >R
	;; alias: to-r
	;; flags: FFL_PRIMITIVE ROM
	;; notes: R> ( -- word )
	;;   Pops a value from the data stack and pushes it onto the return stack.
	TRAP T_POP		; Get a value from the stack
	STORE R31
	
	LOAD R rstack		; Select the return stack
	STORE R curstack
	LOAD R31
	TRAP T_PUSH		; And push it onto the

	LOAD R dstack		; Select the return stack again
	STORE R curstack

	RTF			; Return to Forth

	
	;; word:  R>
	;; alias: r-from
	;; flags: FFL_PRIMITIVE ROM
	;; notes: R> ( -- word )
	;;   Pops the top value from the return stack and pushes it onto the data stack.
	LOAD R rstack		; Select the return stack
	STORE R curstack
	TRAP T_POP
	STORE R31		; Pop

	LOAD R dstack		; Select the return stack
	STORE R curstack
	LOAD R31
	TRAP T_PUSH		; Push

	RTF			; Return to Forth

	
	;; word:  R@
	;; alias: r-fetch
	;; flags: FFL_PRIMITIVE ROM
	;; notes: R@ ( -- word )
	;;   Duplicates the top value of the return stack.
	LOAD R rstack		; Select the return stack
	STORE R curstack
	TRAP T_PEEK
	STORE R31

	LOAD R dstack		; Select the return stack
	STORE R curstack
	TRAP T_PUSH
	
	RTF			; Return to Forth

	
	;; word:  RDROP
	;; alias: RDROP
	;; flags: FFL_PRIMITIVE ROM
	;; notes: RDROP ( -- )
	;;   Drops the top value from the return stack.
	LOAD R rstack		; Select the return stack
	STORE R curstack
	TRAP T_POP
	LOAD R dstack		; Select the return stack
	STORE R curstack
	RTF			; Return to Forth

	
	;; word:  I
	;; copy:  r-fetch
	;; flags: FFL_PRIMITIVE ROM
	;; notes: I ( -- word )
	;;   Shares code with R@: duplicates the top value of
	;;   the return stack.

	// NOP

	
	;; word:  J
	;; copy:  r-fetch
	;; flags: FFL_PRIMITIVE ROM
	;; notes: I ( -- word )
	;;   copies the third topmost value of the return stack.
	LOAD R rstack		; Select the return stack
	STORE R curstack
	LI 2			; 0=topmost, 2=third topmost
	TRAP T_NPEEK
	STORE R31

	LOAD R dstack		; Select the return stack
	STORE R curstack
	TRAP T_PUSH
	
	RTF			; Return to Forth
	

	;; word:  CLRSTACK
	;; alias: CLRSTACK
	;; flags: FFL_PRIMITIVE ROM
	;; notes: CLRSTACK ( -- )
	;;   Clears the return stack.
	;;
	LOAD R rstack
	ADD PLUS2
	STORE I R rstack
	RTF			; Return to Forth
	


// End of file.
