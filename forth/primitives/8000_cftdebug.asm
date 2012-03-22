// -*- asm -*-
//
// CFT-specific test harness debugging

	;; word:  PRINTA
	;; flags: FFL_PRIMITIVE ROM CFT
	;; notes: PRINTD ( w -- )
	;;   Prints out an address to the debugging interface.
	POP (SP)
	PRINTA
	NEXT

	;; word:  PRINTC
	;; flags: FFL_PRIMITIVE ROM CFT
	;; notes: PRINTD ( c -- )
	;;   Issues the PRINTC debugging instruction to the test harness,
	;;   which should print out the character c.
	POP (SP)
	PRINTC
	NEXT

	;; word:  PRINTD
	;; flags: FFL_PRIMITIVE ROM CFT
	;; notes: PRINTD ( w -- )
	;;   Issues the PRINTD debugging instruction to the test harness,
	;;   which should print out w as a signed integer.
	POP (SP)
	PRINTD
	NEXT

	;; word:  PRINTU
	;; flags: FFL_PRIMITIVE ROM CFT
	;; notes: PRINTU ( u -- )
	;;   Issues the PRINTU debugging instruction to the test harness,
	;;   which should print out u as an unsigned integer.
	POP (SP)
	PRINTU
	NEXT

	;; word:  PRINTH
	;; flags: FFL_PRIMITIVE ROM CFT
	;; notes: PRINTH ( w -- )
	;;   Issues the PRINTH debugging instruction to the test harness,
	;;   which should print out w in hex.
	POP (SP)
	PRINTH
	NEXT

	;; word:  PRINTB
	;; flags: FFL_PRIMITIVE ROM CFT
	;; notes: PRINTB ( w -- )
	;;   Issues the PRINTB debugging instruction to the test harness,
	;;   which should print out w in binary.
	POP (SP)
	PRINTB
	NEXT

	;; word:  PRINTSP
	;; flags: FFL_PRIMITIVE ROM CFT
	;; notes: PRINTSP ( -- )
	;;   Issues the PRINTB debugging instruction to the test harness,
	;;   which should print out a space (ASCII 32).
	PRINTSP
	NEXT

	;; word:  PRINTNL
	;; flags: FFL_PRIMITIVE ROM CFT
	;; notes: PRINTNL ( -- )
	;;   Issues the PRINTB debugging instruction to the test harness,
	;;   which should print out a line feed character (ASCII 10).
	PRINTNL
	NEXT

	;; word:  DEBUGON
	;; flags: FFL_PRIMITIVE ROM CFT
	;; notes: DUMP ( -- )
	;;   Enables debug logging.
	DEBUGON
	NEXT
	
	;; word:  DEBUGOFF
	;; flags: FFL_PRIMITIVE ROM CFT
	;; notes: DUMP ( -- )
	;;   DISABLES debug logging.
	DEBUGOFF
	NEXT
	
	;; word:  DUMP
	;; flags: FFL_PRIMITIVE ROM CFT
	;; notes: DUMP ( -- )
	;;   Issues the DUMP debugging instruction to the test harness,
	;;   which should dump the machine state.
	DUMP
	NEXT
	
	;; word:  SUCCESS
	;; flags: FFL_PRIMITIVE ROM CFT
	;; notes: SUCCESS ( -- )
	;;   Issues the SUCCESS debugging instruction to the test harness,
	;;   which should report a successful testing checkpoint.
	SUCCESS
	NEXT
	
	;; word:  FAIL
	;; flags: FFL_PRIMITIVE ROM CFT
	;; notes: FAIL ( -- )
	;;   Issues the FAIL debugging instruction to the test harness,
	;;   which should report a failed testing checkpoint.
	FAIL
	NEXT

	;; word:  PRINT32
	;; flags: FFL_PRIMITIVE ROM CFT
	;; notes: PRINT32 ( d -- )
	;;   Prints out a double unsigned number in hex.
	RPOP(TMP1, SP)
	RPOP(TMP2, SP)
	PRINT32(TMP1,TMP2)
	NEXT

// End of file.

