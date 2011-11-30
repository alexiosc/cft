// -*- asm -*-
//
// Interpreter-related primitives

	;; word:  QUIT
	;; alias: QUIT
	;; flags: ROM DOCOL
	;; notes: QUIT ( -- )
	;;   QUIT is the main interpreter loop.
	.word dw_CLRSTACK	; CLRSTACK
	.word dw__DOT_QUOTE
	.strn "Ready" 10

__quit_loop:
	.word dw_TIB
	.word dw_TIBMAX		; TIM TIBMAX OVER - QUERY
	.word dw_OVER
	.word dw_MINUS
	.word dw_QUERY

	.word dw_IN_0_STORE	; IN0!
	.word dw_INTERPRET	; INTERPRET
	.word dw_DEBUGOFF

	.word dw__DOT_QUOTE
	.strn " ok" 10

	.word dw__JMP		; Jump to...
	.word __quit_loop	;   self. (RECURSE)
	

	;; word:  INTERPRET
	;; flags: ROM DOCOL
	;; notes: INTERPRET ( -- )
	;;   Process and interpret user input.
	.word dw_BEGIN		; BEGIN

	.word dw__LIT		; 32 WORD
	.word 32
	.word dw_WORD

	;; Stack: addr

	.word dw_DUP		; DUP LEN 0=
	.word dw_LEN
	.word dw_ZERO_EQUALS

	;; Stack: addr flag

	.word dw__IF		; IF ( skips according to next word if top of stack is non-zero )
	.word __interpret_endif0

	.word dw_RDROP		; RDROP
	.word dw_DROP		; DROP
	.word dw_EXIT		; EXIT
