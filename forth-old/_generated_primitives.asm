// -*- asm -*-

///////////////////////////////////////////////////////////////////////////////
//
// FORTH PRIMITIVES
//
// WARNING: Generated automatically from primitives/*.asm using
// mkprimitives.py. Do not modify directly.
//
///////////////////////////////////////////////////////////////////////////////

_primitive_dict:



///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/0000_basics.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// Basic primitives

	;; word:  EXIT
	;; flags: PRIMITIVE ROM
        ;;   word EXIT defined in primitives/0000_basics.asm:6.
dw_EXIT_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_EXIT          ; Pointer to word name (above)
        .word NULL              ; Link to previous dictionary entry
dw_EXIT:
        .word @+1               ; Code entry point: next instruction
dw_EXIT_pfa:
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
        ;;   word _DOCOL defined in primitives/0000_basics.asm:26.
dw__DOCOL_head:
        .word FFL_PRIMITIVE FFL_ROM FFL_CPH ; Flags
        .word dwn__DOCOL        ; Pointer to word name (above)
        .word dw_EXIT_head      ; Link to previous dictionary entry
dw__DOCOL:
        .word @+1               ; Code entry point: next instruction
dw__DOCOL_pfa:
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
        ;;   word _VAR defined in primitives/0000_basics.asm:50.
dw__VAR_head:
        .word FFL_PRIMITIVE FFL_ROM FFL_CPH ; Flags
        .word dwn__VAR          ; Pointer to word name (above)
        .word dw__DOCOL_head    ; Link to previous dictionary entry
dw__VAR:
        .word @+1               ; Code entry point: next instruction
dw__VAR_pfa:
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
        ;;   word NEXT defined in primitives/0000_basics.asm:65.
dw_NEXT_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_NEXT          ; Pointer to word name (above)
        .word dw__VAR_head      ; Link to previous dictionary entry
dw_NEXT:
        .word @+1               ; Code entry point: next instruction
dw_NEXT_pfa:
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


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/0001_ok.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// Define the NOP primitive

	;; word:  OK
	;; flags: ROM PRIMITIVE
        ;;   word OK defined in primitives/0001_ok.asm:6.
dw_OK_head:
        .word FFL_ROM FFL_PRIMITIVE ; Flags
        .word dwn_OK            ; Pointer to word name (above)
        .word dw_NEXT_head      ; Link to previous dictionary entry
dw_OK:
        .word @+1               ; Code entry point: next instruction
dw_OK_pfa:

	;; primitive code follows.

	;; Print out an OK prompt

	;; End of primitive
__forth_ok:
	LIA @+3
	TRAP T_PUTS
	RTF
	.strn "  ok" 10


// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/0050_numbers.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- mode: asm; tab-width: 20; comment-column: 40 -*-
//
// Numbers, base conversion, etc.

	;; word:  BASE
	;; flags: VARIABLE ROM
        ;;   word BASE defined in primitives/0050_numbers.asm:6.
dw_BASE_head:
        .word FFL_VARIABLE FFL_ROM ; Flags
        .word dwn_BASE          ; Pointer to word name (above)
        .word dw_OK_head        ; Link to previous dictionary entry
dw_BASE:
        .word dw__VAR           ; Code entry point: next instruction
dw_BASE_pfa:
	;; notes: BASE ( -- addr )
	;;   Puts the address of the BASE variable on the stack.
	;;
	;;   Expects: rstack: the IP to go to. No increment.
	.word numbase


	;; word:  DIGIT?
	;; alias: DIGIT-QUESTION
	;; flags: PRIMITIVE ROM
        ;;   word DIGIT? defined in primitives/0050_numbers.asm:16.
dw_DIGIT_QUESTION_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_DIGIT_QUESTION ; Pointer to word name (above)
        .word dw_BASE_head      ; Link to previous dictionary entry
dw_DIGIT_QUESTION:
        .word @+1               ; Code entry point: next instruction
dw_DIGIT_QUESTION_pfa:
	;; notes: DIGIT? ( c -- flag )
	;;   Flag is true if c represents the ASCII character of a valid
	;;   digit in the current BASE.
	TRAP T_POP
	TRAP T_DIGIT
	TRAP T_PUSH
	RTF


	;; word:  DIGIT
	;; flags: PRIMITIVE ROM
        ;;   word DIGIT defined in primitives/0050_numbers.asm:27.
dw_DIGIT_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_DIGIT         ; Pointer to word name (above)
        .word dw_DIGIT_QUESTION_head ; Link to previous dictionary entry
dw_DIGIT:
        .word @+1               ; Code entry point: next instruction
dw_DIGIT_pfa:
	;; notes: DIGIT ( c -- n )
	;;   n is the number represented by the digit c in the current BASE.
	;;   If the digit is not valid, n is -1.
	TRAP T_POP
	TRAP T_DIGIT
	LOAD TR0
	TRAP T_PUSH
	RTF


	;; word:  _NUMBER
	;; flags: PRIMITIVE ROM
        ;;   word _NUMBER defined in primitives/0050_numbers.asm:39.
dw__NUMBER_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn__NUMBER       ; Pointer to word name (above)
        .word dw_DIGIT_head     ; Link to previous dictionary entry
dw__NUMBER:
        .word @+1               ; Code entry point: next instruction
dw__NUMBER_pfa:
	;; notes: DIGIT ( addr -- n )
	;;   parses a number from the string in addr and pushes it onto the stack.
	;;   Uses the current BASE.
	//LI 32
	//TRAP T_FORTH_WORD

	TRAP T_POP
	STORE TIR0		; Store the char pointer for parsing
	STORE TR0
	LI 0
	STORE R29
	STORE R27		; R27 == 1 ==> negative number

	;; Is the first character + or -?
	LI 45			; '-'?
	XOR I TR0
	SNZ
	JMP _fl__NUM_neg

	LI 43			; '+'?
	XOR I TR0
	SNZ
	JMP _fl__NUM_pos

_fl__NUM_parse:	LOAD I TIR0
	SNZ
	JMP _fl__NUM_done	; NULL termination
	STORE R28

	LOAD R numbase	; Multiply the partial sum by BASE
	STORE TR0
	LOAD R29	; Partial sum
	STORE TR1
	TRAP T_MUL16	; Multiply
	LOAD TR2
	STORE R29	; Store it.

	LOAD R28
	AND NOTBIT15	; Process the character
	TRAP T_DIGIT
	SNZ	; Ensure the digit is valid
	JMP _fl__NUM_error	;   and bail out if it isn't.

	LOAD TR0
	ADD R29	; Add it to the partial sum
	STORE R29
	//PRINTD

	LOAD R28	; Neg termination
	SPA
	JMP _fl__NUM_done

	JMP _fl__NUM_parse

_fl__NUM_neg:	LI 1	; Set the negative flag
	STORE R27	; Store it for later

_fl__NUM_pos:	LOAD I TIR0
	JMP _fl__NUM_parse

_fl__NUM_done:	LOAD R27	; Did we see a '-' prefix earlier?
	SZA
	JMP _fl__NUM_negate	; Yes.

	LOAD R29



_fl__NUM_push:	TRAP T_PUSH
	LOAD MINUS1
	TRAP T_PUSH
	RTF

_fl__NUM_negate:	LOAD R29
	NEG
	JMP _fl__NUM_push

_fl__NUM_error:	LI ERR_BADNUM
	STORE R errno
	LI 0
	TRAP T_PUSH
	RTF

// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/0051_type.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// Converting from BASE to ASCII

	;; word:  <#
	;; alias: LESS-SHARP
	;; flags: ROM PRIMITIVE
        ;;   word <# defined in primitives/0051_type.asm:7.
dw_LESS_SHARP_head:
        .word FFL_ROM FFL_PRIMITIVE ; Flags
        .word dwn_LESS_SHARP    ; Pointer to word name (above)
        .word dw__NUMBER_head   ; Link to previous dictionary entry
dw_LESS_SHARP:
        .word @+1               ; Code entry point: next instruction
dw_LESS_SHARP_pfa:
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
        ;;   word #> defined in primitives/0051_type.asm:19.
dw_SHARP_GREATER_head:
        .word FFL_ROM FFL_PRIMITIVE ; Flags
        .word dwn_SHARP_GREATER ; Pointer to word name (above)
        .word dw_LESS_SHARP_head ; Link to previous dictionary entry
dw_SHARP_GREATER:
        .word @+1               ; Code entry point: next instruction
dw_SHARP_GREATER_pfa:
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
        ;;   word HOLD defined in primitives/0051_type.asm:44.
dw_HOLD_head:
        .word FFL_ROM FFL_PRIMITIVE ; Flags
        .word dwn_HOLD          ; Pointer to word name (above)
        .word dw_SHARP_GREATER_head ; Link to previous dictionary entry
dw_HOLD:
        .word @+1               ; Code entry point: next instruction
dw_HOLD_pfa:
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


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/0100_memory.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// Define memory-related primitives

	;; word:  @
	;; alias: FETCH
	;; flags: FFL_PRIMITIVE ROM
        ;;   word @ defined in primitives/0100_memory.asm:7.
dw_FETCH_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_FETCH         ; Pointer to word name (above)
        .word dw_HOLD_head      ; Link to previous dictionary entry
dw_FETCH:
        .word @+1               ; Code entry point: next instruction
dw_FETCH_pfa:
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
        ;;   word ! defined in primitives/0100_memory.asm:20.
dw_STORE_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_STORE         ; Pointer to word name (above)
        .word dw_FETCH_head     ; Link to previous dictionary entry
dw_STORE:
        .word @+1               ; Code entry point: next instruction
dw_STORE_pfa:
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
        ;;   word +! defined in primitives/0100_memory.asm:33.
dw_PLUS_STORE_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_PLUS_STORE    ; Pointer to word name (above)
        .word dw_STORE_head     ; Link to previous dictionary entry
dw_PLUS_STORE:
        .word @+1               ; Code entry point: next instruction
dw_PLUS_STORE_pfa:
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
        ;;   word ALLOT defined in primitives/0100_memory.asm:45.
dw_ALLOT_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_ALLOT         ; Pointer to word name (above)
        .word dw_PLUS_STORE_head ; Link to previous dictionary entry
dw_ALLOT:
        .word @+1               ; Code entry point: next instruction
dw_ALLOT_pfa:
	;; notes: ALLOT ( word -- )
	;;   Allots word words on the dictionary, changes HERE accordingly.

	TRAP T_POP
	ADD CP
	STORE CP
	RTF			; Return to Forth


	;; word:  ,
	;; alias: comma
	;; flags: FFL_PRIMITIVE ROM
        ;;   word , defined in primitives/0100_memory.asm:57.
dw_COMMA_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_COMMA         ; Pointer to word name (above)
        .word dw_ALLOT_head     ; Link to previous dictionary entry
dw_COMMA:
        .word @+1               ; Code entry point: next instruction
dw_COMMA_pfa:
	;; notes: , ( word -- )
	;;   Allots space for word, then stores word at HERE 1-.

	TRAP T_POP
	STORE I CP		; CP autoincrements.
	RTF			; Return to Forth


	;; word:  FILL
	;; flags: FFL_PRIMITIVE ROM
        ;;   word FILL defined in primitives/0100_memory.asm:67.
dw_FILL_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_FILL          ; Pointer to word name (above)
        .word dw_COMMA_head     ; Link to previous dictionary entry
dw_FILL:
        .word @+1               ; Code entry point: next instruction
