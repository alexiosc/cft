;; // -*- asm -*-
;; //
;; // rudimentary line editing and terminal buffering

	;; TODO: Fix this
.page
	
	;; Subroutine: getch
	;;
	;; Inputs:
	;;   None.
	;;
	;; Outputs:
	;;   INCH: character received.
	;;   INPFR: new input flags.

_getch:
	LI IFL_NEWCHAR		; Do we have a new character?
	AND INPFR
	SNZ
	JMP _getch

	LI IFL_NEWCHAR		; Clear the flag
	XOR MINUS1		; Faster than NOT
	AND INPFR
	STORE INPFR
	RET

	
	
	;; word:  KEY
	;; flags: CODE ROM CFT
	;; notes: KEY ( -- c )
	;;        Returns the next available character from the terminal.

	JSR _getch
	RPUSH(SP, INPCH)
	NEXT



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
	JSR _getch

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
	//STORE I TI0		; Null-terminate the string.

	LOAD TI0
	PUSH(SP)		; Push the next available address.
		
	NEXT			; Finished at last!


	
	;; word:  EXPECT
	;; flags: DOCOL ROM
	;; notes: EXPECT ( a +n -- )
	;;        Wrapper around accept for F83 compatibility.
	;; code:  : EXPECT ( a +n -- ) accept DROP ;

	;; ( a +n ) OVER TIB ! ( a +n ) \ Set up TIB
	.word dw_OVER		; ( a +n a )
	.word dw_TIB		; TIB ( a +n va )
	.word dw_store		; ! ( a + n )

	;; 0 >IN ! \ Set up >IN
	doLIT(0)
	.word dw_ofsIN
	.word dw_store

	;; $accept ( a+len+1 ) \ read input
	.word dw_accept		; $accept ( a+len+1 )

	;; TIB @ - ( len+1 ) 1- ( len ) \ get string length
	.word dw_TIB		; TIB ( a+len+1 va )
	.word dw_fetch		; @  ( a+len+1 a )
	.word dw_sub		; - ( len+1 )
	.word dw_dec		; 1- ( len)

	;; #TIB ! ( )
	.word dw_cTIB		; #TIB ( len va )
	.word dw_store		; ! ( )

	.word dw_EXIT


	
	;; word:  getline
	;; flags: DOCOL ROM
	;; notes: getline ( -- )
	;;        Get the next line from the current block.

	;; TODO: separate this into two words so line parsing can be used separately.
	
	;; BLKBUF @ DUP >BLK @ + ( buf a ) \ start address for parse
	.word dw_BLKBUF
	.word dw_fetch		; ( buf )
	.word dw_DUP		; ( buf buf )
	.word dw_pBLK
	.word dw_fetch
	.word dw_add		; ( buf b )

	;; SWAP BLKBS + ( b e ) \ Get end address
	.word dw_SWAP		; SWAP ( b buf )
	.word dw_BLKBS		; BLKBS ( b buf +n )
	.word dw_add		; + ( b e )

	doLIT(10)		; 10 ( b e c )

	.word dw__parse		; $parse ( b u +n )

	;; Adjust >BLK
	.word dw_pBLK		; >BLK ( b u +n va )
	.word dw_plus_store	; +! ( b u )

	;; Debugging
	.word dw_2DUP
	.word dw_TYPE

	;; Store line length
	.word dw_cBLK		; #BLK (b u va )
	.word dw_store		; ! ( b )
	
	;; 0 >IN ! \ Set >IN
	doLIT(0)
	.word dw_ofsIN
	.word dw_store

	.word dw_EXIT

	
	
	;; word:  QUERY
	;; flags: DOCOL ROM
	;; notes: QUERY ( -- )
	;;        Get a line from the terminal or from the current block.

	.word dw_BLK
	.word dw_fetch
	.word dw_if_branch
	.word _query_tty

_query_blk:
	.word dw_EOBq		; EOB?
	.word dw_if_branch	;   (if false...)
	.word _query_blk1	;   ... then read a line

	;; 0 BLK ! RECURSE \ Stop reading from the block, QUERY again.
	doLIT(0)
	.word dw_BLK
	.word dw_store		; 0 BLK !
	.word dw_branch
	.word _query_tty	; RECURSE ( sort of )
	
_query_blk1:
	.word dw_getline	; BLKBUF0 ( va )
	.word dw_EXIT

_query_tty:
	;; TIBADDR @ TIBS EXPECT
	.word dw_TIBADDR
	.word dw_fetch
	.word dw_TIBS
	.word dw_EXPECT
	.word dw_EXIT
	
		
	
;; // End of file.
