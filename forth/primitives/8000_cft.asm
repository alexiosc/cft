// -*- asm -*-
//
// CFT-specific code.


	
	;; word:  PANEL>
	;; alias: panel-from
	;; flags: FFL_PRIMITIVE ROM CFT
	;; notes: PANEL> ( -- w )
	;;   Reads the front panel switches and pushes the result.

	IN FPSR
	PUSH (SP)
	NEXT


	
	;; word:  >PANEL
	;; alias: from-panel
	;; flags: FFL_PRIMITIVE ROM CFT
	;; notes: >PANEL ( W -- )
	;;   Write to the front panel output register (OR).

	POP(SP)
	OUT FPOR
	NEXT


	
	;; word:  DIP>
	;; alias: DIP-from
	;; flags: FFL_PRIMITIVE ROM CFT
	;; notes: DIP> ( -- w )
	;;   Write to the front panel output register (OR).

	IN FPDSR
	PUSH (SP)
	NEXT

	

	;; word:  HWTYPE
	;; flags: FFL_PRIMITIVE ROM CFT
	;; notes: HWTYPE ( -- w )
	;;   Push the contents of the hardware type register.

	IN HWTYPE
	PUSH (SP)
	NEXT


	
// End of file.