dw_FILL_pfa:
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
        ;;   word CMOVE defined in primitives/0100_memory.asm:93.
dw_CMOVE_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_CMOVE         ; Pointer to word name (above)
        .word dw_FILL_head      ; Link to previous dictionary entry
dw_CMOVE:
        .word @+1               ; Code entry point: next instruction
dw_CMOVE_pfa:
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
        ;;   word COUNT defined in primitives/0100_memory.asm:111.
dw_COUNT_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_COUNT         ; Pointer to word name (above)
        .word dw_CMOVE_head     ; Link to previous dictionary entry
dw_COUNT:
        .word @+1               ; Code entry point: next instruction
dw_COUNT_pfa:
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


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/0250_stack.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// Define the NAME primitive

	;; word:  DROP
	;; flags: FFL_PRIMITIVE ROM
        ;;   word DROP defined in primitives/0250_stack.asm:6.
dw_DROP_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_DROP          ; Pointer to word name (above)
        .word dw_COUNT_head     ; Link to previous dictionary entry
dw_DROP:
        .word @+1               ; Code entry point: next instruction
dw_DROP_pfa:
	;; notes: DROP ( word -- )
	;;   Drops a word from the stack
	TRAP T_POP
	RTF			; Return to Forth


	;; word:  DUP
	;; flags: FFL_PRIMITIVE ROM
        ;;   word DUP defined in primitives/0250_stack.asm:14.
dw_DUP_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_DUP           ; Pointer to word name (above)
        .word dw_DROP_head      ; Link to previous dictionary entry
dw_DUP:
        .word @+1               ; Code entry point: next instruction
dw_DUP_pfa:
	;; notes: DUP ( word -- word word )
	;;   Duplicates the top word on the stack.
	TRAP T_PEEK
	TRAP T_PUSH
	RTF			; Return to Forth


	;; word:  ?DUP
	;; alias: question-dup
	;; flags: FFL_PRIMITIVE ROM
        ;;   word ?DUP defined in primitives/0250_stack.asm:24.
dw_QUESTION_DUP_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_QUESTION_DUP  ; Pointer to word name (above)
        .word dw_DUP_head       ; Link to previous dictionary entry
dw_QUESTION_DUP:
        .word @+1               ; Code entry point: next instruction
dw_QUESTION_DUP_pfa:
	;; notes: ?DUP ( word -- word word )
	;;   Duplicates the top word on the stack if it is non-zero
	TRAP T_PEEK
	SZA
	TRAP T_PUSH
	RTF			; Return to Forth


	;; word:  SWAP
	;; flags: FFL_PRIMITIVE ROM
        ;;   word SWAP defined in primitives/0250_stack.asm:34.
dw_SWAP_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_SWAP          ; Pointer to word name (above)
        .word dw_QUESTION_DUP_head ; Link to previous dictionary entry
dw_SWAP:
        .word @+1               ; Code entry point: next instruction
dw_SWAP_pfa:
	;; notes: DUP ( word1 word2 -- word2 word1 )
	;;   Swaps the top two words on the stack.
	TRAP T_POP
	STORE R31		; word2
	TRAP T_POP
	STORE R30		; word1

	LOAD R31		; word2
	TRAP T_PUSH
	LOAD R30		; word1
	TRAP T_PUSH

	RTF			; Return to Forth


	;; word:  SP@
	;; alias: sp-fetch
	;; flags: FFL_PRIMITIVE ROM
        ;;   word SP@ defined in primitives/0250_stack.asm:52.
dw_SP_FETCH_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_SP_FETCH      ; Pointer to word name (above)
        .word dw_SWAP_head      ; Link to previous dictionary entry
dw_SP_FETCH:
        .word @+1               ; Code entry point: next instruction
dw_SP_FETCH_pfa:
	;; notes: SP@ ( -- word )
	;;   Pushes the address of the data stack pointer onto the stack itself.
	LOAD I R dstack		; Load the stack pointer
	TRAP T_PUSH		; Push
	RTF			; Return to Forth


	;; word:  SPMAX
	;; alias: SPMAX
	;; flags: FFL_PRIMITIVE ROM
        ;;   word SPMAX defined in primitives/0250_stack.asm:62.
dw_SPMAX_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_SPMAX         ; Pointer to word name (above)
        .word dw_SP_FETCH_head  ; Link to previous dictionary entry
dw_SPMAX:
        .word @+1               ; Code entry point: next instruction
dw_SPMAX_pfa:
	;; notes: SPMAX ( -- word )
	;;   Pushes the maximum address of the data stack pointer onto the stack itself.
	LOAD R dstack		; Load the stack pointer
	INC
	STORE TR0
	LOAD I TR0
	TRAP T_PUSH		; Push
	RTF			; Return to Forth


	;; word:  OVER
	;; alias: OVER
	;; flags: FFL_PRIMITIVE ROM
        ;;   word OVER defined in primitives/0250_stack.asm:75.
dw_OVER_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_OVER          ; Pointer to word name (above)
        .word dw_SPMAX_head     ; Link to previous dictionary entry
dw_OVER:
        .word @+1               ; Code entry point: next instruction
dw_OVER_pfa:
	;; notes: OVER ( a b -- a b a )
	;;   Push onto the stack the second topmost value.
	LI 1
	TRAP T_NPEEK
	TRAP T_PUSH
	RTF			; Return to Forth


	;; word:  PICK
	;; alias: PICK
	;; flags: FFL_PRIMITIVE ROM
        ;;   word PICK defined in primitives/0250_stack.asm:86.
dw_PICK_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_PICK          ; Pointer to word name (above)
        .word dw_OVER_head      ; Link to previous dictionary entry
dw_PICK:
        .word @+1               ; Code entry point: next instruction
dw_PICK_pfa:
	;; notes: PICK ( +n -- a )
	;;   Pushes the nth topmost value of the data stack back onto the stack.
	;;   0 PICK is equivalent to DUP.
	;;   1 PICK is equivalent to OVER.
	LI 1
	TRAP T_NPEEK
	TRAP T_PUSH
	RTF			; Return to Forth


	;; word:  ROT
	;; alias: ROT
	;; flags: FFL_PRIMITIVE ROM
        ;;   word ROT defined in primitives/0250_stack.asm:99.
dw_ROT_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_ROT           ; Pointer to word name (above)
        .word dw_PICK_head      ; Link to previous dictionary entry
dw_ROT:
        .word @+1               ; Code entry point: next instruction
dw_ROT_pfa:
	;; notes: ROT ( a b c -- b c a )
	;;   Rotates the topmost three stack values so that the third
	;;   topmost value becomes the top.
	;;
	LI 2			; Verify stack depth and get the first number
	TRAP T_NPEEK
	STORE R31
	LOAD TR0		; SP-2 is the address of a
	ADD PLUS1
	STORE TIR0

	LOAD I TIR0		; Read b
	STORE R30
	LOAD I TIR0		; Read c
	STORE R29

	LOAD TR0
	STORE TIR0

	LOAD R30		; Store b in position SP-2
	STORE I TIR0
	LOAD R29		; Store c in position SP-1
	STORE I TIR0
	LOAD R31		; Store a in position SP
	STORE I TIR0
	RTF			; Return to Forth


	;; word:  ROLL
	;; alias: ROLL
	;; flags: FFL_PRIMITIVE ROM
        ;;   word ROLL defined in primitives/0250_stack.asm:130.
dw_ROLL_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_ROLL          ; Pointer to word name (above)
        .word dw_ROT_head       ; Link to previous dictionary entry
dw_ROLL:
        .word @+1               ; Code entry point: next instruction
dw_ROLL_pfa:
	;; notes: ROLL ( n -- )
	;;   The n-th stack value (not counting n itself) is removed from the
	;;   stack and placed to the top. Values on top of the n-th one are moved
	;;   one down to accommodate this. For example, a b c d 2 ROLL gives a c d
	;;   b. 0 ROLL does nothing.
	;;

	TRAP T_POP		; Get the n value.
	STORE R30

	TRAP T_NPEEK		; Peek the stack and validate n
	STORE R29		; Store for later.

	LOAD TR0		; Address of the nth value
	STORE TIR1		; Store target address

	INC
	STORE TIR0		; Store source address

	LOAD R30
	STORE TR0		; Number of words to copy

	TRAP T_MEMCPY		; Copy TR0 words from TIR0 to TIR1.
	LOAD R29
	STORE I TIR1

	RTF			; Return to Forth


	;; word:  DEPTH
	;; alias: DEPTH
	;; flags: FFL_PRIMITIVE ROM
        ;;   word DEPTH defined in primitives/0250_stack.asm:162.
dw_DEPTH_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_DEPTH         ; Pointer to word name (above)
        .word dw_ROLL_head      ; Link to previous dictionary entry
dw_DEPTH:
        .word @+1               ; Code entry point: next instruction
dw_DEPTH_pfa:
	;; notes: DEPTH ( -- n )
	;;   n is the number of 16-bit words on the data stack before n was pushed onto it.
	;;
	LOAD R dstack		; Subtract the start address of the stack from the SP.
	NEG
	ADD I R dstack
	ADD MINUS2		; The first two words in a stack are for housekeeping
	TRAP T_PUSH
	RTF			; Return to Forth



	;; word:  CLDSTACK
	;; alias: CLDSTACK
	;; flags: FFL_PRIMITIVE ROM
        ;;   word CLDSTACK defined in primitives/0250_stack.asm:177.
dw_CLDSTACK_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_CLDSTACK      ; Pointer to word name (above)
        .word dw_DEPTH_head     ; Link to previous dictionary entry
dw_CLDSTACK:
        .word @+1               ; Code entry point: next instruction
dw_CLDSTACK_pfa:
	;; notes: CLDSTACK ( -- )
	;;   Clears the data stack.
	;;
	LOAD R dstack
	ADD PLUS2
	STORE I R dstack
	RTF			; Return to Forth


// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/0300_arithmetic.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// Arithmetic primitives

	;; word:  +
	;; alias: PLUS
	;; flags: FFL_PRIMITIVE ROM
        ;;   word + defined in primitives/0300_arithmetic.asm:7.
dw_PLUS_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_PLUS          ; Pointer to word name (above)
        .word dw_CLDSTACK_head  ; Link to previous dictionary entry
dw_PLUS:
        .word @+1               ; Code entry point: next instruction
dw_PLUS_pfa:
	;; notes: PLUS ( a b -- sum )
	;;   sum is the sum of a and b.

	TRAP T_POP		; b
	STORE R31
	TRAP T_POP		; a
	ADD R31
	TRAP T_PUSH
	RTF			; Return to Forth

	;; word:  1+
	;; alias: ONE-PLUS
	;; flags: FFL_PRIMITIVE ROM
        ;;   word 1+ defined in primitives/0300_arithmetic.asm:20.
dw_ONE_PLUS_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_ONE_PLUS      ; Pointer to word name (above)
        .word dw_PLUS_head      ; Link to previous dictionary entry
dw_ONE_PLUS:
        .word @+1               ; Code entry point: next instruction
dw_ONE_PLUS_pfa:
	;; notes: 1+ ( a -- b )
	;;   b is a + 1.

	TRAP T_POP		; a
	INC
	TRAP T_PUSH
	RTF			; Return to Forth

	;; word:  2+
	;; alias: TWO-PLUS
	;; flags: FFL_PRIMITIVE ROM
        ;;   word 2+ defined in primitives/0300_arithmetic.asm:31.
