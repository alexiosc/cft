// -*- asm -*-
//
// CFT-specific test harness debugging

	;; word:  PRINTA
	;; flags: FFL_PRIMITIVE ROM
	;; notes: PRINTD ( word -- )
	;;   Prints out an address to the debugging interface.
	TRAP T_POP
	PRINTA
	RTF
	

	;; word:  PRINTD
	;; flags: FFL_PRIMITIVE ROM
	;; notes: PRINTD ( word -- )
	;;   Issues the PRINTD debugging instruction to the test harness,
	;;   which should print out word in decimal.
	TRAP T_POP
	PRINTD
	RTF
	

	;; word:  DUMP
	;; flags: FFL_PRIMITIVE ROM
	;; notes: DUMP ( -- )
	;;   Issues the DUMP debugging instruction to the test harness,
	;;   which should dump the machine state.
	DUMP
	RTF
	
	;; word:  DEBUGON
	;; flags: FFL_PRIMITIVE ROM
	;; notes: DUMP ( -- )
	;;   Enables debug logging.
	DEBUGON
	RTF
	
	;; word:  DEBUGOFF
	;; flags: FFL_PRIMITIVE ROM
	;; notes: DUMP ( -- )
	;;   DISABLES debug logging.
	DEBUGOFF
	RTF
	
// End of file.
