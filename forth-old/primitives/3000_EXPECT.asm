// -*- asm -*-
//
// QUERY: rudimentary line editing
	
	;; word:  QUERY
	;; alias: QUERY
	;; flags: FFL_PRIMITIVE ROM CFT
	;; notes: QUERY ( addr n -- )
	;;   Receive up to n characters and store as a neg-terminated string
	;;   starting at address addr. Rudimentary editing facilities are
	;;   provided. Input is terminated when Return is pressed and no more
	;;   than n characters are accepted. The Return character is not
	;;   stored.
	TRAP T_POP		; The max number of characters to input
	STORE R inputbufend	; Store temporarily

	TRAP T_POP		; The starting address
	STORE R inputbase
	ADD R inputbufend	; Add to produce the end address
	STORE R inputbufend


__fl_expect:
	;; Prepare for input
	SEI			; Enable interrupts, or we'll have no input
	LOAD R inputbase	; inputptr = inputbase
	STORE LIPTR
	LOAD LIPTR
	
__fl_expect_loop:
	LI IFL_NEWCHAR		; Do we have a new character?
	AND R input_flags
	SNZ
	JMP __fl_expect_loop

	CLI			; Do this atomically: no interrupts!
	LI IFL_NEWCHAR		; Clear the flag
	NOT
	AND R input_flags
	STORE R input_flags
	SEI			; Re-enable interrupts.

	;; Return pressed?
	LI 13			; Is the character 13?
	XOR R last_inp_char
	SNZ
	JMP __fl_expect_end

	;; Backspace or delete pressed?
	LI 8			; Is it 8 (BS)?
	XOR R last_inp_char
	SNZ
	JMP __fl_expect_del
	LI 127			; Is it 127 (DEL)?
	XOR R last_inp_char
	SNZ
	JMP __fl_expect_del

	;; Ctrl-C?
	LI 3			; Is it 3 (ETX/^C)?
	XOR R last_inp_char
	SNZ
	JMP __fl_expect_ctrlc

	;; Is it a printable character?
	LI 32
	NEG
	ADD R last_inp_char
	SNN			; If >= 32 (non-negative), it's printable
	JMP __fl_expect_loop		; If not, go back.

	;; Is the line buffer full?
	LOAD LIPTR		; Is the line buffer full?
	XOR R inputbufend
	SNZ
	JMP __fl_expect_full

	;; All good, add the character!
	LOAD R last_inp_char	; Otherwise, load the character
	STORE I R LIPTR		; Add it to the buffer, autoincrement
	PUTCHAR			; ...and output it.

	JMP __fl_expect_loop

__fl_expect_del:
	LOAD R LIPTR		; Load the input pointer
	XOR R inputbase		; Are we at the beginning of the buffer?
	SZA
	JMP __fl_expect_dodel
	LI 7
	PUTCHAR
	JMP __fl_expect_loop

__fl_expect_dodel:
	LI 8
	PUTCHAR
	LI 32
	PUTCHAR
	LI 8
	PUTCHAR

	LOAD R MINUS1		; Decrement the input buffer pointer
	ADD R LIPTR
	STORE R LIPTR
	
	JMP __fl_expect_loop

__fl_expect_ctrlc:
	LI IFL_CTRLC		; Set the IFL_CTRLC input flag
	OR R input_flags
	STORE R input_flags

	LI 0
	STORE R I inputbase	; inputbuf[0] = 0

	LIA @+3			; Reference the string three words down
	TRAP T_PUTS
	JMP __fl_expect_ctrlc

	.strn "^C" 10

__fl_expect_full:
	LI 7			; BEL
	PUTCHAR
	JMP __fl_expect_loop
	
__fl_expect_end:
	LI 32
	PUTCHAR			; As per Forth 83 standard

	;; Is there any input?
	LOAD R LIPTR		; Load the input pointer
	XOR R inputbase		; Are we at the beginning of the buffer?
	SZA
	JMP __fl_expect_end1	; Nope.

	;; No input received. Null-terminate.
	LI 0
	STORE I R LIPTR
	RTF

__fl_expect_end1:
	;; Neg-Terminate the string
	LOAD LIPTR		; LIPTR autoindexes, so use another register
	ADD MINUS1
	STORE R31
	LOAD I R31
	OR BIT15
	STORE I R31

	RTF			; Return to Forth


// End of file.
	