dw_TWO_PLUS_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_TWO_PLUS      ; Pointer to word name (above)
        .word dw_ONE_PLUS_head  ; Link to previous dictionary entry
dw_TWO_PLUS:
        .word @+1               ; Code entry point: next instruction
dw_TWO_PLUS_pfa:
	;; notes: 2+ ( a -- b )
	;;   b is a + 2.

	TRAP T_POP		; a
	ADD PLUS2		; a+2
	TRAP T_PUSH
	RTF			; Return to Forth

	;; word:  -
	;; alias: MINUS
	;; flags: FFL_PRIMITIVE ROM
        ;;   word - defined in primitives/0300_arithmetic.asm:42.
dw_MINUS_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_MINUS         ; Pointer to word name (above)
        .word dw_TWO_PLUS_head  ; Link to previous dictionary entry
dw_MINUS:
        .word @+1               ; Code entry point: next instruction
dw_MINUS_pfa:
	;; notes: PLUS ( a b -- sum )
	;;   sum is the sum of a and b.

	TRAP T_POP		; b
	NEG			; -b
	STORE R31
	TRAP T_POP		; a
	ADD R31
	TRAP T_PUSH
	RTF			; Return to Forth

	;; word:  1-
	;; alias: ONE-MINUS
	;; flags: FFL_PRIMITIVE ROM
        ;;   word 1- defined in primitives/0300_arithmetic.asm:56.
dw_ONE_MINUS_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_ONE_MINUS     ; Pointer to word name (above)
        .word dw_MINUS_head     ; Link to previous dictionary entry
dw_ONE_MINUS:
        .word @+1               ; Code entry point: next instruction
dw_ONE_MINUS_pfa:
	;; notes: 1- ( a -- b )
	;;   b is a -1.

	TRAP T_POP		; a
	ADD MINUS1		; a - 1
	TRAP T_PUSH
	RTF			; Return to Forth


	;; word:  2-
	;; alias: TWO-MINUS
	;; flags: FFL_PRIMITIVE ROM
        ;;   word 2- defined in primitives/0300_arithmetic.asm:68.
dw_TWO_MINUS_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_TWO_MINUS     ; Pointer to word name (above)
        .word dw_ONE_MINUS_head ; Link to previous dictionary entry
dw_TWO_MINUS:
        .word @+1               ; Code entry point: next instruction
dw_TWO_MINUS_pfa:
	;; notes: 2- ( a -- b )
	;;   b is a - 2.

	TRAP T_POP		; a
	ADD MINUS2		; a - 2
	TRAP T_PUSH
	RTF			; Return to Forth


	;; word:  2/
	;; alias: TWO-DIVIDE
	;; flags: FFL_PRIMITIVE ROM
        ;;   word 2/ defined in primitives/0300_arithmetic.asm:80.
dw_TWO_DIVIDE_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_TWO_DIVIDE    ; Pointer to word name (above)
        .word dw_TWO_MINUS_head ; Link to previous dictionary entry
dw_TWO_DIVIDE:
        .word @+1               ; Code entry point: next instruction
dw_TWO_DIVIDE_pfa:
	;; notes: 2/ ( a -- b )
	;;   b is floor(a / 2).
	TRAP T_POP		; a
	CLL
	SNN
	CPL			; if A < 0: L=1
	RBR			; roll 1 bit right
	TRAP T_PUSH
	RTF			; Return to Forth


	;; word:  2*
	;; alias: TWO-TIMES
	;; flags: FFL_PRIMITIVE ROM
        ;;   word 2* defined in primitives/0300_arithmetic.asm:94.
dw_TWO_TIMES_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_TWO_TIMES     ; Pointer to word name (above)
        .word dw_TWO_DIVIDE_head ; Link to previous dictionary entry
dw_TWO_TIMES:
        .word @+1               ; Code entry point: next instruction
dw_TWO_TIMES_pfa:
	;; notes: 2* ( a -- b )
	;;   b is a * 2
	TRAP T_POP		; a
	CLL RBL
	TRAP T_PUSH
	RTF


	;; word:  NEGATE
	;; flags: FFL_PRIMITIVE ROM
        ;;   word NEGATE defined in primitives/0300_arithmetic.asm:104.
dw_NEGATE_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_NEGATE        ; Pointer to word name (above)
        .word dw_TWO_TIMES_head ; Link to previous dictionary entry
dw_NEGATE:
        .word @+1               ; Code entry point: next instruction
dw_NEGATE_pfa:
	;; notes: NEGATE ( a -- nega )
	;;   nega is the twos complement of a.

	TRAP T_POP		; a
	NEG			; -a
	TRAP T_PUSH
	RTF			; Return to Forth


	;; word:  *
	;; alias: times
	;; flags: FFL_PRIMITIVE ROM
        ;;   word * defined in primitives/0300_arithmetic.asm:116.
dw_TIMES_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_TIMES         ; Pointer to word name (above)
        .word dw_NEGATE_head    ; Link to previous dictionary entry
dw_TIMES:
        .word @+1               ; Code entry point: next instruction
dw_TIMES_pfa:
	;; notes: * ( w1 w2 -- w3 )
	;;   w3 is the least-significant 16 bits of the arithmetic
	;;   product of w1 times w2.

	TRAP T_POP		; b
	STORE TR1
	TRAP T_POP		; a
	STORE TR0

	TRAP T_MUL16		; Multiply

	LOAD TR2
	TRAP T_PUSH

	RTF			; Return to Forth


	;; word:  /
	;; alias: divide
	;; flags: FFL_PRIMITIVE ROM
        ;;   word / defined in primitives/0300_arithmetic.asm:136.
dw_DIVIDE_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_DIVIDE        ; Pointer to word name (above)
        .word dw_TIMES_head     ; Link to previous dictionary entry
dw_DIVIDE:
        .word @+1               ; Code entry point: next instruction
dw_DIVIDE_pfa:
	;; notes: / ( w1 w2 -- w3 )
	;;   Divide w1 / w2 and leave the quotient w3 on the stack.

	TRAP T_POP		; b
	STORE TR1
	TRAP T_POP		; a
	STORE TR0

	TRAP T_DIV16		; Divide

	LOAD TR2
	TRAP T_PUSH

	RTF			; Return to Forth


	;; word:  /MOD
	;; alias: divide-mod
	;; flags: FFL_PRIMITIVE ROM
        ;;   word /MOD defined in primitives/0300_arithmetic.asm:155.
dw_DIVIDE_MOD_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_DIVIDE_MOD    ; Pointer to word name (above)
        .word dw_DIVIDE_head    ; Link to previous dictionary entry
dw_DIVIDE_MOD:
        .word @+1               ; Code entry point: next instruction
dw_DIVIDE_MOD_pfa:
	;; notes: /MOD ( w1 w2 -- w3 w4 )
	;;   Divide w1 / w2. Leave the remainder (w4) and quotient (w3) on the stack.

	TRAP T_POP		; b
	STORE TR1
	TRAP T_POP		; a
	STORE TR0

	TRAP T_DIV16		; Divide

	LOAD TR0		; Push modulo
	TRAP T_PUSH
	LOAD TR2		; Push quotient
	TRAP T_PUSH

	RTF			; Return to Forth


	;; word:  MOD
	;; alias: mod
	;; flags: FFL_PRIMITIVE ROM
        ;;   word MOD defined in primitives/0300_arithmetic.asm:176.
dw_MOD_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_MOD           ; Pointer to word name (above)
        .word dw_DIVIDE_MOD_head ; Link to previous dictionary entry
dw_MOD:
        .word @+1               ; Code entry point: next instruction
dw_MOD_pfa:
	;; notes: MOD ( w1 w2 -- w3 )
	;;   w3 is the 16-modulo of the 16-bit integer division w1/w2.

	TRAP T_POP		; b
	STORE TR1
	TRAP T_POP		; a
	STORE TR0

	TRAP T_DIV16		; Divide

	LOAD TR0		; Push modulo
	TRAP T_PUSH

	RTF			; Return to Forth


	;; word:  ABS
	;; alias: abs
	;; flags: FFL_PRIMITIVE ROM
        ;;   word ABS defined in primitives/0300_arithmetic.asm:195.
dw_ABS_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_ABS           ; Pointer to word name (above)
        .word dw_MOD_head       ; Link to previous dictionary entry
dw_ABS:
        .word @+1               ; Code entry point: next instruction
dw_ABS_pfa:
	;; notes: ABS ( w1 -- w2 )
	;;   w2 is the absolute value of w1.

	TRAP T_POP
	STORE TR0

	SPA			; A < 0?
	NEG			; Yes. Negate.

	TRAP T_PUSH
	RTF			; Return to Forth


// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/0325_dblarithmetic.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// Arithmetic primitives for double numbers.
//
// Double numbers are stored on the stack with the least
// significant 16bits pushed first. So: 10. .s -- 10 0.

	;; word:  D+
	;; alias: D-PLUS
	;; flags: FFL_PRIMITIVE ROM
        ;;   word D+ defined in primitives/0325_dblarithmetic.asm:10.
dw_D_PLUS_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_D_PLUS        ; Pointer to word name (above)
        .word dw_ABS_head       ; Link to previous dictionary entry
dw_D_PLUS:
        .word @+1               ; Code entry point: next instruction
dw_D_PLUS_pfa:
	;; notes: D+ ( dw1 dw2 -- dw3 )
	;;   dw3 is the sum of dw1 and dw2.
	;; registers at __add32:
	;;   R31 = a_hi
	;;   R30 = a_lo
	;;   R29 = b_hi
	;;     A = b_lo (b_lo is not stored)

	TRAP T_POP		; a_hi
	STORE R31

        TRAP T_POP		; a_lo
	STORE R30

	TRAP T_POP		; b_hi
	STORE R29

	TRAP T_POP		; b_lo

dw_D_PLUS_work:
	CLL
	ADD R30			; a_lo + b_lo
	STORE R30

	LOAD R29
	SCL			; L = 1?
	INC
	ADD R31
	STORE R31

	LOAD R30
	TRAP T_PUSH		; Push low word

	LOAD R31		; Push high word
	TRAP T_PUSH

	RTF	; Return to Forth


	;; word:  DNEGATE
	;; flags: PRIMITIVE ROM
        ;;   word DNEGATE defined in primitives/0325_dblarithmetic.asm:51.
dw_DNEGATE_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_DNEGATE       ; Pointer to word name (above)
        .word dw_D_PLUS_head    ; Link to previous dictionary entry
dw_DNEGATE:
        .word @+1               ; Code entry point: next instruction
dw_DNEGATE_pfa:
	;; notes: DNEGATE ( dw1 -- dw2 )
	;;   dw2 is the twos complement of double word 1.
	;; registers:
	;;   R31 = a_hi
	;;   R30 = a_lo
	;;   R29 = b_hi
	;;         b_lo (b_lo is not stored)

	TRAP T_POP		; a_hi
	NOT			; 1s' complement
	STORE R31

        TRAP T_POP		; a_lo
	NOT			; 1s' complement
	STORE R30

	LI 0			; Negate low word
	STORE R29
	LI 1
	JMP dw_D_PLUS_work	; And perform add32.


	;; word:  D-
	;; flags: DOCOL ROM
        ;;   word D- defined in primitives/0325_dblarithmetic.asm:75.
dw_D__head:
        .word FFL_DOCOL FFL_ROM ; Flags
        .word dwn_D_            ; Pointer to word name (above)
        .word dw_DNEGATE_head   ; Link to previous dictionary entry
