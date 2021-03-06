// -*- asm -*-
//
// Define the NAME primitive

	;; word:  branch
	;; flags: CODE ROM
	;; notes: branch ( -- )
	;;   Branches to the address specified after it in an address list. That is,
	;;   IP <- mem[IP]

	RMOV(IP, I IP)		; IP = mem[IP++]
	NEXT



	;; word:  ?branch
	;; alias: if-branch
	;; flags: CODE ROM
	;; notes: branch? ( f -- )
	;;   If f is zero, branch to the address specified after ?branch
	;;   in the address list. That is, IP <- mem[IP]

	POP SP			; Pop f from the data stack
	SZA			; Zero?
	JMP __branch_no		; No. Don't branch.

__branch_yes:
	RMOV(IP, I IP)		; Yes. IP <- mem[IP++]
	
__branch_end:
	NEXT

__branch_no:
	ISZ IP	                ; Increment IP (and skip if zero, which it never is)
	JMP __branch_end
	JMP __branch_end	; IP is never zero, but just in case, do it again.



	;; word:  next
	;; flags: CODE ROM
	;; notes: next ( -- )
	;;   Decrement index (at top of return stack) and exit loop if
	;;   index is less than 0. The loop address is at mem[IP].

	SPEEK (RP)		; Peek at the top of the data stack
	SNZ			; Is it non-zero?
	JMP __next_endloop	; No. It's zero.

	ADD MINUS1		; Decrement by 1
	SPOKE0 (RP)		; Store it back

	RMOV(IP, I IP)		; Take the branch. IP <- mem[IP++]

__next_end:
	NEXT

__next_endloop:
	DECM (RP)		; Discard the index value from the ret stack.

	ISZ IP			; End of loop. IP++
	JMP __next_end
	JMP __next_end



// End of file.
