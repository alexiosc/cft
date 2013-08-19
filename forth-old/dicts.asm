///////////////////////////////////////////////////////////////////////////////
//
// Dictionary code
//
///////////////////////////////////////////////////////////////////////////////

	;; Add a dictionary definition.
	;;
	;; Input:
	;;   R0: Flags
	;;   R1: Pointer to a negative-terminated name of key
	;;   R2: Code pointer
	;;   R3: Data pointer
	;;   R4: Data length
	;;   CP: Dictionary pointer
	;;
	;; Notes:
	;;
	;; The dictionary structure is like this:
	;;
	;; FLAGS
	;; NAME, usually neg-terminated
	;; LINK, address of previous dictionary entry
	;; CODEPOINTER, address in memory of the handler
	;; LEN, 2s complement of length of DATA (in words)
	;; DATA, array of data
	
_rom_newdictkey:
	LOAD CP
	STORE R31

	;; First, copy the name.
	LOAD R1
	STORE TIR0
_rom_newdictkey_strcpy:
	LOAD I TIR0
	STORE I CP
	SNP
	JMP _rom_newdictkey_strcpy

	;; Keep a pointer to the head of the entry
	LOAD CP
	STORE R30		; The head of this entry

	;; Write data
	LOAD R0			; Copy the flags
	STORE I CP		; Autoincrement
	LOAD R31		; Start of name string
	STORE I CP
	LOAD LASTENTRY		; Copy LINK
	STORE I CP
	LOAD R2			; Copy the code pointer
	STORE I CP
	LOAD R4
	NEG			; Twos complement
	STORE I CP		; Copy the negated data length

	;; Copy the data array
	LOAD R3
	STORE TIR0
_rom_newdictkey_memcpy:
	LOAD I TIR0		; Autoindex
	STORE I CP
	LOAD R4
	ADD R MINUS1		; R4--
	STORE R4
	SZA
	JMP _rom_newdictkey_memcpy

	LOAD R30
	STORE LASTENTRY		; Update the LASTENTRY pointer

	RTT			; We're done.


	
	;; Find a dictionary definition.
	;;
	;; Input:
	;;   A: pointer to a neg-terminated string to find
	;;
	;; Returns:
	;;   A: body of dictionary definition for this entry.
	;;      If the symbol was not found, A=0.
	;;   TR0: if found, the entry flags.
	;;   TR1: if found, the address of the head of the definition.
	;;   TR2: if found, the address of the string label.

_rom_dictfind:
	STORE R30		; Save address of key

	LOAD TRAPRET		; Save return value
	STORE R29

	LOAD LASTENTRY
	STORE TIR2		; Store for indexing
	STORE TR1

	;; Examine a dictionary entry.
_rom_dictfind_loop:
	LOAD I TIR2		; Load the flags
	STORE TR0		; Store for returning

	;; Compare the searched key and the current key
	LOAD I TIR2		; Get the string pointer
	STORE TR2		; Store for returning
	STORE TIR0		; String A
	LOAD R30
	STORE TIR1		; String B
	TRAP T_STRCMP		; Run strcmp

	SNZ
	JMP _rom_dictfind_found	; A = 0 => found it!

	;; Didn't find it, move to the next one.
	LOAD I TIR2		; Load the LINK
	SNZ			; Is the LINK zero (NULL?)
	JMP I R29		; LINK=0: symbol not found, return 0.
	STORE TIR2		; Store the value back for indexing.
	STORE TR1		; Store for returning
	JMP _rom_dictfind_loop	; Try next one.

_rom_dictfind_found:
	LOAD I TIR2		; Skip the LINK
	LOAD TIR2		; Return a pointer to the body

	JMP I R29		; Return to saved address
	
// End of file.