dw_D_:
        .word dw__DOCOL         ; Code entry point: next instruction
dw_D__pfa:
	;; notes: D- ( dw1 dw2 -- dw3 )
	;;   dw3 is the double result of dw1-dw2.
	.word dw_DNEGATE
	.word dw_D_PLUS
	.word dw_EXIT


	;; word:  D0=
	;; alias: D0-EQUALS
	;; flags: DOCOL ROM
        ;;   word D0= defined in primitives/0325_dblarithmetic.asm:85.
dw_D0_EQUALS_head:
        .word FFL_DOCOL FFL_ROM ; Flags
        .word dwn_D0_EQUALS     ; Pointer to word name (above)
        .word dw_D__head        ; Link to previous dictionary entry
dw_D0_EQUALS:
        .word dw__DOCOL         ; Code entry point: next instruction
dw_D0_EQUALS_pfa:
	;; notes: D0= ( dw1 -- flag )
	;;   flag is true if d1 is zero.
	;;   : d0= 0 dup d= ;
	.word dw__LIT
	.word 0
	.word dw_DUP
	.word dw_D_EQUALS
	.word dw_EXIT


	;; word:  D=
	;; alias: D-EQUALS
	;; flags: FFL_PRIMITIVE ROM
        ;;   word D= defined in primitives/0325_dblarithmetic.asm:98.
dw_D_EQUALS_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_D_EQUALS      ; Pointer to word name (above)
        .word dw_D0_EQUALS_head ; Link to previous dictionary entry
dw_D_EQUALS:
        .word @+1               ; Code entry point: next instruction
dw_D_EQUALS_pfa:
	;; notes: D= ( dw1 dw2 -- flag )
	;;   flag is non-zero if dw1 == dw2
	TRAP T_POP		; a_hi
	STORE R31

        TRAP T_POP		; a_lo
	STORE R30

	TRAP T_POP		; b_hi
	STORE R29

	TRAP T_POP		; b_lo

	;; Compare the low words

	XOR R30			; a_lo == b_lo
	SZA			; A == 0
	JMP __fl_false

	;; Compare the high words

	LOAD R31
	XOR R29
	SZA			; A == 0
	JMP __fl_false
	JMP __fl_true


	;; word:  D<
	;; alias: D-LESS-THAN
	;; flags: FFL_PRIMITIVE ROM
        ;;   word D< defined in primitives/0325_dblarithmetic.asm:129.
dw_D_LESS_THAN_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_D_LESS_THAN   ; Pointer to word name (above)
        .word dw_D_EQUALS_head  ; Link to previous dictionary entry
dw_D_LESS_THAN:
        .word @+1               ; Code entry point: next instruction
dw_D_LESS_THAN_pfa:
	;; notes: D< ( dw1 dw2 -- flag )
	;;   flag is non-zero if dw1 < dw2
	;;
	;; algorithm:
	;;
	;;   if dw1_hi < dw2_hi:
	;;     return true
	;;   if dw1_hi > dw2_hi:
	;;     return false
	;;   igf dw1_lo < dw2_lo:
	;;     return true
	;;   return false
	TRAP T_POP		; a_hi
	STORE R31

        TRAP T_POP		; a_lo
	STORE R30

	TRAP T_POP		; b_hi
	STORE R29

	TRAP T_POP		; b_lo
	STORE R28

	;; Full comparison of a_hi and b_hi

dw_D_LESS_THAN_work:
	LOAD R29		; Full comparison of a_hi and b_hi
	NEG
	ADD R31			; a - b
	SNN			; a_hi < b_hi?
	JMP __fl_true		;   Yes. Return true.

	SZA			; a_hi == b_hi?
	JMP __fl_false		;   no. Return false.

	;; a_hi == b_hi. Compare a_lo and b_lo

	LOAD R28
	NEG
	ADD R30			; a - b
	SNN			; a_lo < b_lo?
	JMP __fl_true		;   Yes. Return true.

	JMP __fl_false		; No. Return false.



	;; word:  D>
	;; alias: D-GREATER-THAN
	;; flags: FFL_PRIMITIVE ROM
        ;;   word D> defined in primitives/0325_dblarithmetic.asm:180.
dw_D_GREATER_THAN_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_D_GREATER_THAN ; Pointer to word name (above)
        .word dw_D_LESS_THAN_head ; Link to previous dictionary entry
dw_D_GREATER_THAN:
        .word @+1               ; Code entry point: next instruction
dw_D_GREATER_THAN_pfa:
	;; notes: D> ( dw1 dw2 -- flag )
	;;   flag is non-zero if dw1 > dw2
	TRAP T_POP		; a_hi
	STORE R29

        TRAP T_POP		; a_lo
	STORE R28

	TRAP T_POP		; b_hi
	STORE R31

	TRAP T_POP		; b_lo
	STORE R30

	JMP dw_D_LESS_THAN_work


	;; word:  DMAX
	;; flags: PRIMITIVE ROM
        ;;   word DMAX defined in primitives/0325_dblarithmetic.asm:199.
dw_DMAX_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_DMAX          ; Pointer to word name (above)
        .word dw_D_GREATER_THAN_head ; Link to previous dictionary entry
dw_DMAX:
        .word @+1               ; Code entry point: next instruction
dw_DMAX_pfa:
	;; notes: DMIN ( dw1 dw2 -- dw3 )
	;;   dw3 is the maximum of dw1 and dw2.
	;;   : d0= 0 dup d= ;
	TRAP T_POP		; a_hi
	STORE R31

        TRAP T_POP		; a_lo
	STORE R30

	TRAP T_POP		; b_hi
	STORE R29

	TRAP T_POP		; b_lo
	STORE R28

__fl_max32:
	LOAD R29		; Full comparison of a_hi and b_hi
	NEG
	ADD R31			; a - b
	SNN			; a_hi < b_hi?
	JMP __fl_max32b		;   a < b. Return b.

	SZA			; a_hi == b_hi?
	JMP __fl_max32a		;   a > b. Return a.

	;; a_hi == b_hi. Compare a_lo and b_lo

	LOAD R28
	NEG
	ADD R30			; a - b
	SNN			; a_lo < b_lo?
	JMP __fl_max32b		;   a < b. Return b.

	JMP __fl_max32a		; a >= b. Return a.

__fl_max32a:			; Push A
	LOAD R28
	TRAP T_PUSH		; Push low
	LOAD R29
	TRAP T_PUSH		; Push high
	RTF

__fl_max32b:			; Push B
	LOAD R30
	TRAP T_PUSH		; Push low
	LOAD R31
	TRAP T_PUSH		; Push high
	RTF


	;; word:  DMIN
	;; flags: PRIMITIVE ROM
        ;;   word DMIN defined in primitives/0325_dblarithmetic.asm:251.
dw_DMIN_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_DMIN          ; Pointer to word name (above)
        .word dw_DMAX_head      ; Link to previous dictionary entry
dw_DMIN:
        .word @+1               ; Code entry point: next instruction
dw_DMIN_pfa:
	;; notes: DMIN ( dw1 dw2 -- dw3 )
	;;   dw3 is the minimum of dw1 and dw2.
	TRAP T_POP		; a_hi
	STORE R29

        TRAP T_POP		; a_lo
	STORE R28

	TRAP T_POP		; b_hi
	STORE R31

	TRAP T_POP		; b_lo
	STORE R30

	JMP __fl_max32


	;; word:  D2*
	;; alias: D-TWO-TIMES
	;; flags: PRIMITIVE ROM
        ;;   word D2* defined in primitives/0325_dblarithmetic.asm:271.
dw_D_TWO_TIMES_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_D_TWO_TIMES   ; Pointer to word name (above)
        .word dw_DMIN_head      ; Link to previous dictionary entry
dw_D_TWO_TIMES:
        .word @+1               ; Code entry point: next instruction
dw_D_TWO_TIMES_pfa:
	;; notes: D2* ( dw1 -- dw2 )
	;;   Multiplies dw1 by two using a left shift.
	TRAP T_POP
	STORE R31
	TRAP T_POP
	CLL RBL			; L = 0 => shift.
	STORE R30
	LOAD R31
	RBL			; left roll (using L)
	STORE R31


	;; word:  D*
	;; alias: D-TIMES
	;; flags: FFL_PRIMITIVE ROM
        ;;   word D* defined in primitives/0325_dblarithmetic.asm:286.
dw_D_TIMES_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_D_TIMES       ; Pointer to word name (above)
        .word dw_D_TWO_TIMES_head ; Link to previous dictionary entry
dw_D_TIMES:
        .word @+1               ; Code entry point: next instruction
dw_D_TIMES_pfa:
	;; notes: D* ( dw1 dw2 -- dw3 )
	;;   dw3 is the product of dw1 and dw2.
	;; registers at __add32:
	;;   R31 = a_hi
	;;   R30 = a_lo
	;;   R29 = b_hi
	;;     A = b_lo (b_lo is not stored)

	TRAP T_POP		; Pop A (high)
	STORE R31
        TRAP T_POP		; Pop A (low)
	STORE TR1

	TRAP T_POP		; Pop B (high)
	STORE TR2
	TRAP T_POP		; Pop A (low)
	STORE TR3

	LOAD R31
	STORE TR0		; POP clobbers TR0

	TRAP T_MUL32

	LOAD R30		; Push the product (lo, then high)
	TRAP T_PUSH
	LOAD R29
	TRAP T_PUSH

	RTF

	;; word:  D/MOD
	;; alias: D-DIVIDE
	;; flags: FFL_PRIMITIVE ROM
        ;;   word D/MOD defined in primitives/0325_dblarithmetic.asm:319.
dw_D_DIVIDE_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_D_DIVIDE      ; Pointer to word name (above)
        .word dw_D_TIMES_head   ; Link to previous dictionary entry
dw_D_DIVIDE:
        .word @+1               ; Code entry point: next instruction
dw_D_DIVIDE_pfa:
	;; notes: / ( dw1 dw2 -- dw3 dw4 )
	;;   Divide w1 / w2 and leave the remainder (dw4) and quotient (dw3)
	;;   on the stack.

	TRAP T_POP		; b
	STORE TR1
	TRAP T_POP		; a
	STORE TR0

	TRAP T_DIV32		; Divide

	LOAD TR2
	TRAP T_PUSH

	RTF			; Return to Forth


// End of file.



///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/0350_logic.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// Logic primitives

	;; word:  TRUE
	;; alias: TRUE
	;; flags: FFL_PRIMITIVE ROM
        ;;   word TRUE defined in primitives/0350_logic.asm:7.
dw_TRUE_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_TRUE          ; Pointer to word name (above)
        .word dw_D_DIVIDE_head  ; Link to previous dictionary entry
dw_TRUE:
        .word @+1               ; Code entry point: next instruction
dw_TRUE_pfa:
	;; notes: TRUE ( -- true )
	;;   Pushes true (-1, &ffff) onto the stack.
	CLA NOT
	TRAP T_PUSH
	RTF


	;; word:  FALSE
	;; alias: FALSE
	;; flags: FFL_PRIMITIVE ROM
        ;;   word FALSE defined in primitives/0350_logic.asm:17.
dw_FALSE_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_FALSE         ; Pointer to word name (above)
        .word dw_TRUE_head      ; Link to previous dictionary entry
dw_FALSE:
        .word @+1               ; Code entry point: next instruction
