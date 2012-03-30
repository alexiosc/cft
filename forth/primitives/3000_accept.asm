;; // -*- asm -*-
;; //
;; // rudimentary line editing and terminal buffering

	;; TODO: Fix this
//.page
	
	;; word:  accept
	;; flags: CODE ROM CFT
	;; notes: accept ( a n -- a1 )
	;;   Receive up to n characters and store as a null-terminated UNPACKED
	;;   string starting at address a. Rudimentary editing facilities are
	;;   provided. Input is terminated when Return is pressed and no more
	;;   than n characters are accepted. The Return character is not
	;;   stored.
	;;
	;;   This word returns the first address UNUSED by the string and its
	;;   terminating null. That is, it returns a + len + 1 where len is
	;;   the length of the string in cells/characters.
	;; 
	;;   Caution: the input buffer must be n + 1 cells long. The additional
	;;   cell is used to hold the terminating null.
	;; 
	;;   Input buffer start address in TMP0
	;;   Input buffer end address (last addr + 1) in TMP1
	;;   Current input pointer (autoinc) TI0

 	POP (SP)	        ; The max number of characters to input
 	STORE TMP1		; Store temporarily

 	POP (SP)		; The starting address
 	STORE TMP0
 	ADD TMP1		; Add to produce the end address
 	STORE TMP1

	LOAD TMP0		; Begin at start address (of course)
	STORE TI0		; store for autoincrement

__accept_loop:
	LI IFL_NEWCHAR		; Do we have a new character?
	AND INPFR
	SNZ
	JMP __accept_loop

	LI IFL_NEWCHAR		; Clear the flag
	XOR MINUS1		; Faster than NOT
	AND INPFR
	STORE INPFR

	;; Return pressed?
	LI 13			; Is the character 13?
	XOR INPCH		; Compare.
	SNZ
	JMP __accept_end	; Yes.

	;; Backspace or delete pressed?
	LI 8			; Is it 8 (BS)?
	XOR INPCH
	SNZ
	JMP __accept_del	; Yes. Backspace.
	LI 127			; Is it 127 (DEL)?
	XOR INPCH
	SNZ
	JMP __accept_del	; Yes. Backspace.

	;; Ctrl-C?
	LI 3			; Is it 3 (ETX/^C)?
	XOR INPCH
	SNZ
	JMP __accept_ctrlc	; Yes. Handle Ctrl-C.

	;; Is it a printable character?
	LI 32
	NEG
	ADD INPCH
	SNN			; If >= 32 (non-negative), it's printable
	JMP __accept_loop	; If not, go back.

	;; Is the line buffer full?
	LOAD TI0		; Is the line buffer full?
	XOR R TMP1
	SNZ
	JMP __accept_full

	;; All good, add the character!
	LOAD INPCH		; Load the character
	STORE I TI0		; Add it to the buffer, autoincrement.
	PUTCHAR			; ...and output it.

	JMP __accept_loop

__accept_del:
	LOAD R TI0		; Load the input pointer
	XOR R TMP0		; Are we at the beginning of the buffer?
	SZA
	JMP __accept_dodel	; No. We can delete.
	PUTC(7)			; Yes. Ring the bell.
	JMP __accept_loop

__accept_dodel:
	// TODO: print an actual string here.
	PUTC(8)
	PUTC(32)
	PUTC(8)

	DECM(TI0)		; Decrement the input buffer pointer
	JMP __accept_loop	; Go again.

__accept_ctrlc:
	LI IFL_CTRLC		; Set the IFL_CTRLC input flag
	OR INPFR
	STORE INPFR

	LI 0			; Erase the input line.
	STORE I TMP0		; inputbuf[0] = 0

	// TODO: print an actual string here.
	PUTC(&5e)		; Print out ^C\n
	PUTC(&43)
	PUTC(10)
	JMP __accept_loop	; Exit. Let the caller decide what to do.

__accept_full:
	PUTC(7)			; Ring the BEL
	JMP __accept_loop
	
__accept_end:
	PUTC(32)		; As per Forth 83 standard

	LI 0
	STORE I TI0		; Null-terminate the string.
	STORE I TI0		; Null-terminate the string.

	LOAD TI0
	PUSH(SP)		; Push the next available address.
		
	NEXT			; Finished at last!


	
	;; word:  QUERY
	;; flags: DOCOL ROM
	;; notes: QUERY ( -- )
	;;        Set up the TIB and get a line from the terminal.

	.word dw_TIB		; TIB ( va )
	.word dw_fetch		; @ ( tib-addr )
	.word dw_pIN		; >IN ( tib-addr va )
	.word dw_store		; ! ( )
	
	.word dw_TIB		; TIB
	.word dw_fetch		; @ ( tib-addr )
	doLIT(TIBS)		; size of TIB ( tib-addr tib-size )
	.word dw_accept		; accept ( a )
	.word dw_DROP		; DROP ( a) \ ignore the returned address

	.word dw_EXIT		; EXIT
	
		
	
;; // End of file.
