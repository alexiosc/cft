// -*- asm -*-
//
// IO primitives

	;; word:  HALT
	;; alias: HALT
	;; flags: FFL_PRIMITIVE ROM
	;; notes:
	;;   Halts the clock. On a real system this also switches to the
	;;   operator's panel, so we can't assume this is the end of
	;;   execution!
	DUMP
	HALT
	RTF			; Return to Forth macro-instruction
	
// End of file.