dw_FALSE_pfa:
	;; notes: FALSE ( -- false )
	;;   Pushes false (0) the stack.
	CLA
	TRAP T_PUSH
	RTF


	;; word:  AND
	;; alias: AND
	;; flags: FFL_PRIMITIVE ROM
        ;;   word AND defined in primitives/0350_logic.asm:27.
dw_AND_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_AND           ; Pointer to word name (above)
        .word dw_FALSE_head     ; Link to previous dictionary entry
dw_AND:
        .word @+1               ; Code entry point: next instruction
dw_AND_pfa:
	;; notes: AND ( a b -- c )
	;;   c is the binary AND of a & b
	TRAP T_POP
	STORE R31
	TRAP T_POP
	AND R31
	TRAP T_PUSH
	RTF


	;; word:  OR
	;; alias: OR
	;; flags: FFL_PRIMITIVE ROM
        ;;   word OR defined in primitives/0350_logic.asm:40.
dw_OR_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_OR            ; Pointer to word name (above)
        .word dw_AND_head       ; Link to previous dictionary entry
dw_OR:
        .word @+1               ; Code entry point: next instruction
dw_OR_pfa:
	;; notes: OR ( a b -- c )
	;;   c is the binary OR of a | b
	TRAP T_POP
	STORE R31
	TRAP T_POP
	OR R31
	TRAP T_PUSH
	RTF


	;; word:  XOR
	;; alias: XOR
	;; flags: FFL_PRIMITIVE ROM
        ;;   word XOR defined in primitives/0350_logic.asm:53.
dw_XOR_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_XOR           ; Pointer to word name (above)
        .word dw_OR_head        ; Link to previous dictionary entry
dw_XOR:
        .word @+1               ; Code entry point: next instruction
dw_XOR_pfa:
	;; notes: XOR ( a b -- c )
	;;   c is the binary XOR of a ^ b
	TRAP T_POP
	STORE R31
	TRAP T_POP
	XOR R31
	TRAP T_PUSH
	RTF


	;; word:  NOT
	;; alias: NOT
	;; flags: FFL_PRIMITIVE ROM
        ;;   word NOT defined in primitives/0350_logic.asm:66.
dw_NOT_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_NOT           ; Pointer to word name (above)
        .word dw_XOR_head       ; Link to previous dictionary entry
dw_NOT:
        .word @+1               ; Code entry point: next instruction
dw_NOT_pfa:
	;; notes: NOT ( a -- b )
	;;   b is the ones' complement (binary negation) of a
	TRAP T_POP
	NOT
	TRAP T_PUSH
	RTF


// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/0400_comparisons.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// Comparison primitives

	;; word:  =
	;; alias: EQUALS
	;; flags: FFL_PRIMITIVE ROM
        ;;   word = defined in primitives/0400_comparisons.asm:7.
dw_EQUALS_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_EQUALS        ; Pointer to word name (above)
        .word dw_NOT_head       ; Link to previous dictionary entry
dw_EQUALS:
        .word @+1               ; Code entry point: next instruction
dw_EQUALS_pfa:
	;; notes: = ( a b -- flag )
	;;   flag is non-zero if a == b
	TRAP T_POP
	STORE R31
	TRAP T_POP
	XOR R31			; a XOR b
__fl_trueif0:
	SZA			; A == 0 => true
	JMP __fl_false		; A != 0 => false
__fl_true:
	LOAD MINUS1
	TRAP T_PUSH
	RTF
__fl_false:
	LI 0
	TRAP T_PUSH
	RTF


	;; word:  <
	;; alias: LESS_THAN
	;; flags: FFL_PRIMITIVE ROM
        ;;   word < defined in primitives/0400_comparisons.asm:29.
dw_LESS_THAN_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_LESS_THAN     ; Pointer to word name (above)
        .word dw_EQUALS_head    ; Link to previous dictionary entry
dw_LESS_THAN:
        .word @+1               ; Code entry point: next instruction
dw_LESS_THAN_pfa:
	;; notes: < ( a b -- flag )
	;;   flag is true if a < b
	TRAP T_POP		; a
	STORE R31
	TRAP T_POP		; b
	NEG
	ADD R31			; a - b
	JMP __fl_trueifneg


	;; word:  >
	;; alias: GREATER_THAN
	;; flags: FFL_PRIMITIVE ROM
        ;;   word > defined in primitives/0400_comparisons.asm:42.
dw_GREATER_THAN_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_GREATER_THAN  ; Pointer to word name (above)
        .word dw_LESS_THAN_head ; Link to previous dictionary entry
dw_GREATER_THAN:
        .word @+1               ; Code entry point: next instruction
dw_GREATER_THAN_pfa:
	;; notes: > ( a b -- flag )
	;;   flag is true if a > b
	TRAP T_POP		; a
	STORE R31
	TRAP T_POP		; b
	NEG
	ADD R31			; a - b
	JMP __fl_trueifpos


	;; word:  0<
	;; alias: ZERO_LESS
	;; flags: FFL_PRIMITIVE ROM
        ;;   word 0< defined in primitives/0400_comparisons.asm:55.
dw_ZERO_LESS_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_ZERO_LESS     ; Pointer to word name (above)
        .word dw_GREATER_THAN_head ; Link to previous dictionary entry
dw_ZERO_LESS:
        .word @+1               ; Code entry point: next instruction
dw_ZERO_LESS_pfa:
	;; notes: 0< ( a -- flag )
	;;
	TRAP T_POP
__fl_trueifneg:
	AND BIT15
__fl_trueifnot0:
	SNZ
	JMP __fl_false		; A = 0 => false
	JMP __fl_true		; A != 0 => true


	;; word:  0=
	;; alias: ZERO_EQUALS
	;; flags: FFL_PRIMITIVE ROM
        ;;   word 0= defined in primitives/0400_comparisons.asm:69.
dw_ZERO_EQUALS_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_ZERO_EQUALS   ; Pointer to word name (above)
        .word dw_ZERO_LESS_head ; Link to previous dictionary entry
dw_ZERO_EQUALS:
        .word @+1               ; Code entry point: next instruction
dw_ZERO_EQUALS_pfa:
	;; notes: 0= ( a -- flag )
	;;
	TRAP T_POP
	JMP __fl_trueif0


	;; word:  0>
	;; alias: ZERO_GREATER
	;; flags: FFL_PRIMITIVE ROM
        ;;   word 0> defined in primitives/0400_comparisons.asm:78.
dw_ZERO_GREATER_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_ZERO_GREATER  ; Pointer to word name (above)
        .word dw_ZERO_EQUALS_head ; Link to previous dictionary entry
dw_ZERO_GREATER:
        .word @+1               ; Code entry point: next instruction
dw_ZERO_GREATER_pfa:
	;; notes: 0> ( a -- flag )
	;;
	TRAP T_POP
__fl_trueifpos:
	AND BIT15
	JMP __fl_trueif0



	;; word:  MAX
	;; alias: MAX
	;; flags: FFL_PRIMITIVE ROM
        ;;   word MAX defined in primitives/0400_comparisons.asm:90.
dw_MAX_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_MAX           ; Pointer to word name (above)
        .word dw_ZERO_GREATER_head ; Link to previous dictionary entry
dw_MAX:
        .word @+1               ; Code entry point: next instruction
dw_MAX_pfa:
	;; notes: MAX ( a b -- word )
	;;   word is a or b, whichever is greatest.
	TRAP T_POP		; b
	STORE R31
	TRAP T_POP		; a
	STORE R30

	NEG			; a - b
	ADD R31

	SNA			; b > a?
	JMP __fl_pushr31
__fl_pushr30:			; return b
	LOAD R30
	TRAP T_PUSH
	RTF
__fl_pushr31:			; return a
	LOAD R31
	TRAP T_PUSH
	RTF


	;; word:  MIN
	;; alias: MIN
	;; flags: FFL_PRIMITIVE ROM
        ;;   word MIN defined in primitives/0400_comparisons.asm:115.
dw_MIN_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_MIN           ; Pointer to word name (above)
        .word dw_MAX_head       ; Link to previous dictionary entry
dw_MIN:
        .word @+1               ; Code entry point: next instruction
dw_MIN_pfa:
	;; notes: MIN ( a b -- word )
	;;   word is a or b, whichever is lesser.
	TRAP T_POP		; b
	STORE R31
	TRAP T_POP		; a
	STORE R30

	NEG			; a - b
	ADD R31

	SNA			; b > a?
	JMP __fl_pushr30	; Return a
	JMP __fl_pushr31	; Return b


// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/0500_strings.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// String handling

	;; word:  LEN
	;; alias: LEN
	;; flags: FFL_PRIMITIVE ROM
        ;;   word LEN defined in primitives/0500_strings.asm:7.
dw_LEN_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_LEN           ; Pointer to word name (above)
        .word dw_MIN_head       ; Link to previous dictionary entry
dw_LEN:
        .word @+1               ; Code entry point: next instruction
dw_LEN_pfa:
	;; notes: LEN ( addr -- word )
	;;
	;;   Word is the length of the string starting at addr.
	TRAP T_POP		; Get the address
	STORE TIR0
	TRAP T_STRLEN		; Count the length
	TRAP T_PUSH		; Push the length
	RTF			; Return to Forth macro-instruction

// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/2000_compiler.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// Compiler primitives

	;; word:  _JMP
	;; flags: FFL_PRIMITIVE ROM CMPLONLY
        ;;   word _JMP defined in primitives/2000_compiler.asm:6.
dw__JMP_head:
        .word FFL_PRIMITIVE FFL_ROM FFL_CMPLONLY ; Flags
        .word dwn__JMP          ; Pointer to word name (above)
        .word dw_LEN_head       ; Link to previous dictionary entry
dw__JMP:
        .word @+1               ; Code entry point: next instruction
dw__JMP_pfa:

	LOAD I IP		; Load the next word
	STORE IP		; Set the IP to it.
	RTF			; Return to Forth


	;; word:  _LIT
	;; flags: FFL_PRIMITIVE ROM CMPLONLY
        ;;   word _LIT defined in primitives/2000_compiler.asm:14.
dw__LIT_head:
        .word FFL_PRIMITIVE FFL_ROM FFL_CMPLONLY ; Flags
        .word dwn__LIT          ; Pointer to word name (above)
        .word dw__JMP_head      ; Link to previous dictionary entry
dw__LIT:
        .word @+1               ; Code entry point: next instruction
dw__LIT_pfa:

	LOAD I IP		; Load the next word
	TRAP T_PUSH		; Push it onto the stack.
	RTF			; Return to Forth


	;; word:  _DOT_QUOTE
	;; flags: FFL_PRIMITIVE ROM CMPLONLY
        ;;   word _DOT_QUOTE defined in primitives/2000_compiler.asm:22.
dw__DOT_QUOTE_head:
        .word FFL_PRIMITIVE FFL_ROM FFL_CMPLONLY ; Flags
        .word dwn__DOT_QUOTE    ; Pointer to word name (above)
        .word dw__LIT_head      ; Link to previous dictionary entry
dw__DOT_QUOTE:
        .word @+1               ; Code entry point: next instruction
dw__DOT_QUOTE_pfa:

__fl__dot_quote_loop:
	LOAD I IP		; Load the next word
	STORE R31

	SNN			; Terminating character?
	JMP __fl_dot_quote_end

	LOAD R31
	PUTCHAR
	JMP __fl__dot_quote_loop

__fl_dot_quote_end:
	AND NOTBIT15		; Print out the final character
	PUTCHAR
	RTF


// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/3000_EXPECT.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// QUERY: rudimentary line editing

	;; word:  QUERY
	;; alias: QUERY
	;; flags: FFL_PRIMITIVE ROM CFT
        ;;   word QUERY defined in primitives/3000_EXPECT.asm:7.
dw_QUERY_head:
        .word FFL_PRIMITIVE FFL_ROM FFL_CFT ; Flags
        .word dwn_QUERY         ; Pointer to word name (above)
        .word dw__DOT_QUOTE_head ; Link to previous dictionary entry
dw_QUERY:
        .word @+1               ; Code entry point: next instruction
dw_QUERY_pfa:
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



///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/3010_WORD.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// The WORD primitive

	;; word:  WORD
	;; flags: FFL_PRIMITIVE ROM
        ;;   word WORD defined in primitives/3010_WORD.asm:6.
dw_WORD_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_WORD          ; Pointer to word name (above)
        .word dw_QUERY_head     ; Link to previous dictionary entry
dw_WORD:
        .word @+1               ; Code entry point: next instruction
dw_WORD_pfa:
	;; notes: WORD ( char -- addr )
	;;   lexes a string delimited by char. The starting address of the string
	;;   is placed on the stack.

	TRAP T_POP
	TRAP T_FORTH_WORD
	TRAP T_PUSH
	RTF

// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/3100_interpreter.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// Interpreter-related primitives

	;; word:  QUIT
	;; alias: QUIT
	;; flags: ROM DOCOL
        ;;   word QUIT defined in primitives/3100_interpreter.asm:7.
dw_QUIT_head:
        .word FFL_ROM FFL_DOCOL ; Flags
        .word dwn_QUIT          ; Pointer to word name (above)
        .word dw_WORD_head      ; Link to previous dictionary entry
dw_QUIT:
        .word dw__DOCOL         ; Code entry point: next instruction
dw_QUIT_pfa:
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
        ;;   word INTERPRET defined in primitives/3100_interpreter.asm:33.
dw_INTERPRET_head:
        .word FFL_ROM FFL_DOCOL ; Flags
        .word dwn_INTERPRET     ; Pointer to word name (above)
        .word dw_QUIT_head      ; Link to previous dictionary entry
dw_INTERPRET:
        .word dw__DOCOL         ; Code entry point: next instruction
dw_INTERPRET_pfa:
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
        ;;   word EXECUTE defined in primitives/3100_interpreter.asm:93.
dw_EXECUTE_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_EXECUTE       ; Pointer to word name (above)
        .word dw_INTERPRET_head ; Link to previous dictionary entry
dw_EXECUTE:
        .word @+1               ; Code entry point: next instruction
dw_EXECUTE_pfa:
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
        ;;   word TIB defined in primitives/3100_interpreter.asm:116.
dw_TIB_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_TIB           ; Pointer to word name (above)
        .word dw_EXECUTE_head   ; Link to previous dictionary entry
dw_TIB:
        .word @+1               ; Code entry point: next instruction
dw_TIB_pfa:
	;; notes: TIB ( -- a )
	;;   a is the address of the character input buffer for interpretation.
	LOAD R inputbase
	TRAP T_PUSH
	RTF


	;; word:  TIBMAX
	;; alias: TIBMAX
	;; flags: PRIMITIVE ROM
        ;;   word TIBMAX defined in primitives/3100_interpreter.asm:126.
dw_TIBMAX_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_TIBMAX        ; Pointer to word name (above)
        .word dw_TIB_head       ; Link to previous dictionary entry
dw_TIBMAX:
        .word @+1               ; Code entry point: next instruction
dw_TIBMAX_pfa:
	;; notes: TIBMAX ( -- a )
	;;   a is the maximum adress of the character input buffer plus 1.
	LOAD R inputbufend
	ADD MINUS1
	TRAP T_PUSH
	RTF


	;; word:  '
	;; alias: tick
	;; flags: PRIMITIVE ROM
        ;;   word ' defined in primitives/3100_interpreter.asm:137.
dw_TICK_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_TICK          ; Pointer to word name (above)
        .word dw_TIBMAX_head    ; Link to previous dictionary entry
dw_TICK:
        .word @+1               ; Code entry point: next instruction
dw_TICK_pfa:
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
        ;;   word FIND defined in primitives/3100_interpreter.asm:165.
dw_FIND_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_FIND          ; Pointer to word name (above)
        .word dw_TICK_head      ; Link to previous dictionary entry
dw_FIND:
        .word @+1               ; Code entry point: next instruction
dw_FIND_pfa:
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
        ;;   word IP! defined in primitives/3100_interpreter.asm:206.
dw_IP_STORE_head:
        .word FFL_PRIMITIVE FFL_ROM FFL_CMPLONLY ; Flags
        .word dwn_IP_STORE      ; Pointer to word name (above)
        .word dw_FIND_head      ; Link to previous dictionary entry
dw_IP_STORE:
        .word @+1               ; Code entry point: next instruction
dw_IP_STORE_pfa:
	;; notes: IP! ( addr -- )
	;;   An unconditional jump to address addr.
	TRAP T_POP
	STORE IP
	RTF


	;; word:  >BODY
	;; alias: to-body
	;; flags: PRIMITIVE ROM
        ;;   word >BODY defined in primitives/3100_interpreter.asm:216.
dw_TO_BODY_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_TO_BODY       ; Pointer to word name (above)
        .word dw_IP_STORE_head  ; Link to previous dictionary entry
dw_TO_BODY:
        .word @+1               ; Code entry point: next instruction
dw_TO_BODY_pfa:
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
        ;;   word >INPTR defined in primitives/3100_interpreter.asm:229.
dw_TO_INPTR_head:
        .word FFL_PRIMITIVE FFL_ROM FFL_CFT ; Flags
        .word dwn_TO_INPTR      ; Pointer to word name (above)
        .word dw_TO_BODY_head   ; Link to previous dictionary entry
dw_TO_INPTR:
        .word @+1               ; Code entry point: next instruction
dw_TO_INPTR_pfa:
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
        ;;   word IN0! defined in primitives/3100_interpreter.asm:241.
dw_IN_0_STORE_head:
        .word FFL_PRIMITIVE FFL_ROM FFL_CFT ; Flags
        .word dwn_IN_0_STORE    ; Pointer to word name (above)
        .word dw_TO_INPTR_head  ; Link to previous dictionary entry
dw_IN_0_STORE:
        .word @+1               ; Code entry point: next instruction
dw_IN_0_STORE_pfa:
	;; notes: IN0! ( -- )
	;;   Sets the input pointer to the start of the input buffer.
	LOAD R inputbase
	STORE LIPTR
	RTF


	;; word:  INPTR
	;; alias: inptr
	;; flags: PRIMITIVE ROM CFT
        ;;   word INPTR defined in primitives/3100_interpreter.asm:251.
dw_INPTR_head:
        .word FFL_PRIMITIVE FFL_ROM FFL_CFT ; Flags
        .word dwn_INPTR         ; Pointer to word name (above)
        .word dw_IN_0_STORE_head ; Link to previous dictionary entry
dw_INPTR:
        .word @+1               ; Code entry point: next instruction
dw_INPTR_pfa:
	;; notes: INPTR ( -- w )
	;;   w2 is the address of the next character in the input stream.
	;;  (single indirection)
	LOAD LIPTR
	TRAP T_PUSH
	RTF


	;; word:  IN@+
	;; alias: in-fetch-inc
	;; flags: PRIMITIVE ROM CFT
        ;;   word IN@+ defined in primitives/3100_interpreter.asm:262.
dw_IN_FETCH_INC_head:
        .word FFL_PRIMITIVE FFL_ROM FFL_CFT ; Flags
        .word dwn_IN_FETCH_INC  ; Pointer to word name (above)
        .word dw_INPTR_head     ; Link to previous dictionary entry
dw_IN_FETCH_INC:
        .word @+1               ; Code entry point: next instruction
dw_IN_FETCH_INC_pfa:
	;; notes: IN@+ ( -- c )
	;;   c is the next character in the input stream. If bit15 is set, then
	;;   IN@+ 32767 AND is the last character in the stream. The pointer is
	;;   incremented to the next character (even if this is the last one).
	LOAD I LIPTR
	TRAP T_PUSH
	RTF


	;; word:  HERE
	;; flags: PRIMITIVE ROM
        ;;   word HERE defined in primitives/3100_interpreter.asm:273.
dw_HERE_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_HERE          ; Pointer to word name (above)
        .word dw_IN_FETCH_INC_head ; Link to previous dictionary entry
dw_HERE:
        .word @+1               ; Code entry point: next instruction
dw_HERE_pfa:
	;; notes: HERE ( -- addr )
	;;   pushes the address of the first free 16-bit word in the dictionary
	LOAD CP
	TRAP T_PUSH
	RTF			; Return to Forth


	;; word:  PAD
	;; flags: PRIMITIVE ROM
        ;;   word PAD defined in primitives/3100_interpreter.asm:282.
dw_PAD_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_PAD           ; Pointer to word name (above)
        .word dw_HERE_head      ; Link to previous dictionary entry
dw_PAD:
        .word @+1               ; Code entry point: next instruction
dw_PAD_pfa:
	;; notes: PAD ( -- addr )
	;;   pushes the address of the pad (HERE 100 +).

	LI 100			; Arbitrarily add 100 words to CP
	ADD CP			; Returns HERE 100 +
	TRAP T_PUSH
	RTF			; Return to Forth


// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/4000_flow.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// Things that deal with flow control, the return stack, etc.


	;; word:  BEGIN
	;; alias: BEGIN
	;; flags: FFL_PRIMITIVE ROM CMPLONLY
        ;;   word BEGIN defined in primitives/4000_flow.asm:8.
dw_BEGIN_head:
        .word FFL_PRIMITIVE FFL_ROM FFL_CMPLONLY ; Flags
        .word dwn_BEGIN         ; Pointer to word name (above)
        .word dw_PAD_head       ; Link to previous dictionary entry
dw_BEGIN:
        .word @+1               ; Code entry point: next instruction
dw_BEGIN_pfa:
	;; notes: BEGIN ( -- )
	;;   Pushes the current cell pointer on the return stack.
	LOAD R rstack		; Select the return stack
	STORE R curstack
	LOAD IP
	ADD MINUS1		; Get the address of the call to BEGIN itself.
	TRAP T_PUSH		; And push it onto the

	LOAD R dstack		; Select the return stack again
	STORE R curstack

	RTF			; Return to Forth


	;; word:  AGAIN
	;; alias: AGAIN
	;; flags: FFL_PRIMITIVE ROM CMPLONLY
        ;;   word AGAIN defined in primitives/4000_flow.asm:25.
dw_AGAIN_head:
        .word FFL_PRIMITIVE FFL_ROM FFL_CMPLONLY ; Flags
        .word dwn_AGAIN         ; Pointer to word name (above)
        .word dw_BEGIN_head     ; Link to previous dictionary entry
dw_AGAIN:
        .word @+1               ; Code entry point: next instruction
dw_AGAIN_pfa:
	;; notes: BEGIN ( -- )
	;;   Pushes the current cell pointer on the return stack.
	LOAD R rstack		; Select the return stack
	STORE R curstack
	TRAP T_POP		; Pop the IP
	STORE IP		; And store it back.

	LOAD R dstack		; Select the return stack again
	STORE R curstack

	RTF			; Return to Forth



	;; word:  _IF
	;; alias: _IF
	;; flags: FFL_PRIMITIVE ROM CMPLONLY
        ;;   word _IF defined in primitives/4000_flow.asm:42.
