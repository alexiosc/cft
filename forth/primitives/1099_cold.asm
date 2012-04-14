// -*- asm -*-
//
// Forth-side boot code.
	;; word:  COLD
	;; flags: DOCOL ROM CFT
	;; notes: TEST ( -- )
	;;   Test the inner interpreter

	;; Set up hardware
	.word dw_RTC_INIT
	
	;; ONLY >RAM FORTH >RAM DEFINITIONS \ Set vocabularies
	.word dw_ONLY
	.word dw_to_RAM
	.word dw_ROM_FORTH
	.word dw_to_RAM
	.word dw_DEFINITIONS

	.word dw_dot_banner	; .banner ( ) \ Print out the banner
	.word dw_QUIT		; QUIT ( ) \ Enter the interpreter
	.word dw_FAIL		; We should never get here.

	
	;; word:  .banner
	;; alias: dot_banner
	;; flags: DOCOL ROM CFT
	;; notes: $banner ( -- )
	;;   Prints out boot banner.
	.word dw_doLIT
	.word _banner_text1
	.word dw_typep0
	.word dw_countwords
	.word dw_DECIMAL
	.word dw_dot
	.word dw_doLIT
	.word _banner_text2
	.word dw_typep0
	.word dw_EXIT
_banner_text1:
	.strp 10 10 27 "[0;33m" 27 "#3 CFT " 10 27 "#4 CFT " 10 10 27 "[0m16-bit Mini-Computer" 10 "CFT Booted. " 10 "Forth words known:" 0
_banner_text2:
	.strp " (type WORDS for a list)" 10 0

	
	;; word:  BYE
	;; flags: DOCOL ROM
	;; copy:  HALT
	;; notes: BYE ( -- )
	;;   Leaves Forth (just runs HALT, which halts the computer)
	.word dw_HALT
	.word dw_EXIT


	
	;; word:  HALT
	;; flags: CODE ROM
	;; notes: HALT ( -- )
	;;   Halts the machine. The computer may be resumed
	;;   from the front panel, in which case execution will continue.
	HALT
	NEXT
	
	
// End of file.
