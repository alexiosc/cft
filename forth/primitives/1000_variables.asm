// -*- asm -*-
//
// Variables.

	
 
	;; word:  UP@
	;; alias: UP_fetch
	;; flags: CODE ROM
	;; notes: UP@ ( -- a )
	;;        The base address of the user area.
	
	RPUSH(SP, UP)
	NEXT

	
 
	;; word:  SP0
	;; flags: USER ROM
	;; notes: SP0 ( -- a )
	;;        The base address of the data stack.
	
	.word 	UAOFS_SP0

	
 
	;; word:  RP0
	;; flags: USER ROM
	;; notes: RP0 ( -- a )
	;;        The base address of the return stack.
	
	.word 	UAOFS_RP0

	
 
	;; word:  STATE
	;; flags: USER ROM
	;; notes: STATE ( -- a )
	;;        The address of the STATE variable, the Forth language state.
	;;        If STATE @ is zero, we are interpreting. Otherwise, we're
	;;        compiling. User programs may not change this variable
	;;        directly.
	
	.word	UAOFS_STATE

	
 
	;; word:  BASE
	;; flags: USER ROM
	;; notes: BASE ( -- a )
	;;        The address of the BASE variable, which defines the current
	;;        number base.
	
	.word	UAOFS_BASE


	
	;; word:  #TIB
	;; alias: cTIB
	;; flags: USER ROM
	;; notes: #TIB ( -- n )
	;;        Return the address of the variable holding the number of
	;;        characters in the Terminal Input Buffer.
	
	.word UAOFS_cTIB


	
	;; word:  TIB
	;; flags: USER ROM
	;; notes: TIB ( -- a )
	;;   Return the address of the first character in the Terminal Input
	;;   Buffer.
	
	.word UAOFS_TIB



	;; word:  >IN
	;; alias: pIN
	;; flags: USER ROM
	;; notes: >IN ( -- a )
	;;   The address of the pointer to the current character in the
	;;   terminal input buffer.

	.word UAOFS_pIN


	
	;; word:  SPAN
	;; flags: USER ROM
	;; notes: SPAN ( -- a )
	;;        Returns the address of the SPAN variable.

	.word	UAOFS_SPAN


	
	;; word:  HLD
	;; flags: USER ROM
	;; notes: HLD ( -- a )
	;;        Returns the address of the HLD pointer.

	.word	UAOFS_HLD



	;; word:  CURRENT
	;; flags: USER ROM
	;; notes: CURRENT ( -- a )
	;;        The address of the CURRENT variable, which points to the
	;;        vocabulary to add new words to.
	
	.word	UAOFS_CURRENT



	;; word:  pCONTEXT
	;; flags: USER ROM
	;; notes: pCONTEXT ( -- a )
	;;        The address of the pCONTEXT variable, which holds the
	;;        vocabulary stack pointer.
	
	.word	UAOFS_pCONTEXT


	
	;; word:  CONTEXT
	;; flags: USER ROM
	;; notes: CONTEXT ( -- a )
	;;        The address of the CONTEXT variable, which points to the
	;;        bottom of the vocabulary stack.
	
	.word	UAOFS_CONTEXT


	
	;; word:  CSP
	;; flags: USER ROM CFT
	;; notes: CONTEXT ( -- a )
	;;        The address of the CSP.
	
	.word	UAOFS_CSP


	
	;; word:  HANDLER
	;; flags: USER ROM CFT
	;; notes: CONTEXT ( -- a )
	;;        The address of the HANDLER.
	
	.word	UAOFS_HANDLER


	
	;; word:  '.READY
	;; alias: tick_dot_READY
	;; flags: USER ROM CFT
	;; notes: '.READY ( -- a | 0 )
	;;        The address of the message printed when QUIT runs.
	
	.word	UAOFS_READY


	
	;; word:  '.PROMPT
	;; alias: tick_dot_PROMPT
	;; flags: USER ROM CFT
	;; notes: '.PROMPT ( -- a | 0 )
	;;        The address of a prompt vector (or 0).
	
	.word	UAOFS_PROMPT

	
	
	;; word:  '.OK
	;; alias: tick_dot_OK
	;; flags: USER ROM CFT
	;; notes: '.OK ( -- a | 0 )
	;;        The address of the .OK prompt vector (or 0).
	
	.word	UAOFS_OK

	
	
	;; word:  'EVAL
	;; alias: tick_EVAL
	;; flags: USER ROM CFT
	;; notes: 'EVAL ( -- a | 0 )
	;;        The address of the EVAL vector (or 0).
	
	.word	UAOFS_EVAL

	
	
	;; word:  'NUMBER
	;; alias: tick_NUMBER
	;; flags: USER ROM CFT
	;; notes: 'NUMBER ( -- a | 0 )
	;;        The address of the NUMBER vector (or 0).
	
	.word	UAOFS_NUMBER

	
	
	;; word:  'EOB?
	;; alias: tick_EOBq
	;; flags: USER ROM CFT
	;; notes: 'EOB? ( -- a | 0 )
	;;        The address of the EOB? vector (or 0).
	
	.word	UAOFS_EOBq


	
// End of file.

