// -*- asm -*-
//
// CFT-specific code.


	
	;; word:  PANEL>
	;; alias: panel-from
	;; flags: CODE ROM CFT
	;; notes: PANEL> ( -- w )
	;;   Reads the front panel switches and pushes the result.

	IN FPSR
	PUSH (SP)
	NEXT


	
	;; word:  >PANEL
	;; alias: from-panel
	;; flags: CODE ROM CFT
	;; notes: >PANEL ( W -- )
	;;   Write to the front panel output register (OR).

	POP(SP)
	OUT FPOR
	NEXT


	
	;; word:  DIP>
	;; alias: DIP-from
	;; flags: CODE ROM CFT
	;; notes: DIP> ( -- w )
	;;   Write to the front panel output register (OR).

	IN FPDSR
	PUSH (SP)
	NEXT

	

	;; word:  HWTYPE
	;; flags: CODE ROM CFT
	;; notes: HWTYPE ( -- w )
	;;   Push the contents of the hardware type register.

	IN HWTYPE
	PUSH (SP)
	NEXT



	;; word:  IO@
	;; alias: IO_fetch
	;; flags: CODE ROM CFT
	;; notes: IO@ ( a -- w )
	;;   Reads a word from the I/O address at a.

	SPEEK(SP)
	STORE TMP1
	IN I TMP1
	SPOKE0(SP)
	NEXT



	;; word:  IO!
	;; alias: IO_store
	;; flags: CODE ROM CFT
	;; notes: IO! ( w a -- )
	;;   Write w to the I/O address at a.

	POP2(SP)		; w in AC, a in TMP1
	OUT I TMP1
	NEXT



// End of file.
