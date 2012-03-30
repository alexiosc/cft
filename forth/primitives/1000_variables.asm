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
	
	.word UAOFS_TIB


	
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


	
// End of file.

