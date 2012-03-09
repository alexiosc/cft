// -*- asm -*-
//
// Define the NAME primitive

	;; word:  doLIST
	;; flags: FFL_PRIMITIVE ROM
	;; notes: $doLIST ( a -- )
	;;   Execute address list starting with a.

	LOAD IP
	PUSH (RP)		; Push the IP onto the Return Stack (RP)
	POP (SP)		; Pop the new value of the IP from the Data Stack
	STORE IP
	NEXT
	
	;; word:  EXIT
	;; flags: FFL_PRIMITIVE ROM
	;; notes: EXIT ( -- )

	POP (RP)
	NEXT
	
	;; word:  EXECUTE
	;; flags: FFL_PRIMITIVE ROM
	;; notes: EXECUTE ( ca -- )
	;;   Pop address from data stack and jump to it.

	POP0 (RP)
	JMP I TMP0
	
	;; word:  doLIT
	;; flags: FFL_PRIMITIVE ROM
	;; notes: EXECUTE ( -- w )
	;;   Push a literal onto the stack.

	LOAD I IP
	PUSH (SP)
	NEXT



	
	;; word:  branch
	;; flags: FFL_PRIMITIVE ROM
	;; notes: branch ( -- )
	;;   Branches to the address specified after it in an address list. That is,
	;;   IP <- mem[IP]

	LOAD I IP
	STORE IP
	NEXT

	;; word:  ?branch
	;; alias: if-branch
	;; flags: FFL_PRIMITIVE ROM
	;; notes: branch? ( f -- )
	;;   If f is zero, branch to the address specified after ?branch
	;;   in the address list. That is, IP <- mem[IP]

	POP (SP)		; Pop f from the data stack
	SZA			; Zero?
	JMP __branch_no		; No. Don't branch.

__branch_yes:
	LOAD I IP		; Yes.
	STORE IP		; IP <- mem[IP++]
	
__branch_end:
	NEXT

__branch_no:
	ISN I IP		; Increment IP (and skip if zero, which it never is)
	JMP __branch_end
	JMP __branch_end	; IP is never zero, but just in case, do it again.



	;; word:  next
	;; flags: FFL_PRIMITIVE ROM
	;; notes: next ( -- )
	;;   Decrement index (at top of return stack) and exit loop if
	;;   index is less than 0. The loop address is at mem[IP].

	SPEEK (RP)		; Peek at the top of the data stack
	ADD MINUS1		; Decrement by 1
	SPOKE0 (RP)		; Store it back

	SNZ			; Is it non-zero?
	JMP __next_endloop	; No. It's zero.

	LOAD I IP		; Take the branch.
	STORE IP		; IP <- mem[IP++]

__next_end:
	NEXT

__next_endloop:
	DECM (RP)		; Discard the index value from the ret stack.

	ISN IP			; End of loop. IP++
	JMP __next_end
	JMP __next_end



	;; word:  $$TEST$$
	;; alias: TEST
	;; flags: DOCOL ROM
	;; notes: TEST ( -- )
	;;   Test the inner interpreter
	.word dw_doLIT
	.word 10
	.word dw_PRINTD
	.word dw_SUCCESS
	.word dw_BYE
	.word dw_EXIT
	
	;; word:  BYE
	;; flags: DOCOL ROM
	;; copy:  HALT
	;; notes: BYE ( -- )
	;;   Leaves Forth (just runs HALT, which halts the computer)
	.word dw_HALT
	.word dw_EXIT

	;; word:  HALT
	;; flags: FFL_PRIMITIVE ROM
	;; notes: HALT ( -- )
	;;   Halts the machine. The computer may be resumed
	;;   from the front panel, in which case execution will continue.
	HALT
	NEXT
	
	
// End of file.
