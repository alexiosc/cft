// -*- asm -*-
//
// CFT-specific code.


	
	;; word:  PANEL>
	;; alias: panel-from
	;; flags: CODE ROM CFT
	;; notes: PANEL> ( -- w )
	;;   Reads the front panel switches and pushes the result.

	LSR			; Read panel Switch Register
	PUSH SP
	NEXT


	
	;; word:  >PANEL
	;; alias: to-panel
	;; flags: CODE ROM CFT
	;; notes: >PANEL ( W -- )
	;;   Write to the front panel output register (OR).

	POP SP
	SOR			; Set Output Register
	NEXT


	
	;; word:  DIP>
	;; alias: DIP-from
	;; flags: CODE ROM CFT
	;; notes: DIP> ( -- w )
	;;   Write to the front panel output register (OR).

	LDSR			; Read DIP-Switch Register
	PUSH SP
	NEXT

	

	;; word:  IO@
	;; alias: IO_fetch
	;; flags: CODE ROM CFT
	;; notes: IO@ ( a -- w )
	;;   Reads a word from the I/O address at a.

	RPOP(TMP0, SP)
	IN I TMP0
	PUSH SP
	NEXT



	;; word:  IO!
	;; alias: IO_store
	;; flags: CODE ROM CFT
	;; notes: IO! ( w a -- )
	;;   Write w to the I/O address at a.

	RPOP(TMP0,SP)		; a
	POP SP			; w
	OUT I TMP0
	NEXT



// End of file.