dw__IF_head:
        .word FFL_PRIMITIVE FFL_ROM FFL_CMPLONLY ; Flags
        .word dwn__IF           ; Pointer to word name (above)
        .word dw_AGAIN_head     ; Link to previous dictionary entry
dw__IF:
        .word @+1               ; Code entry point: next instruction
dw__IF_pfa:
	;; notes: _IF ( -- )
	;;   Sets the IP to the value in the next word, iff the top of the stack is zero.
	LOAD I IP		; Branch value
	STORE R31
	TRAP T_POP
	SZA			; If the value == 0.._
	RTF			; Go back and execute the part after the _IF.
	LOAD R31
	STORE IP
	RTF


	;; word:  >R
	;; alias: to-r
	;; flags: FFL_PRIMITIVE ROM
        ;;   word >R defined in primitives/4000_flow.asm:57.
dw_TO_R_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_TO_R          ; Pointer to word name (above)
        .word dw__IF_head       ; Link to previous dictionary entry
dw_TO_R:
        .word @+1               ; Code entry point: next instruction
dw_TO_R_pfa:
	;; notes: R> ( -- word )
	;;   Pops a value from the data stack and pushes it onto the return stack.
	TRAP T_POP		; Get a value from the stack
	STORE R31

	LOAD R rstack		; Select the return stack
	STORE R curstack
	LOAD R31
	TRAP T_PUSH		; And push it onto the

	LOAD R dstack		; Select the return stack again
	STORE R curstack

	RTF			; Return to Forth


	;; word:  R>
	;; alias: r-from
	;; flags: FFL_PRIMITIVE ROM
        ;;   word R> defined in primitives/4000_flow.asm:76.
dw_R_FROM_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_R_FROM        ; Pointer to word name (above)
        .word dw_TO_R_head      ; Link to previous dictionary entry
dw_R_FROM:
        .word @+1               ; Code entry point: next instruction
dw_R_FROM_pfa:
	;; notes: R> ( -- word )
	;;   Pops the top value from the return stack and pushes it onto the data stack.
	LOAD R rstack		; Select the return stack
	STORE R curstack
	TRAP T_POP
	STORE R31		; Pop

	LOAD R dstack		; Select the return stack
	STORE R curstack
	LOAD R31
	TRAP T_PUSH		; Push

	RTF			; Return to Forth


	;; word:  R@
	;; alias: r-fetch
	;; flags: FFL_PRIMITIVE ROM
        ;;   word R@ defined in primitives/4000_flow.asm:94.
dw_R_FETCH_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_R_FETCH       ; Pointer to word name (above)
        .word dw_R_FROM_head    ; Link to previous dictionary entry
dw_R_FETCH:
        .word @+1               ; Code entry point: next instruction
dw_R_FETCH_pfa:
	;; notes: R@ ( -- word )
	;;   Duplicates the top value of the return stack.
	LOAD R rstack		; Select the return stack
	STORE R curstack
	TRAP T_PEEK
	STORE R31

	LOAD R dstack		; Select the return stack
	STORE R curstack
	TRAP T_PUSH

	RTF			; Return to Forth


	;; word:  RDROP
	;; alias: RDROP
	;; flags: FFL_PRIMITIVE ROM
        ;;   word RDROP defined in primitives/4000_flow.asm:111.
dw_RDROP_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_RDROP         ; Pointer to word name (above)
        .word dw_R_FETCH_head   ; Link to previous dictionary entry
dw_RDROP:
        .word @+1               ; Code entry point: next instruction
dw_RDROP_pfa:
	;; notes: RDROP ( -- )
	;;   Drops the top value from the return stack.
	LOAD R rstack		; Select the return stack
	STORE R curstack
	TRAP T_POP
	LOAD R dstack		; Select the return stack
	STORE R curstack
	RTF			; Return to Forth


	;; word:  I
	;; copy:  r-fetch
	;; flags: FFL_PRIMITIVE ROM
        ;;   word I defined in primitives/4000_flow.asm:124.
dw_I_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_I             ; Pointer to word name (above)
        .word dw_RDROP_head     ; Link to previous dictionary entry
dw_I:
        .word @dw_R_FETCH+1     ; Code entry point: next instruction
dw_I_pfa:
	;; notes: I ( -- word )
	;;   Shares code with R@: duplicates the top value of
	;;   the return stack.

	// NOP


	;; word:  J
	;; copy:  r-fetch
	;; flags: FFL_PRIMITIVE ROM
        ;;   word J defined in primitives/4000_flow.asm:134.
dw_J_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_J             ; Pointer to word name (above)
        .word dw_I_head         ; Link to previous dictionary entry
dw_J:
        .word @dw_R_FETCH+1     ; Code entry point: next instruction
dw_J_pfa:
	;; notes: I ( -- word )
	;;   copies the third topmost value of the return stack.
	LOAD R rstack		; Select the return stack
	STORE R curstack
	LI 2			; 0=topmost, 2=third topmost
	TRAP T_NPEEK
	STORE R31

	LOAD R dstack		; Select the return stack
	STORE R curstack
	TRAP T_PUSH

	RTF			; Return to Forth


	;; word:  CLRSTACK
	;; alias: CLRSTACK
	;; flags: FFL_PRIMITIVE ROM
        ;;   word CLRSTACK defined in primitives/4000_flow.asm:152.
dw_CLRSTACK_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_CLRSTACK      ; Pointer to word name (above)
        .word dw_J_head         ; Link to previous dictionary entry
dw_CLRSTACK:
        .word @+1               ; Code entry point: next instruction
dw_CLRSTACK_pfa:
	;; notes: CLRSTACK ( -- )
	;;   Clears the return stack.
	;;
	LOAD R rstack
	ADD PLUS2
	STORE I R rstack
	RTF			; Return to Forth



// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/6000_io.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// IO primitives

	;; word:  HALT
	;; alias: HALT
	;; flags: FFL_PRIMITIVE ROM
        ;;   word HALT defined in primitives/6000_io.asm:7.
dw_HALT_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_HALT          ; Pointer to word name (above)
        .word dw_CLRSTACK_head  ; Link to previous dictionary entry
dw_HALT:
        .word @+1               ; Code entry point: next instruction
dw_HALT_pfa:
	;; notes:
	;;   Halts the clock. On a real system this also switches to the
	;;   operator's panel, so we can't assume this is the end of
	;;   execution!
	DUMP
	HALT
	RTF			; Return to Forth macro-instruction

// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/6100_tty.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// I/O primitives

	;; word:  EMIT
	;; flags: FFL_PRIMITIVE ROM
        ;;   word EMIT defined in primitives/6100_tty.asm:6.
dw_EMIT_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_EMIT          ; Pointer to word name (above)
        .word dw_HALT_head      ; Link to previous dictionary entry
dw_EMIT:
        .word @+1               ; Code entry point: next instruction
dw_EMIT_pfa:
	;; notes: EMIT ( word -- )
	;;   Outputs the character specified by word.
	TRAP T_POP
__fl_emit:
	PUTCHAR
	RTF			; Return to Forth


	;; word:  CR
	;; flags: FFL_PRIMITIVE ROM
        ;;   word CR defined in primitives/6100_tty.asm:16.
dw_CR_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_CR            ; Pointer to word name (above)
        .word dw_EMIT_head      ; Link to previous dictionary entry
dw_CR:
        .word @+1               ; Code entry point: next instruction
dw_CR_pfa:
	;; notes: CR ( -- )
	;;   Outputs a carriage return.
	LI 10
	JMP __fl_emit


	;; word:  SPACE
	;; flags: FFL_PRIMITIVE ROM
        ;;   word SPACE defined in primitives/6100_tty.asm:24.
dw_SPACE_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_SPACE         ; Pointer to word name (above)
        .word dw_CR_head        ; Link to previous dictionary entry
dw_SPACE:
        .word @+1               ; Code entry point: next instruction
dw_SPACE_pfa:
	;; notes: SPACE ( -- )
	;;   Outputs a space.
	LI 32
	JMP __fl_emit


	;; word:  SPACES
	;; flags: FFL_PRIMITIVE ROM
        ;;   word SPACES defined in primitives/6100_tty.asm:32.
dw_SPACES_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_SPACES        ; Pointer to word name (above)
        .word dw_SPACE_head     ; Link to previous dictionary entry
dw_SPACES:
        .word @+1               ; Code entry point: next instruction
dw_SPACES_pfa:
	;; notes: SPACE ( num -- )
	;;   Outputs num spaces.
	TRAP T_POP
	NEG
	STORE IR0
__dw_spaces_loop:
	LOAD I IR0
	LOAD IR0
	SZA
	RTF			; Return to Forth
	LI 32
	PUTCHAR
	JMP __dw_spaces_loop


	;; word:  PUTS
	;; flags: FFL_PRIMITIVE ROM CFT
        ;;   word PUTS defined in primitives/6100_tty.asm:49.
dw_PUTS_head:
        .word FFL_PRIMITIVE FFL_ROM FFL_CFT ; Flags
        .word dwn_PUTS          ; Pointer to word name (above)
        .word dw_SPACES_head    ; Link to previous dictionary entry
dw_PUTS:
        .word @+1               ; Code entry point: next instruction
dw_PUTS_pfa:
	;; notes: CFT ( addr -- )
	;;   Prints out the string that starts at addr.
	TRAP T_POP		; address
	TRAP T_PUTS
	RTF


	;; word:  SPACES
	;; word:  TYPE
	;; flags: FFL_PRIMITIVE ROM
        ;;   word TYPE defined in primitives/6100_tty.asm:59.
dw_TYPE_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_TYPE          ; Pointer to word name (above)
        .word dw_PUTS_head      ; Link to previous dictionary entry
dw_TYPE:
        .word @+1               ; Code entry point: next instruction
dw_TYPE_pfa:
	;; notes: TYPE ( addr num -- )
	;;   Prinaaat num characters starting at address addr.
	TRAP T_POP		; num
	NEG			; -(num-1)
	STORE IR0

	TRAP T_POP		; addr
	STORE IR1

__dw_type_loop:
	LOAD I IR0		; Autoindex (abused)
	LOAD IR0
	SNP
	RTF			; Return to Forth
	LOAD I IR1		; Load character
	PUTCHAR
	JMP __dw_type_loop


	;; word:  KEY
	;; flags: FFL_PRIMITIVE ROM
        ;;   word KEY defined in primitives/6100_tty.asm:80.
dw_KEY_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_KEY           ; Pointer to word name (above)
        .word dw_TYPE_head      ; Link to previous dictionary entry
dw_KEY:
        .word @+1               ; Code entry point: next instruction
dw_KEY_pfa:
	;; notes: KEY ( -- word )
	;;   Word is the last character input.
_dw_key_loop:
	LI IFL_NEWCHAR		; Do we have a new character?
	AND R input_flags
	SNZ
	JMP _dw_key_loop

	LI IFL_NEWCHAR		; Clear the flag
	NOT
	AND R input_flags
	STORE R input_flags

	LOAD R last_inp_char
	TRAP T_PUSH

	RTF			; Return to Forth


	;; word:  ?KEY
	;; alias: have-key
	;; flags: FFL_PRIMITIVE ROM
        ;;   word ?KEY defined in primitives/6100_tty.asm:102.
