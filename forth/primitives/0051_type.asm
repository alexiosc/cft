// -*- asm -*-
//
// Converting from BASE to ASCII

	;; word:  <#
	;; alias: LESS-SHARP
	;; flags: ROM PRIMITIVE
	;; notes: <# ( -- )
	;;   Initialise a type conversion.
	LI 99			; The end of the buffer is just before the PAD.
	ADD CP
	STORE R convbuf
	STORE R convptr
	RTF


	;; word:  #>
	;; alias: SHARP-GREATER
	;; flags: ROM PRIMITIVE
	;; notes: ># ( -- addr n )
	;;   Ends pictured numeric output conversion. Puts the string address
	;;   and length on the stack ready for TYPE.
	LI 1
	ADD R convptr		; convptr + 1
	TRAP T_PUSH

	;; Terminate the string.
	LOAD BIT15
	OR I R convbuf		; Last character of the buffer (buffer top).
	STORE I R convbuf

	LOAD R convbuf

	;; Calculate and push the length.
	LOAD R convptr
	//ADD MINUS1
	NEG
	ADD R convbuf
	TRAP T_PUSH
	RTF


	;; word:  HOLD
	;; flags: ROM PRIMITIVE
	;; notes: HOLD ( char -- )
	;;   Inserts char into the pictured numeric output buffer. Should be used
	;;   betweem <# and #>.
	TRAP T_POP
	STORE I R convptr	; *convptr = c
	LOAD R convptr		; convptr--
	ADD MINUS1
	STORE R convptr
	RTF
	
// End of file.
