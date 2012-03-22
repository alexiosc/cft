// -*- asm -*-
//
// Variables.


	
	;; word:  HLD
	;; flags: DOCOL ROM
	;; notes: HLD ( -- a )
	;;        Returns the address of the HLD pointer.

	.word dw_doLIT
	.word UHLD
	.word dw_EXIT


	
// End of file.

