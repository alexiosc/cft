// -*- asm -*-
//
// Core memory primitives

	;; word:  C!
	;; alias: c-store
	;; copy:  store
	;; flags: CODE ROM
	;; notes: C! ( w a -- )
	;;   Store w at address a.

	;; word:  !
	;; alias: store
	;; flags: CODE ROM
	;; notes: ! ( w a -- )
	;;   Store w at address a.

	RPOP (TMP0, SP)		; TMP0 = a
	POP SP
	STORE I TMP0
	NEXT



	;; word:  C@
	;; alias: c-fetch
	;; copy:  fetch
	;; flags: CODE ROM
	;; notes: C@ ( a -- w )
	;;   Retrieve value at address a. On CFT, characters are
	;;   16-bits wide and each memory address is one whole 16-bit cell.
	
	;; word:  @
	;; alias: fetch
	;; flags: CODE ROM
	;; notes: @ ( a -- w )
	;;   Retrieve value at address a.

	RPOP(TMP0, SP)
	LOAD I TMP0		; AC <- mem[TMP0]
	PUSH SP
	NEXT



	;; word:  +!
	;; alias: plus-store
	;; flags: CODE ROM
	;; notes: ! ( w a -- )
	;;   word is added to value at address addr

	RPOP(TMP0, SP)		; a
	POP SP			; w
	ADD I TMP0		; AC <- AC + mem[a]
	STORE I TMP0		; mem[w] <- AC
	NEXT



	;; word:  1+!
	;; alias: one-plus-store
	;; flags: CODE ROM
	;; notes: ! ( a -- )
	;;        Increment the value at a by 1.

	RPOP(TMP0, SP)
	ISZ I TMP0
	NEXT
	NEXT



	;; word:  1-!
	;; alias: one-minus-store
	;; flags: CODE ROM
	;; notes: ! ( a -- )
	;;        Decrement the value at a by 1.

	RPOP(TMP0, SP)
	LOAD MINUS1
	ADD I TMP0
	STORE I TMP0
	NEXT



	;; word:  !BITS
	;; alias: store-BITS
	;; flags: CODE ROM
	;; notes: !BITS ( 16b1 addr 16b2 -- )
	;;        Store the value of 16b1 masked by 16b2 into the equivalent
        ;;        masked part of the contents of addr, without affecting bits
        ;;        outside the mask.

	RPOP(TMP0, SP)		; Mask
	RPOP(TMP1, SP)		; Addr
	RPOP(TMP2, SP)		; Value

	RAND(TMP2, TMP1, TMP3)	; value = value & mask

	LOAD TMP0		; Mask
	NOT			; ~mask
	AND I TMP1		; ~mask & mem[addr]
	OR TMP2			; (~mask & mem[addr]) | (value & mask)
	STORE I TMP1		; Store it back.
	NEXT


	
// End of file.