dw_HAVE_KEY_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_HAVE_KEY      ; Pointer to word name (above)
        .word dw_KEY_head       ; Link to previous dictionary entry
dw_HAVE_KEY:
        .word @+1               ; Code entry point: next instruction
dw_HAVE_KEY_pfa:
	;; notes: KEY ( -- flag )
	;;   Flag is 1 if a key has been pressed, 0 otherwise.
	LI IFL_NEWCHAR		; Do we have a new character?
	AND R input_flags
	SNZ
	JMP _dw_have_key_not
	LI 1
_dw_have_key_done:
	TRAP T_PUSH
	RTF
_dw_have_key_not:
	LI 0
	JMP _dw_have_key_done
	RTF			; Return to Forth

// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/8000_cftdebug.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// CFT-specific test harness debugging

	;; word:  PRINTA
	;; flags: FFL_PRIMITIVE ROM
        ;;   word PRINTA defined in primitives/8000_cftdebug.asm:6.
dw_PRINTA_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_PRINTA        ; Pointer to word name (above)
        .word dw_HAVE_KEY_head  ; Link to previous dictionary entry
dw_PRINTA:
        .word @+1               ; Code entry point: next instruction
dw_PRINTA_pfa:
	;; notes: PRINTD ( word -- )
	;;   Prints out an address to the debugging interface.
	TRAP T_POP
	PRINTA
	RTF


	;; word:  PRINTD
	;; flags: FFL_PRIMITIVE ROM
        ;;   word PRINTD defined in primitives/8000_cftdebug.asm:15.
dw_PRINTD_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_PRINTD        ; Pointer to word name (above)
        .word dw_PRINTA_head    ; Link to previous dictionary entry
dw_PRINTD:
        .word @+1               ; Code entry point: next instruction
dw_PRINTD_pfa:
	;; notes: PRINTD ( word -- )
	;;   Issues the PRINTD debugging instruction to the test harness,
	;;   which should print out word in decimal.
	TRAP T_POP
	PRINTD
	RTF


	;; word:  DUMP
	;; flags: FFL_PRIMITIVE ROM
        ;;   word DUMP defined in primitives/8000_cftdebug.asm:25.
dw_DUMP_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_DUMP          ; Pointer to word name (above)
        .word dw_PRINTD_head    ; Link to previous dictionary entry
dw_DUMP:
        .word @+1               ; Code entry point: next instruction
dw_DUMP_pfa:
	;; notes: DUMP ( -- )
	;;   Issues the DUMP debugging instruction to the test harness,
	;;   which should dump the machine state.
	DUMP
	RTF

	;; word:  DEBUGON
	;; flags: FFL_PRIMITIVE ROM
        ;;   word DEBUGON defined in primitives/8000_cftdebug.asm:33.
dw_DEBUGON_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_DEBUGON       ; Pointer to word name (above)
        .word dw_DUMP_head      ; Link to previous dictionary entry
dw_DEBUGON:
        .word @+1               ; Code entry point: next instruction
dw_DEBUGON_pfa:
	;; notes: DUMP ( -- )
	;;   Enables debug logging.
	DEBUGON
	RTF

	;; word:  DEBUGOFF
	;; flags: FFL_PRIMITIVE ROM
        ;;   word DEBUGOFF defined in primitives/8000_cftdebug.asm:40.
dw_DEBUGOFF_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_DEBUGOFF      ; Pointer to word name (above)
        .word dw_DEBUGON_head   ; Link to previous dictionary entry
dw_DEBUGOFF:
        .word @+1               ; Code entry point: next instruction
dw_DEBUGOFF_pfa:
	;; notes: DUMP ( -- )
	;;   DISABLES debug logging.
	DEBUGOFF
	RTF

// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/9998_test.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// A fake compiled definition to test things.

	;; word:  TEMP_TEST
	;; alias: TEMP_TEST
	;; flags: ROM DOCOL
        ;;   word TEMP_TEST defined in primitives/9998_test.asm:7.
dw_TEMP_TEST_head:
        .word FFL_ROM FFL_DOCOL ; Flags
        .word dwn_TEMP_TEST     ; Pointer to word name (above)
        .word dw_DEBUGOFF_head  ; Link to previous dictionary entry
dw_TEMP_TEST:
        .word dw__DOCOL         ; Code entry point: next instruction
dw_TEMP_TEST_pfa:
	.word dw__LIT
	.word 32
	.word dw_DUMP
	.word dw__DOT_QUOTE
	.strn " ok "
	.word dw_EXIT


// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/9999_nop.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// Define the NOP primitive

	;; word:  NOP
	;; flags: FFL_PRIMITIVE ROM
        ;;   word NOP defined in primitives/9999_nop.asm:6.
dw_NOP_head:
        .word FFL_PRIMITIVE FFL_ROM ; Flags
        .word dwn_NOP           ; Pointer to word name (above)
        .word dw_TEMP_TEST_head ; Link to previous dictionary entry
dw_NOP:
        .word @+1               ; Code entry point: next instruction
dw_NOP_pfa:

	;; primitive code follows.

	;; This primitive does ABSOLUTELY nothing.

	;; End of primitive
	RTF


// End of file.

.equ __lastromlink dw_NOP_head

// End of file.
dwn_EXIT:
		.strn "EXIT"
dwn__DOCOL:
		.strn "_DOCOL"
dwn__VAR:
		.strn "_VAR"
dwn_NEXT:
		.strn "NEXT"
dwn_OK:
		.strn "OK"
dwn_BASE:
		.strn "BASE"
dwn_DIGIT_QUESTION:
		.strn "DIGIT?"
dwn_DIGIT:
		.strn "DIGIT"
dwn__NUMBER:
		.strn "_NUMBER"
dwn_LESS_SHARP:
		.strn "<#"
dwn_SHARP_GREATER:
		.strn "#>"
dwn_HOLD:
		.strn "HOLD"
dwn_FETCH:
		.strn "@"
dwn_STORE:
		.strn "!"
dwn_PLUS_STORE:
		.strn "+!"
dwn_ALLOT:
		.strn "ALLOT"
dwn_COMMA:
		.strn ","
dwn_FILL:
		.strn "FILL"
dwn_CMOVE:
		.strn "CMOVE"
dwn_COUNT:
		.strn "COUNT"
dwn_DROP:
		.strn "DROP"
dwn_DUP:
		.strn "DUP"
dwn_QUESTION_DUP:
		.strn "?DUP"
dwn_SWAP:
		.strn "SWAP"
dwn_SP_FETCH:
		.strn "SP@"
dwn_SPMAX:
		.strn "SPMAX"
dwn_OVER:
		.strn "OVER"
dwn_PICK:
		.strn "PICK"
dwn_ROT:
		.strn "ROT"
dwn_ROLL:
		.strn "ROLL"
dwn_DEPTH:
		.strn "DEPTH"
dwn_CLDSTACK:
		.strn "CLDSTACK"
dwn_PLUS:
		.strn "+"
dwn_ONE_PLUS:
		.strn "1+"
dwn_TWO_PLUS:
		.strn "2+"
dwn_MINUS:
		.strn "-"
dwn_ONE_MINUS:
		.strn "1-"
dwn_TWO_MINUS:
		.strn "2-"
dwn_TWO_DIVIDE:
		.strn "2/"
dwn_TWO_TIMES:
		.strn "2*"
dwn_NEGATE:
		.strn "NEGATE"
dwn_TIMES:
		.strn "*"
dwn_DIVIDE:
		.strn "/"
dwn_DIVIDE_MOD:
		.strn "/MOD"
dwn_MOD:
		.strn "MOD"
dwn_ABS:
		.strn "ABS"
dwn_D_PLUS:
		.strn "D+"
dwn_DNEGATE:
		.strn "DNEGATE"
dwn_D_:
		.strn "D-"
dwn_D0_EQUALS:
		.strn "D0="
dwn_D_EQUALS:
		.strn "D="
dwn_D_LESS_THAN:
		.strn "D<"
dwn_D_GREATER_THAN:
		.strn "D>"
dwn_DMAX:
		.strn "DMAX"
dwn_DMIN:
		.strn "DMIN"
dwn_D_TWO_TIMES:
		.strn "D2*"
dwn_D_TIMES:
		.strn "D*"
dwn_D_DIVIDE:
		.strn "D/MOD"
dwn_TRUE:
		.strn "TRUE"
dwn_FALSE:
		.strn "FALSE"
dwn_AND:
		.strn "AND"
dwn_OR:
		.strn "OR"
dwn_XOR:
		.strn "XOR"
dwn_NOT:
		.strn "NOT"
dwn_EQUALS:
		.strn "="
dwn_LESS_THAN:
		.strn "<"
dwn_GREATER_THAN:
		.strn ">"
dwn_ZERO_LESS:
		.strn "0<"
dwn_ZERO_EQUALS:
		.strn "0="
dwn_ZERO_GREATER:
		.strn "0>"
dwn_MAX:
		.strn "MAX"
dwn_MIN:
		.strn "MIN"
dwn_LEN:
		.strn "LEN"
dwn__JMP:
		.strn "_JMP"
dwn__LIT:
		.strn "_LIT"
dwn__DOT_QUOTE:
		.strn "_DOT_QUOTE"
dwn_QUERY:
		.strn "QUERY"
dwn_WORD:
		.strn "WORD"
dwn_QUIT:
		.strn "QUIT"
dwn_INTERPRET:
		.strn "INTERPRET"
dwn_EXECUTE:
		.strn "EXECUTE"
dwn_TIB:
		.strn "TIB"
dwn_TIBMAX:
		.strn "TIBMAX"
dwn_TICK:
		.strn "'"
dwn_FIND:
		.strn "FIND"
dwn_IP_STORE:
		.strn "IP!"
dwn_TO_BODY:
		.strn ">BODY"
dwn_TO_INPTR:
		.strn ">INPTR"
dwn_IN_0_STORE:
		.strn "IN0!"
dwn_INPTR:
		.strn "INPTR"
dwn_IN_FETCH_INC:
		.strn "IN@+"
dwn_HERE:
		.strn "HERE"
dwn_PAD:
		.strn "PAD"
dwn_BEGIN:
		.strn "BEGIN"
dwn_AGAIN:
		.strn "AGAIN"
dwn__IF:
		.strn "_IF"
dwn_TO_R:
		.strn ">R"
dwn_R_FROM:
		.strn "R>"
dwn_R_FETCH:
		.strn "R@"
dwn_RDROP:
		.strn "RDROP"
dwn_I:
		.strn "I"
dwn_J:
		.strn "J"
dwn_CLRSTACK:
		.strn "CLRSTACK"
dwn_HALT:
		.strn "HALT"
dwn_EMIT:
		.strn "EMIT"
dwn_CR:
		.strn "CR"
dwn_SPACE:
		.strn "SPACE"
dwn_SPACES:
		.strn "SPACES"
dwn_PUTS:
		.strn "PUTS"
dwn_TYPE:
		.strn "TYPE"
dwn_KEY:
		.strn "KEY"
dwn_HAVE_KEY:
		.strn "?KEY"
dwn_PRINTA:
		.strn "PRINTA"
dwn_PRINTD:
		.strn "PRINTD"
dwn_DUMP:
		.strn "DUMP"
dwn_DEBUGON:
		.strn "DEBUGON"
dwn_DEBUGOFF:
		.strn "DEBUGOFF"
dwn_TEMP_TEST:
		.strn "TEMP_TEST"
dwn_NOP:
		.strn "NOP"

