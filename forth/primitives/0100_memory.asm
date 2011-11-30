// -*- asm -*-
//
// Define memory-related primitives

	;; word:  @
	;; alias: FETCH
	;; flags: FFL_PRIMITIVE ROM
	;; notes: @ ( addr -- word )
	;;   word is the value at addr

	TRAP T_POP
	STORE R31
	LOAD I R31
	TRAP T_PUSH
	RTF			; Return to Forth
	

	;; word:  !
	;; alias: STORE
	;; flags: FFL_PRIMITIVE ROM
	;; notes: ! ( word addr -- )
	;;   word is stored at address addr

	TRAP T_POP		; Pop address
	STORE R31
	TRAP T_POP		; Pop value
	STORE I R31
	RTF			; Return to Forth
	

	;; word:  +!
	;; alias: PLUS-STORE
	;; flags: FFL_PRIMITIVE ROM
	;; notes: ! ( word addr -- )
	;;   word is added to value at address addr

	TRAP T_POP		; Pop address
	STORE R31
	TRAP T_POP		; Pop value
	ADD I R31		; Add it
	STORE I R31		; And store the result
	RTF			; Return to Forth
	
	;; word:  ALLOT
	;; flags: FFL_PRIMITIVE ROM
	;; notes: ALLOT ( word -- )
	;;   Allots word words on the dictionary, changes HERE accordingly.

	TRAP T_POP
	ADD CP
	STORE CP
	RTF			; Return to Forth
	

	;; word:  ,
	;; alias: comma
	;; flags: FFL_PRIMITIVE ROM
	;; notes: , ( word -- )
	;;   Allots space for word, then stores word at HERE 1-.

	TRAP T_POP
	STORE I CP		; CP autoincrements.
	RTF			; Return to Forth
	

	;; word:  FILL
	;; flags: FFL_PRIMITIVE ROM
	;; notes: FILL ( addr num word -- )
	;;   Num words of memory starting at addr are filled with word.

	TRAP T_POP		; value
	STORE R31

	TRAP T_POP		; num
	NEG			; twos complement
	STORE IR0

	TRAP T_POP		; addr
	STORE IR1

__dw_fill_loop:
	LOAD R31
	STORE I IR1		; Write a word
	LOAD I IR0		; Cheap autoincrement of IR0 (the counter)
	LOAD IR0		; And load the value for checking
	SZA
	JMP __dw_fill_loop	; Again
	
	RTF			; Return to Forth
	

	;; word:  CMOVE
	;; flags: FFL_PRIMITIVE ROM
	;; notes: CMOVE ( addr1 addr2 num -- )
	;;   Move num bytes from addr1 to addr2, proceeding towards high memory.

	TRAP T_POP		; num
	STORE TR0

	TRAP T_POP		; addr2
	STORE TIR1

	TRAP T_POP		; addr1
	STORE TR0

	TRAP T_MEMCPY		; Invoke memcpy
	RTF			; Return to Forth
	

	;; word:  COUNT
	;; flags: FFL_PRIMITIVE ROM
	;; notes: COUNT ( addr1 -- addr2 len )
	;;   addr2 is the first character of the string at addr1, and len is
	;;   its length. This primitive is compatible with Forths using counted
	;;   strings, even though we use neg-terminated strings on CFT. Of
	;;   course, in the case of the CFT, addr2 == addr1. In other Forths,
	;;   addr2 = addr1 + 1, since strings are prepended with a byte
	;;   specifying their length.

	TRAP T_PEEK		; Just peek the stack
	STORE TIR0
	TRAP T_STRLEN
	TRAP T_PUSH
	RTF			; Return to Forth
	

// End of file.
