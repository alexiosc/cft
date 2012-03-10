// -*- asm -*-
//
// Core memory primitives

	;; word:  C!
	;; alias: c-store
	;; copy:  store
	;; flags: FFL_PRIMITIVE ROM
	;; notes: C! ( w a -- )
	;;   Store w at address a.

	;; word:  !
	;; alias: store
	;; flags: FFL_PRIMITIVE ROM
	;; notes: ! ( w a -- )
	;;   Store w at address a.
	POP2r (SP)		; w in TMP1, a in AC
	STORE I TMP1
	NEXT



	;; word:  C@
	;; alias: c-fetch
	;; copy:  fetch
	;; flags: FFL_PRIMITIVE ROM
	;; notes: C@ ( a -- w )
	;;   Retrieve value at address a. On CFT, characters are
	;;   16-bits wide and each memory address is one whole 16-bit cell.
	
	;; word:  @
	;; alias: fetch
	;; flags: FFL_PRIMITIVE ROM
	;; notes: @ ( a -- w )
	;;   Retrieve value at address a.
	SPEEK (SP)
	STORE TMP1		; TMP1 <- w
	LOAD I TMP1		; AC <- mem[TMP1]
	SPOKE0 (SP)
	NEXT


// End of file.