__interpret_endif0:

	;; Stack: addr
	
	.word dw_FIND		; FIND 0=
	.word dw_ZERO_EQUALS	;

	;; Stack: head/addr flag

	.word dw__IF		; _IF (#2)
	.word __interpret_endif1

	.word dw_DUP		; DUP _NUMBER
	.word dw__NUMBER

	.word dw__IF		; IF
	.word __interpret_endif2
	.word dw_SWAP		; SWAP DROP AGAIN
	.word dw_DROP
	.word dw_AGAIN
__interpret_endif2:		; THEN
	
	.word dw_PUTS		; . 63 EMIT SPACE AGAIN
	.word dw__LIT
	.word 63
	.word dw_EMIT
	.word dw_SPACE
	.word dw_AGAIN

__interpret_endif1:
	.word dw_EXECUTE	; EXECUTE

	.word dw_AGAIN		; AGAIN
	

	;; word:  EXECUTE
	;; alias: EXECUTE
	;; flags: PRIMITIVE ROM
	;; notes: EXECUTE ( addr -- )
	;;   Executes the Forth word with compilation address addr.
	TRAP T_POP		; Pop the address
	STORE R31
	LI 3			; body = head + 3
	ADD R31

	;; Set us up for double indirection.
	STORE R31		; Store the address of the body in R31
	LOAD I R31		; Then store the address of R31 into the IP
	STORE R30

	LOAD R31
	INC			; Get the PFA
	STORE PFA

	JMP I R30		; Jump to the code handler.
	;; Note: we never RTF.
	

	;; word:  TIB
	;; alias: TIB
	;; flags: PRIMITIVE ROM
	;; notes: TIB ( -- a )
	;;   a is the address of the character input buffer for interpretation.
	LOAD R inputbase
	TRAP T_PUSH
	RTF
	

	;; word:  TIBMAX
	;; alias: TIBMAX
	;; flags: PRIMITIVE ROM
	;; notes: TIBMAX ( -- a )
	;;   a is the maximum adress of the character input buffer plus 1.
	LOAD R inputbufend
	ADD MINUS1
	TRAP T_PUSH
	RTF
	

	;; word:  '
	;; alias: tick
	;; flags: PRIMITIVE ROM
	;; notes: ' ( str -- a )
	;;   a is the head (compilation) address of the dictionary entry
	;;   for the string at address str.

	TRAP T_POP		; Address of string to search for
	TRAP T_DICTFIND		; Look for the dictionary entry

	SNZ			; Found?
	JMP __fl_tick_nfound	; A != 0 => found it!

	;; The entry was found. Push the head (which T_DICTFIND left
	;; in TR0).
	LOAD TR0
	TRAP T_PUSH
	RTF

__fl_tick_nfound:
	LI ERR_NFOUND		; Key not found.
	STORE R errno
	RTF

	;; page padding...
	.fill 11 &beef		; PAD
	

	;; word:  FIND
	;; alias: FIND
	;; flags: PRIMITIVE ROM
	;; notes: FIND ( str -- a n )

	;;   Check if a dictionary entry exists. The entry is a neg-terminated
	;;   string with address str. If the entry is not found, a == str
	;;   and n == 0. If the entry is found, a is the head of the entry.
	;;   If the word is immediate, a == 1. If it is not, a == -1.
	TRAP T_PEEK		; Address of string to search for
	STORE R31
	TRAP T_UPCASE		; Convert to upper case
	LOAD R31
	TRAP T_DICTFIND		; Look for the dictionary entry

	SNZ			; Found?
	JMP __fl_find_nfound	; A != 0 => found it!

	;; The entry was found.
	LOAD TR0		; TR0 holds the flags (pop clobbers TR0).
	STORE R31
	TRAP T_POP		; Pop and discard str.

	LOAD TR1
	TRAP T_PUSH		; Push the dict entry head.

	;; Check the flags. Twos complement magic follows.
	LI FFL_IMMEDIATE        ; Check for the immediate flag
	AND R31			; R31 still holds the flags.
	SZA			; Flag set?
	LI MINUS2		; the flag is set. load -2.
	NOT			; If A=0, a<-&ffff (-1, non-immediate).
	TRAP T_PUSH	        ; If A=-2, a<-&0002 (NOT &fffe = &0001)
	RTF

__fl_find_nfound:
	LI 0
	TRAP T_PUSH
	RTF
	

	;; word:  IP!
	;; alias: IP-store
	;; flags: PRIMITIVE ROM CMPLONLY
	;; notes: IP! ( addr -- )
	;;   An unconditional jump to address addr.
	TRAP T_POP
	STORE IP
	RTF
	

	;; word:  >BODY
	;; alias: to-body
	;; flags: PRIMITIVE ROM
	;; notes: >BODY ( w1 -- w2 )
	;;   w2 is the address of the body of the dictionary entry with address w1.
	TRAP T_POP
	STORE R31
	LI 3			; body = head + 3
	ADD R31
	TRAP T_PUSH
	RTF
	

	;; word:  >INPTR
	;; alias: to-inptr
	;; flags: PRIMITIVE ROM CFT
	;; notes: >INPTR ( -- w )
	;;   w2 is the address of the pointer to the next character in the input stream.
	;;   I.e., a pointer to the pointer to the next character in the input stream
	;;   (double indirection).
	LI LIPTR
	TRAP T_PUSH
	RTF
	

	;; word:  IN0!
	;; alias: in-0-store
	;; flags: PRIMITIVE ROM CFT
	;; notes: IN0! ( -- )
	;;   Sets the input pointer to the start of the input buffer.
	LOAD R inputbase
	STORE LIPTR
	RTF
	

	;; word:  INPTR
	;; alias: inptr
	;; flags: PRIMITIVE ROM CFT
	;; notes: INPTR ( -- w )
	;;   w2 is the address of the next character in the input stream.
	;;  (single indirection)
	LOAD LIPTR
	TRAP T_PUSH
	RTF
	

	;; word:  IN@+
	;; alias: in-fetch-inc
	;; flags: PRIMITIVE ROM CFT
	;; notes: IN@+ ( -- c )
	;;   c is the next character in the input stream. If bit15 is set, then
	;;   IN@+ 32767 AND is the last character in the stream. The pointer is
	;;   incremented to the next character (even if this is the last one).
	LOAD I LIPTR
	TRAP T_PUSH
	RTF
	

	;; word:  HERE
	;; flags: PRIMITIVE ROM
	;; notes: HERE ( -- addr )
	;;   pushes the address of the first free 16-bit word in the dictionary
	LOAD CP
	TRAP T_PUSH
	RTF			; Return to Forth
	

	;; word:  PAD
	;; flags: PRIMITIVE ROM
	;; notes: PAD ( -- addr )
	;;   pushes the address of the pad (HERE 100 +).

	LI 100			; Arbitrarily add 100 words to CP
	ADD CP			; Returns HERE 100 +
	TRAP T_PUSH
	RTF			; Return to Forth
	

// End of file.
