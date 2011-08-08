// -*- asm -*-
//
// Basic primitives

	;; word:  EXIT
	;; flags: PRIMITIVE ROM
	;; notes:
	;;   Ends execution of a colon definition.
	;;
	;;   Expects: rstack: the IP to go to. No increment.

__exit:
	LOAD R rstack		; Select the return stack
	STORE R curstack
	TRAP T_POP		; Pop IP from the return stack
	//PRINTH
	STORE IP		; Store the IP

	LOAD R dstack		; Select the data stack again
	STORE R curstack

	RTF			; What now?
	

	;; word:  _DOCOL
	;; flags: PRIMITIVE ROM CPH
	;; notes:
	;;   Begins execution of a colon definition.

_f_docol:
	;; Push the IP onto the return stack.
	LOAD R rstack		; Select the return stack
	STORE R curstack
	LOAD IP			; The IP is pointing to the next instruction
	TRAP T_PUSH		; Push IP onto the return stack
	LOAD R dstack		; Select the data stack again
	STORE R curstack

	LOAD PFA		; Get the PFA
	//PRINTH
	STORE IP		; This is the IP now.

	//LOAD I IP		; Skip the length (LENGTH REMOVED FROM DOCOL)

	;; Now call the NEXT entry point
	JMP __next


	;; word:  _VAR
	;; flags: PRIMITIVE ROM CPH
	;; notes:
	;;   Executes a variable definition by putting the address of the
	;;   variable on the stack. The address is the first (and only)
	;;   item in the variable's dictionary parameter field.

_f_var:
	;; Load the first byte of the PFA
	LOAD PFA
	LOAD I PFA
	TRAP T_PUSH
	RTF


	;; word:  NEXT
	;; flags: PRIMITIVE ROM
	;; notes:
	;;   Execute the instruction pointed to by IP.

__next:
	LOAD I IP		; A = address of address of handler pointer (word head)
	STORE R31		; Store for one more level of indirection
	INC
	STORE PFA		; Word head + 1 = PFA

	LOAD I R31		; A = address of code handler
	STORE R31

	JMP I R31		; Jump to address of handler

	HALT			; End of interpretation
	;; Note: should revert back to the QUIT loop here.

// End of file.
