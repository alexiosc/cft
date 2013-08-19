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
// FILE: primitives/0001_VOCABULARY-Root.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// Start the Forth vocabulary.


	;; vocabulary: Root


	.equ _voc_ NULL




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; START NEW VOCABULARY: Root
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




	;; word:  ROM.ROOT
	;; alias: ROM-ROOT
	;; flags: VOCABULARY ROM
        ;;   word ROM.ROOT defined in primitives/0001_VOCABULARY-Root.asm:11.
//dwn_ROM_ROOT:
//        .strp "ROM.ROOT" 0
dw_ROM_ROOT_head:
        .word FFL_T_VAR FFL_ROM 2 ; Flags & hash
        .word dwn_ROM_ROOT      ; Pointer to word name (above)
        .word NULL              ; Link to previous dictionary entry
dw_ROM_ROOT:
        CFA_doVOC()       ; Code entry point: next instruction
dw_ROM_ROOT_pfa:
	;; notes: ROM.ROOT ( -- )
	;;        Makes the Root vocabulary the current vocabulary.

	.word _voc_Root



	;; word:  ROM.FORTH
	;; alias: ROM-FORTH
	;; flags: VOCABULARY ROM
        ;;   word ROM.FORTH defined in primitives/0001_VOCABULARY-Root.asm:21.
//dwn_ROM_FORTH:
//        .strp "ROM.FORTH" 0
dw_ROM_FORTH_head:
        .word FFL_T_VAR FFL_ROM 3 ; Flags & hash
        .word dwn_ROM_FORTH     ; Pointer to word name (above)
        .word dw_ROM_ROOT_head  ; Link to previous dictionary entry
dw_ROM_FORTH:
        CFA_doVOC()       ; Code entry point: next instruction
dw_ROM_FORTH_pfa:
	;; notes: ROM.FORTH ( -- )
	;;        Makes the ROMForth vocabulary the current vocabulary.

	.word _voc_ROMForth



	;; word:  ONLY
	;; flags: DOCOL ROM CFT
        ;;   word ONLY defined in primitives/0001_VOCABULARY-Root.asm:30.
//dwn_ONLY:
//        .strp "ONLY" 0
dw_ONLY_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 3 ; Flags & hash
        .word dwn_ONLY          ; Pointer to word name (above)
        .word dw_ROM_FORTH_head ; Link to previous dictionary entry
dw_ONLY:
        CFA_doCOL()       ; Code entry point: next instruction
dw_ONLY_pfa:
	;; notes: ONLY ( -- )
	;;        Clears the vocabulary stack and installs ROM.ROOT
	;;        as its first two entries.
	;; code:  : ONLY ( -- ) 2 pCONTEXT ! ['] ROM.ROOT DUP CONTEXT 2! ;

	;; 2 pCONTEXT ! \ Reset the vocabulary pointer
	doLIT(2)		; 2
	.word dw_pCONTEXT	; pCONTEXT
	.word dw_store		; !

	;; ['] ROM.BOOT DUP CONTEXT 2! \ Store ROM.BOOT as the first 2 entries.
	doLIT(dw_ROM_ROOT_pfa)	; **last ( va )
	.word dw_DUP		; DUP ( va va )
	.word dw_CONTEXT	; CONTEXT ( va va a )
	.word dw_two_store	; 2! ( )

	.word dw_EXIT






	;; word:  ORDER
	;; flags: DOCOL ROM CFT
        ;;   word ORDER defined in primitives/0001_VOCABULARY-Root.asm:55.
//dwn_ORDER:
//        .strp "ORDER" 0
dw_ORDER_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn_ORDER         ; Pointer to word name (above)
        .word dw_ONLY_head      ; Link to previous dictionary entry
dw_ORDER:
        CFA_doCOL()       ; Code entry point: next instruction
dw_ORDER_pfa:
	;; notes: ORDER ( -- )
	;;        Prints out the vocabulary search order.

	.word dw_voc0		; voc0 ( n a )

_order_loop:
	.word dw_dec		; 1- ( n a-1 )
	.word dw_to_NAME	; >NAME ( n na )
	.word dw_typep0		; TYPEP0 ( n )
	.word dw_SPACE		; SPACE ( n )

	.word dw_voc_plus	; voc+ ( n a | false )
	.word dw_if_DUP		; ?DUP ( n a a | false )
	.word dw_if_branch	; if done...
	.word _order_done	;    ... go to end ( )

	.word dw_branch		; loop again
	.word _order_loop

_order_done:
	.word dw_EXIT



	;; word:  WORDS
	;; flags: DOCOL ROM CFT
        ;;   word WORDS defined in primitives/0001_VOCABULARY-Root.asm:81.
//dwn_WORDS:
//        .strp "WORDS" 0
dw_WORDS_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn_WORDS         ; Pointer to word name (above)
        .word dw_ORDER_head     ; Link to previous dictionary entry
dw_WORDS:
        CFA_doCOL()       ; Code entry point: next instruction
dw_WORDS_pfa:
	;; notes: WORDS ( -- )
	;;        Prints out list of words.

	.word dw_CR		; CR ( )
	doLIT(0)
	.word dw_CONTEXT_fetch	; CONTEXT@ ( a )

_words_loop:
	.word dw_fetch		; @ ( a' )

	.word dw_DUP		; @ ( a' a' )
 	.word dw_if_branch	; ?branch ( a' )
	.word _words_end	;
	.word dw_inc		; 1+ ( a'+1 ) \ start + 1: word name ptr (pstr)
	.word dw_DUP		; DUP ( a'+1 a'+1 ) \ start + 1: word name ptr (pstr)
	.word dw_fetch		; @ ( a'+1 a'' ) \ string address
	.word dw_typep0		; TYPEP0 ( a'+1 )
	.word dw_SPACE		; SPACE

	;; Link to the next word
	.word dw_inc		; 1+ ( a'+2 ) \ start + 2: link.
	.word dw_branch		; branch
	.word _words_loop

_words_end:
	.word dw_DROP		; DROP ( )
	.word dw_EXIT



	;; word:  >RAM
	;; alias: to_RAM
	;; flags: CODE ROM CFT
        ;;   word >RAM defined in primitives/0001_VOCABULARY-Root.asm:114.
//dwn_to_RAM:
//        .strp ">RAM" 0
dw_to_RAM_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn_to_RAM        ; Pointer to word name (above)
        .word dw_WORDS_head     ; Link to previous dictionary entry
dw_to_RAM:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_to_RAM_pfa:
	;; notes: >RAM ( -- )
	;;        Makes a copy of the current vocabulary definition to RAM,
	;;        so it can be extended. Vocabulary definitions are variables
	;;        and must be mutable.

	;; Get the address of the pointer to the top vocabulary.
	LOADUP(UAOFS_pCONTEXT)
	STORE TMP1
	LI UAOFS_CONTEXT
	ADD UP
	ADD MINUS1
	ADD TMP1
	STORE TMP1		; TMP1 = address of the top of the vocab stack
	RMOV(TMP3, I TMP1)	; TMP3 = PFA (soon-to-be last link)

	;; TMP1 = AC = vocab word PFA. Get to the HEAD.
	ADD _to_RAM_data
	STORE I0

	;; Now start copying. First, keep a copy of HERE.
	RMOV(TMP2, CP)

	;; 1. Copy the flags, clear the FFL_ROM bit.
	LOAD @_to_RAM_data+1
	AND I I0
	STORE I CP		; CP++ = mem[I0++] & ~FFL_ROM

	;; 2. Copy the string pointer as is.
	RMOV(I CP, I I0)	; CP++ = I0++

	;; 3. Set the link. The link is the current value in the vocab PFA.
	LOAD I I0		; Just to increment I0.
	RMOV(I CP, I TMP3)	; CP++ = PFA

	;; 4. Copy the CFA.
	RMOV(I CP, I I0)	; CP++ = I0++

	;; 5. Also update the address of the new head on the vocabulary stack.
	RMOV(I TMP1, CP)

	;; 6. Add the LAST pointer (which is the new head, in TMP2)
	RMOV(I CP, TMP2)

	// TODO: dictionary search fails after this. Chekc why!
	NEXT

_to_RAM_data:
	.word -4		; PFA-to-head offset
	.word @&ffff^FFL_ROM	; NOT FFL_ROM



	;; ;; Compile the string address.
	;; .word dw_to_NAME	; >NAME ( cp a va va name-addr )
	;; .word dw_comma		; , ( cp a va va )

	;; ;; Compile the link
	;; .word dw_fetch		; @ ( cp a va a )
	;; .word dw_DUP
	;; .word dw_PRINTA
	;; .word dw_comma		; , ( cp a va )

	;; ;; Compile the codeword
	;; .word dw_fetch		; @ ( cp a cfa )
	;; .word dw_DUP
	;; .word dw_PRINTH
	;; .word dw_comma		; , ( cp a )

	;; ;; Compile the value.
	;; .word dw_fetch		; @ ( cp cfa )
	;; .word dw_DUP
	;; .word dw_PRINTH
	;; .word dw_comma		; , ( cp )

	;; ;; And update the LAST pointer.

	.word dw_EXIT



// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/1001_VOCABULARY-Forth.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// Start the Forth vocabulary.


	;; vocabulary: ROMForth


	.equ _voc_Root dw_to_RAM_head




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; START NEW VOCABULARY: ROMForth
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/1010_core.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// The inner interpreter.



	;; word:  doLIST
	;; flags: CODE ROM
        ;;   word doLIST defined in primitives/1010_core.asm:8.
//dwn_doLIST:
//        .strp "DOLIST" 0
dw_doLIST_head:
        .word FFL_T_CODE FFL_ROM 2 ; Flags & hash
        .word dwn_doLIST        ; Pointer to word name (above)
        .word NULL              ; Link to previous dictionary entry
dw_doLIST:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_doLIST_pfa:
	;; notes: $doLIST ( a -- )
	;;   Execute address list starting with a.

	RPUSH(RP, IP)	      ; Push the IP onto the Return Stack (RP)
	RPOP(IP, SP)	      ;	Pop the new value of the IP from the Data Stack
	NEXT



	;; word:  EXIT
	;; flags: CODE ROM COMPILE
        ;;   word EXIT defined in primitives/1010_core.asm:19.
//dwn_EXIT:
//        .strp "EXIT" 0
dw_EXIT_head:
        .word FFL_T_CODE FFL_ROM FFL_COMPILE 1 ; Flags & hash
        .word dwn_EXIT          ; Pointer to word name (above)
        .word dw_doLIST_head    ; Link to previous dictionary entry
dw_EXIT:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_EXIT_pfa:
	;; notes: EXIT ( -- )

	RPOP(IP, RP)		; Get the IP from the return stack
	NEXT



	;; word:  EXECUTE
	;; flags: CODE ROM
        ;;   word EXECUTE defined in primitives/1010_core.asm:28.
//dwn_EXECUTE:
//        .strp "EXECUTE" 0
dw_EXECUTE_head:
        .word FFL_T_CODE FFL_ROM 2 ; Flags & hash
        .word dwn_EXECUTE       ; Pointer to word name (above)
        .word dw_EXIT_head      ; Link to previous dictionary entry
dw_EXECUTE:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_EXECUTE_pfa:
	;; notes: EXECUTE ( ca -- )
	;;   Pop address from data stack and jump to it.

	RPOP(TMP0,SP)		; POP without STORE
	JMP I TMP0



	;; word:  doLIT
	;; flags: CODE ROM IMMEDIATE
        ;;   word doLIT defined in primitives/1010_core.asm:38.
//dwn_doLIT:
//        .strp "DOLIT" 0
dw_doLIT_head:
        .word FFL_T_CODE FFL_ROM FFL_IMMEDIATE 1 ; Flags & hash
        .word dwn_doLIT         ; Pointer to word name (above)
        .word dw_EXECUTE_head   ; Link to previous dictionary entry
dw_doLIT:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_doLIT_pfa:
	;; notes: EXECUTE ( -- w )
	;;   Push a literal onto the stack.

	LOAD I IP
	PUSH SP
	NEXT



	;; word:  doPSTR
	;; flags: CODE ROM
        ;;   word doPSTR defined in primitives/1010_core.asm:49.
//dwn_doPSTR:
//        .strp "DOPSTR" 0
dw_doPSTR_head:
        .word FFL_T_CODE FFL_ROM 2 ; Flags & hash
        .word dwn_doPSTR        ; Pointer to word name (above)
        .word dw_doLIT_head     ; Link to previous dictionary entry
dw_doPSTR:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_doPSTR_pfa:
	;; notes: EXECUTE ( -- w )
	;;   Push a string literal onto the stack.

	RMOV (TMP1, I IP)	; TMP1 = First cell after string.
	RPUSH (SP, IP)		; IP (no indirection) is the address of the string.
	RMOV (IP, TMP1)		; IP = TMP1
	NEXT



	;; word:  NOP
	;; flags: CODE ROM
        ;;   word NOP defined in primitives/1010_core.asm:61.
//dwn_NOP:
//        .strp "NOP" 0
dw_NOP_head:
        .word FFL_T_CODE FFL_ROM 5 ; Flags & hash
        .word dwn_NOP           ; Pointer to word name (above)
        .word dw_doPSTR_head    ; Link to previous dictionary entry
dw_NOP:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_NOP_pfa:
	;; notes: NOP ( -- )
	;;   Does nothing, and it does it slowly.

	NEXT


// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/1011_branch.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// Define the NAME primitive

	;; word:  branch
	;; flags: CODE ROM
        ;;   word branch defined in primitives/1011_branch.asm:6.
//dwn_branch:
//        .strp "BRANCH" 0
dw_branch_head:
        .word FFL_T_CODE FFL_ROM 4 ; Flags & hash
        .word dwn_branch        ; Pointer to word name (above)
        .word dw_NOP_head       ; Link to previous dictionary entry
dw_branch:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_branch_pfa:
	;; notes: branch ( -- )
	;;   Branches to the address specified after it in an address list. That is,
	;;   IP <- mem[IP]

	RMOV(IP, I IP)		; IP = mem[IP++]
	NEXT



	;; word:  ?branch
	;; alias: if-branch
	;; flags: CODE ROM
        ;;   word ?branch defined in primitives/1011_branch.asm:18.
//dwn_if_branch:
//        .strp "?BRANCH" 0
dw_if_branch_head:
        .word FFL_T_CODE FFL_ROM 0 ; Flags & hash
        .word dwn_if_branch     ; Pointer to word name (above)
        .word dw_branch_head    ; Link to previous dictionary entry
dw_if_branch:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_if_branch_pfa:
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
        ;;   word next defined in primitives/1011_branch.asm:41.
//dwn_next:
//        .strp "NEXT" 0
dw_next_head:
        .word FFL_T_CODE FFL_ROM 2 ; Flags & hash
        .word dwn_next          ; Pointer to word name (above)
        .word dw_if_branch_head ; Link to previous dictionary entry
dw_next:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_next_pfa:
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


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/1013_comparison.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// Core comparison primitives



	;; word:  FALSE
	;; flags: CODE ROM
        ;;   word FALSE defined in primitives/1013_comparison.asm:8.
//dwn_FALSE:
//        .strp "FALSE" 0
dw_FALSE_head:
        .word FFL_T_CODE FFL_ROM 3 ; Flags & hash
        .word dwn_FALSE         ; Pointer to word name (above)
        .word dw_next_head      ; Link to previous dictionary entry
dw_FALSE:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_FALSE_pfa:
	;; notes: FALSE ( -- f )
	;;   Push FALSE
	LI 0
	PUSH SP
	NEXT



	;; word:  TRUE
	;; flags: CODE ROM
        ;;   word TRUE defined in primitives/1013_comparison.asm:18.
//dwn_TRUE:
//        .strp "TRUE" 0
dw_TRUE_head:
        .word FFL_T_CODE FFL_ROM 0 ; Flags & hash
        .word dwn_TRUE          ; Pointer to word name (above)
        .word dw_FALSE_head     ; Link to previous dictionary entry
dw_TRUE:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_TRUE_pfa:
	;; notes: TRUE ( -- f )
	;;   Push TRUE
	RPUSH(SP, MINUS1)	; Push &ffff
	NEXT



	;; word:  0<
	;; alias: zero-less
	;; flags: CODE ROM
        ;;   word 0< defined in primitives/1013_comparison.asm:28.
//dwn_zero_less:
//        .strp "0<" 0
dw_zero_less_head:
        .word FFL_T_CODE FFL_ROM 2 ; Flags & hash
        .word dwn_zero_less     ; Pointer to word name (above)
        .word dw_TRUE_head      ; Link to previous dictionary entry
dw_zero_less:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_zero_less_pfa:
	;; notes: 0< ( n -- f )
	;;   Push true if n is negative, false otherwise
	POP SP
	SNA			; Negative?
	JMP dw_FALSE		; No. Push 0
	JMP dw_TRUE		; Yes. Push 1



	;; word:  0=
	;; alias: zero-equals
	;; flags: CODE ROM
        ;;   word 0= defined in primitives/1013_comparison.asm:40.
//dwn_zero_equals:
//        .strp "0=" 0
dw_zero_equals_head:
        .word FFL_T_CODE FFL_ROM 2 ; Flags & hash
        .word dwn_zero_equals   ; Pointer to word name (above)
        .word dw_zero_less_head ; Link to previous dictionary entry
dw_zero_equals:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_zero_equals_pfa:
	;; notes: 0= ( n -- f )
	;;   Push true if n is zero, false otherwise
	POP SP
	SZA			; Zero?
	JMP dw_FALSE		; No. Push 0
	JMP dw_TRUE		; Yes. Push 1



	;; word:  0>
	;; alias: zero-greater
	;; flags: CODE ROM
        ;;   word 0> defined in primitives/1013_comparison.asm:52.
//dwn_zero_greater:
//        .strp "0>" 0
dw_zero_greater_head:
        .word FFL_T_CODE FFL_ROM 2 ; Flags & hash
        .word dwn_zero_greater  ; Pointer to word name (above)
        .word dw_zero_equals_head ; Link to previous dictionary entry
dw_zero_greater:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_zero_greater_pfa:
	;; notes: 0> ( n -- f )
	;;   Push true if n is greter than zero, false otherwise
	POP SP
	SPA			; Greater than zero?
	JMP dw_FALSE		; No. Push 0
	JMP dw_TRUE		; Yes. Push 1



	;; word:  <
	;; alias: lt
	;; flags: CODE ROM
        ;;   word < defined in primitives/1013_comparison.asm:64.
//dwn_lt:
//        .strp "<" 0
dw_lt_head:
        .word FFL_T_CODE FFL_ROM 5 ; Flags & hash
        .word dwn_lt            ; Pointer to word name (above)
        .word dw_zero_greater_head ; Link to previous dictionary entry
dw_lt:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_lt_pfa:
	;; notes: < ( w1 w2 -- f )
	;;   Push true if w1 < w2, false otherwise.
	RPOP(TMP0, SP)		; TMP0 = w1
	POP SP			; w2

	NEG
	ADD TMP0		; w1 - w2

	SNA			; w1 < w2?
	JMP dw_FALSE		; No. (unequal)
	JMP dw_TRUE



	;; word:  <=
	;; alias: leq
	;; flags: CODE ROM
        ;;   word <= defined in primitives/1013_comparison.asm:81.
//dwn_leq:
//        .strp "<=" 0
dw_leq_head:
        .word FFL_T_CODE FFL_ROM 6 ; Flags & hash
        .word dwn_leq           ; Pointer to word name (above)
        .word dw_lt_head        ; Link to previous dictionary entry
dw_leq:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_leq_pfa:
	;; notes: <= ( w1 w2 -- f )
	;;   Push true if w1 <= w2, false otherwise.
	RPOP(TMP0, SP)		; TMP0 = w1
	POP SP			; w2

	NEG
	ADD TMP0		; w1 - w2

	SNP			; w1 <= w2?
	JMP dw_FALSE		; No.
	JMP dw_TRUE		; Yes.



	;; word:  =
	;; alias: equal
	;; flags: CODE ROM
        ;;   word = defined in primitives/1013_comparison.asm:98.
//dwn_equal:
//        .strp "=" 0
dw_equal_head:
        .word FFL_T_CODE FFL_ROM 4 ; Flags & hash
        .word dwn_equal         ; Pointer to word name (above)
        .word dw_leq_head       ; Link to previous dictionary entry
dw_equal:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_equal_pfa:
	;; notes: = ( w w -- f )
	;;   Push true if n is negative, false otherwise
	RPOP(TMP0, SP)		; TMP0 = w1
	POP SP			; w2

	XOR TMP0		; Compare

	SZA			; A == 0? (equal?)
	JMP dw_FALSE		; No. (unequal)
	JMP dw_TRUE



	;; word:  <>
	;; alias: not-equal
	;; flags: CODE ROM
        ;;   word <> defined in primitives/1013_comparison.asm:114.
//dwn_not_equal:
//        .strp "<>" 0
dw_not_equal_head:
        .word FFL_T_CODE FFL_ROM 6 ; Flags & hash
        .word dwn_not_equal     ; Pointer to word name (above)
        .word dw_equal_head     ; Link to previous dictionary entry
dw_not_equal:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_not_equal_pfa:
	;; notes: = ( w w -- f )
	;;   Push true if n is negative, false otherwise
	RPOP(TMP0, SP)		; TMP0 = w1
	POP SP			; w2

	XOR TMP0		; Compare

	SNZ			; A != 0? (unequal?)
	JMP dw_FALSE		; No. (equal)
	JMP dw_TRUE



	;; word:  >=
	;; alias: geq
	;; flags: CODE ROM
        ;;   word >= defined in primitives/1013_comparison.asm:130.
//dwn_geq:
//        .strp ">=" 0
dw_geq_head:
        .word FFL_T_CODE FFL_ROM 4 ; Flags & hash
        .word dwn_geq           ; Pointer to word name (above)
        .word dw_not_equal_head ; Link to previous dictionary entry
dw_geq:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_geq_pfa:
	;; notes: >= ( w1 w2 -- f )
	;;   Push true if w1 >= w2, false otherwise.
	RPOP(TMP0, SP)		; TMP0 = w1
	POP SP			; w2

	NEG
	ADD TMP0		; w1 - w2

	SNN			; w1 >= w2?
	JMP dw_FALSE		; No. (unequal)
	JMP dw_TRUE



	;; word:  >
	;; alias: gt
	;; flags: CODE ROM
        ;;   word > defined in primitives/1013_comparison.asm:147.
//dwn_gt:
//        .strp ">" 0
dw_gt_head:
        .word FFL_T_CODE FFL_ROM 7 ; Flags & hash
        .word dwn_gt            ; Pointer to word name (above)
        .word dw_geq_head       ; Link to previous dictionary entry
dw_gt:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_gt_pfa:
	;; notes: > ( w1 w2 -- f )
	;;   Push true if w1 > w2, false otherwise.
	RPOP(TMP0, SP)		; TMP0 = w1
	POP SP			; w2

	NEG
	ADD TMP0		; w1 - w2

	SPA			; Positive A?
	JMP dw_FALSE		; No. (unequal)
	JMP dw_TRUE



	;; word:  MIN
	;; flags: CODE ROM
        ;;   word MIN defined in primitives/1013_comparison.asm:163.
//dwn_MIN:
//        .strp "MIN" 0
dw_MIN_head:
        .word FFL_T_CODE FFL_ROM 6 ; Flags & hash
        .word dwn_MIN           ; Pointer to word name (above)
        .word dw_gt_head        ; Link to previous dictionary entry
dw_MIN:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_MIN_pfa:
	;; notes: MIN ( w1 w2 -- w )
	;;   Pushes the minimum of the two numbers.
	RPOP(TMP0, SP)		; TMP0 = w1

	RPOP(TMP1, SP)		; TMP1 = w2
	NEG
	ADD TMP0		; w1 - w2

	SPA			; Positive AC? (= w2 is min)
	JMP dw_MIN_push_w1	; No. w1 is smaller. Push it.

dw_MIN_push_w2:			; Yes. w2 is smaller.
	RPUSH(SP, TMP1)
	NEXT

dw_MIN_push_w1:
	RPUSH(SP, TMP0)
	NEXT



	;; word:  MAX
	;; flags: CODE ROM
        ;;   word MAX defined in primitives/1013_comparison.asm:186.
//dwn_MAX:
//        .strp "MAX" 0
dw_MAX_head:
        .word FFL_T_CODE FFL_ROM 6 ; Flags & hash
        .word dwn_MAX           ; Pointer to word name (above)
        .word dw_MIN_head       ; Link to previous dictionary entry
dw_MAX:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_MAX_pfa:
	;; notes: MIN ( w w -- w )
	;;   Pushes the minimum of the two numbers.
	RPOP(TMP0, SP)		; TMP0 = w1

	RPOP(TMP1, SP)		; TMP1 = w2
	NEG
	ADD TMP0		; w1 - w2

	SPA			; Positive AC? (= w1 is max)
	JMP dw_MIN_push_w2	; Push w2
	JMP dw_MIN_push_w1	; Push w1



	;; word:  WITHIN
	;; flags: CODE ROM
        ;;   word WITHIN defined in primitives/1013_comparison.asm:202.
//dwn_WITHIN:
//        .strp "WITHIN" 0
dw_WITHIN_head:
        .word FFL_T_CODE FFL_ROM 1 ; Flags & hash
        .word dwn_WITHIN        ; Pointer to word name (above)
        .word dw_MAX_head       ; Link to previous dictionary entry
dw_WITHIN:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_WITHIN_pfa:
	;; notes: WITHIN ( u ul uh -- f )
	;;   TRUE if ul <= u <= uh
	RPOP (TMP0, SP)		; uh
	RPOP (TMP1, SP)		; ul
	POP (SP)		; u
	NEG
	STORE TMP2		; TMP2 = -u

	ADD TMP0		; uh - u
	SNN			; >=0? (i.e. u <= uh)
	JMP dw_FALSE		; No. Push FALSE and exit.

	LOAD TMP2
	ADD TMP1		; ul - u
	SNP			; <=0? (i.e ul <= u)
	JMP dw_FALSE		; No. Push FALSE end exit.

	JMP dw_TRUE		; Both checks succeeded. Push TRUE.



// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/1014_arithlogic.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// Core arithmetic and logic

	;; word:  AND
	;; flags: CODE ROM
        ;;   word AND defined in primitives/1014_arithlogic.asm:6.
//dwn_AND:
//        .strp "AND" 0
dw_AND_head:
        .word FFL_T_CODE FFL_ROM 2 ; Flags & hash
        .word dwn_AND           ; Pointer to word name (above)
        .word dw_WITHIN_head    ; Link to previous dictionary entry
dw_AND:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_AND_pfa:
	;; notes: AND ( w w -- w )
	;;   Bitwise AND

	RPOP(TMP0, SP)
	POP SP
	AND TMP0
	PUSH SP
	NEXT



	;; word:  OR
	;; flags: CODE ROM
        ;;   word OR defined in primitives/1014_arithlogic.asm:19.
//dwn_OR:
//        .strp "OR" 0
dw_OR_head:
        .word FFL_T_CODE FFL_ROM 5 ; Flags & hash
        .word dwn_OR            ; Pointer to word name (above)
        .word dw_AND_head       ; Link to previous dictionary entry
dw_OR:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_OR_pfa:
	;; notes: OR ( w w -- w )
	;;   Bitwise OR

	RPOP(TMP0, SP)
	POP SP
	OR TMP0
	PUSH SP
	NEXT



	;; word:  XOR
	;; flags: CODE ROM
        ;;   word XOR defined in primitives/1014_arithlogic.asm:32.
//dwn_XOR:
//        .strp "XOR" 0
dw_XOR_head:
        .word FFL_T_CODE FFL_ROM 3 ; Flags & hash
        .word dwn_XOR           ; Pointer to word name (above)
        .word dw_OR_head        ; Link to previous dictionary entry
dw_XOR:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_XOR_pfa:
	;; notes: XOR ( w w -- w )
	;;   Bitwise XOR

	RPOP(TMP0, SP)
	POP SP
	XOR TMP0
	PUSH SP
	NEXT



	;; word:  +
	;; alias: add
	;; flags: CODE ROM
        ;;   word + defined in primitives/1014_arithlogic.asm:46.
//dwn_add:
//        .strp "+" 0
dw_add_head:
        .word FFL_T_CODE FFL_ROM 2 ; Flags & hash
        .word dwn_add           ; Pointer to word name (above)
        .word dw_XOR_head       ; Link to previous dictionary entry
dw_add:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_add_pfa:
	;; notes: + ( w w -- w )
	;;   Addition

	RPOP(TMP0, SP)
	POP SP
	ADD TMP0
	PUSH SP
	NEXT



	;; word:  -
	;; alias: sub
	;; flags: CODE ROM
        ;;   word - defined in primitives/1014_arithlogic.asm:60.
//dwn_sub:
//        .strp "-" 0
dw_sub_head:
        .word FFL_T_CODE FFL_ROM 4 ; Flags & hash
        .word dwn_sub           ; Pointer to word name (above)
        .word dw_add_head       ; Link to previous dictionary entry
dw_sub:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_sub_pfa:
	;; notes: - ( w1 w2 -- w )
	;;   Subtraction

	RPOP(TMP0, SP)		; w1
	POP SP
	NEG
	ADD TMP0
	PUSH SP
	NEXT



	;; word:  NEGATE
	;; alias: NEGATE
	;; flags: CODE ROM
        ;;   word NEGATE defined in primitives/1014_arithlogic.asm:75.
//dwn_NEGATE:
//        .strp "NEGATE" 0
dw_NEGATE_head:
        .word FFL_T_CODE FFL_ROM 0 ; Flags & hash
        .word dwn_NEGATE        ; Pointer to word name (above)
        .word dw_sub_head       ; Link to previous dictionary entry
dw_NEGATE:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_NEGATE_pfa:
	;; notes: NEGATE ( w -- -w )
	;;        Two's complement negation.

	POP SP
	NEG
	PUSH SP
	NEXT



	;; word:  1+
	;; alias: inc
	;; flags: CODE ROM
        ;;   word 1+ defined in primitives/1014_arithlogic.asm:88.
//dwn_inc:
//        .strp "1+" 0
dw_inc_head:
        .word FFL_T_CODE FFL_ROM 3 ; Flags & hash
        .word dwn_inc           ; Pointer to word name (above)
        .word dw_NEGATE_head    ; Link to previous dictionary entry
dw_inc:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_inc_pfa:
	;; notes: 1+ ( w -- w )
	;;   Increment by one

	POP SP
	ADD PLUS1
	PUSH SP
	NEXT



	;; word:  2+
	;; alias: inc2
	;; flags: CODE ROM
        ;;   word 2+ defined in primitives/1014_arithlogic.asm:101.
//dwn_inc2:
//        .strp "2+" 0
dw_inc2_head:
        .word FFL_T_CODE FFL_ROM 0 ; Flags & hash
        .word dwn_inc2          ; Pointer to word name (above)
        .word dw_inc_head       ; Link to previous dictionary entry
dw_inc2:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_inc2_pfa:
	;; notes: 2+ ( w -- w )
	;;   Increment by two

	POP SP
	ADD PLUS2
	PUSH SP
	NEXT



	;; word:  1-
	;; alias: dec
	;; flags: CODE ROM
        ;;   word 1- defined in primitives/1014_arithlogic.asm:114.
//dwn_dec:
//        .strp "1-" 0
dw_dec_head:
        .word FFL_T_CODE FFL_ROM 3 ; Flags & hash
        .word dwn_dec           ; Pointer to word name (above)
        .word dw_inc2_head      ; Link to previous dictionary entry
dw_dec:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_dec_pfa:
	;; notes: 1- ( w -- w )
	;;   Decrement by one

	POP SP
	ADD MINUS1
	PUSH SP
	NEXT



	;; word:  2-
	;; alias: dec2
	;; flags: CODE ROM
        ;;   word 2- defined in primitives/1014_arithlogic.asm:127.
//dwn_dec2:
//        .strp "2-" 0
dw_dec2_head:
        .word FFL_T_CODE FFL_ROM 0 ; Flags & hash
        .word dwn_dec2          ; Pointer to word name (above)
        .word dw_dec_head       ; Link to previous dictionary entry
dw_dec2:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_dec2_pfa:
	;; notes: 2- ( w -- w )
	;;   Decrement by two

	POP SP
	ADD MINUS2
	PUSH SP
	NEXT



	;; word:  >>1
	;; alias: shl1
	;; flags: CODE ROM CFT
        ;;   word >>1 defined in primitives/1014_arithlogic.asm:140.
//dwn_shl1:
//        .strp ">>1" 0
dw_shl1_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 5 ; Flags & hash
        .word dwn_shl1          ; Pointer to word name (above)
        .word dw_dec2_head      ; Link to previous dictionary entry
dw_shl1:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_shl1_pfa:
	;; notes: 2/ ( w -- w )
	;;   Shift right one bit. No sign extension.

	POP SP
	SBR
	PUSH SP
	NEXT



	;; word:  2/
	;; alias: 2div
	;; flags: CODE ROM
        ;;   word 2/ defined in primitives/1014_arithlogic.asm:153.
//dwn_2div:
//        .strp "2/" 0
dw_2div_head:
        .word FFL_T_CODE FFL_ROM 0 ; Flags & hash
        .word dwn_2div          ; Pointer to word name (above)
        .word dw_shl1_head      ; Link to previous dictionary entry
dw_2div:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_2div_pfa:
	;; notes: 2/ ( w -- w )
	;;   Shift right one bit with sign extension.

	POP SP

	CLL			; Clear L
	SNN			; Skip if non-negative
	SEL			; Set L for sign extension

	RBR			; Roll 1 bit right, L becomes bit 15.

	PUSH SP
	NEXT



	;; word:  2*
	;; alias: 2mul
	;; flags: CODE ROM CFT
        ;;   word 2* defined in primitives/1014_arithlogic.asm:172.
//dwn_2mul:
//        .strp "2*" 0
dw_2mul_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 0 ; Flags & hash
        .word dwn_2mul          ; Pointer to word name (above)
        .word dw_2div_head      ; Link to previous dictionary entry
dw_2mul:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_2mul_pfa:
	;; notes: 2* ( u -- u )
	;;   Shift left one bit.

	POP SP
	SBL
	PUSH SP
	NEXT



	;; word:  16/
	;; alias: 16div
	;; flags: CODE ROM CFT
        ;;   word 16/ defined in primitives/1014_arithlogic.asm:185.
//dwn_16div:
//        .strp "16/" 0
dw_16div_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn_16div         ; Pointer to word name (above)
        .word dw_2mul_head      ; Link to previous dictionary entry
dw_16div:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_16div_pfa:
	;; notes: 16/ ( u -- u )
	;;   Shift right four bits (one nybble). No sign extension.

	POP SP
	RNR
	AND PLUS0FFF		; Discard bits 12-15
	PUSH SP
	NEXT



	;; word:  16*
	;; alias: 16mul
	;; flags: CODE ROM CFT
        ;;   word 16* defined in primitives/1014_arithlogic.asm:199.
//dwn_16mul:
//        .strp "16*" 0
dw_16mul_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn_16mul         ; Pointer to word name (above)
        .word dw_16div_head     ; Link to previous dictionary entry
dw_16mul:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_16mul_pfa:
	;; notes: 16* ( w -- w )
	;;   Shift left four bits.

	POP SP
	RNL
	AND PLUSFFF0		; Discard bits 0-3
	PUSH SP
	NEXT



	;; word:  256*
	;; alias: 256mul
	;; flags: CODE ROM CFT
        ;;   word 256* defined in primitives/1014_arithlogic.asm:213.
//dwn_256mul:
//        .strp "256*" 0
dw_256mul_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 6 ; Flags & hash
        .word dwn_256mul        ; Pointer to word name (above)
        .word dw_16mul_head     ; Link to previous dictionary entry
dw_256mul:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_256mul_pfa:
	;; notes: 256* ( w -- w )
	;;        Shift left eight bits.

	POP SP
	RNL
	RNL
	AND BYTEHI		; Discard bits 0-7
	PUSH SP
	NEXT



	;; word:  256/
	;; alias: 256div
	;; flags: CODE ROM CFT
        ;;   word 256/ defined in primitives/1014_arithlogic.asm:228.
//dwn_256div:
//        .strp "256/" 0
dw_256div_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 6 ; Flags & hash
        .word dwn_256div        ; Pointer to word name (above)
        .word dw_256mul_head    ; Link to previous dictionary entry
dw_256div:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_256div_pfa:
	;; notes: 256/ ( w -- w )
	;;        Shift right eight bits.

	POP SP
	RNR
	RNR
	AND BYTELO		; Discard bits 0-7
	PUSH SP
	NEXT



	;; word:  NOT
	;; flags: CODE ROM
        ;;   word NOT defined in primitives/1014_arithlogic.asm:242.
//dwn_NOT:
//        .strp "NOT" 0
dw_NOT_head:
        .word FFL_T_CODE FFL_ROM 5 ; Flags & hash
        .word dwn_NOT           ; Pointer to word name (above)
        .word dw_256div_head    ; Link to previous dictionary entry
dw_NOT:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_NOT_pfa:
	;; notes: NOT ( w -- w )
	;;   Flip all bits in w, or negate in one's complement.

	POP SP
	NOT
	PUSH SP
	NEXT



	;; word:  ABS
	;; flags: CODE ROM
        ;;   word ABS defined in primitives/1014_arithlogic.asm:254.
//dwn_ABS:
//        .strp "ABS" 0
dw_ABS_head:
        .word FFL_T_CODE FFL_ROM 2 ; Flags & hash
        .word dwn_ABS           ; Pointer to word name (above)
        .word dw_NOT_head       ; Link to previous dictionary entry
dw_ABS:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_ABS_pfa:
	;; notes: ABS ( w -- w )
	;;   The absolute value of w

	POP SP
	SNN			; Non-Negative?
	NEG			; No. Negate it
	PUSH SP
	NEXT



	;; word:  NOR
	;; flags: CODE ROM
        ;;   word NOR defined in primitives/1014_arithlogic.asm:267.
//dwn_NOR:
//        .strp "NOR" 0
dw_NOR_head:
        .word FFL_T_CODE FFL_ROM 5 ; Flags & hash
        .word dwn_NOR           ; Pointer to word name (above)
        .word dw_ABS_head       ; Link to previous dictionary entry
dw_NOR:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_NOR_pfa:
	;; notes: NOR ( w w -- w )
	;;   	  Bitwise OR

	RPOP(TMP0, SP)
	POP SP
	OR TMP0
	NOT
	PUSH SP
	NEXT



	;; word:  NAND
	;; flags: CODE ROM
        ;;   word NAND defined in primitives/1014_arithlogic.asm:281.
//dwn_NAND:
//        .strp "NAND" 0
dw_NAND_head:
        .word FFL_T_CODE FFL_ROM 2 ; Flags & hash
        .word dwn_NAND          ; Pointer to word name (above)
        .word dw_NOR_head       ; Link to previous dictionary entry
dw_NAND:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_NAND_pfa:
	;; notes: NAND ( w w -- w )
	;;        Bitwise OR

	RPOP(TMP0, SP)
	POP SP
	AND TMP0
	NOT
	PUSH SP
	NEXT



// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/1015_cell.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-

	;; These ones don't need to be here, they just need to be on
	;; the same page as the arithmetic words they alias.

	;; word:  CELL-
	;; alias: cell-dec
	;; copy:  dec
	;; flags: CODE ROM
        ;;   word CELL- defined in primitives/1015_cell.asm:9.
//dwn_cell_dec:
//        .strp "CELL-" 0
dw_cell_dec_head:
        .word FFL_T_CODE FFL_ROM 6 ; Flags & hash
        .word dwn_cell_dec      ; Pointer to word name (above)
        .word dw_NAND_head      ; Link to previous dictionary entry
dw_cell_dec:
        JMP dw_dec        ; Code entry point: next instruction
dw_cell_dec_pfa:
	;; notes: CELL- ( a -- a )
	;;   Decrement memory address a by 1 cell.



	;; word:  CELL+
	;; alias: cell-inc
	;; copy:  inc
	;; flags: CODE ROM
        ;;   word CELL+ defined in primitives/1015_cell.asm:18.
//dwn_cell_inc:
//        .strp "CELL+" 0
dw_cell_inc_head:
        .word FFL_T_CODE FFL_ROM 6 ; Flags & hash
        .word dwn_cell_inc      ; Pointer to word name (above)
        .word dw_cell_dec_head  ; Link to previous dictionary entry
dw_cell_inc:
        JMP dw_inc        ; Code entry point: next instruction
dw_cell_inc_pfa:
	;; notes: CELL+ ( a -- a )
	;;   Increment memory address a by 1 cell.



	;; word:  CELLS
	;; copy:  NOP
	;; flags: CODE ROM
        ;;   word CELLS defined in primitives/1015_cell.asm:26.
//dwn_CELLS:
//        .strp "CELLS" 0
dw_CELLS_head:
        .word FFL_T_CODE FFL_ROM 6 ; Flags & hash
        .word dwn_CELLS         ; Pointer to word name (above)
        .word dw_cell_inc_head  ; Link to previous dictionary entry
dw_CELLS:
        JMP dw_NOP        ; Code entry point: next instruction
dw_CELLS_pfa:
	;; notes: CELLS ( n -- n )
	;;   Converts number of words to number of cells. Identity on the CFT.



	;; word:  ALIGNED
	;; copy:  NOP
	;; flags: CODE ROM
        ;;   word ALIGNED defined in primitives/1015_cell.asm:34.
//dwn_ALIGNED:
//        .strp "ALIGNED" 0
dw_ALIGNED_head:
        .word FFL_T_CODE FFL_ROM 6 ; Flags & hash
        .word dwn_ALIGNED       ; Pointer to word name (above)
        .word dw_CELLS_head     ; Link to previous dictionary entry
dw_ALIGNED:
        JMP dw_NOP        ; Code entry point: next instruction
dw_ALIGNED_pfa:
	;; notes: CELLS ( n -- n )
	;;   Aligns address. A NOP on the CFT.



	;; word:  LOBYTE
	;; flags: CODE ROM CFT
        ;;   word LOBYTE defined in primitives/1015_cell.asm:41.
//dwn_LOBYTE:
//        .strp "LOBYTE" 0
dw_LOBYTE_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn_LOBYTE        ; Pointer to word name (above)
        .word dw_ALIGNED_head   ; Link to previous dictionary entry
dw_LOBYTE:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_LOBYTE_pfa:
	;; notes: CELLS ( n -- n )
	;;        Gets the low order byte of a 16-bit cell value.

	POP SP	                ; Pop
	GETLOCHAR()		; Get the low character (byte)
	PUSH SP
	NEXT



	;; word:  HIBYTE
	;; copy:  256div
	;; flags: CODE ROM CFT
        ;;   word HIBYTE defined in primitives/1015_cell.asm:54.
//dwn_HIBYTE:
//        .strp "HIBYTE" 0
dw_HIBYTE_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 6 ; Flags & hash
        .word dwn_HIBYTE        ; Pointer to word name (above)
        .word dw_LOBYTE_head    ; Link to previous dictionary entry
dw_HIBYTE:
        JMP dw_256div     ; Code entry point: next instruction
dw_HIBYTE_pfa:
	;; notes: CELLS ( n -- n )
	;;        Gets the high order byte of a 16-bit cell value.

	;; SPEEK(SP)		; Pop
	;; GETHICHAR()		; Get the high character (byte)
	;; SPOKE0(SP)		; Write it back.
	;; NEXT



	;; word:  ><
	;; alias: byte-swap
	;; flags: CODE ROM CFT
        ;;   word >< defined in primitives/1015_cell.asm:67.
//dwn_byte_swap:
//        .strp "><" 0
dw_byte_swap_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 4 ; Flags & hash
        .word dwn_byte_swap     ; Pointer to word name (above)
        .word dw_HIBYTE_head    ; Link to previous dictionary entry
dw_byte_swap:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_byte_swap_pfa:
	;; notes: >< ( n -- n )
	;;        Swaps the top and bottom 8 bits of the value n.

	RPOP (TMP0, SP)		; TMP0 = n

	RNR			; High byte -> low byte
	RNR
	AND BYTELO
	STORE TMP1

	LOAD TMP0		; Low byte -> high byte
	RNL
	RNL
	AND BYTEHI

	OR TMP1			; Put them together
	PUSH SP
	NEXT




// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/1016_memory.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// Core memory primitives

	;; word:  C!
	;; alias: c-store
	;; copy:  store
	;; flags: CODE ROM
        ;;   word C! defined in primitives/1016_memory.asm:8.
//dwn_c_store:
//        .strp "C!" 0
dw_c_store_head:
        .word FFL_T_CODE FFL_ROM 1 ; Flags & hash
        .word dwn_c_store       ; Pointer to word name (above)
        .word dw_byte_swap_head ; Link to previous dictionary entry
dw_c_store:
        JMP dw_store      ; Code entry point: next instruction
dw_c_store_pfa:
	;; notes: C! ( w a -- )
	;;   Store w at address a.

	;; word:  !
	;; alias: store
	;; flags: CODE ROM
        ;;   word ! defined in primitives/1016_memory.asm:14.
//dwn_store:
//        .strp "!" 0
dw_store_head:
        .word FFL_T_CODE FFL_ROM 0 ; Flags & hash
        .word dwn_store         ; Pointer to word name (above)
        .word dw_c_store_head   ; Link to previous dictionary entry
dw_store:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_store_pfa:
	;; notes: ! ( w a -- )
	;;   Store w at address a.

	RPOP (TMP0, SP)		; TMP0 = a
	POP SP
	STORE I TMP0
	NEXT



	;; word:  C@
	;; alias: c-fetch
	;; copy:  fetch
	;; flags: CODE ROM
        ;;   word C@ defined in primitives/1016_memory.asm:28.
//dwn_c_fetch:
//        .strp "C@" 0
dw_c_fetch_head:
        .word FFL_T_CODE FFL_ROM 1 ; Flags & hash
        .word dwn_c_fetch       ; Pointer to word name (above)
        .word dw_store_head     ; Link to previous dictionary entry
dw_c_fetch:
        JMP dw_fetch      ; Code entry point: next instruction
dw_c_fetch_pfa:
	;; notes: C@ ( a -- w )
	;;   Retrieve value at address a. On CFT, characters are
	;;   16-bits wide and each memory address is one whole 16-bit cell.

	;; word:  @
	;; alias: fetch
	;; flags: CODE ROM
        ;;   word @ defined in primitives/1016_memory.asm:35.
//dwn_fetch:
//        .strp "@" 0
dw_fetch_head:
        .word FFL_T_CODE FFL_ROM 1 ; Flags & hash
        .word dwn_fetch         ; Pointer to word name (above)
        .word dw_c_fetch_head   ; Link to previous dictionary entry
dw_fetch:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_fetch_pfa:
	;; notes: @ ( a -- w )
	;;   Retrieve value at address a.

	RPOP(TMP0, SP)
	LOAD I TMP0		; AC <- mem[TMP0]
	PUSH SP
	NEXT



	;; word:  +!
	;; alias: plus-store
	;; flags: CODE ROM
        ;;   word +! defined in primitives/1016_memory.asm:48.
//dwn_plus_store:
//        .strp "+!" 0
dw_plus_store_head:
        .word FFL_T_CODE FFL_ROM 1 ; Flags & hash
        .word dwn_plus_store    ; Pointer to word name (above)
        .word dw_fetch_head     ; Link to previous dictionary entry
dw_plus_store:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_plus_store_pfa:
	;; notes: ! ( w a -- )
	;;   word is added to value at address addr

	RPOP(TMP0, SP)		; a
	POP SP			; w
	ADD I TMP0		; AC <- AC + mem[a]
	STORE I TMP0		; mem[w] <- AC
	NEXT



	;; word:  1+!
	;; alias: one-plus-store
	;; flags: CODE ROM
        ;;   word 1+! defined in primitives/1016_memory.asm:62.
//dwn_one_plus_store:
//        .strp "1+!" 0
dw_one_plus_store_head:
        .word FFL_T_CODE FFL_ROM 2 ; Flags & hash
        .word dwn_one_plus_store ; Pointer to word name (above)
        .word dw_plus_store_head ; Link to previous dictionary entry
dw_one_plus_store:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_one_plus_store_pfa:
	;; notes: ! ( a -- )
	;;        Increment the value at a by 1.

	RPOP(TMP0, SP)
	ISZ I TMP0
	NEXT
	NEXT



	;; word:  1-!
	;; alias: one-minus-store
	;; flags: CODE ROM
        ;;   word 1-! defined in primitives/1016_memory.asm:75.
//dwn_one_minus_store:
//        .strp "1-!" 0
dw_one_minus_store_head:
        .word FFL_T_CODE FFL_ROM 2 ; Flags & hash
        .word dwn_one_minus_store ; Pointer to word name (above)
        .word dw_one_plus_store_head ; Link to previous dictionary entry
dw_one_minus_store:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_one_minus_store_pfa:
	;; notes: ! ( a -- )
	;;        Decrement the value at a by 1.

	RPOP(TMP0, SP)
	LOAD MINUS1
	ADD I TMP0
	STORE I TMP0
	NEXT



	;; word:  !BITS
	;; alias: store-BITS
	;; flags: CODE ROM
        ;;   word !BITS defined in primitives/1016_memory.asm:89.
//dwn_store_BITS:
//        .strp "!BITS" 0
dw_store_BITS_head:
        .word FFL_T_CODE FFL_ROM 4 ; Flags & hash
        .word dwn_store_BITS    ; Pointer to word name (above)
        .word dw_one_minus_store_head ; Link to previous dictionary entry
dw_store_BITS:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_store_BITS_pfa:
	;; notes: !BITS ( 16b1 addr 16b2 -- )
	;;        Store the value of 16b1 masked by 16b2 into the equivalent
        ;;        masked part of the contents of addr, without affecting bits
        ;;        outside the mask.

	RPOP(TMP0, SP)		; Mask
	RPOP(TMP1, SP)		; Addr
	RPOP(TMP2, SP)		; Value

	RAND(TMP2, TMP1, TMP3)	; value = value & mask

	LOAD TMP0		; Mask
	NOT			; ~mask
	AND I TMP1		; ~mask & mem[addr]
	OR TMP2			; (~mask & mem[addr]) | (value & mask)
	STORE I TMP1		; Store it back.
	NEXT



// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/1017_stack.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// Core stack primitives



	;; word:  RP@
	;; alias: RP-fetch
	;; flags: CODE ROM
        ;;   word RP@ defined in primitives/1017_stack.asm:9.
//dwn_RP_fetch:
//        .strp "RP@" 0
dw_RP_fetch_head:
        .word FFL_T_CODE FFL_ROM 1 ; Flags & hash
        .word dwn_RP_fetch      ; Pointer to word name (above)
        .word dw_store_BITS_head ; Link to previous dictionary entry
dw_RP_fetch:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_RP_fetch_pfa:
	;; notes: RP@ ( -- a )
	;;   Push current RP to data stack.

	LOAD RP
	PUSH SP
	NEXT



	;; word:  RP!
	;; alias: RP-store
	;; flags: CODE ROM
        ;;   word RP! defined in primitives/1017_stack.asm:21.
//dwn_RP_store:
//        .strp "RP!" 0
dw_RP_store_head:
        .word FFL_T_CODE FFL_ROM 1 ; Flags & hash
        .word dwn_RP_store      ; Pointer to word name (above)
        .word dw_RP_fetch_head  ; Link to previous dictionary entry
dw_RP_store:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_RP_store_pfa:
	;; notes: RP! ( a -- )
	;;   Set the value of the RP.

	POP SP
	STORE RP
	NEXT



	;; word:  SP@
	;; alias: SP-fetch
	;; flags: CODE ROM
        ;;   word SP@ defined in primitives/1017_stack.asm:33.
//dwn_SP_fetch:
//        .strp "SP@" 0
dw_SP_fetch_head:
        .word FFL_T_CODE FFL_ROM 0 ; Flags & hash
        .word dwn_SP_fetch      ; Pointer to word name (above)
        .word dw_RP_store_head  ; Link to previous dictionary entry
dw_SP_fetch:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_SP_fetch_pfa:
	;; notes: SP@ ( -- a )
	;;   Push current SP to data stack.

	LOAD SP
	PUSH SP
	NEXT



	;; word:  SP!
	;; alias: SP-store
	;; flags: CODE ROM
        ;;   word SP! defined in primitives/1017_stack.asm:45.
//dwn_SP_store:
//        .strp "SP!" 0
dw_SP_store_head:
        .word FFL_T_CODE FFL_ROM 0 ; Flags & hash
        .word dwn_SP_store      ; Pointer to word name (above)
        .word dw_SP_fetch_head  ; Link to previous dictionary entry
dw_SP_store:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_SP_store_pfa:
	;; notes: SP! ( a -- )
	;;   Set the value of the SP.

	POP SP
	STORE SP
	NEXT



	;; word:  >R
	;; alias: to-R
	;; flags: CODE ROM
        ;;   word >R defined in primitives/1017_stack.asm:57.
//dwn_to_R:
//        .strp ">R" 0
dw_to_R_head:
        .word FFL_T_CODE FFL_ROM 4 ; Flags & hash
        .word dwn_to_R          ; Pointer to word name (above)
        .word dw_SP_store_head  ; Link to previous dictionary entry
dw_to_R:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_to_R_pfa:
	;; notes: >R ( n -- )
	;;   Pop value from data stack, push onto return stack.

	POP SP
	PUSH RP
	NEXT



	;; word:  R>
	;; alias: R-from
	;; flags: CODE ROM
        ;;   word R> defined in primitives/1017_stack.asm:69.
//dwn_R_from:
//        .strp "R>" 0
dw_R_from_head:
        .word FFL_T_CODE FFL_ROM 0 ; Flags & hash
        .word dwn_R_from        ; Pointer to word name (above)
        .word dw_to_R_head      ; Link to previous dictionary entry
dw_R_from:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_R_from_pfa:
	;; notes: R> ( n -- )
	;;   Pop value from return stack, push onto data stack.

	POP RP
	PUSH SP
	NEXT



	;; word:  R@
	;; alias: R-fetch
	;; flags: CODE ROM
        ;;   word R@ defined in primitives/1017_stack.asm:81.
//dwn_R_fetch:
//        .strp "R@" 0
dw_R_fetch_head:
        .word FFL_T_CODE FFL_ROM 0 ; Flags & hash
        .word dwn_R_fetch       ; Pointer to word name (above)
        .word dw_R_from_head    ; Link to previous dictionary entry
dw_R_fetch:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_R_fetch_pfa:
	;; notes: R@ ( -- w )
	;;   Copy top of return stack to data stack

	POP RP
	PUSH RP
	PUSH SP
	NEXT



	;; word:  RDUP
	;; flags: CODE ROM
        ;;   word RDUP defined in primitives/1017_stack.asm:93.
//dwn_RDUP:
//        .strp "RDUP" 0
dw_RDUP_head:
        .word FFL_T_CODE FFL_ROM 6 ; Flags & hash
        .word dwn_RDUP          ; Pointer to word name (above)
        .word dw_R_fetch_head   ; Link to previous dictionary entry
dw_RDUP:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_RDUP_pfa:
	;; notes: RDUP ( n -- )
	;;   Duplicate the top value on the return stack.

	POP RP
	PUSH RP
	PUSH RP
	NEXT



	;; word:  RDROP
	;; flags: CODE ROM
        ;;   word RDROP defined in primitives/1017_stack.asm:105.
//dwn_RDROP:
//        .strp "RDROP" 0
dw_RDROP_head:
        .word FFL_T_CODE FFL_ROM 7 ; Flags & hash
        .word dwn_RDROP         ; Pointer to word name (above)
        .word dw_RDUP_head      ; Link to previous dictionary entry
dw_RDROP:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_RDROP_pfa:
	;; notes: RDROP ( -- )
	;;   Drops a value from the return stack.

	POP RP
	NEXT



	;; word:  DROP
	;; flags: CODE ROM
        ;;   word DROP defined in primitives/1017_stack.asm:115.
//dwn_DROP:
//        .strp "DROP" 0
dw_DROP_head:
        .word FFL_T_CODE FFL_ROM 0 ; Flags & hash
        .word dwn_DROP          ; Pointer to word name (above)
        .word dw_RDROP_head     ; Link to previous dictionary entry
dw_DROP:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_DROP_pfa:
	;; notes: DROP ( w -- )
	;;   Discard from the data stack.

	POP SP
	NEXT



	;; word:  DUP
	;; flags: CODE ROM
        ;;   word DUP defined in primitives/1017_stack.asm:125.
//dwn_DUP:
//        .strp "DUP" 0
dw_DUP_head:
        .word FFL_T_CODE FFL_ROM 7 ; Flags & hash
        .word dwn_DUP           ; Pointer to word name (above)
        .word dw_DROP_head      ; Link to previous dictionary entry
dw_DUP:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_DUP_pfa:
	;; notes: DUP ( w -- w w )
	;;   Duplicate the top item on the stack.

	POP SP
	PUSH SP
	PUSH SP
	NEXT



	;; word:  SWAP
	;; flags: CODE ROM
        ;;   word SWAP defined in primitives/1017_stack.asm:137.
//dwn_SWAP:
//        .strp "SWAP" 0
dw_SWAP_head:
        .word FFL_T_CODE FFL_ROM 7 ; Flags & hash
        .word dwn_SWAP          ; Pointer to word name (above)
        .word dw_DUP_head       ; Link to previous dictionary entry
dw_SWAP:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_SWAP_pfa:
	;; notes: SWAP ( w1 w2 -- w2 w1 )
	;;   Swap the top two items on the stack.

	RPOP(TMP0, SP)
	RPOP(TMP1, SP)

	RPUSH(SP, TMP0)
	RPUSH(SP, TMP1)
	NEXT



	;; word:  OVER
	;; flags: CODE ROM
        ;;   word OVER defined in primitives/1017_stack.asm:151.
//dwn_OVER:
//        .strp "OVER" 0
dw_OVER_head:
        .word FFL_T_CODE FFL_ROM 3 ; Flags & hash
        .word dwn_OVER          ; Pointer to word name (above)
        .word dw_SWAP_head      ; Link to previous dictionary entry
dw_OVER:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_OVER_pfa:
	;; notes: OVER ( w1 w2 -- w1 w2 w1 )
	;;   Duplicate the second item on the data stack.

	RPOP(TMP0, SP)		; w2
	RPOP(TMP1, SP)		; w1

	RPUSH(SP, TMP1)		; ( w1 )
	RPUSH(SP, TMP0)		; ( w1 w2 )
	RPUSH(SP, TMP1)		; ( w1 w2 w1 )
	NEXT



	;; word:  ?DUP
	;; alias: if-DUP
	;; flags: CODE ROM
        ;;   word ?DUP defined in primitives/1017_stack.asm:167.
//dwn_if_DUP:
//        .strp "?DUP" 0
dw_if_DUP_head:
        .word FFL_T_CODE FFL_ROM 3 ; Flags & hash
        .word dwn_if_DUP        ; Pointer to word name (above)
        .word dw_OVER_head      ; Link to previous dictionary entry
dw_if_DUP:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_if_DUP_pfa:
	;; notes: ?DUP ( w -- w w | 0 )
	;;   If w is non-zero, duplicate it.

	POP SP
	SZA
	PUSH SP			; Non-zero. Duplicate
	PUSH SP			; Otherwise, push it back
	NEXT



	;; word:  ROT
	;; flags: CODE ROM
        ;;   word ROT defined in primitives/1017_stack.asm:180.
//dwn_ROT:
//        .strp "ROT" 0
dw_ROT_head:
        .word FFL_T_CODE FFL_ROM 1 ; Flags & hash
        .word dwn_ROT           ; Pointer to word name (above)
        .word dw_if_DUP_head    ; Link to previous dictionary entry
dw_ROT:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_ROT_pfa:
	;; notes: ROT ( w1 w2 w3 -- w2 w3 w1 )
	;;        Rotate topmost 3 items on data stack to the left.

	RPOP(TMP2, SP)		; w3
	RPOP(TMP1, SP)		; w2
	RPOP(TMP0, SP)		; w1

	RPUSH(SP, TMP1)		; w2
	RPUSH(SP, TMP2)		; w3
	RPUSH(SP, TMP0)		; w1

	NEXT



	;; word:  -ROT
	;; alias: not-ROT
	;; flags: CODE ROM
        ;;   word -ROT defined in primitives/1017_stack.asm:198.
//dwn_not_ROT:
//        .strp "-ROT" 0
dw_not_ROT_head:
        .word FFL_T_CODE FFL_ROM 1 ; Flags & hash
        .word dwn_not_ROT       ; Pointer to word name (above)
        .word dw_ROT_head       ; Link to previous dictionary entry
dw_not_ROT:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_not_ROT_pfa:
	;; notes: -ROT ( w1 w2 w3 -- w3 w1 w2 )
	;;        Rotate topmost 3 items on data stack to the right.

	RPOP(TMP2, SP)		; w3
	RPOP(TMP1, SP)		; w2
	RPOP(TMP0, SP)		; w1

	RPUSH(SP, TMP2)		; w3
	RPUSH(SP, TMP0)		; w1
	RPUSH(SP, TMP1)		; w2

	NEXT



	;; word:  ROLL
	;; flags: CODE ROM
        ;;   word ROLL defined in primitives/1017_stack.asm:215.
//dwn_ROLL:
//        .strp "ROLL" 0
dw_ROLL_head:
        .word FFL_T_CODE FFL_ROM 6 ; Flags & hash
        .word dwn_ROLL          ; Pointer to word name (above)
        .word dw_not_ROT_head   ; Link to previous dictionary entry
dw_ROLL:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_ROLL_pfa:
	;; notes: ROLL ( +n -- )
	;;        The +nth stack value, not counting +n itself is first removed
        ;;        and then transferred to the top of the stack, moving the
        ;;        remaining values into the vacated position.  {0..the number
        ;;        of elements on the stack-1}
	;;
	;;        2 ROLL is equivalent to ROT
	;;        0 ROLL is a null operation

	;; TODO: complete this.
	FAIL




	;; word:  DEPTH
	;; flags: CODE ROM
        ;;   word DEPTH defined in primitives/1017_stack.asm:232.
//dwn_DEPTH:
//        .strp "DEPTH" 0
dw_DEPTH_head:
        .word FFL_T_CODE FFL_ROM 1 ; Flags & hash
        .word dwn_DEPTH         ; Pointer to word name (above)
        .word dw_ROLL_head      ; Link to previous dictionary entry
dw_DEPTH:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_DEPTH_pfa:
	;; notes: DEPTH ( -- n )
	;;   Returns the number of elements on the stack (before
	;;   execution of DEPTH).

	LOAD I UP		; The SP0 register is at mem[UP+0]
	NEG
	ADD SP			; Top - bottom
	PUSH SP
	NEXT



	;; word:  RDEPTH
	;; flags: CODE ROM
        ;;   word RDEPTH defined in primitives/1017_stack.asm:246.
//dwn_RDEPTH:
//        .strp "RDEPTH" 0
dw_RDEPTH_head:
        .word FFL_T_CODE FFL_ROM 4 ; Flags & hash
        .word dwn_RDEPTH        ; Pointer to word name (above)
        .word dw_DEPTH_head     ; Link to previous dictionary entry
dw_RDEPTH:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_RDEPTH_pfa:
	;; notes: RDEPTH ( -- n )
	;;   Returns the number of elements on the return stack (before
	;;   execution of DEPTH).

	LOADUP(1)		; The RP0 reg is at mem[UP+1]
	NEG
	ADD RP			; Top - bottom
	PUSH SP
	NEXT



	;; word:  PICK
	;; flags: CODE ROM
        ;;   word PICK defined in primitives/1017_stack.asm:260.
//dwn_PICK:
//        .strp "PICK" 0
dw_PICK_head:
        .word FFL_T_CODE FFL_ROM 4 ; Flags & hash
        .word dwn_PICK          ; Pointer to word name (above)
        .word dw_RDEPTH_head    ; Link to previous dictionary entry
dw_PICK:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_PICK_pfa:
	;; notes: PICK ( +n -- w )
	;;   Returns the nth-from-the top element on the stack. 0 PICK
	;;   returns the top element.

	POP SP			; SP now points to top of stack + 1
	ING			; -(n+1), offset the +1
	ADD SP			; SP - (n + 1)
	STORE TMP0		; TMP0 <- SP - (n + 1)
	LOAD I TMP0
	PUSH SP
	NEXT



	;; word:  RPICK
	;; flags: CODE ROM
        ;;   word RPICK defined in primitives/1017_stack.asm:276.
//dwn_RPICK:
//        .strp "RPICK" 0
dw_RPICK_head:
        .word FFL_T_CODE FFL_ROM 7 ; Flags & hash
        .word dwn_RPICK         ; Pointer to word name (above)
        .word dw_PICK_head      ; Link to previous dictionary entry
dw_RPICK:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_RPICK_pfa:
	;; notes: RPICK ( +n -- w )
	;;   Returns the nth-from-the top element on the return stack. 0 PICK
	;;   returns the top element.

	POP SP
	ING			; -(n+1), offset the +1
	ADD RP			; RP - (n + 1)
	STORE TMP0		; TMP0 <- RP - (n + 1)
	LOAD I TMP0
	PUSH SP
	NEXT



// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/1050_tty.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// Core TTY operations.



	;; word:  EMIT
	;; flags: CODE ROM
        ;;   word EMIT defined in primitives/1050_tty.asm:8.
//dwn_EMIT:
//        .strp "EMIT" 0
dw_EMIT_head:
        .word FFL_T_CODE FFL_ROM 1 ; Flags & hash
        .word dwn_EMIT          ; Pointer to word name (above)
        .word dw_RPICK_head     ; Link to previous dictionary entry
dw_EMIT:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_EMIT_pfa:
	;; notes: EMIT ( c -- )
	;;        Execute the current word set in 'EMIT.
	;; code:  : EMIT ( c -- ) 'EMIT @EXECUTE ;
	LOADUP(UAOFS_EMIT)
	LJMP(_fetch_execute)



	;; WARNING: THESE ARE ALL FOR THE 26C92 DUART.

	;; DUART bit values

	.equ DUART_IMR_ARXINT  #----'--1- ; UART A: RX interrupt (on reception or FIFO full)
	.equ DUART_IMR_BRXINT  #--1-'---- ; UART B: RX interrupt (on reception or FIFO full)

	.equ DUART_CMD_MR0     #1011'----
	.equ DUART_CMD_MR1     #0001'----
	.equ DUART_CMD_RXEN    #----'---1
	.equ DUART_CMD_RXDIS   #----'--1-
	.equ DUART_CMD_TXEN    #----'-1--
	.equ DUART_CMD_TXDIS   #----'1---

	.equ DUART_MR1_5BIT    #------00
	.equ DUART_MR1_6BIT    #------01
	.equ DUART_MR1_7BIT    #------10
	.equ DUART_MR1_8BIT    #------11
	.equ DUART_MR1_EVEN    #-----0-- ; Even parity (must have WP or FP too)
	.equ DUART_MR1_ODD     #-----1-- ; Odd parity (must have WP or FP too)
	.equ DUART_MR1_WP      #---00--- ; With parity
	.equ DUART_MR1_FP      #---01--- ; Forced parity
	.equ DUART_MR1_NP      #---10--- ; No parity
	.equ DUART_MR1_MD      #---11--- ; Multidrop
	.equ DUART_MR1_ERRC    #--1----- ; Char error
	.equ DUART_MR1_ERRB    #--0----- ; Block error
	.equ DUART_MR1_INTRX   #-0------ ; RX interrupt on reception
	.equ DUART_MR1_INTF    #-1------ ; RX interrupt on Rx FIFO full
	.equ DUART_MR1_RXRTS   #0------- ; RX controls RTS
	.equ DUART_MR1_NRXRTS  #1------- ; RX does not control RTS

	.equ DUART_MR2_1SB     #----0111 ; 1 stop bit.
	.equ DUART_MR2_1_5SB   #----1000 ; 1.5 (actually 1.563) stop bit.
	.equ DUART_MR2_2SB     #----1111 ; 2 stop bits.
	.equ DUART_MR2_CTS     #---10000 ; CTS Enable Tx
	.equ DUART_MR2_NRTS    #--0----- ; Tx does not control RTS
	.equ DUART_MR2_RTS     #--1----- ; Tx controls RTS
	.equ DUART_MR2_NORMAL  #00------ ; Normal mode

	.equ DUART_CSR_B4800   #0000
	.equ DUART_CSR_B9600   #1011
	.equ DUART_CSR_B19200  #0011
	.equ DUART_CSR_B38400  #1100
	.equ DUART_CSR_B57600  #0101
	.equ DUART_CSR_B115200 #0110



	;; word:  TTY.INIT
	;; flags: CODE ROM
        ;;   word TTY.INIT defined in primitives/1050_tty.asm:66.
//dwn_TTY_INIT:
//        .strp "TTY.INIT" 0
dw_TTY_INIT_head:
        .word FFL_T_CODE FFL_ROM 4 ; Flags & hash
        .word dwn_TTY_INIT      ; Pointer to word name (above)
        .word dw_EMIT_head      ; Link to previous dictionary entry
dw_TTY_INIT:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_TTY_INIT_pfa:
	;; notes: tty.init ( -- )
	;;   Initialise the console. Currently does nothing. The emulator
	;;   console is always initialised.

	;; DUART0: channel A IRQ on Rx.
	;; LI DUART_IMR_ARXINT
	;; OUT DUART0 DUART_IMR

	;; DUART0, UART A: enable transmitter and receiver. Also point to MR1
	;; LI DUART_CMD_MR1 DUART_CMD_RXEN DUART_CMD_TXEN
	;; OUT DUART0 UARTA UARTCR

	;; MR0. 8 bits, no partiy, char errors, interrupt on reception, and RTS.
	;; LI DUART_MR1_8BIT DUART_MR1_NP DUART_MR1_INTRX DUART_MR1_RXRTS
	;; OUT DUART0 UARTMR

	;; MR2 is selected automatically. Set it for normal operation, 1 stop bit.
	;; LI DUART_MR2_NORMAL DUART_MR2_CTS DUART_MR2_RTS DUART_MR2_1SB
	;; OUT DUART0 UARTMR

	;; Delay a bit and set MR0.
	;; LI 0
	;; OUT DUART0 UARTA UARTCR
	;; OUT DUART0 UARTA UARTCR
	;; OUT DUART0 UARTA UARTCR
	;; OUT DUART0 UARTA UARTCR
	;; LI DUART_CMD_MR0
	;; OUT DUART0 UARTA UARTCR

	;; Set the MR for normal operation and Extended II bps rates.
	;; LI #0000101
	;; OUT DUART0 UARTA UARTACR

	;; Set the baud rate. This needs to be set twice, in the low
	;; (transmitter) and high (receiver) nybbles.
	;; LI DUART_CSR_B115200
	;; STORE TMP0
	;; CLL RNL
	;; OR TMP0
	;; OUT DUART0 UARTA UARTCSR

	LIA _tty_init_str
	PUSH SP
	FORTH(dw_typep0)

	;; Done.
	NEXT

_tty_init_str:
	.strp 10 10 "TTY: 0A* 0B 1A 1B (16550)" 10 0



	;; word:  TTY.EMIT
	;; flags: CODE ROM
        ;;   word TTY.EMIT defined in primitives/1050_tty.asm:121.
//dwn_TTY_EMIT:
//        .strp "TTY.EMIT" 0
dw_TTY_EMIT_head:
        .word FFL_T_CODE FFL_ROM 4 ; Flags & hash
        .word dwn_TTY_EMIT      ; Pointer to word name (above)
        .word dw_TTY_INIT_head  ; Link to previous dictionary entry
dw_TTY_EMIT:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_TTY_EMIT_pfa:
	;; notes: TTY.EMIT ( c -- )
	;;        Transmits c to the current TTY port.

	POP SP
	AND PLUS127
	STORE TMP0

_tty_emit:
	IN I ttylsr		; Load
	AND ttyther
	SNZ
	JMP _tty_emit	; Wait until ready

	LOAD TMP0
	OUT I ttyrxtx

	NEXT

	;; TODO: move to user variables
ttyrxtx:
	.word @TTY0&&3ff TTYRHR
ttylsr:
	.word @TTY0&&3ff TTYLSR
ttyther:
	.word TTYTHRE		; Ready to send



	;; word:  rx?
	;; alias: rx_q
	;; flags: CODE ROM
        ;;   word rx? defined in primitives/1050_tty.asm:152.
//dwn_rx_q:
//        .strp "RX?" 0
dw_rx_q_head:
        .word FFL_T_CODE FFL_ROM 1 ; Flags & hash
        .word dwn_rx_q          ; Pointer to word name (above)
        .word dw_TTY_EMIT_head  ; Link to previous dictionary entry
dw_rx_q:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_rx_q_pfa:
	;; notes: tt.rx? ( -- f )
	;;   Returns true if the console has received a character.
	RPUSH(SP, INPFR)
	NEXT



	;; word:  rx
	;; flags: CODE ROM
        ;;   word rx defined in primitives/1050_tty.asm:161.
//dwn_rx:
//        .strp "RX" 0
dw_rx_head:
        .word FFL_T_CODE FFL_ROM 0 ; Flags & hash
        .word dwn_rx            ; Pointer to word name (above)
        .word dw_rx_q_head      ; Link to previous dictionary entry
dw_rx:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_rx_pfa:
	;; notes: rx? ( -- c )
	;;   Receive a character from the console. Block if one isn't available.
_rx_loop:
	LI IFL_NEWCHAR
	AND INPFR
	SNZ
	JMP _rx_loop

	RPUSH(SP, INPCH)

	LI IFL_NEWCHAR		; Clear the flag
	XOR MINUS1		; Faster than NOT
	AND INPFR
	STORE INPFR

	NEXT



// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/1099_cold.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// Forth-side boot code.



	;; word:  _.?PRESENT
	;; alias: _qPRESENT
	;; flags: DOCOL ROM CFT
        ;;   word _.?PRESENT defined in primitives/1099_cold.asm:9.
//dwn__qPRESENT:
//        .strp "_.?PRESENT" 0
dw__qPRESENT_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 5 ; Flags & hash
        .word dwn__qPRESENT     ; Pointer to word name (above)
        .word dw_rx_head        ; Link to previous dictionary entry
dw__qPRESENT:
        CFA_doCOL()       ; Code entry point: next instruction
dw__qPRESENT_pfa:
	;; notes: _.?PRESENT ( f -- )
	;;        Print "present" if f is non-zero, "not present" otherwise.

	.word dw_if_branch	; if f == 0:
	.word __qPRESENT0

__qPRESENT1:
	doLIT(__qPRESENT_yes)
	.word dw_typep0
	.word dw_EXIT

__qPRESENT0:
	doLIT(__qPRESENT_no)
	.word dw_typep0
	.word dw_EXIT

__qPRESENT_no:
	.strp "not " 		; Note: even length, falls through to str3.
__qPRESENT_yes:
	.strp "present." 10 0


_dev_VDU:
	.strp "VDU" 0
_dev_MBU:
	.strp "MBU" 0
_dev_RTC:
	.strp "RTC" 0
_dev_NVRAM:
	.strp "NVR" 0
_dev_HD0:
	.strp "HD0" 0
_dev_HD1:
	.strp "HD1" 0
_dev_HD2:
	.strp "HD2" 0
_dev_HD3:
	.strp "HD3" 0



	;; word:  _.DEV
	;; alias: _DEV
	;; flags: DOCOL ROM CFT
        ;;   word _.DEV defined in primitives/1099_cold.asm:53.
//dwn__DEV:
//        .strp "_.DEV" 0
dw__DEV_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn__DEV          ; Pointer to word name (above)
        .word dw__qPRESENT_head ; Link to previous dictionary entry
dw__DEV:
        CFA_doCOL()       ; Code entry point: next instruction
dw__DEV_pfa:
	;; notes: ._DEV ( a -- )
	;;        Prints out a device name during detection.

	.word dw_typep0		; TYPEp0
	doCHAR(":")		; CHAR :
	.word dw_EMIT		; EMIT
	.word dw_SPACE		; SPACE
	.word dw_EXIT



	;; word:  _INIT
	;; flags: DOCOL ROM CFT
        ;;   word _INIT defined in primitives/1099_cold.asm:66.
//dwn__INIT:
//        .strp "_INIT" 0
dw__INIT_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn__INIT         ; Pointer to word name (above)
        .word dw__DEV_head      ; Link to previous dictionary entry
dw__INIT:
        CFA_doCOL()       ; Code entry point: next instruction
dw__INIT_pfa:
	;; notes: _INIT ( -- )
	;;        Initialises hardware.


	.word dw_EXIT



	;; word:  COLD
	;; flags: DOCOL ROM CFT
        ;;   word COLD defined in primitives/1099_cold.asm:76.
//dwn_COLD:
//        .strp "COLD" 0
dw_COLD_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 7 ; Flags & hash
        .word dwn_COLD          ; Pointer to word name (above)
        .word dw__INIT_head     ; Link to previous dictionary entry
dw_COLD:
        CFA_doCOL()       ; Code entry point: next instruction
dw_COLD_pfa:
	;; notes: TEST ( -- )
	;;   Test the inner interpreter

	;; Initialise the system configuration bitmap.
	doLIT(0)
	doREG(SYSCFG)		; Strip R bit from SYSCFG variable
	.word dw_store


	;; Initialise hardware
	.word dw_TTY_INIT

	;; Set up MBU
	doLIT(_dev_MBU)		; _dev_RTC ( a )
	.word dw__DEV		; _DEV ( )
	.word dw_MBU_INIT	; MBU.INIT
	.word dw__qPRESENT	; _?PRESENT

	;; Set up VDU, if available.
	;; TODO: Reinstate this
	doLIT(_dev_VDU)		; _dev_VDU ( a )
	.word dw__DEV		; _DEV ( )
	.word dw_VDU_INIT	; MBU.INIT
	.word dw__qPRESENT	; _?PRESENT

	;; Set up memory
	.word dw_MEM_INIT
	doLIT(1)
	.word dw__qPRESENT

	;; Set up RTC
	doLIT(_dev_RTC)		; _dev_RTC ( a )
	.word dw__DEV		; _DEV ( )
	.word dw_RTC_INIT	; RTC.INIT ( f )
	.word dw_DUP		; DUP ( f f )
	.word dw_if_branch	; if f == 0:
	.word _cold_nortc	;   skip
	.word dw_dot_DATE
	.word dw_TYPE
	.word dw_SPACE
	.word dw_dot_TIME
	.word dw_TYPE
	.word dw_SPACE
_cold_nortc:
	.word dw_DUP
	.word dw__qPRESENT
	doLIT(_dev_NVRAM)	; _dev_NVRAM ( a )
	.word dw__DEV		; _DEV ( )
	.word dw__qPRESENT


	;; Set up IDE
	doLIT(0)
	doREG(IDE0)
	.word dw_IDE_INIT
	doLIT(1)
	doREG(IDE1)
	.word dw_IDE_INIT

	doLIT(_dev_HD0)
	.word dw__DEV		; _DEV ( )
	doLIT(0)
	.word dw_HD_INIT
	.word dw__qPRESENT

	doLIT(_dev_HD1)
	.word dw__DEV		; _DEV ( )
	doLIT(1)
	.word dw_HD_INIT
	.word dw__qPRESENT

	doLIT(_dev_HD2)
	.word dw__DEV		; _DEV ( )
	doLIT(2)
	.word dw_HD_INIT
	.word dw__qPRESENT

	doLIT(_dev_HD3)
	.word dw__DEV		; _DEV ( )
	doLIT(3)
	.word dw_HD_INIT
	.word dw__qPRESENT

	;; Initialise the DOES> jump table

	doLIT(_does_table)
	.word dw_DTP
	.word dw_store


	;; Initialise vocabularies

	;; ONLY >RAM FORTH >RAM DEFINITIONS \ Set vocabularies
	.word dw_ONLY
	.word dw_to_RAM
	.word dw_ROM_FORTH
	.word dw_to_RAM
	.word dw_DEFINITIONS


	;; Print the Forth banner and enter Forth.

	.word dw_dot_banner	; .banner ( ) \ Print out the banner
	.word dw_QUIT		; QUIT ( ) \ Enter the interpreter
	.word dw_FAIL		; We should never get here.



	;; word:  .banner
	;; alias: dot_banner
	;; flags: DOCOL ROM CFT
        ;;   word .banner defined in primitives/1099_cold.asm:187.
//dwn_dot_banner:
//        .strp ".BANNER" 0
dw_dot_banner_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 1 ; Flags & hash
        .word dwn_dot_banner    ; Pointer to word name (above)
        .word dw_COLD_head      ; Link to previous dictionary entry
dw_dot_banner:
        CFA_doCOL()       ; Code entry point: next instruction
dw_dot_banner_pfa:
	;; notes: $banner ( -- )
	;;   Prints out boot banner.
	.word dw_doLIT
	.word _banner_text1
	.word dw_typep0
	.word dw_countwords
	.word dw_DECIMAL
	.word dw_dot
	.word dw_doLIT
	.word _banner_text2
	.word dw_typep0
	.word dw_EXIT
_banner_text1:
	.strp 10 10 27 "[0;33m" 27 "#3 CFT " 10 27 "#4 CFT " 10 10 27 "[0m16-bit Mini-Computer" 10 "CFT Booted. " 10 "Forth words known:" 0
_banner_text2:
	.strp " (type WORDS for a list)" 10 0


	;; word:  BYE
	;; flags: DOCOL ROM
        ;;   word BYE defined in primitives/1099_cold.asm:207.
//dwn_BYE:
//        .strp "BYE" 0
dw_BYE_head:
        .word FFL_T_DOCOL FFL_ROM 1 ; Flags & hash
        .word dwn_BYE           ; Pointer to word name (above)
        .word dw_dot_banner_head ; Link to previous dictionary entry
dw_BYE:
        CFA_doCOL()       ; Code entry point: next instruction
dw_BYE_pfa:
	;; copy:  HALT
	;; notes: BYE ( -- )
	;;   Leaves Forth (just runs HALT, which halts the computer)
	.word dw_HALT
	.word dw_EXIT



	;; word:  HALT
	;; flags: CODE ROM
        ;;   word HALT defined in primitives/1099_cold.asm:217.
//dwn_HALT:
//        .strp "HALT" 0
dw_HALT_head:
        .word FFL_T_CODE FFL_ROM 4 ; Flags & hash
        .word dwn_HALT          ; Pointer to word name (above)
        .word dw_BYE_head       ; Link to previous dictionary entry
dw_HALT:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_HALT_pfa:
	;; notes: HALT ( -- )
	;;   Halts the machine. The computer may be resumed
	;;   from the front panel, in which case execution will continue.
	HALT
	NEXT


// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/1105_memory.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// Slightly more complex memory primitives than in core. Still in Assembly.



	;; word:  HERE
	;; flags: CODE ROM
        ;;   word HERE defined in primitives/1105_memory.asm:8.
//dwn_HERE:
//        .strp "HERE" 0
dw_HERE_head:
        .word FFL_T_CODE FFL_ROM 4 ; Flags & hash
        .word dwn_HERE          ; Pointer to word name (above)
        .word dw_HALT_head      ; Link to previous dictionary entry
dw_HERE:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_HERE_pfa:
	;; notes: HERE ( -- a )
	;;   Returns the address of the first available cell in the user dictionary.

	RPUSH(SP, CP)
	NEXT



	;; word:  PAD
	;; flags: CODE ROM
        ;;   word PAD defined in primitives/1105_memory.asm:18.
//dwn_PAD:
//        .strp "PAD" 0
dw_PAD_head:
        .word FFL_T_CODE FFL_ROM 3 ; Flags & hash
        .word dwn_PAD           ; Pointer to word name (above)
        .word dw_HERE_head      ; Link to previous dictionary entry
dw_PAD:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_PAD_pfa:
	;; notes: PAD ( -- a )
	;;   Returns the address of the first available cell for scratch use.

	LI 80
	ADD CP
	PUSH SP
	NEXT



	;; word:  @EXECUTE
	;; alias: fetch-EXECUTE
	;; flags: CODE ROM
        ;;   word @EXECUTE defined in primitives/1105_memory.asm:31.
//dwn_fetch_EXECUTE:
//        .strp "@EXECUTE" 0
dw_fetch_EXECUTE_head:
        .word FFL_T_CODE FFL_ROM 0 ; Flags & hash
        .word dwn_fetch_EXECUTE ; Pointer to word name (above)
        .word dw_PAD_head       ; Link to previous dictionary entry
dw_fetch_EXECUTE:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_fetch_EXECUTE_pfa:
	;; notes: @EXECUTE ( a -- )
	;;        If a is non-zero, assume it's a word address and execute it.
	;; code:  : @EXECUTE ( a -- ) @ ?DUP IF EXECUTE THEN ; \ Equivalent

	POP SP		   	; Get the address of the vector
	STORE TMP0		; Dereference the vector to get the address
	LOAD I TMP0		;    of the word to execute.
_fetch_execute:
	SNZ			; Is it zero?
	NEXT			; Yes. Ignore it.
	JMPII TMP0		; Jump into.



	;; word:  2!
	;; alias: two-store
	;; flags: CODE ROM
        ;;   word 2! defined in primitives/1105_memory.asm:48.
//dwn_two_store:
//        .strp "2!" 0
dw_two_store_head:
        .word FFL_T_CODE FFL_ROM 0 ; Flags & hash
        .word dwn_two_store     ; Pointer to word name (above)
        .word dw_fetch_EXECUTE_head ; Link to previous dictionary entry
dw_two_store:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_two_store_pfa:
	;; notes: 2! ( d a -- )
	;;   Stores the 32-bit integer d at address a (low) and a+1 (high).

	RPOP (I0, SP)		; Pop the address
	RPOP (I I0, SP)		; Store d high
	RPOP (I I0, SP)		; Store d low
	NEXT



	;; word:  2@
	;; alias: two-fetch
	;; flags: CODE ROM
        ;;   word 2@ defined in primitives/1105_memory.asm:61.
//dwn_two_fetch:
//        .strp "2@" 0
dw_two_fetch_head:
        .word FFL_T_CODE FFL_ROM 0 ; Flags & hash
        .word dwn_two_fetch     ; Pointer to word name (above)
        .word dw_two_store_head ; Link to previous dictionary entry
dw_two_fetch:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_two_fetch_pfa:
	;; notes: 2@ ( a -- d )
	;;   Fetches a 32-bit integer from address a.

	RPOP (I0, SP)		; Address
	RPUSH (SP, I I0)	; Push low
	RPUSH (SP, I I0)	; Push high
	NEXT



	;; word:  +FLAG!
	;; alias: set_FLAG_store
	;; flags: CODE ROM
        ;;   word +FLAG! defined in primitives/1105_memory.asm:74.
//dwn_set_FLAG_store:
//        .strp "+FLAG!" 0
dw_set_FLAG_store_head:
        .word FFL_T_CODE FFL_ROM 5 ; Flags & hash
        .word dwn_set_FLAG_store ; Pointer to word name (above)
        .word dw_two_fetch_head ; Link to previous dictionary entry
dw_set_FLAG_store:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_set_FLAG_store_pfa:
	;; notes: +FLAG! ( u a -- )
	;;        The value at address a is ORred with u in-place.

	RPOP(TMP0, SP)		; TMP0 = a
	POP SP			; u

	OR I TMP0		; u | mem[a]
	STORE I TMP0		; mem[a] = u | mem[a]
	NEXT



	;; word:  -FLAG!
	;; alias: clear_FLAG_store
	;; flags: CODE ROM
        ;;   word -FLAG! defined in primitives/1105_memory.asm:89.
//dwn_clear_FLAG_store:
//        .strp "-FLAG!" 0
dw_clear_FLAG_store_head:
        .word FFL_T_CODE FFL_ROM 3 ; Flags & hash
        .word dwn_clear_FLAG_store ; Pointer to word name (above)
        .word dw_set_FLAG_store_head ; Link to previous dictionary entry
dw_clear_FLAG_store:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_clear_FLAG_store_pfa:
	;; notes: -FLAG! ( u a -- )
	;;        The value at address a is ANDed with (NOT u) in-place.

	RPOP(TMP0, SP)		; TMP0 = a
	POP SP			; u
	XOR MINUS1		; ~u (faster than NOT)

	AND I TMP0		; ~u & mem[a]
	STORE I TMP1		; mem[a] = mem[a] & ~u
	NEXT



// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/1120_strings.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// String handling primitives.



	;; word:  BL
	;; flags: CONST ROM
        ;;   word BL defined in primitives/1120_strings.asm:8.
//dwn_BL:
//        .strp "BL" 0
dw_BL_head:
        .word FFL_T_CONST FFL_ROM 0 ; Flags & hash
        .word dwn_BL            ; Pointer to word name (above)
        .word dw_clear_FLAG_store_head ; Link to previous dictionary entry
dw_BL:
        CFA_doCONST()     ; Code entry point: next instruction
dw_BL_pfa:
	;; notes: bl ( -- 32 )
	;;        Pushes the codepoint of a space onto the stack.

	.word 32



	;; word:  >CHAR
	;; alias: to-char
	;; flags: CODE ROM
        ;;   word >CHAR defined in primitives/1120_strings.asm:18.
//dwn_to_char:
//        .strp ">CHAR" 0
dw_to_char_head:
        .word FFL_T_CODE FFL_ROM 3 ; Flags & hash
        .word dwn_to_char       ; Pointer to word name (above)
        .word dw_BL_head        ; Link to previous dictionary entry
dw_to_char:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_to_char_pfa:
	;; notes: >CHAR ( c -- c )
	;;   Strips high bits and optionally converts non-printable ASCII
	;;   characters to dots.

	POP SP
	AND PLUS127		; Keep the lower 7 bits
	STORE TMP0

	LI 32			; Compare against ASCII 32
	NEG
	ADD TMP0
	SNN			; char >= 32?
	JMP _dw_to_char_fix	; No.

	LI 127			; Compare against ASCII 127
	XOR TMP0
	SNZ			; Is it 127?
	JMP _dw_to_char_fix	; Yes.

	LOAD TMP0		; No. Push it back.
	PUSH SP
	NEXT

_dw_to_char_fix:
	LI 46			; ASCII 46 = .
	PUSH SP
	NEXT



	;; word:  COUNT
	;; flags: CODE ROM
        ;;   word COUNT defined in primitives/1120_strings.asm:50.
//dwn_COUNT:
//        .strp "COUNT" 0
dw_COUNT_head:
        .word FFL_T_CODE FFL_ROM 6 ; Flags & hash
        .word dwn_COUNT         ; Pointer to word name (above)
        .word dw_to_char_head   ; Link to previous dictionary entry
dw_COUNT:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_COUNT_pfa:
	;; notes: COUNT ( b -- b +n )
	;;        Pushes the length +n (in characters) of the packed,
	;;        null-terminated string at address b.

	POP SP
	JSR _strplen
	PUSH SP
	NEXT

_strplen:
	STORE I0		; I0 is the string pointer
	LI 0
	STORE TMP0		; TMP0 is the count

_strplen_loop:
	LOAD I I0
	SNZ			; Terminator?
	JMP _strplen_end1	; Done.

	AND BYTEHI		; Check the high 8 bits
	SNZ			; Terminator?
	JMP _strplen_end	; Done

	LINCn(TMP0, 2)		; TMP0 += 2

	JMP _strplen_loop	; Again

_strplen_end:
	ISZ TMP0		; TMP0 += 1
	RET

_strplen_end1:
	LOAD TMP0
	RET



	;; word:  >CCOUNT
	;; alias: to_CCOUNT
	;; flags: CODE ROM
        ;;   word >CCOUNT defined in primitives/1120_strings.asm:90.
//dwn_to_CCOUNT:
//        .strp ">CCOUNT" 0
dw_to_CCOUNT_head:
        .word FFL_T_CODE FFL_ROM 1 ; Flags & hash
        .word dwn_to_CCOUNT     ; Pointer to word name (above)
        .word dw_COUNT_head     ; Link to previous dictionary entry
dw_to_CCOUNT:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_to_CCOUNT_pfa:
	;; notes: >CCOUNT ( u -- u )
	;;        Returns the number of cells needed to store u bytes
	;;        of a packed string including its termination.

	POP SP
	SNA			; Special case: empty pstrings use 1 cell.
	INC
	OP1 CLL INC RBR		; L=0, AC++, AC>>1
	PUSH SP
	NEXT



	;; word:  CCOUNT
	;; flags: CODE ROM
        ;;   word CCOUNT defined in primitives/1120_strings.asm:105.
//dwn_CCOUNT:
//        .strp "CCOUNT" 0
dw_CCOUNT_head:
        .word FFL_T_CODE FFL_ROM 5 ; Flags & hash
        .word dwn_CCOUNT        ; Pointer to word name (above)
        .word dw_to_CCOUNT_head ; Link to previous dictionary entry
dw_CCOUNT:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_CCOUNT_pfa:
	;; notes: CCOUNT ( b -- b +n )
	;;   Returns the number of cells used by the packed string b, including
	;;   that of its terminating null.

	POP SP
	JSR _strwplen
	PUSH SP
	NEXT

_strwplen:
	STORE I0		; I0 is the string pointer
	LI 0
	STORE TMP0		; TMP0 is the count

_strwplen_loop:
	ISZ TMP0		; TMP0++. Will never skip unless length >= 65536.

	LOAD I I0
	SNZ			; Terminator?
	JMP _strwplen_end	; Done.

	AND BYTEHI		; Check the high 8 bits
	SNZ			; Terminator?
	JMP _strwplen_end	; Done. No separate termination cell.

	JMP _strwplen_loop	; Loop again.

_strwplen_end:
	LOAD TMP0
	RET


	;; word:  CMOVE
	;; flags: CODE ROM
        ;;   word CMOVE defined in primitives/1120_strings.asm:139.
//dwn_CMOVE:
//        .strp "CMOVE" 0
dw_CMOVE_head:
        .word FFL_T_CODE FFL_ROM 6 ; Flags & hash
        .word dwn_CMOVE         ; Pointer to word name (above)
        .word dw_CCOUNT_head    ; Link to previous dictionary entry
dw_CMOVE:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_CMOVE_pfa:
	;; notes: CMOVE ( addr1 addr2 u -- )
	;;   Copy u cells from addr1 to addr2.

	RPOP(TMP0, SP)		; Count (in cells)
	RPOP(I1, SP)		; Target address
	RPOP(I0, SP)		; Source address

	JSR _cmove_entry
	NEXT

_cmove_entry:
	RNEG(TMP0, TMP0)	; TMP0 = -TMP0
	SNZ			; Sanity check: exit if TMP0=0.
	RET

_cmove_loop:
	RMOV(I I1, I I0)	; mem[I0++] = mem[I1++]
	ISZ TMP0		; TMP0++
	JMP _cmove_loop		; Loop again.
	RET			; Exit if TMP1 == 0.



	;; word:  FILL
	;; flags: CODE ROM CFT
        ;;   word FILL defined in primitives/1120_strings.asm:164.
//dwn_FILL:
//        .strp "FILL" 0
dw_FILL_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn_FILL          ; Pointer to word name (above)
        .word dw_CMOVE_head     ; Link to previous dictionary entry
dw_FILL:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_FILL_pfa:
	;; notes: FILL ( a u c -- )
	;;   Fill c cells starting at address a with value u.

	RPOP(TMP0, SP)		; Count (in cells)
	RPOP(TMP1, SP)		; Value
	RPOP(I0, SP)		; Address
	JMP _cfill_entry



	;; word:  ERASE
	;; flags: CODE ROM
        ;;   word ERASE defined in primitives/1120_strings.asm:176.
//dwn_ERASE:
//        .strp "ERASE" 0
dw_ERASE_head:
        .word FFL_T_CODE FFL_ROM 0 ; Flags & hash
        .word dwn_ERASE         ; Pointer to word name (above)
        .word dw_FILL_head      ; Link to previous dictionary entry
dw_ERASE:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_ERASE_pfa:
	;; notes: ERASE ( a u -- )
	;;        Fill c cells starting at address a with zeroes.

	RPOP(TMP0, SP)		; Count (in cells)
	LI 0
	STORE TMP1		; Value
	;; Fall-through.


	;; Subroutine: _cfill
	;; Inputs:
	;;   I0:   starting address
	;;   TMP0: count (in cells)
	;;   TMP1: value
	;; Outputs:
	;;   None.
	;; Side-effects:
	;;   I0:   last address + 1
	;;   TMP0: 0000


_cfill_entry:
	RNEG(TMP0, TMP0)	; TMP0 = -TMP0
	SNZ			; Sanity check: exit if TMP0=0.
	RET

_cfill_loop:
	RMOV(I I0, TMP1)	; mem[I0++] = TMP1
	ISZ TMP0		; TMP0++
	JMP _cfill_loop		; Loop again.
	RET			; Exit if TMP0 == 0.



	;; word:  $PACK
	;; alias: _pack
	;; flags: CODE ROM CFT
        ;;   word $PACK defined in primitives/1120_strings.asm:213.
//dwn__pack:
//        .strp "$PACK" 0
dw__pack_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 1 ; Flags & hash
        .word dwn__pack         ; Pointer to word name (above)
        .word dw_ERASE_head     ; Link to previous dictionary entry
dw__pack:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw__pack_pfa:
	;; notes: $PACK ( a1 a2 -- a3 a4 )
	;;        Converts an unpacked null-terminated string starting
	;;        at address a1 to a bit-packed representation at address
	;;        a2 which must be a buffer big enough for the conversion.
	;;        The word returns the last address read from (a3) and
	;;        written to (a4).

	RPOP(TMP0, SP)		; pop dst address
	RPOP(I0, SP)		; pop src address

__pack_loop:
	RMOV(I TMP0, I I0)	; Copy Low byte
        SNZ			; Done?
        JMP __pack_end		; Yes

        LOAD I I0		; High byte
        SNZ			; Done?
        JMP __pack_end		; Yes
	MAKEHICHAR()		; Shift 8 bits left
        OR I TMP0		; Combine the two bytes
        STORE I TMP0

        ISZ TMP0		; Increment TMP0. Should never skip.
        JMP __pack_loop		; Loop again
        JMP __pack_loop		; Loop again (sanity check)

__pack_end:
	RPUSH(SP, I0)		; Push the final source address.
	ISZ TMP0		;
	PUSH SP			; Push the final target address.
	NEXT


	;; word:  $cPACK
	;; alias: _cPACK
	;; flags: CODE ROM CFT
        ;;   word $cPACK defined in primitives/1120_strings.asm:249.
//dwn__cPACK:
//        .strp "$CPACK" 0
dw__cPACK_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn__cPACK        ; Pointer to word name (above)
        .word dw__pack_head     ; Link to previous dictionary entry
dw__cPACK:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw__cPACK_pfa:
	;; notes: $PACK ( a1 c a2 -- a3 a4 )
	;;        Converts an unpacked string of length c cells starting
	;;        at address a1 to a bit-packed representation at address
	;;        a2 which must be a buffer big enough for the conversion.
	;;        The word returns the last address read from (a3) and
	;;        written to (a4).

	RPOP(TMP0, SP)		; TMP0 = dst address
	POP SP			; TMP1 = count
	ING			; TMP1 = -(TMP1 + 1)
	STORE TMP1
	RPOP(I0, SP)		; I0 = src address (autoincrement)

__cpack_loop:
	ISZ TMP1		; TMP1++. Zero?
        JMP __cpack_lo		; No. Skip
        JMP __cpack_end1	; Yes. End processing.

__cpack_lo:
	RMOV(I TMP0, I I0)	; Just copy the low byte

	ISZ TMP1		; TMP1++. Zero?
        JMP __cpack_hi		; No. Skip
        JMP __cpack_end		; Yes. End processing.

__cpack_hi:
        LOAD I I0		; High byte
	MAKEHICHAR()		; Shift 8 bits left
        OR I TMP0		; Combine the two bytes
        STORE I TMP0

        ISZ TMP0		; Increment TMP1. Should never skip.
        JMP __cpack_loop	; (but just in case...)
        JMP __cpack_loop	; Loop again

__cpack_end1:
	LI 0
	STORE I TMP0

__cpack_end:
	RPUSH(SP, I0)		; Push the final source address.
	ISZ TMP0		;
	PUSH (SP)		; Push the final target address.

	NEXT


	;; word:  2CHARS
	;; flags: CODE ROM CFT
        ;;   word 2CHARS defined in primitives/1120_strings.asm:298.
//dwn_2CHARS:
//        .strp "2CHARS" 0
dw_2CHARS_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 4 ; Flags & hash
        .word dwn_2CHARS        ; Pointer to word name (above)
        .word dw__cPACK_head    ; Link to previous dictionary entry
dw_2CHARS:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_2CHARS_pfa:
	;; notes: 2CHARS ( a -- a c2 c1 )
	;;        Given an address a of a packed string cell, this splits the
	;;        cell value at a into two bytes c2 (high, second character)
	;;        and c1 (low, first character) and pushes them onto the stack
	;;        in this order. Useful in processing packed strings. The
	;;        address u is increased by one and also pushed onto the
	;;        stack. A c1 or c2 value of 0 signifies the end of the string.

	RPOP(TMP0, SP)		; address
	ADD PLUS1
	PUSH SP			; push the incremented address.

	LOAD I TMP0		; Load character at TMP1
	GETHICHAR()
	PUSH SP			; Push the high character

	LOAD I TMP0
	GETLOCHAR()
	PUSH SP			; Push the low character

	NEXT



//.page

	;; word:  S@
	;; alias: s-fetch
	;; flags: CODE ROM CFT
        ;;   word S@ defined in primitives/1120_strings.asm:327.
//dwn_s_fetch:
//        .strp "S@" 0
dw_s_fetch_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 1 ; Flags & hash
        .word dwn_s_fetch       ; Pointer to word name (above)
        .word dw_2CHARS_head    ; Link to previous dictionary entry
dw_s_fetch:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_s_fetch_pfa:
	;; notes: S@ ( a n -- c )
	;;        Returns the character c at position n of packed string a.
	;;        No checking is performed.

	RPOP (TMP0, SP)		; position
	RPOP (TMP1, SP)		; address

	;; cell position: u >> 1
	;; bit position: u & 1 ? 0xff00 /* MSB */ : 0xff /* LSB */
	RSBR (TMP0, TMP0)	; TMP1 = TMP1 >> 1
	SSL			; L = 1? (odd index?)
	JMP _s_fetch_even	; No. Even index.

_s_fetch_odd:
	;; fetching odd bytes (most significant)
	RADD (TMP1, TMP1, TMP0)	; TMP2 += TMP1
	LOAD I TMP1
	GETHICHAR()		; (AC>>8) & 0xff
	PUSH SP
	NEXT

_s_fetch_even:
	RADD (TMP1, TMP2, TMP0)	; TMP2 += TMP1
	LOAD I TMP1
	AND BYTELO		; AC & 0xff
	PUSH SP
	NEXT			; Done.


	;; word:  S!
	;; alias: s-store
	;; flags: CODE ROM CFT
        ;;   word S! defined in primitives/1120_strings.asm:359.
//dwn_s_store:
//        .strp "S!" 0
dw_s_store_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 1 ; Flags & hash
        .word dwn_s_store       ; Pointer to word name (above)
        .word dw_s_fetch_head   ; Link to previous dictionary entry
dw_s_store:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_s_store_pfa:
	;; notes: S@ ( a n c -- )
	;;        Stores character c at position n of string at address a.
	;;        No checking is performed. n=0 is the first character.


	RPOP (TMP2, SP)		; character
	RPOP (TMP0, SP)		; position
	RPOP (TMP1, SP)		; address

	;; cell position: u >> 1
	;; bit position: u & 1 ? 0xff00 /* MSB */ : 0xff /* LSB */
	RSBR (TMP0, TMP0)	; TMP0 = TMP0 >> 1
	SSL			; L = 1? (odd index?)
	JMP _s_store_even	; No. Even index.

s_store_odd:
	;; storing odd bytes (most significant)
	RADD (TMP1, TMP1, TMP0)	; TMP1 += TMP1
	RAND (I TMP1, I TMP1, BYTELO) ; mask high 8 bits
	LOAD TMP2
	MAKEHICHAR()
	OR I TMP1		; TMP1 |= shifted char
	STORE I TMP1		; store it
	NEXT

_s_store_even:
	RADD (TMP1, TMP1, TMP0)	; TMP1 += TMP0
	RAND (I TMP1, I TMP1, BYTEHI) ; mask lo 8 bits
	LOAD TMP2
	AND BYTELO		; character & 0xff00
	OR I TMP1		; TMP1 |= shifted char
	STORE I TMP1		; store it
	NEXT



	;; word:  do$
	;; alias: do_str
	;; flags: CODE ROM CFT
        ;;   word do$ defined in primitives/1120_strings.asm:398.
//dwn_do_str:
//        .strp "DO$" 0
dw_do_str_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 7 ; Flags & hash
        .word dwn_do_str        ; Pointer to word name (above)
        .word dw_s_store_head   ; Link to previous dictionary entry
dw_do_str:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_do_str_pfa:
	;; notes: doSTR ( -- addr )
	;; 	  Allows string handling in high-level words. Puts the address
        ;;        of the string on the stack, and adjusts the return address
        ;;        (the first item on the return stack) to skip over it. The
        ;;        string must have been compiled with ,$.

	RPOP(TMP0, RP)

	LI 1
	ADD TMP0		; Get the string address
	PUSH SP			; Push it onto the data stack

	LOAD I TMP0		; Load the new IP
	PUSH RP		        ; And store it back on the return stack

	NEXT



	;; word:  .$
	;; alias: dot_str
	;; flags: DOCOL ROM CFT COMPILE
        ;;   word .$ defined in primitives/1120_strings.asm:420.
//dwn_dot_str:
//        .strp ".$" 0
dw_dot_str_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT FFL_COMPILE 4 ; Flags & hash
        .word dwn_dot_str       ; Pointer to word name (above)
        .word dw_do_str_head    ; Link to previous dictionary entry
dw_dot_str:
        CFA_doCOL()       ; Code entry point: next instruction
dw_dot_str_pfa:
	;; notes: .$ ( -- )
	;; 	  Prints out a string previously compiled with ,$.

	.word dw_do_str		; do$
	.word dw_typep0		; TYPEp0
	.word dw_EXIT



// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/1125_token.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// Tokenising words.



;; 	;; _ord:  xxxblindex
;; 	;; _lags: CODE ROM CFT
;; 	;; notes: blindex ( b c -- b )
;; 	;;        Given a string with address b and a character c, returns the first
;; 	;;        address >= b containing a token separator character (anything <= 32).
;; 	;;        Returns zero if the character could not be found.

;; 	RPOP (TMP1, SP)		; character
;; 	RPOP (I0, SP)		; address

;; _blindex_loop:
;; 	LOAD I I0		; Check a character
;; 	SNZ			; Is it the terminating null?
;; 	JMP _blindex_ret0	; Yes. Wrap up.

;; 	ADD _minus32		; Compare against 32
;; 	SPA			; <= 32?
;; 	JMP _blindex_done	; Yes. Done.
;; 	JMP _blindex_loop	; No. Loop again.

;; _blindex_done:
;; 	RPUSH(SP, I0)		; Return I0

;; _blindex_ret0:
;; 	LI 0
;; 	PUSH(SP)
;; 	NEXT



;; 	;; _ord:  xxxblskip
;; 	;; _lags: CODE ROM
;; 	;; notes: TOKEN ( -- )
;; 	;;        Advances >IN past any white space.

;; 	LOADUP(UAOFS_pIN)	; I0 := UP[>IN] (autoincrement reg)
;; 	STORE I0

;; _blskip_loop:
;; 	LOAD I I0		; Load mem[>IN], autoincrement.
;; 	SNZ			; Zero?
;; 	JMP _blskin_end

;; 	ADD _minus32
;; 	SPA			; <=32?
;; 	JMP _blskip_loop	; Yes.

;; _blskin_end:
;; 	LOAD I0
;; 	ADD MINUS1		; Decrement >IN
;; 	STORE I TMP0		; TMP0 still holds the address of >IN
;; 	NEXT



;; 	;; _ord:  xxx_$token
;; 	;; _lias: xxx_token
;; 	;; _lags: CODE ROM
;; 	;; notes: $token ( -- +u )
;; 	;;        Parses a token, starting with the current position of the
;; 	;;        TIB. Returns the length of the token in characters.

;; 	LOADUP(UAOFS_pIN)	; I0 := UP[>IN] (autoincrement reg)
;; 	STORE I0
;; 	RPUSH(SP, I0)		; Push beginning of token.
;; 	LI 0
;; 	STORE TMP1		; Length counter

;; _token_loop:
;; 	LOAD I I0		; Load mem[>IN], autoincrement.
;; 	SNZ			; Zero?
;; 	JMP _token_end		; Yes. Exit.

;; 	ADD _minus32
;; 	SPA			; >32?
;; 	JMP _token_space	; No.

;; 	ISZ TMP1		; Increment count
;; 	JMP _token_loop		; Loop again.

;; _token_space:
;; 	;; It's a whitespace character. Null-terminate.
;; 	LOAD I0
;; 	ADD MINUS1		; Decrement >IN
;; 	STORE I0
;; 	LI 0
;; 	STORE I I0		; [>IN++] = \0

;; 	LOAD I0			; Save the index register value
;; 	STORE I TMP0		; ... to the user variable

;; _token_end:
;; 	RPUSH(SP, TMP1)		; Push length counter
;; 	;; Also skip any trailing white space
;; 	JMP _blskip_loop

;; _minus32:
;; 	.word -32



// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/1130_parse.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// Tokenising words.



	;; word:  INSRC
	;; flags: DOCOL ROM
        ;;   word INSRC defined in primitives/1130_parse.asm:8.
//dwn_INSRC:
//        .strp "INSRC" 0
dw_INSRC_head:
        .word FFL_T_DOCOL FFL_ROM 4 ; Flags & hash
        .word dwn_INSRC         ; Pointer to word name (above)
        .word dw_dot_str_head   ; Link to previous dictionary entry
dw_INSRC:
        CFA_doCOL()       ; Code entry point: next instruction
dw_INSRC_pfa:
	;; notes: INSRC ( -- a +n )
	;; 	  Return the address and length of the current buffer. This word may be
	;;        overridden by changing the user variable 'INSRC to point to
	;;        a custom word.

	.word dw_BLK
	.word dw_fetch
	.word dw_if_branch	; if BLK == 0...
	.word _insrc_tty	; ... go to _insrc_tty

_insrc_blk:
	.word dw_pLINE		; pLINE ( va )
	.word dw_fetch		; @ ( a )
	.word dw_cLINE		; BLKBS ( a va )
	.word dw_fetch		; @ ( a +n )
	.word dw_EXIT

_insrc_tty:
	.word dw_TIB
	.word dw_fetch
	.word dw_cTIB
	.word dw_fetch
	.word dw_EXIT



	;; word:  _EOB?
	;; alias: _EOBq
	;; flags: DOCOL ROM CFT
        ;;   word _EOB? defined in primitives/1130_parse.asm:37.
//dwn__EOBq:
//        .strp "_EOB?" 0
dw__EOBq_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn__EOBq         ; Pointer to word name (above)
        .word dw_INSRC_head     ; Link to previous dictionary entry
dw__EOBq:
        CFA_doCOL()       ; Code entry point: next instruction
dw__EOBq_pfa:
	;; notes: _EOB? ( -- f )
	;;   	  Return TRUE if the end of the input stream has been reached.
	;;        This is the default provider for EOB?, and deals with
	;;        terminals and block buffers.

	.word dw_BLK
	.word dw_fetch
	.word dw_if_branch
	.word _eob_tty

_eob_blk:
	.word dw_pBLK		; >BLK @ ( +n )
	.word dw_fetch
	.word dw_cBLK		; #BLK ( +n va )
	.word dw_fetch		; @ ( +n +n )
	.word dw_geq		; >=
	.word dw_EXIT

_eob_tty:
	.word dw_ofsIN		; >IN @ ( +n )
	.word dw_fetch
	.word dw_cTIB		; #TIB @ ( +n +n )
	.word dw_fetch
	.word dw_geq		; >=
	.word dw_EXIT



	;; word:  _EOL?
	;; alias: _EOLq
	;; flags: DOCOL ROM CFT
        ;;   word _EOL? defined in primitives/1130_parse.asm:68.
//dwn__EOLq:
//        .strp "_EOL?" 0
dw__EOLq_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn__EOLq         ; Pointer to word name (above)
        .word dw__EOBq_head     ; Link to previous dictionary entry
dw__EOLq:
        CFA_doCOL()       ; Code entry point: next instruction
dw__EOLq_pfa:
	;; notes: _EOL? ( -- f )
	;;   	  Return TRUE if the end of the current line has been reached.
	;;        If the input stream comes from the terminal, this is equivalent
	;;        to _EOB?.

	.word dw_BLK
	.word dw_fetch
	.word dw_if_branch
	.word _eob_tty		; Jump into _EOB? code.

_eol_blk:
	.word dw_ofsIN		; >IN @ ( +n )
	.word dw_fetch
	.word dw_cLINE		; #LINE @ ( +n +n )
	.word dw_fetch
	.word dw_geq		; >= ( f )
	.word dw_EXIT



	;; word:  EOB?
	;; alias: EOBq
	;; flags: DOCOL ROM CFT
        ;;   word EOB? defined in primitives/1130_parse.asm:91.
//dwn_EOBq:
//        .strp "EOB?" 0
dw_EOBq_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 1 ; Flags & hash
        .word dwn_EOBq          ; Pointer to word name (above)
        .word dw__EOLq_head     ; Link to previous dictionary entry
dw_EOBq:
        CFA_doCOL()       ; Code entry point: next instruction
dw_EOBq_pfa:
	;; notes: EOB? ( -- f )
	;;   	  Return TRUE if the end of the current buffer/block/file has
	;;        been reached.
	;; code:  : EOB? ( -- f ) 'EOB? @EXECUTE ;

	.word dw_tick_EOBq
	.word dw_fetch_EXECUTE
	.word dw_EXIT



	;; word:  EOL?
	;; alias: EOLq
	;; flags: DOCOL ROM CFT
        ;;   word EOL? defined in primitives/1130_parse.asm:105.
//dwn_EOLq:
//        .strp "EOL?" 0
dw_EOLq_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 1 ; Flags & hash
        .word dwn_EOLq          ; Pointer to word name (above)
        .word dw_EOBq_head      ; Link to previous dictionary entry
dw_EOLq:
        CFA_doCOL()       ; Code entry point: next instruction
dw_EOLq_pfa:
	;; notes: EOL? ( -- f )
	;;   	  Return TRUE if the end of the current line has
	;;        been reached.
	;; code:  : EOL? ( -- f ) 'EOL? @EXECUTE ;

	.word dw_tick_EOLq
	.word dw_fetch_EXECUTE
	.word dw_EXIT



	;; word:  $parse
	;; alias: _parse
	;; flags: CODE ROM CFT
        ;;   word $parse defined in primitives/1130_parse.asm:119.
//dwn__parse:
//        .strp "$PARSE" 0
dw__parse_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn__parse        ; Pointer to word name (above)
        .word dw_EOLq_head      ; Link to previous dictionary entry
dw__parse:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw__parse_pfa:
	;; notes: $PARSE ( b e c  -- b u +n )
	;; 	  Ignores any leading characters with codepoint c, then parses
        ;; 	  a token (starting at address b) until the first codepoint c
	;;        is seen again. Returns the address of the token and its
	;;        length. Returns b=0 and u=0 if there is no more input. +n is
	;;        the number of characters processed.
	;;        Parsing stops if the end address e is reached.

	RPOP(TMP1, SP)		; TMP1=c
	;; PRINTC			; soup
	RPOP(TMP5, SP)		; TMP5=e
	RPOP(I0, SP)		; I0=b
	;; PRINTA

	LI 0
	STORE TMP6		; Number of characters processed
	STORE TMP2		; TMP2 = return address
	STORE TMP4		; TMP4 = return length

	;; Step 1. Skip over any leading instances of c.
_parse_loop0:

	LOAD I0			; I0 == TMP5 (end address)?
	XOR TMP5
	SNZ
	JMP _parse_eob		; End reached.

	ISZ TMP6
	LOAD I I0		; Load mem[I0], autoincrement.
	;; PRINTC

	XOR TMP1		; Compare against c
	SNZ			; Equal?
	JMP _parse_loop0	; Yes. Loop.

	;; Step 2. Parse the token.
	RADD(TMP3, I0, MINUS1)  ; TMP3 = TIBP - 1 (keep pointer for later)
	LI 1
	STORE TMP4		; TMP4 = count (already one)

_parse_loop1:
	LOAD I0			; I0 == TMP5 (end address)?
	XOR TMP5
	SNZ
	JMP _parse_end		; End reached.

	ISZ TMP6
	LOAD I I0		; Next character
	;; PRINTC

	XOR TMP1		; Compare against c
	SNZ			; Equal?
	JMP _parse_end		; Yes.

	ISZ TMP4		; Increment TMP4.
	JMP _parse_loop1	; Loop again.

_parse_end:
	RPUSH(SP, TMP3)		; Push address of token.
	;; PRINTA
	RPUSH(SP, TMP4)		; Push length of token.
	RPUSH(SP, TMP6)		; Return the number of characters processed
	NEXT

_parse_eob:
	LI 0
	PUSH(SP)
	PUSH(SP)
	RPUSH(SP, TMP6)		; Return the number of characters processed
	NEXT



	;; word:  PARSE
	;; flags: DOCOL ROM
        ;;   word PARSE defined in primitives/1130_parse.asm:194.
//dwn_PARSE:
//        .strp "PARSE" 0
dw_PARSE_head:
        .word FFL_T_DOCOL FFL_ROM 5 ; Flags & hash
        .word dwn_PARSE         ; Pointer to word name (above)
        .word dw__parse_head    ; Link to previous dictionary entry
dw_PARSE:
        CFA_doCOL()       ; Code entry point: next instruction
dw_PARSE_pfa:
	;; notes: PARSE ( c -- b u )
	;; 	  Ignores any leading characters with codepoint c, then parses
        ;; 	  a token (starting at >IN) until the first codepoint c
	;;        is seen again. Returns the address of the token and its
	;;        length. Returns b=0 and u=0 if there is no more input.

	;; .word dw_pstate

	.word dw_EOLq		; true = end of input
	.word dw_NOT		; false = end of input
	.word dw_if_branch	; branch if false
	.word _parse_empty

	;; >R ( ) \ Move the character out of the way
	.word dw_to_R

	;; ( ) 'INSRC @EXECUTE ( a +n ) \ Get the buffer start address & size
	.word dw_tick_INSRC
	.word dw_fetch_EXECUTE

	;; ( a +n ) OVER + SWAP ( e a ) \ Get the end address
	.word dw_OVER		; ( a s a )
	.word dw_add		; ( a e )
	.word dw_SWAP		; ( e a )

	;; ( e a ) >IN @ + SWAP ( b e ) \ Offset start address by >IN
	.word dw_ofsIN
	.word dw_fetch		; ( e a ofs )
	.word dw_add		; ( e b )
	.word dw_SWAP		; ( b e )

	;; ( b e ) $parse ( b u +n ) \
	.word dw_R_from		; R> ( b e c )

	.word dw__parse		; $parse ( b u +n )

	;; ( b u +n ) >IN +! ( b u ) \ Adjust >IN
	.word dw_ofsIN		; >IN ( b u +n va )
	.word dw_plus_store	; +! ( b u )
	.word dw_EXIT

_parse_empty:
	.word dw_DROP		; ( )
	doLIT(0)		; 0 0 EXIT
	.word dw_DUP
	.word dw_EXIT




	;; word:  -TRAILING
	;; alias: dash_TRAILING
	;; flags: CODE ROM
        ;;   word -TRAILING defined in primitives/1130_parse.asm:247.
//dwn_dash_TRAILING:
//        .strp "-TRAILING" 0
dw_dash_TRAILING_head:
        .word FFL_T_CODE FFL_ROM 4 ; Flags & hash
        .word dwn_dash_TRAILING ; Pointer to word name (above)
        .word dw_PARSE_head     ; Link to previous dictionary entry
dw_dash_TRAILING:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_dash_TRAILING_pfa:
	;; notes: -TRAILING ( addr +n1 -- addr +n2 )
	;;        The character count +n1 of a unpacked text string beginning at
        ;;        addr is adjusted to exclude trailing spaces. If +n1 is zero,
        ;;        then +n2 is also zero.  If the entire string consists of
        ;;        spaces, then +n2 is zero.
	;;
	;;        Python algorithm (CFT-optimised):
	;;          string = "   ABC ASD   "
	;;          n1 = len(string) # Input
	;;          n2 = -(n1 + 1) # ING
	;;          i = n2 + 1     # NEG
	;;          for i,c in zip(range(i, 0), string):           # (i, i+1, i+2, ..., 1)
	;;              print "***", i, ord(c)
	;;              if ord(c) > 32:
	;;                  n2 = i
	;;          return n1 + n2 + 1


	RPOP(TMP1, SP)		; TMP2 = n1
	ING			; -(n1 + 1)
	STORE TMP2		; TMP3 = n2
	INC			; -n1
	STORE I1		; I1 = i (loop counter)

	SPEEK(SP)
	STORE I0		; I0 = a (don't pop, we won't change this)

_trailing_loop:
	LOAD I I0		; load string character
	ADD _trailing_data	; -32
	SPA			; skip next if char > 32
	JMP _trailing_next

	RMOV(TMP2, I1)		; n2 = i

_trailing_next:
	ISZ I1			; i++
	JMP _trailing_loop	; loop until i == 0

	LI 1			; 1
	ADD TMP1		; n1 + 1
	ADD TMP2		; n1 + n2 + 1

	PUSH(SP)		; Push it.
	NEXT

_trailing_data:
	.word -32



	;; word:  -cTRAILING
	;; alias: dash_cTRAILING
	;; flags: DOCOL ROM
        ;;   word -cTRAILING defined in primitives/1130_parse.asm:301.
//dwn_dash_cTRAILING:
//        .strp "-CTRAILING" 0
dw_dash_cTRAILING_head:
        .word FFL_T_DOCOL FFL_ROM 7 ; Flags & hash
        .word dwn_dash_cTRAILING ; Pointer to word name (above)
        .word dw_dash_TRAILING_head ; Link to previous dictionary entry
dw_dash_cTRAILING:
        CFA_doCOL()       ; Code entry point: next instruction
dw_dash_cTRAILING_pfa:
	;; notes: -cTRAILING ( addr +n1 -- addr +n2 )
	;;        The character count +n1 of a packed text string beginning at
        ;;        addr is adjusted to exclude trailing spaces. If +n1 is zero,
        ;;        then +n2 is also zero.  If the entire string consists of
        ;;        spaces, then +n2 is zero.

	.word dw_DUP		; DUP ( a n n )
	.word dw_if_branch	;   IF
	.word _dash_TRL_end
	.word dw_branch
	.word _dash_TRL_jumpin

_dash_TRL_loop:
	.word dw_DUP		; DUP ( a n n )
	.word dw_zero_less	; <0 ( a n f )
	.word dw_NOT
	.word dw_if_branch	;   IF
	.word _dash_TRL_end

_dash_TRL_jumpin:
	.word dw_dec		; 1- ( a n )

	.word dw_2DUP		; 2DUP ( a n a n )
	.word dw_s_fetch	; S@ ( a n c )
	.word dw_BL		; BL ( a n c 32 )
	.word dw_leq		; <= ( a n f )
	.word dw_if_branch
	.word _dash_TRL_end

	;; It's <= 32, null terminate and go again
	.word dw_2DUP		; 2DUP ( a n a n )
	doLIT(0)		; 0 ( a n a n 0 )
	.word dw_s_store	; S! ( a n )
	.word dw_branch		;    loop again
	.word _dash_TRL_loop

_dash_TRL_end:
	.word dw_inc		; 1+ ( a n+1 ) \ convert offset to length
	.word dw_EXIT



// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/1140_parsers.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// Tokenising words.



	;; word:  .(
	;; alias: dot-paren
	;; flags: DOCOL ROM CFT IMMEDIATE
        ;;   word .( defined in primitives/1140_parsers.asm:9.
//dwn_dot_paren:
//        .strp ".(" 0
dw_dot_paren_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT FFL_IMMEDIATE 4 ; Flags & hash
        .word dwn_dot_paren     ; Pointer to word name (above)
        .word dw_dash_cTRAILING_head ; Link to previous dictionary entry
dw_dot_paren:
        CFA_doCOL()       ; Code entry point: next instruction
dw_dot_paren_pfa:
	;; notes: .( ( -- )
	;;        Used as .( foo). Prints out the string inside the
        ;;        parentheses. The space is not part of the string.
	;; code:  : .( 41 PARSE TYPE ; IMMEDIATE

	doCHAR(")")		; 41
	.word dw_PARSE		; PARSE
	.word dw_TYPE		; TYPE
	.word dw_EXIT		; EXIT



	;; word:  ."
	;; alias: dot-quote
	;; flags: DOCOL ROM CFT IMMEDIATE COMPILE
        ;;   word ." defined in primitives/1140_parsers.asm:24.
//dwn_dot_quote:
//        .strp ".\"" 0
dw_dot_quote_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT FFL_IMMEDIATE FFL_COMPILE 4 ; Flags & hash
        .word dwn_dot_quote     ; Pointer to word name (above)
        .word dw_dot_paren_head ; Link to previous dictionary entry
dw_dot_quote:
        CFA_doCOL()       ; Code entry point: next instruction
dw_dot_quote_pfa:
	;; notes: ." ( -- )
	;;        Used as ." foo". Compiles a bit-packed, null-terminated string
	;;        such that when executed, the address of the string is left on
	;;        the stack.

	doLIT(dw_doPSTR)	; [COMPILE] doPSTR ( a )
	.word dw_comma		; , ( )
	.word dw_comma_str	; ," ( )
	doLIT(dw_typep0)
	.word dw_comma		; ,
	.word dw_EXIT		; EXIT



	;; word:  "
	;; alias: quote
	;; flags: DOCOL ROM CFT IMMEDIATE COMPILE
        ;;   word " defined in primitives/1140_parsers.asm:41.
//dwn_quote:
//        .strp "\"" 0
dw_quote_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT FFL_IMMEDIATE FFL_COMPILE 3 ; Flags & hash
        .word dwn_quote         ; Pointer to word name (above)
        .word dw_dot_quote_head ; Link to previous dictionary entry
dw_quote:
        CFA_doCOL()       ; Code entry point: next instruction
dw_quote_pfa:
	;; notes: ." ( -- )
	;;        Used as ." foo". Compiles a bit-packed, null-terminated string
	;;        such that when executed, the address of the string is left on
	;;        the stack.

	doLIT(dw_doPSTR)	; [COMPILE] doPSTR ( a )
	.word dw_comma		; , ( )
	.word dw_comma_str	; ," ( )
	.word dw_EXIT		; EXIT



	;; word:  (
	;; alias: comment
	;; flags: DOCOL ROM CFT IMMEDIATE
        ;;   word ( defined in primitives/1140_parsers.asm:56.
//dwn_comment:
//        .strp "(" 0
dw_comment_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT FFL_IMMEDIATE 1 ; Flags & hash
        .word dwn_comment       ; Pointer to word name (above)
        .word dw_quote_head     ; Link to previous dictionary entry
dw_comment:
        CFA_doCOL()       ; Code entry point: next instruction
dw_comment_pfa:
	;; notes: ( ( -- )
	;;        Ignores characters until the closing ) is seen. Used
	;;        for comments.
	;; code:  : .( 41 PARSE ; IMMEDIATE

	doCHAR(")")		; 41
	.word dw_PARSE		; PARSE ( b u )
	.word dw_2DROP		; 2DROP ( )
	.word dw_EXIT		; EXIT



	;; word:  \
	;; alias: line_comment
	;; flags: DOCOL ROM CFT IMMEDIATE
        ;;   word \ defined in primitives/1140_parsers.asm:71.
//dwn_line_comment:
//        .strp "\\" 0
dw_line_comment_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT FFL_IMMEDIATE 5 ; Flags & hash
        .word dwn_line_comment  ; Pointer to word name (above)
        .word dw_comment_head   ; Link to previous dictionary entry
dw_line_comment:
        CFA_doCOL()       ; Code entry point: next instruction
dw_line_comment_pfa:
	;; notes: \ ( -- )
	;;        Ignores the remainder of the line.
	;; code:  : \ ( -- ) #TIB @ >IN ! ;

	doCHAR(10)		; 10
	.word dw_PARSE		; PARSE ( b u )
	.word dw_2DROP		; 2DROP ( )
	.word dw_EXIT		; EXIT



	;; word:  CHAR
	;; flags: DOCOL ROM CFT
        ;;   word CHAR defined in primitives/1140_parsers.asm:84.
//dwn_CHAR:
//        .strp "CHAR" 0
dw_CHAR_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 7 ; Flags & hash
        .word dwn_CHAR          ; Pointer to word name (above)
        .word dw_line_comment_head ; Link to previous dictionary entry
dw_CHAR:
        CFA_doCOL()       ; Code entry point: next instruction
dw_CHAR_pfa:
	;; notes: CHAR ( -- c )
	;;        Parse a space-delimited token and return its first character.

	.word dw_BL		; BL
	.word dw_PARSE		; PARSE
	.word dw_DROP		; DROP
	.word dw_c_fetch	; C@ ( which is really @ here)
	.word dw_EXIT		; EXIT



	;; word:  WORD
	;; flags: DOCOL ROM CFT IMMEDIATE
        ;;   word WORD defined in primitives/1140_parsers.asm:97.
//dwn_WORD:
//        .strp "WORD" 0
dw_WORD_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT FFL_IMMEDIATE 3 ; Flags & hash
        .word dwn_WORD          ; Pointer to word name (above)
        .word dw_CHAR_head      ; Link to previous dictionary entry
dw_WORD:
        CFA_doCOL()       ; Code entry point: next instruction
dw_WORD_pfa:
	;; notes: WORD ( c -- a )
	;;        Parse a c-delimited token and pack it into a bit-packed
	;;        string. Return its starting address (which will be HERE).

	.word dw_PARSE		; PARSE ( b u )
	.word dw_HERE		; HERE ( b u a )

	.word dw__cPACK		; $cPACK ( a3 a4 )
	.word dw_2DROP		; 2DROP ( )
	.word dw_HERE		; HERE ( a )

	;; .word dw_DUP
	;; doLIT(8)
	;; .word dw_DUMP
	;; .word dw_DROP

	;; .word dw_DEBUGOFF
	;; .word dw_DUP
	;; .word dw_CCOUNT
	;; .word dw_dot_s
	;; .word dw_CR


	.word dw_EXIT		; EXIT



	;; word:  TOKEN
	;; flags: DOCOL ROM
        ;;   word TOKEN defined in primitives/1140_parsers.asm:126.
//dwn_TOKEN:
//        .strp "TOKEN" 0
dw_TOKEN_head:
        .word FFL_T_DOCOL FFL_ROM 1 ; Flags & hash
        .word dwn_TOKEN         ; Pointer to word name (above)
        .word dw_WORD_head      ; Link to previous dictionary entry
dw_TOKEN:
        CFA_doCOL()       ; Code entry point: next instruction
dw_TOKEN_pfa:
	;; notes: TOKEN ( -- addr | 0 )
	;;        Parse a token and prepare it for dictionary search.
	;;        Return its address, or 0 if no more tokens are available.

	;; .word dw_pstate
	.word dw_BL		; BL
	.word dw_PARSE		; PARSE ( b u )

	.word dw_DUP		; DUP ( b u u )
	.word dw_if_branch	; ( b u )
	.word _token_empty

	.word dw_HERE		; HERE ( b u a )
	.word dw__cPACK		; $cPACK ( a3 a4 )
	.word dw_2DROP		; 2DROP ( )
	.word dw_HERE		; HERE ( a )
	.word dw_pstrupper	; pSTRUPPER ( a )

	.word dw_EXIT		; EXIT

_token_empty:
	.word dw_SWAP
	.word dw_DROP
	.word dw_EXIT



	;; word:  '
	;; alias: tick
	;; flags: DOCOL ROM
        ;;   word ' defined in primitives/1140_parsers.asm:156.
//dwn_tick:
//        .strp "'" 0
dw_tick_head:
        .word FFL_T_DOCOL FFL_ROM 6 ; Flags & hash
        .word dwn_tick          ; Pointer to word name (above)
        .word dw_TOKEN_head     ; Link to previous dictionary entry
dw_tick:
        CFA_doCOL()       ; Code entry point: next instruction
dw_tick_pfa:
	;; notes: ' ( -- addr )
	;;        Return the address of the word represented by the next token.
	;;        If the word isn't found, raise an error.

	.word dw_TOKEN		; TOKEN ( addr )
	.word dw_FIND		; FIND ( addr f )
	.word dw_if_branch	; ?branch ( addr )
	.word _tick_fail
	.word dw_EXIT

_tick_fail:
	.word dw_THROW



// End of file.



///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/1200_div16.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// Division words


/.page


	;; word:  /0?
	;; alias: div0q
	;; flags: DOCOL ROM CFT
        ;;   word /0? defined in primitives/1200_div16.asm:11.
//dwn_div0q:
//        .strp "/0?" 0
dw_div0q_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 4 ; Flags & hash
        .word dwn_div0q         ; Pointer to word name (above)
        .word dw_tick_head      ; Link to previous dictionary entry
dw_div0q:
        CFA_doCOL()       ; Code entry point: next instruction
dw_div0q_pfa:
	;; notes: /0? ( n -- n )
	;;        Abort with an error message if n is zero.

	.word dw_DUP		; ?DUP ( n n )
	.word dw_zero_equals	; 0= ( n f )
	.word dw_doABORT_str	; ABORT" division by 0"
	.word @+8
	.strp "division by 0" 0
	;;     11223344556677
	.word dw_EXIT		; ( n )



	;; word:  <<
	;; alias: shl
	;; flags: CODE ROM CFT
        ;;   word << defined in primitives/1200_div16.asm:27.
//dwn_shl:
//        .strp "<<" 0
dw_shl_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 6 ; Flags & hash
        .word dwn_shl           ; Pointer to word name (above)
        .word dw_div0q_head     ; Link to previous dictionary entry
dw_shl:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_shl_pfa:
	;; notes: << ( u +n -- a )
	;;        Shift u +n bits left.
	;;        TMP0 = +n
	;;        TMP1 = u

	POP SP			; Pop u
	NEG
	STORE TMP0

	RPOP(TMP1, SP)

	LOAD TMP0		; Bail out if either arg is zero.
	AND TMP1
	SNZ
	JMP _shl_end

_shl_loop:
	RSBL(TMP1,TMP1)
	ISZ TMP0
	JMP _shl_loop

_shl_end:
	RPUSH(SP, TMP1)
	NEXT


	;; word:  >>
	;; alias: shr
	;; flags: CODE ROM CFT
        ;;   word >> defined in primitives/1200_div16.asm:56.
//dwn_shr:
//        .strp ">>" 0
dw_shr_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 4 ; Flags & hash
        .word dwn_shr           ; Pointer to word name (above)
        .word dw_shl_head       ; Link to previous dictionary entry
dw_shr:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_shr_pfa:
	;; notes: >> ( u +n -- a )
	;;        Shift u +n bits right.
	;;        TMP0 = +n
	;;        TMP1 = u

	POP SP			; Pop u
	NEG
	STORE TMP0

	RPOP(TMP1, SP)

	LOAD TMP0		; Bail out if either arg is zero.
	AND TMP1
	SNZ
	JMP _shr_end

_shr_loop:
	RSBR(TMP1, TMP1)
	ISZ TMP0
	JMP _shr_loop

_shr_end:
	RPUSH(SP, TMP1)
	NEXT



	;; word:  U/MOD
	;; alias: U-DIV-MOD
	;; flags: CODE ROM CFT
        ;;   word U/MOD defined in primitives/1200_div16.asm:86.
//dwn_U_DIV_MOD:
//        .strp "U/MOD" 0
dw_U_DIV_MOD_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 0 ; Flags & hash
        .word dwn_U_DIV_MOD     ; Pointer to word name (above)
        .word dw_shr_head       ; Link to previous dictionary entry
dw_U_DIV_MOD:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_U_DIV_MOD_pfa:
	;; notes: U/MOD ( u1 u2 -- ur uq )
	;;   16-bit unsigned integer division. Calculates u1 / u2 and
	;;   returns the remainder ur and the quotient uq.
	RPOP(TMP3, SP)		; u2
	RPOP(TMP1, SP)		; u1

	JSR _udiv16

	;; TODO: check for division by zero here (AC = 0 => error)

	RPUSH (SP, TMP5)	; modulo
	RPUSH (SP, TMP1)	; quotient

	NEXT



	;; Subroutine: div16
	;;
	;; Inputs:
	;;   TMP1: dividend
	;;   TMP3: divisor
	;;
	;; Outputs:
	;;   TMP1: quotient
	;;   TMP5: modulo
	;;   AC: 0 => division by zero.

_udiv16_done:
	LI 1
	RET

_udiv16:
	;; TODO: optimise for division by powers of two (and ideally 10)

	;; Check for division by zero.
        LOAD TMP3		; Check for division by zero
	SNZ
	RET			; Division by zero. Return 0.

	;; Check for division by 2.
	LI 2
	XOR TMP3
	SNZ
	JMP _ushr1

	;; Check for division by 16.
	LI 16
	XOR TMP3
	SNZ
	JMP _ushr4

	LOAD _udiv16_rep	; -17 => 16 bits
	STORE TMP0

	LI 0
	STORE TMP5		; modulo = 0

_udiv16_nextbit:
        ISZ TMP0		; Increment and check if done.
        JMP @+2
	JMP _udiv16_done

	;; Magic.
	RSBL(TMP1, TMP1)	; Shift left <TMP5,TMP1> (<modulo,quotient>)
	RRBL(TMP5, TMP5)

	;; Compare modulo and divisor
	LOAD TMP3		; Calculate modulo - divisor (TMP5 - TMP3)
	NEG
	ADD TMP5

	;; Will it fit?
	SNN			; Will it fit?
	JMP _udiv16_nextbit	; No. Try next bit.

	;; Yes, it fits.
	STORE TMP5 		; Update the modulo.

	LI 1			; The divisor fits in the divident. Add 1.
	ADD TMP1
	STORE TMP1

	JMP _udiv16_nextbit	; And go again.

_udiv16_rep:
	.word -17

	;; Optimised 16-bit division by 2 and 16.
	;;
	;; Inputs:
	;;   TMP1: dividend
	;;   TMP3: divisor
	;;
	;; Outputs:
	;;   TMP1: quotient
	;;   TMP5: modulo
	;;   AC: 0 => division by zero.

_ushr1:
	LOAD TMP1
	CLL RBR
	STORE TMP1
	CLA RBL			; Roll-in value of L.
	STORE TMP5
	LI 0
	RET

_ushr4:
	LI &f
	AND TMP1
	STORE TMP5		; Modulo = (TMP1 & 0xf)

	LOAD TMP1

	LOAD TMP1
	RNR
	AND PLUS0FFF		; Quotient = (TMP1 >> 4) & 0xfff)
	STORE TMP1
	LI 0
	RET



	;; word:  /MOD
	;; alias: DIV-MOD
	;; flags: CODE ROM CFT
        ;;   word /MOD defined in primitives/1200_div16.asm:213.
//dwn_DIV_MOD:
//        .strp "/MOD" 0
dw_DIV_MOD_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 3 ; Flags & hash
        .word dwn_DIV_MOD       ; Pointer to word name (above)
        .word dw_U_DIV_MOD_head ; Link to previous dictionary entry
dw_DIV_MOD:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_DIV_MOD_pfa:
	;; notes: /MOD ( u1 u2 -- ur uq )
	;;   Floored, 16-bit signed integer division. Calculates u1 / u2 and
	;;   returns the remainder ur and the quotient uq.
	;;
	;;   Wraps udiv16, and modifies its results for symmetric signed
	;;   division, then adjusts to obtain floored division as per the F83
	;;   standard.

	RPOP(TMP3, SP)		; u2 divisor
	RPOP(TMP1, SP)		; u1 dividend

	;; Check the sign of the dividend.
	STORE TMP14		; Store for later.
	SNA			; Negative?
	JMP _idiv16_testr	; No. Carry on.

	NEG
	STORE TMP1		; Negate it and store it back.

	;; Check the sign of the divisor.
_idiv16_testr:
	RMOV(TMP15, TMP3)	; Load divisor, store for later.
	SNA			; Negative?
	JMP _idiv16_go		; No. Carry on.

	NEG
	STORE TMP3		; Negate it and store it back.

	;; ...and go divide. (unsigned division, of course)
_idiv16_go:
	JSR _udiv16

	;; TODO: check for division by zero here (AC = 0 => error)



	;; This is where symmetric signed division is implemented.
	;; Based on this, we calculate floored division results as per the F83
	;; standard.
	;;
	;; Symmetric division entails (based on unsigned results):
	;;
	;;   * Flipping the sign of the quotient if the signs of the dividend
	;;     and divisor differ.
	;;
	;;   * Flipping the sign of the remainder if the dividend is negative.
	;;
	;; Details found at http://www.bearcave.com/software/divide.htm

	;; Negate the quotient of the argument signs differ.
	LOAD TMP14
	XOR TMP15
	AND _idiv16_bit15	; Are the signs different?
	STORE TMP13		; Keep this for later (for floored division)
	SNZ
	JMP _idiv16_nonegq

	RNEG(TMP1, TMP1)		; Negate the quotient.

	;; Don't negate quotient
_idiv16_nonegq:
	;; The sign of the remainder is the same as the sign of the dividend.
	LOAD TMP14
	SNA
	JMP _idiv16_symmetric_done

	RNEG(TMP5, TMP5)	; Negate the remainder to match.

_idiv16_symmetric_done:
_idiv16_flooored:

        ;; Up to here, we've done floored division. Now convert it to symmetric
        ;; division.
	;;

        LOAD TMP5		; Load modulo
        SNZ
        JMP _idiv16_done	; It's zero: all's good. Exit.

	LOAD TMP13		; Non-zero if argument signs differ
	SNZ
	JMP _idiv16_done	; Equal signs: all done here. Exit.

        RADD(TMP1, TMP1, MINUS1) ; Quotient--
        RADD(TMP5, TMP5, TMP15)	; modulo += divisor

_idiv16_done:
	RPUSH(SP, TMP5)		; modulo
	RPUSH(SP, TMP1)		; quotient
	NEXT

_idiv16_bit15:
	.word &8000


	;; word:  /
	;; alias: DIV
	;; flags: DOCOL ROM CFT
        ;;   word / defined in primitives/1200_div16.asm:311.
//dwn_DIV:
//        .strp "/" 0
dw_DIV_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 6 ; Flags & hash
        .word dwn_DIV           ; Pointer to word name (above)
        .word dw_DIV_MOD_head   ; Link to previous dictionary entry
dw_DIV:
        CFA_doCOL()       ; Code entry point: next instruction
dw_DIV_pfa:
	;; notes: / ( u1 u2 -- u )
	;;   16-bit signed integer division. Calculates u1 / u2 and
	;;   returns the remainder ur and the quotient uq.
	.word dw_DIV_MOD	; /MOD
	.word dw_SWAP		; SWAP
	.word dw_DROP		; DROP
	.word dw_EXIT



// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/1200_div32.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// Division words

	;; word:  UD/MOD
	;; alias: UD-DIV-MOD
	;; flags: CODE ROM CFT
        ;;   word UD/MOD defined in primitives/1200_div32.asm:7.
//dwn_UD_DIV_MOD:
//        .strp "UD/MOD" 0
dw_UD_DIV_MOD_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 3 ; Flags & hash
        .word dwn_UD_DIV_MOD    ; Pointer to word name (above)
        .word dw_DIV_head       ; Link to previous dictionary entry
dw_UD_DIV_MOD:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_UD_DIV_MOD_pfa:
	;; notes: UD/MOD ( d1 d2 -- dr dq )
	;;   32-bit unsigned integer division. Calculates d1 / d2 and
	;;   returns the remainder dr and the quotient dq.

	RPOP(TMP2, SP)		; d2 high
	RPOP(TMP3, SP)		; d2 low

	RPOP(TMP7, SP)		; d1 high (temporarily)
	RPOP(TMP1, SP)		; d1 low
	RMOV(TMP0, TMP7)	; move d1 high to right register

	JSR _udiv32

	;; TODO: check for division by zero here (AC = 0 => error)

	RPUSH (SP, TMP5)	; quotient low
	RPUSH (SP, TMP4)	; quotient high

	RPUSH (SP, TMP1)	; remainder low
	RPUSH (SP, TMP0)	; remainder high

	NEXT



	;; word:  UM/MOD
	;; alias: UM-DIV-MOD
	;; flags: CODE ROM
        ;;   word UM/MOD defined in primitives/1200_div32.asm:35.
//dwn_UM_DIV_MOD:
//        .strp "UM/MOD" 0
dw_UM_DIV_MOD_head:
        .word FFL_T_CODE FFL_ROM 3 ; Flags & hash
        .word dwn_UM_DIV_MOD    ; Pointer to word name (above)
        .word dw_UD_DIV_MOD_head ; Link to previous dictionary entry
dw_UM_DIV_MOD:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_UM_DIV_MOD_pfa:
	;; notes: UM/MOD ( d u -- dr dq )
	;;   Divide a 32-bit unsigned dividend d by a 16-bit unsigned divisor u.
	;;   Returns the remainder dr and the quotient dq.

	LI 0
	STORE TMP2		; divisor high = 0
	RPOP(TMP3, SP)		; u to divisor low

	RPOP(TMP7, SP)		; d1 high (temporarily)
	RPOP(TMP1, SP)		; d1 low
	RMOV(TMP0, TMP7)	; move d1 high to right register

	JSR _udiv32

	;; TODO: check for division by zero here (AC = 0 => error)

	RPUSH (SP, TMP5)	; quotient low
	RPUSH (SP, TMP4)	; quotient high

	RPUSH (SP, TMP1)	; remainder low
	RPUSH (SP, TMP0)	; remainder high

	NEXT



	;; A 32-bit unsigned division routine based on div16.
	;; Inputs (HI,LO)
	;;   TMP0,TMP1 = dividend (d1)
	;;   TMP2,TMP3 = divisor (d2)
	;;
	;; Output:
	;;   TMP0,TMP1 = remainder
	;;   TMP4,TMP5 = quotient
	;;   AC = 0 => division by zero.
	;;
	;; Registers:
	;;   TMP6,TMP7: shift mask
	;;   TMP8,TMP9: temporary

_udiv32_done:
        LI 1
        RET

_udiv32_wrap_udiv16:
	RMOV(TMP11, RETV)
	JSR _udiv16
	LI 0
	STORE TMP0
	STORE TMP4
	JMP I TMP11		; Return to saved address

_udiv32:
        ; Check for division by zero.
        LOAD TMP2
        OR TMP3
        SNZ
        RET                     ; Return with AC = 0

	;; Optimisation: if TMP0==TMP2==0, use _udiv16.
	LOAD TMP2
	OR TMP0
	SNZ
	JMP _udiv32_wrap_udiv16

	RMOV(TMP6, _udiv32_rep) ; loop counter: 32 bits, 32 iterations

	LSET(TMP4, 0)           ; Modulo high = 0
        STORE TMP5              ; Modulo low = 0

_udiv32_nextbit:
        ISZ TMP6                ; TMP6++, skip if 0.
        JMP @+2
        JMP _udiv32_done        ; We're done.

        ; Magic: Shift left <TMP0,TMP1,TMP4,TMP5> 64-bit value (<modulo,quotient>)

        RSBL(TMP1, TMP1)        ; Shift first word.
        RRBL(TMP0, TMP0)        ; Roll subsequent for bit propagation.
        RRBL(TMP5, TMP5)        ; Roll subsequent for bit propagation.
        RRBL(TMP4, TMP4)        ; Roll subsequent for bit propagation.

_udiv32_compare:

        ; Calculate modulo - divisor (<TMP4,TMP5> - <TMP2,TMP3>)

        ; First, negate <TMP2,TMP3> (complement, then add <0,1>)
        RNEG32(TMP7,TMP8,TMP2,TMP3) ; <TMP7,TMP8> = -<TMP2,TMP3>

        ; Now, add module + (-divisor) (<TMP4,TMP5> + <TMP7,TMP8>)
        CLL
        RADD(TMP8, TMP8, TMP5)  ; Add low words. Keep the result for later.
        LOAD TMP7
        ADC(TMP4)               ; Add high words with carry.

_udiv32_does_it_fit:
	SNN			; Will it fit?
	JMP _udiv32_nextbit	; No. Try next bit.

_udiv32_it_fits:
	STORE TMP4 		; We already have the result of the subtraction. Store it.
        RMOV(TMP5,TMP8)         ; Transfer the low order word too.

	INC32(TMP0,TMP1)	; Add one to the quotient

	JMP _udiv32_nextbit     ; And loop again.

_udiv32_rep:
	.word -33		; Number of loop repetitions


	;; word:  D/MOD
	;; alias: D-div-MOD
	;; flags: CODE ROM CFT
        ;;   word D/MOD defined in primitives/1200_div32.asm:149.
//dwn_D_div_MOD:
//        .strp "D/MOD" 0
dw_D_div_MOD_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 1 ; Flags & hash
        .word dwn_D_div_MOD     ; Pointer to word name (above)
        .word dw_UM_DIV_MOD_head ; Link to previous dictionary entry
dw_D_div_MOD:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_D_div_MOD_pfa:
	;; notes: D/MOD ( d1 d2 -- dr dq )
	;;   32-bit signed floored division. Uses udiv32, which it then
	;;   adjusts first for symmetric signed division, then for
	;;   floored division.

	RPOP(TMP2, SP)		; d2 high
	STORE TMP15		; Store for later
	RPOP(TMP3, SP)		; d2 low
	STORE TMP12		; Store for later

	RPOP(TMP7, SP)		; d1 high (temporarily)
	RPOP(TMP1, SP)		; d1 low
	RMOV(TMP0, TMP7)	; move d1 high to right register
	STORE TMP14		; and keep for later.

	;; Absolute values of the two arguments
	LOAD TMP0
	SNA
	JMP _idiv32_nonegn

	RNEG32(TMP0, TMP1, TMP0, TMP1)

_idiv32_nonegn:

	LOAD TMP2
	SNA
	JMP _idiv32_nonegr

	RNEG32(TMP2, TMP3, TMP2, TMP3)

	;; Perform the division itself.
_idiv32_nonegr:

	JSR _udiv32

	;; TODO: check for division by zero here (AC = 0 => error)



	;; This is where symmetric signed division is implemented.
	;; Based on this, we calculate floored division results as per the F83
	;; standard.
	;;
	;; Symmetric division entails (based on unsigned results):
	;;
	;;   * Flipping the sign of the quotient if the signs of the dividend
	;;     and divisor differ.
	;;
	;;   * Flipping the sign of the remainder if the dividend is negative.
	;;
	;; Details found at http://www.bearcave.com/software/divide.htm

	;; Negate the quotient of the argument signs differ.
	LOAD TMP14
	XOR TMP15
	AND _idiv16_bit15	; Are the signs different? (uses idiv16 constant)
	STORE TMP13		; Keep this for later (for floored division)
	SNZ
	JMP _idiv32_nonegq

	RNEG32(TMP0, TMP1, TMP0, TMP1)	; Negate the quotient.

	;; Don't negate quotient
_idiv32_nonegq:
	;; The sign of the remainder is the same as the sign of the dividend.
	LOAD TMP14
	SNA
	JMP _idiv32_symmetric_done

	RNEG32(TMP4, TMP5, TMP4, TMP5) ; Negate the remainder to match.

_idiv32_symmetric_done:
_idiv32_flooored:

        ;; Up to here, we've done floored division. Now convert it to symmetric
        ;; division.
	;;
	;; Discussion found at
	;; http://atariwiki.strotmann.de/wiki/Wiki.jsp?page=Signed%20Integer%20Division

        LOAD TMP4		; Load modulo
	OR TMP5			; Checking if it's zero. OR words together.
        SNZ
	JMP _idiv32_done	; It's zero: all's good. Exit.

	LOAD TMP13		; Non-zero if argument signs differ
	SNZ
	JMP _idiv32_done	; Equal signs: all done here. Exit.

        RADD(TMP1, TMP1, R MINUS1)  ; Quotient--
	RADC(TMP0, TMP0, R MINUS1)

        RADD(TMP5, TMP5, TMP12)	; modulo += divisor (low words)
        RADC(TMP4, TMP4, TMP15)	; modulo += divisor (high words)

_idiv32_done:
	RMOV(TMP15, TMP0)
	RPUSH (SP, TMP5)	; quotient low
	RPUSH (SP, TMP4)	; quotient high

	RPUSH (SP, TMP1)	; remainder low
	RPUSH (SP, TMP15)	; remainder high

	NEXT

//.page


// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/1200_mul.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// Core arithmetic and logic

//.page


	;; word:  *
	;; alias: mul16
	;; flags: CODE ROM
        ;;   word * defined in primitives/1200_mul.asm:10.
//dwn_mul16:
//        .strp "*" 0
dw_mul16_head:
        .word FFL_T_CODE FFL_ROM 3 ; Flags & hash
        .word dwn_mul16         ; Pointer to word name (above)
        .word dw_D_div_MOD_head ; Link to previous dictionary entry
dw_mul16:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_mul16_pfa:
	;; notes: * ( w1 w2 -- w )
	;;   16-bit signed integer multiplication. CFT does multiplication in
	;;   software. The algorithm is faster if w1 > w2.

	RPOP(TMP15, SP)
	RPOP(TMP14, SP)
	JSR _umul16
	RPUSH(SP, TMP13)
	NEXT



	;; word:  *10
	;; alias: mul10
	;; flags: CODE ROM CFT
        ;;   word *10 defined in primitives/1200_mul.asm:25.
//dwn_mul10:
//        .strp "*10" 0
dw_mul10_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 1 ; Flags & hash
        .word dwn_mul10         ; Pointer to word name (above)
        .word dw_mul16_head     ; Link to previous dictionary entry
dw_mul10:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_mul10_pfa:
	;; notes: *10 ( w -- w )
	;;        Multiply w by 10. 10w = (w<<1) | (w<<3), considerably cheaper than
	;;        a full 16-bit multiplication.

	RPOP(TMP0,SP)

	SBL			; 2w
	STORE TMP0		; Store it for later
	SBL			; 4w
	SBL			; 8w
	OR TMP0			; 2w | 8w
	PUSH SP
	NEXT



	;; word:  BCD8>
	;; alias: BCD8_from
	;; flags: CODE ROM CFT
        ;;   word BCD8> defined in primitives/1200_mul.asm:44.
//dwn_BCD8_from:
//        .strp "BCD8>" 0
dw_BCD8_from_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 7 ; Flags & hash
        .word dwn_BCD8_from     ; Pointer to word name (above)
        .word dw_mul10_head     ; Link to previous dictionary entry
dw_BCD8_from:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_BCD8_from_pfa:
	;; notes: BCD8> ( bcd -- w bcd )
	;;        Convert the lower 8-bits of bcd from BCD to binary. Push the
        ;;        binary value w on the stack, followed by the upper 8 bits of
        ;;        bcd shifted 8 places right.
	;;
	;;        TMP1 = bcd
	;;        TMP2 = running total

	RPOP(TMP1,SP)
	STORE TMP1

	;; Units.
	AND PLUS15		; Keep the least significant digit
	STORE TMP2

	;; Tens.
	RRNR(TMP1, TMP1)	; Roll TMP1 4 bits right
	AND PLUS15		; Keep low nybble
	SBL			; Multiply by 10
	STORE TMP0
	SBL
	SBL
	OR TMP0
	ADD TMP2		; Add it to the running total

	;; Push the converted number
	PUSH SP

	;; Push the high byte of bcd.
	RRNR(TMP1, TMP1)
	AND BYTELO
	PUSH SP

	NEXT



	;; word:  BCD>
	;; alias: BCD_from
	;; flags: DOCOL ROM CFT
        ;;   word BCD> defined in primitives/1200_mul.asm:84.
//dwn_BCD_from:
//        .strp "BCD>" 0
dw_BCD_from_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 6 ; Flags & hash
        .word dwn_BCD_from      ; Pointer to word name (above)
        .word dw_BCD8_from_head ; Link to previous dictionary entry
dw_BCD_from:
        CFA_doCOL()       ; Code entry point: next instruction
dw_BCD_from_pfa:
	;; notes: BCD> ( bcd -- w )
	;;        Convert a 16-bit (four digit) BCD to binary.

	.word dw_BCD8_from	; BCD8> ( lo bcd )
	.word dw_BCD8_from	; BCD8> ( lo hi bcd )
	.word dw_DROP		; DROP ( lo hi )
	.word dw_if_DUP		; ?DUP ( lo 0 | lo hi hi )
	.word dw_if_branch	;   if hi == 0: EXIT
	.word _BCD_from_exit
	doLIT(100)		; 100 ( lo hi 100 )
	.word dw_mul16		; * ( lo 100hi )
	.word dw_add		; + ( 100hi + lo )
_BCD_from_exit:
	.word dw_EXIT




	;; 16-bit unsigned multiplication (works for signed too)
	;;
	;; Inputs:
	;;   TMP15 smaller number
	;;   TMP14 larger number
	;;
	;; Side effects:
	;;   L
	;;
	;; Outputs:
	;;   TMP13 product

_umul16:
	LI 0
	STORE TMP13		; TMP13 = product = 0

_umul16_loop:
	LOAD TMP15		; a == 0?
	SNZ
	RET			; Then we're done.

	SBR			; L = A & 1, A = A >> 1
	STORE TMP15
	SSL			; L == 0?
	JMP _umul16_noadd

	RADD(TMP13, TMP13, TMP14) ; prod += b

_umul16_noadd:
	LOAD TMP14		; b <<= 1
	SBL
	STORE TMP14

	JMP _umul16_loop	; Loop again


//	.page


	;; word:  UM*
	;; alias: UM_times
	;; flags: CODE ROM CFT
        ;;   word UM* defined in primitives/1200_mul.asm:144.
//dwn_UM_times:
//        .strp "UM*" 0
dw_UM_times_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 6 ; Flags & hash
        .word dwn_UM_times      ; Pointer to word name (above)
        .word dw_BCD_from_head  ; Link to previous dictionary entry
dw_UM_times:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_UM_times_pfa:
	;; notes: * ( w1 w2 -- d )
	;;   16-bit unsigned integer multiplication. Returns 32-bit value.
	;;   Please remember that CFT does multiplication in software. Consider
	;;   using shifts instead of this expensive operation.

	;; Pop 16-bit values, populate 32-bit inputs of mul32.
	RPOP(TMP2, SP)		; A low
	RPOP(TMP4, SP)		; B low
	LI 0
	STORE TMP1		; A high
	STORE TMP3		; B high
	JSR _umul32		; (TMP5,TMP5) = (TMP1,TMP2) * (TMP3,TMP4)
	RPUSH(SP, TMP6)		; Push low result
	RPUSH(SP, TMP5)		; Push high result
	NEXT			; Done.



	;; word:  UD*
	;; alias: UDtimes
	;; flags: CODE ROM CFT
        ;;   word UD* defined in primitives/1200_mul.asm:165.
//dwn_UDtimes:
//        .strp "UD*" 0
dw_UDtimes_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 6 ; Flags & hash
        .word dwn_UDtimes       ; Pointer to word name (above)
        .word dw_UM_times_head  ; Link to previous dictionary entry
dw_UDtimes:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_UDtimes_pfa:
	;; notes: * ( d d -- d )
	;;   32-bit unsigned integer multiplication.
	;;   Please remember that CFT does multiplication in software. Consider
	;;   using shifts instead of this expensive operation.

	;; Pop 16-bit values, populate 32-bit inputs of mul32.
	RPOP(TMP1, SP)		; A high
	RPOP(TMP2, SP)		; A low
	RPOP(TMP3, SP)		; B high
	RPOP(TMP4, SP)		; B low
	JSR _umul32		; (TMP5,TMP5) = (TMP1,TMP2) * (TMP3,TMP4)
	RPUSH(SP, TMP6)		; Push low result
	RPUSH(SP, TMP5)		; Push high result
	NEXT			; Done.



	;; 32-bit unsigned integer multiplication
	;;
	;; Inputs:
	;;   TMP1 = high word of a
	;;   TMP2 = low word of a
	;;   TMP3 = high word of b
	;;   TMP4 = low word of b
	;;
	;; Output:
	;;   TMP5 = high word of product
	;;   TMP6 = low word of product
	;;
	;; Algorithm:
	;; sum = 0
	;; while a >= 1:
	;;   if a & 1:
	;;     sum += b
	;;   a = a >> 1
	;;   b = b << 1


_umul32:
	LI 0
	STORE TMP5 		; product = 0
	STORE TMP6 		; product = 0

	LOAD TMP1		; stop here if a == 0
	OR TMP2
	SNZ
	RET			; return

	LOAD TMP4		; stop here if b ==0
	OR TMP5
	SNZ
	RET			; return

_umul32_loop:

	;; Get bit0 of a by shifting right (which we're going to do
	;; anyway) and testing L.

	;; 32-bit shift-right
	RSBR(TMP1, TMP1)	; a = a >> 1
	RRBR(TMP2, TMP2)

	SSL			; L == 1?
	JMP _umul32_noadd	; No. Skip adding to the product.

	;; Add b to product with carry.
	//LOAD TMP3
	//PRINTHI
	//LOAD TMP4
	//PRINTLO

	OP1 CLL			; clear carry
	RADD(TMP6,TMP6,TMP4)	; prod low += b low
	RADC(TMP5,TMP5,TMP3)	; prod high += b high + carry


_umul32_noadd:
	;; 32-bit shift-left
	RSBL(TMP4, TMP4)	; b = b << 1
	RRBL(TMP3, TMP3)	; roll (using L from above)

	;; Are we done?
	LOAD TMP2		; a == 0?
	OR TMP1
	SNZ
	RET			; Then we're done.

	JMP _umul32_loop	; Loop again



// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/1300_mularith.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// Supplemental multiplication-based arithmetic



	;; word:  */MOD
	;; alias: mul_div_MOD
	;; flags: DOCOL ROM
        ;;   word */MOD defined in primitives/1300_mularith.asm:9.
//dwn_mul_div_MOD:
//        .strp "*/MOD" 0
dw_mul_div_MOD_head:
        .word FFL_T_DOCOL FFL_ROM 7 ; Flags & hash
        .word dwn_mul_div_MOD   ; Pointer to word name (above)
        .word dw_UDtimes_head   ; Link to previous dictionary entry
dw_mul_div_MOD:
        CFA_doCOL()       ; Code entry point: next instruction
dw_mul_div_MOD_pfa:
	;; notes: */MOD ( n1 n2 n3 -- n4 n5 )
	;;        n1 is first multiplied by n2 producing an intermediate 32-
        ;;        bit result.  n4 is the remainder and n5 is the floor of the
        ;;        quotient of the intermediate 32-bit result divided by the
        ;;        divisor n3.  A 32-bit intermediate product is used as for */
        ;;        .  n4 has the same sign as n3 or is zero.  An error condition
        ;;        results if the divisor is zero or if the quotient falls
        ;;        outside of the range {-32,768..32,767}.
	;;
	;; code:  : */ ( n1 n2 n3 -- n4 ) /0? >R UM* R> N>D D/MOD
	;;        ABORT" division overflow" DROP -ROT DROP ;

	.word dw_div0q		; /0? ( n1 n2 n3 ) \ Check for division by zero

	;; ( n1 n2 n3 )
	.word dw_to_R		; >R ( n1 n2 )
	.word dw_UM_times	; UM* ( d )
	.word dw_R_from		; R> ( d n3 )
	.word dw_N_to_D		; N>d ( d d )
	.word dw_D_div_MOD	; D/MOD ( drl drh dql dqh )

	;; .word dw_zero_equals	; 0= ( drl drh dql f )
	.word dw_doABORT_str	; ABORT" division overflow"
	.word @+10
	.strp "division overflow" 0
	;;     112233445566778899

	.word dw_not_ROT	; -ROT ( dql drl drh )
	.word dw_DROP		; DROP ( dql drl )

	.word dw_EXIT



	;; word:  */
	;; alias: mul_div
	;; flags: DOCOL ROM
        ;;   word */ defined in primitives/1300_mularith.asm:46.
//dwn_mul_div:
//        .strp "*/" 0
dw_mul_div_head:
        .word FFL_T_DOCOL FFL_ROM 0 ; Flags & hash
        .word dwn_mul_div       ; Pointer to word name (above)
        .word dw_mul_div_MOD_head ; Link to previous dictionary entry
dw_mul_div:
        CFA_doCOL()       ; Code entry point: next instruction
dw_mul_div_pfa:
	;; notes: */ ( n1 n2 n3 -- n4 )
	;;        n1 is first multiplied by n2 producing an intermediate 32-
        ;;        bit result.  n4 is the floor of the quotient of the
        ;;        intermediate 32-bit result divided by the divisor n3.  The
        ;;        product of n1 times n2 is maintained as an intermediate 32-
        ;;        bit result for greater precision than the otherwise
        ;;        equivalent sequence: n1 n2 * n3 / .  An error condition
        ;;        results if the divisor is zero or if the quotient falls
        ;;        outside of the range {-32,768..32,767}.
	;;
	;; code:  : */ ( n1 n2 n3 -- n4 ) */MOD DROP ;

	.word dw_mul_div_MOD
	.word dw_DROP
	.word dw_EXIT



// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/1500_vocabularies.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// Words to manage vocabularies.
//
// This implements the search order proposal in F83, as found here:
//
// http://forth.sourceforge.net/std/fst83/fst83-c.htm



	;; word:  #CONTEXT
	;; alias: numCONTEXT
	;; flags: CONST ROM
        ;;   word #CONTEXT defined in primitives/1500_vocabularies.asm:13.
//dwn_numCONTEXT:
//        .strp "#CONTEXT" 0
dw_numCONTEXT_head:
        .word FFL_T_CONST FFL_ROM 3 ; Flags & hash
        .word dwn_numCONTEXT    ; Pointer to word name (above)
        .word dw_mul_div_head   ; Link to previous dictionary entry
dw_numCONTEXT:
        CFA_doCONST()     ; Code entry point: next instruction
dw_numCONTEXT_pfa:
	;; notes: #CONTEXT ( -- a )
	;;        The number of entries in the vocabulary stack.

	.word VSS



	;; word:  voc0
	;; flags: DOCOL ROM CFT
        ;;   word voc0 defined in primitives/1500_vocabularies.asm:22.
//dwn_voc0:
//        .strp "VOC0" 0
dw_voc0_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn_voc0          ; Pointer to word name (above)
        .word dw_numCONTEXT_head ; Link to previous dictionary entry
dw_voc0:
        CFA_doCOL()       ; Code entry point: next instruction
dw_voc0_pfa:
	;; notes: voc0 ( -- 1 a )
	;;        Return the first vocabulary on the vocab stack.
	;; code:  : voc0 ( -- 1 a ) 1 0 CONTEXT@ ;

	doLIT(1)
	doLIT(0)
	.word dw_CONTEXT_fetch
	.word dw_EXIT



	;; word:  voc+
	;; alias: voc-plus
	;; flags: DOCOL ROM CFT
        ;;   word voc+ defined in primitives/1500_vocabularies.asm:36.
//dwn_voc_plus:
//        .strp "VOC+" 0
dw_voc_plus_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn_voc_plus      ; Pointer to word name (above)
        .word dw_voc0_head      ; Link to previous dictionary entry
dw_voc_plus:
        CFA_doCOL()       ; Code entry point: next instruction
dw_voc_plus_pfa:
	;; notes: voc+ ( u -- u+1 a | false )
	;;        Return the next vocabulary in the stack. If there are no more
	;;        vocabularies on the stack, false (0) is returned. Combine
	;;        this with voc0 to loop through vocabularies.

	.word dw_DUP		; DUP ( u u )
	.word dw_pCONTEXT	; pCONTEXT ( u u a )
	.word dw_fetch		; @ ( u u vsp )
	.word dw_lt		; < ( u f )

	.word dw_if_branch	; == 0?
	.word _voc_plus_nope

	.word dw_DUP		; ( u u )
	.word dw_inc		; ( u u+1 )
	.word dw_SWAP		; ( u+1 u )
	.word dw_CONTEXT_fetch	; ( u+1 a )
	.word dw_EXIT

_voc_plus_nope:
	.word dw_DROP		; DROP ( )
	doLIT(0)		; 0 ( false )
	.word dw_EXIT



	;; word:  CONTEXT@
	;; alias: CONTEXT_fetch
	;; flags: DOCOL ROM CFT
        ;;   word CONTEXT@ defined in primitives/1500_vocabularies.asm:65.
//dwn_CONTEXT_fetch:
//        .strp "CONTEXT@" 0
dw_CONTEXT_fetch_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 3 ; Flags & hash
        .word dwn_CONTEXT_fetch ; Pointer to word name (above)
        .word dw_voc_plus_head  ; Link to previous dictionary entry
dw_CONTEXT_fetch:
        CFA_doCOL()       ; Code entry point: next instruction
dw_CONTEXT_fetch_pfa:
	;; notes: CONTEXT@ ( u -- a )
	;;        Get the u-th (from the top) entry in the vocabulary stack.
	;;        The value returned is the address of a variable holding
	;;        the address of the last entry in that dictionary. It's also
	;;        the PFA of the vocabulary word.
	;; code:  : CONTEXT@ ( u -- a ) pCONTEXT @ 1- SWAP - CONTEXT + @ ;

	.word dw_pCONTEXT	; pCONTEXT ( u a )
	.word dw_fetch		; @ ( u u )
	.word dw_dec		; 1- ( u )
	.word dw_SWAP		; SWAP ( u u )
	.word dw_sub		; - ( u )
	.word dw_CONTEXT	; CONTEXT ( u a )
	.word dw_add		; + ( a+u )
	.word dw_fetch		; @ ( a )
	.word dw_EXIT



	;; word:  CONTEXT!
	;; alias: CONTEXT_store
	;; flags: DOCOL ROM CFT
        ;;   word CONTEXT! defined in primitives/1500_vocabularies.asm:87.
//dwn_CONTEXT_store:
//        .strp "CONTEXT!" 0
dw_CONTEXT_store_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 3 ; Flags & hash
        .word dwn_CONTEXT_store ; Pointer to word name (above)
        .word dw_CONTEXT_fetch_head ; Link to previous dictionary entry
dw_CONTEXT_store:
        CFA_doCOL()       ; Code entry point: next instruction
dw_CONTEXT_store_pfa:
	;; notes: CONTEXT! ( a u -- a )
	;;        Store vocabulary address a at position u in the
	;;        vocabulary stack.
	;; code:  : CONTEXT! ( a u -- a ) ;

	.word dw_pCONTEXT	; pCONTEXT ( a u a )
	.word dw_fetch		; @ ( a u u )
	.word dw_dec		; 1- ( a u )
	.word dw_SWAP		; SWAP ( a u u )
	.word dw_sub		; - ( a u )
	.word dw_CONTEXT	; CONTEXT ( a u a )
	.word dw_add		; + ( a a+u )
	.word dw_store		; ! ( )
	.word dw_EXIT



	;; word:  DEFINITIONS
	;; flags: DOCOL ROM
        ;;   word DEFINITIONS defined in primitives/1500_vocabularies.asm:106.
//dwn_DEFINITIONS:
//        .strp "DEFINITIONS" 0
dw_DEFINITIONS_head:
        .word FFL_T_DOCOL FFL_ROM 7 ; Flags & hash
        .word dwn_DEFINITIONS   ; Pointer to word name (above)
        .word dw_CONTEXT_store_head ; Link to previous dictionary entry
dw_DEFINITIONS:
        CFA_doCOL()       ; Code entry point: next instruction
dw_DEFINITIONS_pfa:
	;; notes: DEFINITIONS ( -- )
	;;        The top of the vocabulary stack becomes the CURRENT
	;;        vocabulary (where new definitions are added to).
	;; code:  : DEFINITIONS ( -- ) 0 CONTEXT@ CURRENT ! ;

	doLIT(0)
	.word dw_CONTEXT_fetch	; CONTEXT@
	.word dw_CURRENT	; CURRENT
	.word dw_store		; !
	.word dw_EXIT



	;; word:  CURRENT@
	;; alias: CURRENT_fetch
	;; flags: DOCOL ROM CFT
        ;;   word CURRENT@ defined in primitives/1500_vocabularies.asm:122.
//dwn_CURRENT_fetch:
//        .strp "CURRENT@" 0
dw_CURRENT_fetch_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 3 ; Flags & hash
        .word dwn_CURRENT_fetch ; Pointer to word name (above)
        .word dw_DEFINITIONS_head ; Link to previous dictionary entry
dw_CURRENT_fetch:
        CFA_doCOL()       ; Code entry point: next instruction
dw_CURRENT_fetch_pfa:
	;; notes: CURRENT@ ( -- a )
	;;        The address of the dictionary to add new definitions to.
	;;        In the process of compiling a new word, LAST will become
	;;        the link in the new dictionary entry, then get updated
	;;        to point to the new dictionary entry itself.
	;; code:  : LAST ( -- a ) CURRENT @ ;

	.word dw_CURRENT	; CURRENT
	.word dw_fetch		; @
	.word dw_EXIT



	;; word:  ALSO
	;; flags: DOCOL ROM
        ;;   word ALSO defined in primitives/1500_vocabularies.asm:137.
//dwn_ALSO:
//        .strp "ALSO" 0
dw_ALSO_head:
        .word FFL_T_DOCOL FFL_ROM 5 ; Flags & hash
        .word dwn_ALSO          ; Pointer to word name (above)
        .word dw_CURRENT_fetch_head ; Link to previous dictionary entry
dw_ALSO:
        CFA_doCOL()       ; Code entry point: next instruction
dw_ALSO_pfa:
	;; notes: ALSO ( -- )
	;;        Duplicate the vocabulary at the top of the stack. This
	;;        allows the 'FORTH ALSO X' idiom, which ends up with
	;;        FORTH X as the top two entries in the vocabulary stack.
	;;        An error is raised if the vocabulary stack runs out of
	;;        space.

	;; pCONTEXT @ 0 #CONTEXT 1- WITHIN NOT ABORT" vocab stack" \ stack ok?
	.word dw_pCONTEXT	; pCONTEXT ( a )
	.word dw_fetch		; @ ( u )
	doLIT(0)		; 0 ( u 0 )
	.word dw_numCONTEXT	; #CONTEXT ( u 0 VSS )
	.word dw_dec		; 1- ( u 0 VSS-1 )
	.word dw_WITHIN		; WITHIN ( f )
	.word dw_NOT		; NOT ( f )
	.word dw_doABORT_str	; doABORT"
	.word @+7
	.strp "vocab stack" 0

	;; 0 CONTEXT@ \ Get the top entry of the stack
	doLIT(0)
	.word dw_CONTEXT_fetch	; CONTEXT@ ( va )

	;; pCONTEXT @ 1+ pCONTEXT ! \ Increment the stack pointer
	.word dw_pCONTEXT	; pCONTEXT ( va a )
	.word dw_fetch		; @ ( va u )
	.word dw_inc		; 1+ ( va u+1 )
	.word dw_pCONTEXT	; pCONTEXT ( va u+1 a )
	.word dw_store		; ! ( va )

	;; 0 CONTEXT! \ Store the previous value at the new location.
	doLIT(0)		; 0 ( va 0 )
	.word dw_CONTEXT_store	; CONTEXT! ( )

	.word dw_EXIT



	;; word:  #WORDS
	;; alias: countwords
	;; flags: DOCOL ROM CFT
        ;;   word #WORDS defined in primitives/1500_vocabularies.asm:178.
//dwn_countwords:
//        .strp "#WORDS" 0
dw_countwords_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 5 ; Flags & hash
        .word dwn_countwords    ; Pointer to word name (above)
        .word dw_ALSO_head      ; Link to previous dictionary entry
dw_countwords:
        CFA_doCOL()       ; Code entry point: next instruction
dw_countwords_pfa:
	;; notes: #WORDS ( -- n )
	;;        Returns the number of words in the CURRENT vocabulary.

 	doLIT(0)		; 0 ( u ) \ u = counter
	doLIT(0)		; 0 ( u 0 )
	.word dw_CONTEXT_fetch	; CONTEXT@ ( u va )

_countwords_loop:
	.word dw_fetch		; @ ( u a' )
	.word dw_DUP		; @ ( u a' a' )
 	.word dw_if_branch	; ?branch ( u a' )
	.word _countwords_end	;
	.word dw_inc2		; 2+ ( u a'+2 ) \ start + 2: link ptr

	.word dw_SWAP		; SWAP ( a'+2 u )
	.word dw_inc		; 1+ ( a'+2 u+1 )
	.word dw_SWAP		; SWAP ( u+1 a'+2 )

 	;; Link to the next word
	.word dw_branch		; branch
	.word _countwords_loop

_countwords_end:
	.word dw_DROP		; DROP ( u )
	.word dw_EXIT



// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/2000_ttyio.asm
//
///////////////////////////////////////////////////////////////////////////////


;; // -*- asm -*-
;; //
;; // Astract mid-level I/O words.



	;; word:  CR
	;; flags: DOCOL ROM
        ;;   word CR defined in primitives/2000_ttyio.asm:8.
//dwn_CR:
//        .strp "CR" 0
dw_CR_head:
        .word FFL_T_DOCOL FFL_ROM 1 ; Flags & hash
        .word dwn_CR            ; Pointer to word name (above)
        .word dw_countwords_head ; Link to previous dictionary entry
dw_CR:
        CFA_doCOL()       ; Code entry point: next instruction
dw_CR_pfa:
	;; notes: CR ( -- )
	;;        EMIT a carriage return.
	;; code:  : CR ( -- ) 10 EMIT ;
	doLIT(10)
	.word dw_EMIT
	.word dw_EXIT



	;; word:  SPACE
	;; flags: DOCOL ROM
        ;;   word SPACE defined in primitives/2000_ttyio.asm:19.
//dwn_SPACE:
//        .strp "SPACE" 0
dw_SPACE_head:
        .word FFL_T_DOCOL FFL_ROM 6 ; Flags & hash
        .word dwn_SPACE         ; Pointer to word name (above)
        .word dw_CR_head        ; Link to previous dictionary entry
dw_SPACE:
        CFA_doCOL()       ; Code entry point: next instruction
dw_SPACE_pfa:
	;; notes: SPACE ( -- )
	;;        EMIT a carriage return.
	;; code:  : CR ( -- ) BL EMIT ;
	.word dw_BL
	.word dw_EMIT
	.word dw_EXIT



	;; word:  SPACES
	;; flags: CODE ROM
        ;;   word SPACES defined in primitives/2000_ttyio.asm:30.
//dwn_SPACES:
//        .strp "SPACES" 0
dw_SPACES_head:
        .word FFL_T_CODE FFL_ROM 5 ; Flags & hash
        .word dwn_SPACES        ; Pointer to word name (above)
        .word dw_SPACE_head     ; Link to previous dictionary entry
dw_SPACES:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_SPACES_pfa:
	;; notes: SPACES ( n -- )
	;;   EMITs n SPACEs.
	;;   TODO: Use 'EMIT
	;;   TODO: Define in terms of SPACE
	POP SP
	NEG
	STORE TMP9
	SNZ
	NEXT
_SPACES_loop:
	FORTH(dw_SPACE)
	ISZ TMP9
	JMP _SPACES_loop
	NEXT



	;; word:  ZEROES
	;; flags: CODE ROM
        ;;   word ZEROES defined in primitives/2000_ttyio.asm:49.
//dwn_ZEROES:
//        .strp "ZEROES" 0
dw_ZEROES_head:
        .word FFL_T_CODE FFL_ROM 4 ; Flags & hash
        .word dwn_ZEROES        ; Pointer to word name (above)
        .word dw_SPACES_head    ; Link to previous dictionary entry
dw_ZEROES:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_ZEROES_pfa:
	;; notes: ZEROES ( n -- )
	;;   EMITs n '0'.
	;;   TODO: Use 'EMIT
	;;   TODO: Define in terms of SPACE

	POP SP
	NEG
	STORE TMP9
	SNZ
	NEXT
_ZEROES_loop:
	PUTC(48)
	ISZ TMP9
	JMP _ZEROES_loop
	NEXT



	;; word:  TYPE
	;; flags: CODE ROM
        ;;   word TYPE defined in primitives/2000_ttyio.asm:69.
//dwn_TYPE:
//        .strp "TYPE" 0
dw_TYPE_head:
        .word FFL_T_CODE FFL_ROM 0 ; Flags & hash
        .word dwn_TYPE          ; Pointer to word name (above)
        .word dw_ZEROES_head    ; Link to previous dictionary entry
dw_TYPE:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_TYPE_pfa:
	;; notes: TYPE ( addr +n -- )
	;;   Print out n characters starting at address addr. Characters are
	;;   expected to be in the unpacked form (one character per cell).

	DEBUGON
	DUMP
	POP SP
	SNZ			; Sanity check
	FAIL
	//JMP _TYPE_end

	NEG
	STORE TMP9		; Save the negated count for looping
	PRINTH
	POP SP
	STORE I0		; Save the address

_TYPE_loop:
	//DUMP
	LOAD I I0		; Load character (autoincrement)

	;; Be 8-bit clean, output all 8 bits (well, all 16, but UARTs
	;; are 8-bit devices).
	//AND PLUS127		; This is EMIT.
	PUSH SP
	FORTH(dw_EMIT)

	ISZ TMP9		; Loop.
	PRINTA
	JMP _TYPE_loop

_TYPE_end:
	DEBUGOFF
	NEXT


	;; word:  type0
	;; flags: CODE ROM CFT
        ;;   word type0 defined in primitives/2000_ttyio.asm:107.
//dwn_type0:
//        .strp "TYPE0" 0
dw_type0_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 1 ; Flags & hash
        .word dwn_type0         ; Pointer to word name (above)
        .word dw_TYPE_head      ; Link to previous dictionary entry
dw_type0:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_type0_pfa:
	;; notes: type0 ( addr -- )
	;;   Print out null-terminated string starting at address addr.
	;;   Characters are expected to be in the unpacked form (one
	;;   character per cell).
	;;   TODO: Use 'EMIT

	POP SP
	STORE I0		; Save the address

_TYPE0_loop:
	LOAD I I0		; Load character (autoincrement)

	SNZ
	JMP _TYPE0_end

	;; Be 8-bit clean, output all 8 bits (well, all 16, but UARTs
	;; are 8-bit devices).
	//AND PLUS127		; This is EMIT.
	PUSH SP
	FORTH(dw_EMIT)

	JMP _TYPE0_loop

_TYPE0_end:
	NEXT


	;; word:  typep0
	;; flags: CODE ROM CFT
        ;;   word typep0 defined in primitives/2000_ttyio.asm:136.
//dwn_typep0:
//        .strp "TYPEP0" 0
dw_typep0_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn_typep0        ; Pointer to word name (above)
        .word dw_type0_head     ; Link to previous dictionary entry
dw_typep0:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_typep0_pfa:
	;; notes: typep0 ( a -- )
	;;        Prints out the packed, null-terminated string starting at a.

	POP SP
	STORE I0		; address

_typep0_loop:
	LOAD I I0		; Read characters
        SNZ			; Done?
        NEXT			; Yes
	STORE TMP9		; No.
	GETLOCHAR()
	PUSH SP
	FORTH(dw_EMIT)

	LOAD TMP9
	GETHICHAR()
	SNZ			; Are we done now?
	NEXT			; Yes
	PUSH SP
	FORTH(dw_EMIT)

	JMP _typep0_loop	; Loop again



	;; word:  TYPEp
	;; flags: CODE ROM CFT
        ;;   word TYPEp defined in primitives/2000_ttyio.asm:164.
//dwn_TYPEp:
//        .strp "TYPEP" 0
dw_TYPEp_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 1 ; Flags & hash
        .word dwn_TYPEp         ; Pointer to word name (above)
        .word dw_typep0_head    ; Link to previous dictionary entry
dw_TYPEp:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_TYPEp_pfa:
	;; notes: TYPEp ( a n -- )
	;;        Prints out the first n characters of the packed string
	;;        starting at a. If the string is shorter than n characters,
	;;        the entire string is printed.

	POP SP
	ING
	STORE TMP9
	POP SP
	STORE I0		; address

_TYPEp_loop:
	ISZ TMP9		; Reached count limit?
	JMP @+2
	NEXT

	LOAD I I0		; Read characters
        SNZ			; Done?
        NEXT			; Yes
	STORE TMP8		; No.
	GETLOCHAR()
	PUSH SP
	FORTH(dw_EMIT)

	ISZ TMP9		; Reached count limit?
	JMP @+2
	NEXT

	LOAD TMP8
	GETHICHAR()
	SNZ			; Are we done now?
	NEXT			; Yes
	PUSH SP
	FORTH(dw_EMIT)

	JMP _TYPEp_loop		; Loop again



	;; word:  NUF?
	;; alias: NUF_if
	;; flags: DOCOL ROM
        ;;   word NUF? defined in primitives/2000_ttyio.asm:206.
//dwn_NUF_if:
//        .strp "NUF?" 0
dw_NUF_if_head:
        .word FFL_T_DOCOL FFL_ROM 2 ; Flags & hash
        .word dwn_NUF_if        ; Pointer to word name (above)
        .word dw_TYPEp_head     ; Link to previous dictionary entry
dw_NUF_if:
        CFA_doCOL()       ; Code entry point: next instruction
dw_NUF_if_pfa:
	;; notes: NUF? ( -- f )
	;;   Similar to the eForth NUF? word. If a key is waiting in the input
	;;   buffer, wait for another key. If that key is CR (actually, any
	;;   ASCII control char), return true. Else return false.

	.word dw_rx_q		; RX? ( -- f )
	.word dw_if_branch	; ?branch ( )
	.word _nuf_false	;   FALSE + EXIT

	.word dw_rx		; RX ( c ) \ read first char
	.word dw_DROP		; DROP ( ) \ drop it
	.word dw_rx		; RX ( c c ) \ receive another char
	.word dw_doLIT		; 10 (\n)
	.word 32
	.word dw_geq		; >=

	.word dw_if_branch	; ?branch
	.word _nuf_true

_nuf_false:
	.word dw_FALSE		; FALSE
	.word dw_EXIT		; EXIT
_nuf_true:
	.word dw_TRUE		; TRUE
	.word dw_EXIT		; EXIT


	;; word:  UEMIT
	;; flags: CODE ROM
        ;;   word UEMIT defined in primitives/2000_ttyio.asm:235.
//dwn_UEMIT:
//        .strp "UEMIT" 0
dw_UEMIT_head:
        .word FFL_T_CODE FFL_ROM 0 ; Flags & hash
        .word dwn_UEMIT         ; Pointer to word name (above)
        .word dw_NUF_if_head    ; Link to previous dictionary entry
dw_UEMIT:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_UEMIT_pfa:
	;; notes: UEMIT ( w -- )
	;;   Prints out c in UTF-8 encoding. All 16 bits of w are used and
	;;   encoded accordingly. Only the first 65,536 UCS codepoints may
	;;   be output, and they are encoded as one, two or three byte
	;;   sequences.
	;;   TODO: Use 'EMIT
	RPOP(TMP9, SP)		; TMP9 := w
	LOAD _uemitd
	AND TMP9
	SNZ
	JMP _uemit1b		; c & 0xff80 == 0 <==> single byte

	LOAD @_uemitd+1		; check for >2 bytes
	AND TMP9
	SNZ
	JMP _uemit2b		; c & 0xf800 == 0 <==> two-byte

	;; Three-byte sequence.
_uemit3b:
	;; first char, highest 4 bits.
	LOAD TMP9
	RNR			; >> 12
	RNR
	RNR
	STORE TMP2
	LI &f
	AND TMP2		; & 0x0f
	STORE TMP2
	LI &e0			; | 0xe0
	OR TMP2
	PUSH SP
	FORTH(dw_EMIT)

	;; second char, middle 6 bits.
	LOAD TMP9
	RNR			; >> 6
	RBR
	RBR
	STORE TMP2
	LI &3f			; & 0x3f
	AND TMP2
	STORE TMP2
	LI &80			; | 0x80
	OR TMP2
	PUSH(SP)
	FORTH(dw_EMIT)

	;; third char, low 6 bits.
	LI &3f			; & 0x3f
	AND TMP9
	STORE TMP2
	LI &80			; | 0x80
	OR TMP2
	PUSH SP
	FORTH(dw_EMIT)

	NEXT

	;; Two-byte sequence.
_uemit2b:
	;; first char, high 5 bits
	LOAD TMP9
	RNR			; >> 6
	RBR
	RBR
	STORE TMP2
	LI &1f			; & 0x1f (5 bits)
	AND TMP2
	STORE TMP2
	LI &c0			; | 0xc0
	OR TMP2
	PUSH(SP)
	FORTH(dw_EMIT)

	;; second char, low 6 bits.
	LI &3f			; & 0x3f (6 bits)
	AND TMP9
	STORE TMP2
	LI &80			; | 0x80
	OR TMP2
	PUSH(SP)
	FORTH(dw_EMIT)

	NEXT

	;; Single-byte sequence.
_uemit1b:
	LOAD TMP9
	PUSH SP
	FORTH(dw_EMIT)
	NEXT

_uemitd:
	.word &ff80		; Mask for >1 byte per char
	.word &f800		; >2 bytes per char



// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/2000_variables.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// Variables.



	;; word:  SYSCFG
	;; flags: CODE ROM CFT
        ;;   word SYSCFG defined in primitives/2000_variables.asm:8.
//dwn_SYSCFG:
//        .strp "SYSCFG" 0
dw_SYSCFG_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 5 ; Flags & hash
        .word dwn_SYSCFG        ; Pointer to word name (above)
        .word dw_UEMIT_head     ; Link to previous dictionary entry
dw_SYSCFG:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_SYSCFG_pfa:
	;; notes: SYSCFG ( -- u )
	;;        The system configuration value.

	LOAD SYSCFG
	PUSH SP
	NEXT



	;; word:  SYSMEM
	;; flags: CODE ROM CFT
        ;;   word SYSMEM defined in primitives/2000_variables.asm:19.
//dwn_SYSMEM:
//        .strp "SYSMEM" 0
dw_SYSMEM_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 5 ; Flags & hash
        .word dwn_SYSMEM        ; Pointer to word name (above)
        .word dw_SYSCFG_head    ; Link to previous dictionary entry
dw_SYSMEM:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_SYSMEM_pfa:
	;; notes: SYSMEM ( -- u1 u2 )
	;;        Returns the amount of installed ROM (in u1) and the amount of
        ;;        installed RAM (in u2). Both are expressed in units of 8kW
        ;;        blocks.

	LOAD SYSMEM
	GETLOCHAR()
	PUSH(SP)

	LOAD SYSMEM
	GETHICHAR()
	PUSH(SP)
	NEXT



	;; word:  UP@
	;; alias: UP_fetch
	;; flags: CODE ROM
        ;;   word UP@ defined in primitives/2000_variables.asm:38.
//dwn_UP_fetch:
//        .strp "UP@" 0
dw_UP_fetch_head:
        .word FFL_T_CODE FFL_ROM 6 ; Flags & hash
        .word dwn_UP_fetch      ; Pointer to word name (above)
        .word dw_SYSMEM_head    ; Link to previous dictionary entry
dw_UP_fetch:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_UP_fetch_pfa:
	;; notes: UP@ ( -- a )
	;;        The base address of the user area.

	RPUSH(SP, UP)
	NEXT



	;; word:  SP0
	;; flags: USER ROM
        ;;   word SP0 defined in primitives/2000_variables.asm:48.
//dwn_SP0:
//        .strp "SP0" 0
dw_SP0_head:
        .word FFL_T_USER FFL_ROM 0 ; Flags & hash
        .word dwn_SP0           ; Pointer to word name (above)
        .word dw_UP_fetch_head  ; Link to previous dictionary entry
dw_SP0:
        CFA_doUSER()      ; Code entry point: next instruction
dw_SP0_pfa:
	;; notes: SP0 ( -- a )
	;;        The base address of the data stack.

	.word 	UAOFS_SP0



	;; word:  RP0
	;; flags: USER ROM
        ;;   word RP0 defined in primitives/2000_variables.asm:57.
//dwn_RP0:
//        .strp "RP0" 0
dw_RP0_head:
        .word FFL_T_USER FFL_ROM 1 ; Flags & hash
        .word dwn_RP0           ; Pointer to word name (above)
        .word dw_SP0_head       ; Link to previous dictionary entry
dw_RP0:
        CFA_doUSER()      ; Code entry point: next instruction
dw_RP0_pfa:
	;; notes: RP0 ( -- a )
	;;        The base address of the return stack.

	.word 	UAOFS_RP0



	;; word:  STATE
	;; flags: USER ROM
        ;;   word STATE defined in primitives/2000_variables.asm:66.
//dwn_STATE:
//        .strp "STATE" 0
dw_STATE_head:
        .word FFL_T_USER FFL_ROM 6 ; Flags & hash
        .word dwn_STATE         ; Pointer to word name (above)
        .word dw_RP0_head       ; Link to previous dictionary entry
dw_STATE:
        CFA_doUSER()      ; Code entry point: next instruction
dw_STATE_pfa:
	;; notes: STATE ( -- a )
	;;        The address of the STATE variable, the Forth language state.
	;;        If STATE @ is zero, we are interpreting. Otherwise, we're
	;;        compiling. User programs may not change this variable
	;;        directly.

	.word	UAOFS_STATE



	;; word:  BASE
	;; flags: USER ROM
        ;;   word BASE defined in primitives/2000_variables.asm:78.
//dwn_BASE:
//        .strp "BASE" 0
dw_BASE_head:
        .word FFL_T_USER FFL_ROM 6 ; Flags & hash
        .word dwn_BASE          ; Pointer to word name (above)
        .word dw_STATE_head     ; Link to previous dictionary entry
dw_BASE:
        CFA_doUSER()      ; Code entry point: next instruction
dw_BASE_pfa:
	;; notes: BASE ( -- a )
	;;        The address of the BASE variable, which defines the current
	;;        number base.

	.word	UAOFS_BASE



	;; word:  BASE>R
	;; alias: BASE_to_R
	;; flags: CODE ROM CFT
        ;;   word BASE>R defined in primitives/2000_variables.asm:89.
//dwn_BASE_to_R:
//        .strp "BASE>R" 0
dw_BASE_to_R_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 4 ; Flags & hash
        .word dwn_BASE_to_R     ; Pointer to word name (above)
        .word dw_BASE_head      ; Link to previous dictionary entry
dw_BASE_to_R:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_BASE_to_R_pfa:
	;; notes: BASE>R ( -- )
	;;        Pushes the value of BASE onto the return stack.

	LOADUP(UAOFS_BASE)
	PUSH RP
	NEXT



	;; word:  R>BASE
	;; alias: R_to_BASE
	;; flags: CODE ROM CFT
        ;;   word R>BASE defined in primitives/2000_variables.asm:101.
//dwn_R_to_BASE:
//        .strp "R>BASE" 0
dw_R_to_BASE_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 4 ; Flags & hash
        .word dwn_R_to_BASE     ; Pointer to word name (above)
        .word dw_BASE_to_R_head ; Link to previous dictionary entry
dw_R_to_BASE:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_R_to_BASE_pfa:
	;; notes: R>BASE ( -- )
	;;        Pops a value from the return stack and stores it in BASE.

	RPOP(TMP1, RP)
	STOREUP(UAOFS_BASE, TMP1)
	NEXT



	;; word:  #TIB
	;; alias: cTIB
	;; flags: USER ROM
        ;;   word #TIB defined in primitives/2000_variables.asm:113.
//dwn_cTIB:
//        .strp "#TIB" 0
dw_cTIB_head:
        .word FFL_T_USER FFL_ROM 7 ; Flags & hash
        .word dwn_cTIB          ; Pointer to word name (above)
        .word dw_R_to_BASE_head ; Link to previous dictionary entry
dw_cTIB:
        CFA_doUSER()      ; Code entry point: next instruction
dw_cTIB_pfa:
	;; notes: #TIB ( -- n )
	;;        Return the address of the variable holding the number of
	;;        characters in the Terminal Input Buffer.

	.word UAOFS_cTIB



	;; word:  TIB
	;; flags: USER ROM
        ;;   word TIB defined in primitives/2000_variables.asm:123.
//dwn_TIB:
//        .strp "TIB" 0
dw_TIB_head:
        .word FFL_T_USER FFL_ROM 7 ; Flags & hash
        .word dwn_TIB           ; Pointer to word name (above)
        .word dw_cTIB_head      ; Link to previous dictionary entry
dw_TIB:
        CFA_doUSER()      ; Code entry point: next instruction
dw_TIB_pfa:
	;; notes: TIB ( -- a )
	;;   Return the address of the first character in the Terminal Input
	;;   Buffer.

	.word UAOFS_TIB



	;; word:  TIBADDR
	;; flags: CONST ROM
        ;;   word TIBADDR defined in primitives/2000_variables.asm:133.
//dwn_TIBADDR:
//        .strp "TIBADDR" 0
dw_TIBADDR_head:
        .word FFL_T_CONST FFL_ROM 3 ; Flags & hash
        .word dwn_TIBADDR       ; Pointer to word name (above)
        .word dw_TIB_head       ; Link to previous dictionary entry
dw_TIBADDR:
        CFA_doCONST()     ; Code entry point: next instruction
dw_TIBADDR_pfa:
	;; notes: TIBADDR ( -- a )
	;;        The default, boot-time address of the terminal input buffer.

	.word TIBADDR



	;; word:  TIBS
	;; flags: CONST ROM
        ;;   word TIBS defined in primitives/2000_variables.asm:142.
//dwn_TIBS:
//        .strp "TIBS" 0
dw_TIBS_head:
        .word FFL_T_CONST FFL_ROM 0 ; Flags & hash
        .word dwn_TIBS          ; Pointer to word name (above)
        .word dw_TIBADDR_head   ; Link to previous dictionary entry
dw_TIBS:
        CFA_doCONST()     ; Code entry point: next instruction
dw_TIBS_pfa:
	;; notes: TIBS ( -- a )
	;;        The defualt, boot-time size of the TIB.

	.word TIBS



	;; word:  >IN
	;; alias: ofsIN
	;; flags: USER ROM
        ;;   word >IN defined in primitives/2000_variables.asm:152.
//dwn_ofsIN:
//        .strp ">IN" 0
dw_ofsIN_head:
        .word FFL_T_USER FFL_ROM 5 ; Flags & hash
        .word dwn_ofsIN         ; Pointer to word name (above)
        .word dw_TIBS_head      ; Link to previous dictionary entry
dw_ofsIN:
        CFA_doUSER()      ; Code entry point: next instruction
dw_ofsIN_pfa:
	;; notes: >IN ( -- a )
	;;        The address of the offset into the current input stream.

	.word UAOFS_ofsIN



	;; word:  SPAN
	;; flags: USER ROM
        ;;   word SPAN defined in primitives/2000_variables.asm:161.
//dwn_SPAN:
//        .strp "SPAN" 0
dw_SPAN_head:
        .word FFL_T_USER FFL_ROM 7 ; Flags & hash
        .word dwn_SPAN          ; Pointer to word name (above)
        .word dw_ofsIN_head     ; Link to previous dictionary entry
dw_SPAN:
        CFA_doUSER()      ; Code entry point: next instruction
dw_SPAN_pfa:
	;; notes: SPAN ( -- a )
	;;        Returns the address of the SPAN variable.

	.word	UAOFS_SPAN



	;; word:  BLK
	;; flags: USER ROM
        ;;   word BLK defined in primitives/2000_variables.asm:170.
//dwn_BLK:
//        .strp "BLK" 0
dw_BLK_head:
        .word FFL_T_USER FFL_ROM 1 ; Flags & hash
        .word dwn_BLK           ; Pointer to word name (above)
        .word dw_SPAN_head      ; Link to previous dictionary entry
dw_BLK:
        CFA_doUSER()      ; Code entry point: next instruction
dw_BLK_pfa:
	;; notes: BLK ( -- a )
	;;        Returns the address of the block number currently being
        ;;        interpreted. If 0, input is from the terminal.

	.word	UAOFS_BLK



	;; word:  >BLK
	;; alias: pBLK
	;; flags: USER ROM CFT
        ;;   word >BLK defined in primitives/2000_variables.asm:181.
//dwn_pBLK:
//        .strp ">BLK" 0
dw_pBLK_head:
        .word FFL_T_USER FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn_pBLK          ; Pointer to word name (above)
        .word dw_BLK_head       ; Link to previous dictionary entry
dw_pBLK:
        CFA_doUSER()      ; Code entry point: next instruction
dw_pBLK_pfa:
	;; notes: >BLK ( -- a )
	;;        Returns the address of a pointer into the current block being
        ;;        interpreted.

	.word	UAOFS_pBLK



	;; word:  #BLK
	;; alias: cBLK
	;; flags: USER ROM CFT
        ;;   word #BLK defined in primitives/2000_variables.asm:192.
//dwn_cBLK:
//        .strp "#BLK" 0
dw_cBLK_head:
        .word FFL_T_USER FFL_ROM FFL_CFT 7 ; Flags & hash
        .word dwn_cBLK          ; Pointer to word name (above)
        .word dw_pBLK_head      ; Link to previous dictionary entry
dw_cBLK:
        CFA_doUSER()      ; Code entry point: next instruction
dw_cBLK_pfa:
	;; notes: #BLK ( -- +n )
	;;        Returns the length of the last block (after trimming for trainling junk).

	.word	UAOFS_cBLK



	;; word:  BLKBUF
	;; flags: USER ROM CFT
        ;;   word BLKBUF defined in primitives/2000_variables.asm:201.
//dwn_BLKBUF:
//        .strp "BLKBUF" 0
dw_BLKBUF_head:
        .word FFL_T_USER FFL_ROM FFL_CFT 4 ; Flags & hash
        .word dwn_BLKBUF        ; Pointer to word name (above)
        .word dw_cBLK_head      ; Link to previous dictionary entry
dw_BLKBUF:
        CFA_doUSER()      ; Code entry point: next instruction
dw_BLKBUF_pfa:
	;; notes: BLKBUF ( -- a )
	;;        Returns the address of a pointer to the current block buffer.

	.word	UAOFS_BLKBUF



	;; word:  BLKBUF0
	;; flags: USER ROM CFT
        ;;   word BLKBUF0 defined in primitives/2000_variables.asm:210.
//dwn_BLKBUF0:
//        .strp "BLKBUF0" 0
dw_BLKBUF0_head:
        .word FFL_T_USER FFL_ROM FFL_CFT 5 ; Flags & hash
        .word dwn_BLKBUF0       ; Pointer to word name (above)
        .word dw_BLKBUF_head    ; Link to previous dictionary entry
dw_BLKBUF0:
        CFA_doUSER()      ; Code entry point: next instruction
dw_BLKBUF0_pfa:
	;; notes: BLKBUF0 ( -- a )
	;;        Returns the address of a pointer to the first block buffer.

	.word	UAOFS_BLKBUF0



	;; word:  BLKBUF1
	;; flags: USER ROM CFT
        ;;   word BLKBUF1 defined in primitives/2000_variables.asm:219.
//dwn_BLKBUF1:
//        .strp "BLKBUF1" 0
dw_BLKBUF1_head:
        .word FFL_T_USER FFL_ROM FFL_CFT 5 ; Flags & hash
        .word dwn_BLKBUF1       ; Pointer to word name (above)
        .word dw_BLKBUF0_head   ; Link to previous dictionary entry
dw_BLKBUF1:
        CFA_doUSER()      ; Code entry point: next instruction
dw_BLKBUF1_pfa:
	;; notes: BLKBUF1 ( -- a )
	;;        Returns the address of a pointer to the first block buffer.

	.word	UAOFS_BLKBUF1



	;; word:  BLKBS
	;; flags: CONST ROM CFT
        ;;   word BLKBS defined in primitives/2000_variables.asm:228.
//dwn_BLKBS:
//        .strp "BLKBS" 0
dw_BLKBS_head:
        .word FFL_T_CONST FFL_ROM FFL_CFT 7 ; Flags & hash
        .word dwn_BLKBS         ; Pointer to word name (above)
        .word dw_BLKBUF1_head   ; Link to previous dictionary entry
dw_BLKBS:
        CFA_doCONST()     ; Code entry point: next instruction
dw_BLKBS_pfa:
	;; notes: BLKBS ( -- +n )
	;;        Returns the block buffer size.

	.word	BLKBS



	;; word:  >LINE
	;; alias: pLINE
	;; flags: USER ROM CFT
        ;;   word >LINE defined in primitives/2000_variables.asm:238.
//dwn_pLINE:
//        .strp ">LINE" 0
dw_pLINE_head:
        .word FFL_T_USER FFL_ROM FFL_CFT 3 ; Flags & hash
        .word dwn_pLINE         ; Pointer to word name (above)
        .word dw_BLKBS_head     ; Link to previous dictionary entry
dw_pLINE:
        CFA_doUSER()      ; Code entry point: next instruction
dw_pLINE_pfa:
	;; notes: >LINE ( -- a )
	;;        Returns the address of the offset of the current line into the current block.

	.word	UAOFS_pLINE



	;; word:  #LINE
	;; alias: cLINE
	;; flags: USER ROM CFT
        ;;   word #LINE defined in primitives/2000_variables.asm:248.
//dwn_cLINE:
//        .strp "#LINE" 0
dw_cLINE_head:
        .word FFL_T_USER FFL_ROM FFL_CFT 6 ; Flags & hash
        .word dwn_cLINE         ; Pointer to word name (above)
        .word dw_pLINE_head     ; Link to previous dictionary entry
dw_cLINE:
        CFA_doUSER()      ; Code entry point: next instruction
dw_cLINE_pfa:
	;; notes: #LINE ( -- +n )
	;;        Returns the length of the last line parsed from the block buffer.

	.word	UAOFS_cLINE



	;; word:  HLD
	;; flags: USER ROM
        ;;   word HLD defined in primitives/2000_variables.asm:257.
//dwn_HLD:
//        .strp "HLD" 0
dw_HLD_head:
        .word FFL_T_USER FFL_ROM 3 ; Flags & hash
        .word dwn_HLD           ; Pointer to word name (above)
        .word dw_cLINE_head     ; Link to previous dictionary entry
dw_HLD:
        CFA_doUSER()      ; Code entry point: next instruction
dw_HLD_pfa:
	;; notes: HLD ( -- a )
	;;        Returns the address of the HLD pointer.

	.word	UAOFS_HLD



	;; word:  CURRENT
	;; flags: USER ROM
        ;;   word CURRENT defined in primitives/2000_variables.asm:266.
//dwn_CURRENT:
//        .strp "CURRENT" 0
dw_CURRENT_head:
        .word FFL_T_USER FFL_ROM 4 ; Flags & hash
        .word dwn_CURRENT       ; Pointer to word name (above)
        .word dw_HLD_head       ; Link to previous dictionary entry
dw_CURRENT:
        CFA_doUSER()      ; Code entry point: next instruction
dw_CURRENT_pfa:
	;; notes: CURRENT ( -- a )
	;;        The address of the CURRENT variable, which points to the
	;;        vocabulary to add new words to.

	.word	UAOFS_CURRENT



	;; word:  pCONTEXT
	;; flags: USER ROM
        ;;   word pCONTEXT defined in primitives/2000_variables.asm:276.
//dwn_pCONTEXT:
//        .strp "PCONTEXT" 0
dw_pCONTEXT_head:
        .word FFL_T_USER FFL_ROM 0 ; Flags & hash
        .word dwn_pCONTEXT      ; Pointer to word name (above)
        .word dw_CURRENT_head   ; Link to previous dictionary entry
dw_pCONTEXT:
        CFA_doUSER()      ; Code entry point: next instruction
dw_pCONTEXT_pfa:
	;; notes: pCONTEXT ( -- a )
	;;        The address of the pCONTEXT variable, which holds the
	;;        vocabulary stack pointer.

	.word	UAOFS_pCONTEXT



	;; word:  CONTEXT
	;; flags: USER ROM
        ;;   word CONTEXT defined in primitives/2000_variables.asm:286.
//dwn_CONTEXT:
//        .strp "CONTEXT" 0
dw_CONTEXT_head:
        .word FFL_T_USER FFL_ROM 4 ; Flags & hash
        .word dwn_CONTEXT       ; Pointer to word name (above)
        .word dw_pCONTEXT_head  ; Link to previous dictionary entry
dw_CONTEXT:
        CFA_doUSER()      ; Code entry point: next instruction
dw_CONTEXT_pfa:
	;; notes: CONTEXT ( -- a )
	;;        The address of the CONTEXT variable, which points to the
	;;        bottom of the vocabulary stack.

	.word	UAOFS_CONTEXT



	;; word:  CSP
	;; flags: USER ROM CFT
        ;;   word CSP defined in primitives/2000_variables.asm:296.
//dwn_CSP:
//        .strp "CSP" 0
dw_CSP_head:
        .word FFL_T_USER FFL_ROM FFL_CFT 0 ; Flags & hash
        .word dwn_CSP           ; Pointer to word name (above)
        .word dw_CONTEXT_head   ; Link to previous dictionary entry
dw_CSP:
        CFA_doUSER()      ; Code entry point: next instruction
dw_CSP_pfa:
	;; notes: CONTEXT ( -- a )
	;;        The address of the CSP.

	.word	UAOFS_CSP



	;; word:  HANDLER
	;; flags: USER ROM CFT
        ;;   word HANDLER defined in primitives/2000_variables.asm:305.
//dwn_HANDLER:
//        .strp "HANDLER" 0
dw_HANDLER_head:
        .word FFL_T_USER FFL_ROM FFL_CFT 7 ; Flags & hash
        .word dwn_HANDLER       ; Pointer to word name (above)
        .word dw_CSP_head       ; Link to previous dictionary entry
dw_HANDLER:
        CFA_doUSER()      ; Code entry point: next instruction
dw_HANDLER_pfa:
	;; notes: CONTEXT ( -- a )
	;;        The address of the HANDLER.

	.word	UAOFS_HANDLER



	;; word:  DISKUNIT
	;; flags: USER ROM CFT
        ;;   word DISKUNIT defined in primitives/2000_variables.asm:314.
//dwn_DISKUNIT:
//        .strp "DISKUNIT" 0
dw_DISKUNIT_head:
        .word FFL_T_USER FFL_ROM FFL_CFT 4 ; Flags & hash
        .word dwn_DISKUNIT      ; Pointer to word name (above)
        .word dw_HANDLER_head   ; Link to previous dictionary entry
dw_DISKUNIT:
        CFA_doUSER()      ; Code entry point: next instruction
dw_DISKUNIT_pfa:
	;; notes: DISKUNIT ( -- a )
	;;        The address of the DISKUNIT variable.

	.word	UAOFS_DISKUNIT



	;; word:  ROTOR
	;; flags: USER ROM CFT
        ;;   word ROTOR defined in primitives/2000_variables.asm:323.
//dwn_ROTOR:
//        .strp "ROTOR" 0
dw_ROTOR_head:
        .word FFL_T_USER FFL_ROM FFL_CFT 7 ; Flags & hash
        .word dwn_ROTOR         ; Pointer to word name (above)
        .word dw_DISKUNIT_head  ; Link to previous dictionary entry
dw_ROTOR:
        CFA_doUSER()      ; Code entry point: next instruction
dw_ROTOR_pfa:
	;; notes: ROTOR ( -- a )
	;;        The address of the ROTOR variable.

	.word	UAOFS_ROTOR



	;; word:  'EMIT
	;; alias: tick_EMIT
	;; flags: USER ROM
        ;;   word 'EMIT defined in primitives/2000_variables.asm:333.
//dwn_tick_EMIT:
//        .strp "'EMIT" 0
dw_tick_EMIT_head:
        .word FFL_T_USER FFL_ROM 2 ; Flags & hash
        .word dwn_tick_EMIT     ; Pointer to word name (above)
        .word dw_ROTOR_head     ; Link to previous dictionary entry
dw_tick_EMIT:
        CFA_doUSER()      ; Code entry point: next instruction
dw_tick_EMIT_pfa:
	;; notes: 'EMIT ( -- a )
	;;        The base address of a word to output characters.

	.word 	UAOFS_EMIT



	;; word:  'INSRC
	;; alias: tick_INSRC
	;; flags: USER ROM CFT
        ;;   word 'INSRC defined in primitives/2000_variables.asm:343.
//dwn_tick_INSRC:
//        .strp "'INSRC" 0
dw_tick_INSRC_head:
        .word FFL_T_USER FFL_ROM FFL_CFT 1 ; Flags & hash
        .word dwn_tick_INSRC    ; Pointer to word name (above)
        .word dw_tick_EMIT_head ; Link to previous dictionary entry
dw_tick_INSRC:
        CFA_doUSER()      ; Code entry point: next instruction
dw_tick_INSRC_pfa:
	;; notes: 'INSRC ( -- a )
	;;        The address of a word to return the current input buffer and buffer size.

	.word	UAOFS_INSRC


	;; word:  '.READY
	;; alias: tick_dot_READY
	;; flags: USER ROM CFT
        ;;   word '.READY defined in primitives/2000_variables.asm:352.
//dwn_tick_dot_READY:
//        .strp "'.READY" 0
dw_tick_dot_READY_head:
        .word FFL_T_USER FFL_ROM FFL_CFT 0 ; Flags & hash
        .word dwn_tick_dot_READY ; Pointer to word name (above)
        .word dw_tick_INSRC_head ; Link to previous dictionary entry
dw_tick_dot_READY:
        CFA_doUSER()      ; Code entry point: next instruction
dw_tick_dot_READY_pfa:
	;; notes: '.READY ( -- a | 0 )
	;;        The address of the message printed when QUIT runs.

	.word	UAOFS_READY



	;; word:  '.PS1
	;; alias: tick_dot_PS1
	;; flags: USER ROM CFT
        ;;   word '.PS1 defined in primitives/2000_variables.asm:362.
//dwn_tick_dot_PS1:
//        .strp "'.PS1" 0
dw_tick_dot_PS1_head:
        .word FFL_T_USER FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn_tick_dot_PS1  ; Pointer to word name (above)
        .word dw_tick_dot_READY_head ; Link to previous dictionary entry
dw_tick_dot_PS1:
        CFA_doUSER()      ; Code entry point: next instruction
dw_tick_dot_PS1_pfa:
	;; notes: '.PS1 ( -- a | 0 )
	;;        The address of the start-of-line prompt vector (or 0).

	.word	UAOFS_PS1



	;; word:  '.PS2
	;; alias: tick_dot_PS2
	;; flags: USER ROM CFT
        ;;   word '.PS2 defined in primitives/2000_variables.asm:372.
//dwn_tick_dot_PS2:
//        .strp "'.PS2" 0
dw_tick_dot_PS2_head:
        .word FFL_T_USER FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn_tick_dot_PS2  ; Pointer to word name (above)
        .word dw_tick_dot_PS1_head ; Link to previous dictionary entry
dw_tick_dot_PS2:
        CFA_doUSER()      ; Code entry point: next instruction
dw_tick_dot_PS2_pfa:
	;; notes: '.PS2 ( -- a | 0 )
	;;        The address of the end-of-line prompt vector (or 0).

	.word	UAOFS_PS2



	;; word:  '.OK
	;; alias: tick_dot_OK
	;; flags: USER ROM CFT
        ;;   word '.OK defined in primitives/2000_variables.asm:382.
//dwn_tick_dot_OK:
//        .strp "'.OK" 0
dw_tick_dot_OK_head:
        .word FFL_T_USER FFL_ROM FFL_CFT 3 ; Flags & hash
        .word dwn_tick_dot_OK   ; Pointer to word name (above)
        .word dw_tick_dot_PS2_head ; Link to previous dictionary entry
dw_tick_dot_OK:
        CFA_doUSER()      ; Code entry point: next instruction
dw_tick_dot_OK_pfa:
	;; notes: '.OK ( -- a | 0 )
	;;        The address of the .OK prompt vector (or 0).

	.word	UAOFS_OK



	;; word:  'EVAL
	;; alias: tick_EVAL
	;; flags: USER ROM CFT
        ;;   word 'EVAL defined in primitives/2000_variables.asm:392.
//dwn_tick_EVAL:
//        .strp "'EVAL" 0
dw_tick_EVAL_head:
        .word FFL_T_USER FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn_tick_EVAL     ; Pointer to word name (above)
        .word dw_tick_dot_OK_head ; Link to previous dictionary entry
dw_tick_EVAL:
        CFA_doUSER()      ; Code entry point: next instruction
dw_tick_EVAL_pfa:
	;; notes: 'EVAL ( -- a | 0 )
	;;        The address of the EVAL vector (or 0).

	.word	UAOFS_EVAL



	;; word:  'NUMBER
	;; alias: tick_NUMBER
	;; flags: USER ROM CFT
        ;;   word 'NUMBER defined in primitives/2000_variables.asm:402.
//dwn_tick_NUMBER:
//        .strp "'NUMBER" 0
dw_tick_NUMBER_head:
        .word FFL_T_USER FFL_ROM FFL_CFT 0 ; Flags & hash
        .word dwn_tick_NUMBER   ; Pointer to word name (above)
        .word dw_tick_EVAL_head ; Link to previous dictionary entry
dw_tick_NUMBER:
        CFA_doUSER()      ; Code entry point: next instruction
dw_tick_NUMBER_pfa:
	;; notes: 'NUMBER ( -- a | 0 )
	;;        The address of the NUMBER vector (or 0).

	.word	UAOFS_NUMBER



	;; word:  'EOB?
	;; alias: tick_EOBq
	;; flags: USER ROM CFT
        ;;   word 'EOB? defined in primitives/2000_variables.asm:412.
//dwn_tick_EOBq:
//        .strp "'EOB?" 0
dw_tick_EOBq_head:
        .word FFL_T_USER FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn_tick_EOBq     ; Pointer to word name (above)
        .word dw_tick_NUMBER_head ; Link to previous dictionary entry
dw_tick_EOBq:
        CFA_doUSER()      ; Code entry point: next instruction
dw_tick_EOBq_pfa:
	;; notes: 'EOB? ( -- a | 0 )
	;;        The address of the EOB? vector (or 0).

	.word	UAOFS_EOBq



	;; word:  'EOL?
	;; alias: tick_EOLq
	;; flags: USER ROM CFT
        ;;   word 'EOL? defined in primitives/2000_variables.asm:422.
//dwn_tick_EOLq:
//        .strp "'EOL?" 0
dw_tick_EOLq_head:
        .word FFL_T_USER FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn_tick_EOLq     ; Pointer to word name (above)
        .word dw_tick_EOBq_head ; Link to previous dictionary entry
dw_tick_EOLq:
        CFA_doUSER()      ; Code entry point: next instruction
dw_tick_EOLq_pfa:
	;; notes: 'EOL? ( -- a | 0 )
	;;        The address of the EOB? vector (or 0).

	.word	UAOFS_EOLq



// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/2100_strcase.asm
//
///////////////////////////////////////////////////////////////////////////////


;; // -*- asm -*-
;; //
;; // Convert case of strings

//.page

	;; word:  pstrupper
	;; flags: CODE ROM
        ;;   word pstrupper defined in primitives/2100_strcase.asm:8.
//dwn_pstrupper:
//        .strp "PSTRUPPER" 0
dw_pstrupper_head:
        .word FFL_T_CODE FFL_ROM 1 ; Flags & hash
        .word dwn_pstrupper     ; Pointer to word name (above)
        .word dw_tick_EOLq_head ; Link to previous dictionary entry
dw_pstrupper:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_pstrupper_pfa:
	;; notes: pstrupper ( s -- s )
	;;        Convert all characters of a packed string to upper cas
	;;        in-place. Returns the address of the string.
	SPEEK(SP)
	STORE TMP1
	LIA _upcase	         ; Vector the character conversion routine
	STORE TMP2
	JMP _pstrmap



	// toupper map subroutine for pstrmap.
	//
	// Input:
	//  AC = character to modify
	//
	// Output
	//  AC = modified character.
_upcase:
	STORE TMP7		; For later.

	ADD _upcase_a		; c - 'a'
	SNN			; c < 'a'?
	JMP _upcase_unmod	; Yes: return character unmodified

	ADD _upcase_z		; c - 'a' + 'a' - 'z' == c - 'z'
	SNA			; c > 'z'?
	JMP _upcase_unmod	; Yes: return character unmodified

	LI &20			; ASCII case bit
	XOR TMP7		; lower case ^ &20 = upper case
	RET

_upcase_unmod:
	LOAD TMP7		; Return the character as-is.
	RET

_upcase_a:
	.word &ff9f		; -97: -ord('a')
_upcase_z:
	.word &ffe6		; -26: ord('a') - ord('z') - 1


_pstrmap:
_pstrmap_loop:
	;; Do two chars at a time.
	LOAD I TMP1
	SNZ			; Done?
	NEXT			; Yes.

	;; The 16-bit word is not &0000, so there's at least one character
	;; in there.
	GETLOCHAR()		; Extract the first character

	JSR I TMP2		; Call the supplied routine to act on it.
	STORE TMP4		; Store it back.

	LOAD I TMP1		; mem[TMP1] = mem[TMP1] & 0xff00 | TMP4
	AND BYTEHI
	OR TMP4
	STORE I TMP1		; Store it back.

	;; Now for the high word. First, is it null?
	//LOAD I TMP1
	GETHICHAR()
	SNZ			; Zero?
	NEXT			; Yes. Done

	JSR I TMP2		; Call the supplied routine to act on it.
	MAKEHICHAR()		; Shift it to the right position.
	STORE TMP4		; TMP4 = (map(c) << 8) & 0xff00

	LOAD I TMP1		; mem[TMP1] = mem[TMP1] & 0xff | TMP4
	AND BYTELO
	OR TMP4
	STORE I TMP1		; Store it back

	;; Process the next pair of characters.
	ISZ TMP1		; Increment TMP1
	JMP _pstrmap_loop	; Just in case.
	JMP _pstrmap_loop



	;; word:  pstrlower
	;; flags: CODE ROM
        ;;   word pstrlower defined in primitives/2100_strcase.asm:94.
//dwn_pstrlower:
//        .strp "PSTRLOWER" 0
dw_pstrlower_head:
        .word FFL_T_CODE FFL_ROM 1 ; Flags & hash
        .word dwn_pstrlower     ; Pointer to word name (above)
        .word dw_pstrupper_head ; Link to previous dictionary entry
dw_pstrlower:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_pstrlower_pfa:
	;; notes: pstrlower ( s -- s )
	;;        Convert all characters of a packed string to lower case in-place.
	;;        Returns the address of the string.
	SPEEK(SP)
	STORE TMP1
	LIA _dncase		; Vector the character conversion routine
	STORE TMP2
	JMP _pstrmap



	// toupper map subroutine for pstrmap.
	//
	// Input:
	//  AC = character to modify
	//
	// Output
	//  AC = modified character.
_dncase:
	STORE TMP7		; For later.

	ADD _dncase_A		; c - 'a'
	SNN			; c < 'a'?
	JMP _dncase_unmod	; Yes: return character unmodified

	ADD _dncase_A		; c - 'a' + 'a' - 'z' == c - 'z'
	SNA			; c > 'z'?
	JMP _dncase_unmod	; Yes: return character unmodified

	LI &20			; ASCII case bit
	XOR TMP7		; lower case ^ &20 = upper case
	RET

_dncase_unmod:
	LOAD TMP7		; Return the character as-is.
	RET

_dncase_A:
	.word &ffbf		; -65: -ord('A')
_dncase_Z:
	.word &ffe6		; -26: ord('A') - ord('Z') - 1


// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/2100_strcmp.asm
//
///////////////////////////////////////////////////////////////////////////////


;; // -*- asm -*-
;; //
;; // Compare strings

//.page

	;; word:  pstrcmp
	;; flags: CODE ROM
        ;;   word pstrcmp defined in primitives/2100_strcmp.asm:8.
//dwn_pstrcmp:
//        .strp "PSTRCMP" 0
dw_pstrcmp_head:
        .word FFL_T_CODE FFL_ROM 7 ; Flags & hash
        .word dwn_pstrcmp       ; Pointer to word name (above)
        .word dw_pstrlower_head ; Link to previous dictionary entry
dw_pstrcmp:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_pstrcmp_pfa:
	;; notes: pstrcmp ( s1 s2 -- n )
	;;   Compare two packed strings and return a number indicating their
	;;   lexicographical order. If n == 0, s1 == s2. If n < 0, s1 < s2.
	;;   If n > 0, s1 > s2.
	RPOP(I2,SP)		; s2
	RPOP(I1,SP)		; s1

	JSR _pstrcmp

	PUSH SP			; AC=0 already.
	NEXT


	// Subroutine to compare two null-terminated packed strings.
	//
	// Input:
	//   I1: string pointer 1
	//   I2: string pointer 2
	//
	// Output:
	//   AC: 0 => s1 == s2
	//       <0 => s1 < s2
	//       >0 => s1 > 22
	//
	// Side effects:
	//   TMP9
	//   TMP8
	//   TMP7

_pstrcmp:
_pstrcmp_loop:
	;; Compare two chars at a time.
	LOAD I I1
	STORE TMP9		; Store to check for termination later
	XOR I I2		; Compare 2 characters at a time
	SZA			; Equal?
	JMP _pstrcmp_unequal	; Unequal.

	;; Equal 16-bit word: is it a termination word?
	LOAD TMP9		; Equal, but is this the end of the string?
	SNZ
	JMP _pstrcmp_done	; The whole word is zero (and equal). Success.

	;; Is the high byte a termination byte?
	GETHICHAR()
	SNZ
	JMP _pstrcmp_done	; The high byte is zero, the words are equal.

	;; The 16-bit words are equal, but not the end of the string. Go again.
	JMP _pstrcmp_loop

_pstrcmp_done:
	RET

_pstrcmp_unequal:
	;; The strings are unequal at this position. Find out the details.
	;; First, get the second character. The first is already in TMP9.
	DECM(I2)
	LOAD I I2
	STORE TMP8		; We'll need this later

	;; Now, compare the low (first) bytes.
	LOAD TMP9
	GETLOCHAR()
	STORE TMP7

	LOAD TMP8
	GETLOCHAR()
	NEG
	ADD TMP7		; Find out the difference

	SZA			; Are the low bytes equal?
	JMP _pstrcmp_done	; No. Found the difference, return it.

	;; The difference must be in the high bytes. Return it.
	LOAD TMP9
	GETHICHAR()
	STORE TMP7

	LOAD TMP8
	GETHICHAR()
	NEG
	ADD TMP7		; Calculate the difference.
	JMP _pstrcmp_done	; Return it.



// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/2200_numbers.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-

///////////////////////////////////////////////////////////////////////////////
//
// Numerical stuff
//
///////////////////////////////////////////////////////////////////////////////


//.page
	;; word:  $DIGIT?
	;; alias: _isdigit
	;; flags: CODE ROM
        ;;   word $DIGIT? defined in primitives/2200_numbers.asm:13.
//dwn__isdigit:
//        .strp "$DIGIT?" 0
dw__isdigit_head:
        .word FFL_T_CODE FFL_ROM 3 ; Flags & hash
        .word dwn__isdigit      ; Pointer to word name (above)
        .word dw_pstrcmp_head   ; Link to previous dictionary entry
dw__isdigit:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw__isdigit_pfa:
	;; notes: DIGIT ( c base -- n true | false )
	;;   If c is a digit character in the specified base, return n, an
	;;   integer representation of the digit, and true. Otherwise, return
	;;   false.

	RPOP(TMP4, SP)		; TMP4 = base
	POP(SP)			; digit
	JSR _isdigit
	SNZ			; is it a valid digit?
	JMP _isdigit_false	; No.
	RPUSH(SP, TMP0)		; Yes. Push the integer representation.
	RPUSH(SP, MINUS1)	; Also push a true flag.
	NEXT

_isdigit_false:
	LI 0
	PUSH(SP)
	NEXT



	;; Subroutine: parse a digit of a number in the specified base.
	;;
	;; Inputs:
	;;   AC: the ASCII character to parase
	;;   TMP4: the base to parse it in.
	;;
	;; Outputs:
	;;   AC:   &ffff if the character was a valid digit, &0000 if not.
	;;   TMP0: if successful, an integer representation of the digit.
	;;         Otherwise, &ffff.
	;;
	;;  Algorithm:
	;;
	;;     n = c - '0' # We get a large unsigned number if c < '0'
	;;     if n < 0:
	;;       return false
	;;     if n > 9:
	;;       if c < 'A':
	;;         return false
	;;       n = n - 7
	;;     if n < base:
	;;       return true
	;;     return false

_isdigit:
	STORE TMP0		; TMP0 = char

	ADD _isdigit_c		; n = char - '0'
	STORE TMP0
	SNN			; n < '0'?
	JMP _isdigit_no		;   return false

	ADD @_isdigit_c+1	; n > 9?
	SPA
	JMP _isdigit_09		; No, skip over the following bit.

	LOAD TMP0		; n = n - 17
	ADD @_isdigit_c+2
	SNN			; n < 'A'?
	JMP _isdigit_no		;  return false
	ADD @_isdigit_c+3	; n = n + 10
	STORE TMP0

_isdigit_09:
	NEG
	ADD TMP4		; n < base?
	SPA
	JMP _isdigit_no

	;; It's a digit, return true.
	LOAD MINUS1		; A = -1
	RET

_isdigit_no:
	;; Not a digit.
	LOAD MINUS1
	STORE TMP0
	LI 0
	RET

_isdigit_c:
	.word -48		; '0'
	.word -9
	.word -17		; '0' - 'A'
	.word 10


	;; word:  NUMBER?
	;; alias: NUMBERq
	;; flags: CODE ROM
        ;;   word NUMBER? defined in primitives/2200_numbers.asm:104.
//dwn_NUMBERq:
//        .strp "NUMBER?" 0
dw_NUMBERq_head:
        .word FFL_T_CODE FFL_ROM 1 ; Flags & hash
        .word dwn_NUMBERq       ; Pointer to word name (above)
        .word dw__isdigit_head  ; Link to previous dictionary entry
dw_NUMBERq:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_NUMBERq_pfa:
	;; notes: NUMBER ( a -- n true | a false )
	;;        If the packed string with address a is a valid number
	;;        literal, return its integer representation and
	;;        true. Otherwise, return the string address a and false.

	SPEEK(SP)		; The string address

_number:
	STORE I0		; I0 is the string pointer
	LI 0
	STORE TMP2		; This is where the number is formed.
	STORE TMP3		; Negative flag (starts off 0)

	LOADUP(UAOFS_BASE)	; Load the BASE user variable
	STORE TMP4		; TMP4 is the base

	LIA _number_prefix
	STORE TMP5		; The character handler (state machine)

_number_loop:
	LOAD I I0
	STORE TMP6		; Temporary copy of the cell
	SNZ			; Terminator?
	JMP _number_end		; Yes. Done.
	GETLOCHAR()		; Get the low character
	STORE TMP7		; Store character byte
	JSR I TMP5		; Process the character

	LOAD TMP6
	GETHICHAR()		; Get the high character
	SNZ			; Terminator?
	JMP _number_end		; Done
	STORE TMP7		; Store character byte
	JSR I TMP5		; Process the character
	JMP _number_loop	; Again

_number_end:
	LOAD TMP3		; Negative flag?
	SZA
	JMP _number_neg		; Yes.
	LOAD TMP2
	SPOKE(SP)		; No. Push the number as-is.
	LI 1
	PUSH(SP)
	NEXT

_number_neg:			; Negate and push the number
	LOAD TMP2
	NEG
	SPOKE(SP)
	LI 1
	PUSH(SP)
	NEXT


	;; Subroutine with three entry points, each of which handles a separate
	;; state of the digit lexer. The lexer parses the regular expression:
	;;
	;; &?[+-]?\d*
	;;
	;; I.e. an optional '&', followed by an optional '-' or '+', followed by
	;; zero or more digit characters valid for the current base.
	;;
	;; Inputs for all entry points:
	;;
	;;   TMP2 = number so far
	;;   TMP3 = negative flag
	;;   TMP4 = base
	;;   TMP5 = state (points to character processor routine)
	;;   TMP7 = character to process
	;;
	;; Side-effects:
	;;   TMP2-5 updated.

	;; State 1: base prefix
_number_prefix:
	;; no need to LOAD TMP7 here, number already in AC.
	XOR _number_prefixes	; Does it start with '&'?
	SZA
	JMP _number_sign	; No. Fall through to sign.

	;; Yes. Change the base and lexer state.
	LI 16
	STORE TMP4

	;; Use the number sign state for the next character
	LIA @_number_sign+1	; Skip 'LOAD TMP7' when entering
	STORE TMP5

	RET			; Get the next character

_number_prefixes:
	.str "&-+"

	;; State 2: sign
_number_sign:
	LOAD TMP7		; Load character
	XOR @_number_prefixes+1	; Is the character '-'?
	SNZ
	JMP _number_negate	; Yes. Negate.

	LOAD TMP7		; Temporary copy of char
	XOR @_number_prefixes+2	; Is the character '+'?
	SNZ
	JMP _number_nonegate	; Yes. Ignore it.

	;; Not a sign character. Switch to digit processing.
	LIA _number_digit
	STORE TMP5
	JMP _number_digit	; Try to process as a digit.

_number_negate:
	;; Negate the sign flag.
	LI 1
	STORE TMP3		 ; Set the negative flag.

_number_nonegate:
	;; Use the number digit state for all subsequent characters
	LIA _number_digit
	STORE TMP5

	RET			; Get the next character

	;; State 3: digits
_number_digit:
	RPUSH(RP, RETV)		; Push return address
	LOAD TMP7		; The character to check

	JSR _isdigit		; Convert.

	SNZ			; Bad character?
	JMP _number_bad		; Yes.

	;; The digit is good. Tack it to the number.
	;; First, Multiply the number by BASE
	RMOV(TMP15, TMP4)	; Smaller number
	RMOV(TMP14, TMP2)	; Usually larger number
	JSR I _number_mul	; Multiply
	;; Then, add the digit to it.
	RADD(TMP2, TMP13, TMP0)	; number = number * base + digit

	RPOP(RETV, RP)
	RET			; Return to saved address

_number_mul:
	.word _umul16

_number_bad:
	LI 0			; Push 0 (the string address is still on the stack)
	PUSH(SP)
	NEXT			; Bail out.









// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/2400_doublestack.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// Stack handling for double numbers
	;; word:  2DROP
	;; flags: CODE ROM
        ;;   word 2DROP defined in primitives/2400_doublestack.asm:5.
//dwn_2DROP:
//        .strp "2DROP" 0
dw_2DROP_head:
        .word FFL_T_CODE FFL_ROM 7 ; Flags & hash
        .word dwn_2DROP         ; Pointer to word name (above)
        .word dw_NUMBERq_head   ; Link to previous dictionary entry
dw_2DROP:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_2DROP_pfa:
	;; notes: 2DROP ( w1 w2 -- )
	;;   Discard two items from the data stack.

	LDECn (SP,2)
	NEXT



	;; word:  2DUP
	;; flags: CODE ROM
        ;;   word 2DUP defined in primitives/2400_doublestack.asm:15.
//dwn_2DUP:
//        .strp "2DUP" 0
dw_2DUP_head:
        .word FFL_T_CODE FFL_ROM 6 ; Flags & hash
        .word dwn_2DUP          ; Pointer to word name (above)
        .word dw_2DROP_head     ; Link to previous dictionary entry
dw_2DUP:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_2DUP_pfa:
	;; notes: 2DUP ( w1 w2 -- w1 w2 w1 w2 )
	;;   Duplicate pair-wise the two top items on the stack.

	LOAD SP			; SP -= 3
	ADD MINUS2
	STORE SP
	STORE TMP0

	RMOV(TMP1, I SP)	; Peek at the two top values and store them.
	RMOV(TMP2, I SP)	; Peek at the two top values and store them.

	RPUSH(SP, TMP1)
	RPUSH(SP, TMP2)

	NEXT



	;; word:  2OVER
	;; flags: CODE ROM
        ;;   word 2OVER defined in primitives/2400_doublestack.asm:35.
//dwn_2OVER:
//        .strp "2OVER" 0
dw_2OVER_head:
        .word FFL_T_CODE FFL_ROM 7 ; Flags & hash
        .word dwn_2OVER         ; Pointer to word name (above)
        .word dw_2DUP_head      ; Link to previous dictionary entry
dw_2OVER:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_2OVER_pfa:
	;; notes: 2OVER ( w1l w1h w2l w2h -- w1l w1h w2l w2h w1l w1h )
	;;        Duplicate pair-wise the second-to-top items on the stack.
	;;        Works like OVER with two double numbers at the top of the
	;;        stack.

	// TODO: complete this.
	FAIL
	LOAD SP			; SP -= 5
	ADD MINUS2
	STORE SP
	STORE TMP0

	RMOV(TMP1, I SP)	; Peek at the two top values and store them.
	RMOV(TMP2, I SP)	; Peek at the two top values and store them.

	RPUSH(SP, TMP1)
	RPUSH(SP, TMP2)

	NEXT


	;; TODO: DMIN DMAX D0= D2/ D< D<= DU<



// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/2500_doublemath.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// Double math



	;; word:  N>D
	;; alias: N_to_D
	;; flags: CODE ROM CFT
        ;;   word N>D defined in primitives/2500_doublemath.asm:9.
//dwn_N_to_D:
//        .strp "N>D" 0
dw_N_to_D_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 5 ; Flags & hash
        .word dwn_N_to_D        ; Pointer to word name (above)
        .word dw_2OVER_head     ; Link to previous dictionary entry
dw_N_to_D:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_N_to_D_pfa:
	;; notes: N>D ( n -- d )
	;;        Convert the integer n to a double integer d.

	SPEEK(SP)
	SNA
	JMP _n2d_pos
_n2d_neg:
	LOAD MINUS1
	JMP _n2d_end
_n2d_pos:
	LI 0
_n2d_end:
	PUSH(SP)
	NEXT



	;; word:  U>D
	;; alias: U_to_D
	;; flags: CODE ROM CFT
        ;;   word U>D defined in primitives/2500_doublemath.asm:29.
//dwn_U_to_D:
//        .strp "U>D" 0
dw_U_to_D_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 6 ; Flags & hash
        .word dwn_U_to_D        ; Pointer to word name (above)
        .word dw_N_to_D_head    ; Link to previous dictionary entry
dw_U_to_D:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_U_to_D_pfa:
	;; notes: U>D ( u -- d )
	;;        Convert the unsigned integer n to a double integer d.

	LI 0
	PUSH(SP)
	NEXT



	;; word:  DNEGATE
	;; flags: CODE ROM
        ;;   word DNEGATE defined in primitives/2500_doublemath.asm:40.
//dwn_DNEGATE:
//        .strp "DNEGATE" 0
dw_DNEGATE_head:
        .word FFL_T_CODE FFL_ROM 3 ; Flags & hash
        .word dwn_DNEGATE       ; Pointer to word name (above)
        .word dw_U_to_D_head    ; Link to previous dictionary entry
dw_DNEGATE:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_DNEGATE_pfa:
	;; notes: NEGATE ( d -- -d )
	;;   Negate double-word d (two's complement)

	LOAD SP			; SP -= 3
	ADD MINUS2
	STORE SP

	CLL
	LOAD I SP		; Low word
	NEG			; negate low word. Sets L if necessary.
	STORE TMP1

	LOAD I SP		; High word
	OP1 IFL INC		; if carry: high word++
	STORE TMP2

	LOAD SP			; SP -= 2
	ADD MINUS2
	STORE SP

	LOAD TMP1		; Store it back
	STORE I SP
	LOAD TMP2
	STORE I SP

	NEXT



	;; word:  DABS
	;; flags: DOCOL ROM
        ;;   word DABS defined in primitives/2500_doublemath.asm:71.
//dwn_DABS:
//        .strp "DABS" 0
dw_DABS_head:
        .word FFL_T_DOCOL FFL_ROM 0 ; Flags & hash
        .word dwn_DABS          ; Pointer to word name (above)
        .word dw_DNEGATE_head   ; Link to previous dictionary entry
dw_DABS:
        CFA_doCOL()       ; Code entry point: next instruction
dw_DABS_pfa:
	;; notes: DABS ( d -- d )
	;;        The absolute value of double integer d.

	.word dw_DUP		; 2DUP ( dl dh dh )
	.word dw_zero_less	; 0< ( dl dh f )
	.word dw_if_branch	;   IF
	.word _DABS_end
	.word dw_DNEGATE	; DNEGATE

_DABS_end:
	.word dw_EXIT



	;; word:  D+
	;; alias: DPLUS
	;; flags: CODE ROM
        ;;   word D+ defined in primitives/2500_doublemath.asm:88.
//dwn_DPLUS:
//        .strp "D+" 0
dw_DPLUS_head:
        .word FFL_T_CODE FFL_ROM 6 ; Flags & hash
        .word dwn_DPLUS         ; Pointer to word name (above)
        .word dw_DABS_head      ; Link to previous dictionary entry
dw_DPLUS:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_DPLUS_pfa:
	;; notes: D+ ( d d -- d )
	;;   Add two double-words
	;;   TODO: Popping four words like this is inefficient. Fix it.

	POP (SP)		; a high
	STORE TMP1
	POP (SP)		; a low
	STORE TMP2

	POP (SP)		; b high
	STORE TMP3
	POP (SP)		; b low

_dplus_work:
	CLL
	ADD TMP2		; a_lo + b_lo
	STORE TMP2

	LOAD TMP3		; b high
	OP1 IFL INC		; propagate carry (increase if L)

	ADD TMP1		; carry + b high + b low
	STORE TMP1

	LOAD TMP2
	PUSH (SP)

	LOAD TMP1
	PUSH (SP)

	NEXT



	;; word:  D-
	;; alias: DMINUS
	;; flags: CODE ROM
        ;;   word D- defined in primitives/2500_doublemath.asm:125.
//dwn_DMINUS:
//        .strp "D-" 0
dw_DMINUS_head:
        .word FFL_T_CODE FFL_ROM 6 ; Flags & hash
        .word dwn_DMINUS        ; Pointer to word name (above)
        .word dw_DPLUS_head     ; Link to previous dictionary entry
dw_DMINUS:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_DMINUS_pfa:
	;; notes: D- ( d d -- d )
	;;   Subtract two double-words.
	;;   TODO: Popping four words like this is inefficient. Fix it.
	POP (SP)		; a high
	STORE TMP1
	POP (SP)		; a low
	STORE TMP2

	POP (SP)		; b high
	STORE TMP3
	POP (SP)		; b low
	NEG
	STORE TMP4

	SCL			; Skip if L clear
	ISZ TMP3		; Otherwise, increment high b

	JMP _dplus_work



// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/3000_accept.asm
//
///////////////////////////////////////////////////////////////////////////////


;; // -*- asm -*-
;; //
;; // rudimentary line editing and terminal buffering

//.page

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



	;; word:  PS1
	;; flags: DOCOL ROM CFT
        ;;   word PS1 defined in primitives/3000_accept.asm:31.
//dwn_PS1:
//        .strp "PS1" 0
dw_PS1_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 3 ; Flags & hash
        .word dwn_PS1           ; Pointer to word name (above)
        .word dw_DMINUS_head    ; Link to previous dictionary entry
dw_PS1:
        CFA_doCOL()       ; Code entry point: next instruction
dw_PS1_pfa:
	;; notes: PS1 ( -- )
	;;        Start-of-line prompt

	doLIT(10)
	.word dw_vt_FG
	.word dw_EXIT



	;; word:  KEY
	;; flags: CODE ROM CFT
        ;;   word KEY defined in primitives/3000_accept.asm:42.
//dwn_KEY:
//        .strp "KEY" 0
dw_KEY_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 0 ; Flags & hash
        .word dwn_KEY           ; Pointer to word name (above)
        .word dw_PS1_head       ; Link to previous dictionary entry
dw_KEY:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_KEY_pfa:
	;; notes: KEY ( -- c )
	;;        Returns the next available character from the terminal.

	JSR _getch
	RPUSH(SP, INPCH)
	NEXT



	;; word:  accept
	;; flags: CODE ROM CFT
        ;;   word accept defined in primitives/3000_accept.asm:53.
//dwn_accept:
//        .strp "ACCEPT" 0
dw_accept_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 7 ; Flags & hash
        .word dwn_accept        ; Pointer to word name (above)
        .word dw_KEY_head       ; Link to previous dictionary entry
dw_accept:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_accept_pfa:
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
	PUSH(SP)		; ...and output it.
	FORTH(dw_EMIT)

	JMP __accept_loop

__accept_del:
	LOAD R TI0		; Load the input pointer
	XOR R TMP0		; Are we at the beginning of the buffer?
	SZA
	JMP __accept_dodel	; No. We can delete.
	LI 7
	PUSH(SP)		; ...and output it.
	FORTH(dw_EMIT)
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
        ;;   word EXPECT defined in primitives/3000_accept.asm:181.
//dwn_EXPECT:
//        .strp "EXPECT" 0
dw_EXPECT_head:
        .word FFL_T_DOCOL FFL_ROM 3 ; Flags & hash
        .word dwn_EXPECT        ; Pointer to word name (above)
        .word dw_accept_head    ; Link to previous dictionary entry
dw_EXPECT:
        CFA_doCOL()       ; Code entry point: next instruction
dw_EXPECT_pfa:
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
        ;;   word getline defined in primitives/3000_accept.asm:214.
//dwn_getline:
//        .strp "GETLINE" 0
dw_getline_head:
        .word FFL_T_DOCOL FFL_ROM 0 ; Flags & hash
        .word dwn_getline       ; Pointer to word name (above)
        .word dw_EXPECT_head    ; Link to previous dictionary entry
dw_getline:
        CFA_doCOL()       ; Code entry point: next instruction
dw_getline_pfa:
	;; notes: getline ( -- )
	;;        Get the next line from the current block.

	;; TODO: separate this into two words so line parsing can be used separately.

	;; BLKBUF @ DUP >BLK @ + ( buf a ) \ start address for parse

	.word dw_BLKBUF
	.word dw_fetch		; ( buf )
	.word dw_DUP		; ( buf buf )
	.word dw_pBLK		; >BLK ( buf buf va )
	.word dw_fetch		; @ ( buf buf ofs )
	.word dw_add		; + ( buf buf+ofs )

	;; SWAP BLKBS + ( b e ) \ Get end address
	.word dw_SWAP		; SWAP ( buf+ofs buf )
	.word dw_cBLK		; #BLK ( buf+ofs buf va )
	.word dw_fetch		; @ ( buf+ofs buf +n )
	.word dw_add		; + ( buf+ofs e )

	doLIT(10)		; 10 ( b e c )
	.word dw__parse		; $parse ( b u +n )

	;; Adjust >BLK
	.word dw_pBLK		; >BLK ( b u +n va )
	.word dw_plus_store	; +! ( b u )

	;; Store line length
	.word dw_cLINE		; #BLK (b u va )
	.word dw_store		; ! ( b )

	;; Store starting line offset
	.word dw_pLINE		; >LINE ( b va )
	.word dw_store		; ! ( )

	;; Clear >IN
	doLIT(0)		; 0
	.word dw_ofsIN		; >IN
	.word dw_store		; !

	.word dw_EXIT



	;; word:  QUERY
	;; flags: DOCOL ROM
        ;;   word QUERY defined in primitives/3000_accept.asm:260.
//dwn_QUERY:
//        .strp "QUERY" 0
dw_QUERY_head:
        .word FFL_T_DOCOL FFL_ROM 4 ; Flags & hash
        .word dwn_QUERY         ; Pointer to word name (above)
        .word dw_getline_head   ; Link to previous dictionary entry
dw_QUERY:
        CFA_doCOL()       ; Code entry point: next instruction
dw_QUERY_pfa:
	;; notes: QUERY ( -- )
	;;        Get a line from the terminal or from the current block.

	.word dw_BLK
	.word dw_fetch
	.word dw_if_branch
	.word _query_tty

_query_blk:
	.word dw_EOLq		; EOL?
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


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/3000_dictionary.asm
//
///////////////////////////////////////////////////////////////////////////////


;; // -*- asm -*-
;; //
;; // dictionary tools



	;; word:  >FLAGS@
	;; alias: to_FLAGS_fetch
	;; flags: DOCOL ROM CFT
        ;;   word >FLAGS@ defined in primitives/3000_dictionary.asm:9.
//dwn_to_FLAGS_fetch:
//        .strp ">FLAGS@" 0
dw_to_FLAGS_fetch_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 1 ; Flags & hash
        .word dwn_to_FLAGS_fetch ; Pointer to word name (above)
        .word dw_QUERY_head     ; Link to previous dictionary entry
dw_to_FLAGS_fetch:
        CFA_doCOL()       ; Code entry point: next instruction
dw_to_FLAGS_fetch_pfa:
	;; notes: >FLAGS ( a -- u )
	;;        Given the PFA of a word, return its flags.

	doLIT(4)		; 4
	.word dw_sub		; -
	.word dw_fetch		; @
	.word dw_EXIT



	;; word:  >CFA
	;; alias: to_CFA
	;; flags: DOCOL ROM CFT
        ;;   word >CFA defined in primitives/3000_dictionary.asm:22.
//dwn_to_CFA:
//        .strp ">CFA" 0
dw_to_CFA_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn_to_CFA        ; Pointer to word name (above)
        .word dw_to_FLAGS_fetch_head ; Link to previous dictionary entry
dw_to_CFA:
        CFA_doCOL()       ; Code entry point: next instruction
dw_to_CFA_pfa:
	;; notes: >CFA ( a -- a )
	;;        Given the PFA of a word, return its CFA.

	.word dw_dec		; 1-
	.word dw_EXIT



	;; word:  >LINK@
	;; alias: to_LINK_fetch
	;; flags: DOCOL ROM CFT
        ;;   word >LINK@ defined in primitives/3000_dictionary.asm:33.
//dwn_to_LINK_fetch:
//        .strp ">LINK@" 0
dw_to_LINK_fetch_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 0 ; Flags & hash
        .word dwn_to_LINK_fetch ; Pointer to word name (above)
        .word dw_to_CFA_head    ; Link to previous dictionary entry
dw_to_LINK_fetch:
        CFA_doCOL()       ; Code entry point: next instruction
dw_to_LINK_fetch_pfa:
	;; notes: >LINK@ ( a -- a | f )
	;;        Given the PFA of a word, return the head address of the word
	;;        preceding it in the vocabulary. If this is the first word in
	;;        the vocabulary, false (zero) is returned.

	.word dw_dec2		; 2-
	.word dw_fetch		; @
	.word dw_EXIT



	;; word:  >NAME
	;; alias: to_NAME
	;; flags: DOCOL ROM CFT
        ;;   word >NAME defined in primitives/3000_dictionary.asm:47.
//dwn_to_NAME:
//        .strp ">NAME" 0
dw_to_NAME_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 3 ; Flags & hash
        .word dwn_to_NAME       ; Pointer to word name (above)
        .word dw_to_LINK_fetch_head ; Link to previous dictionary entry
dw_to_NAME:
        CFA_doCOL()       ; Code entry point: next instruction
dw_to_NAME_pfa:
	;; notes: >NAME ( a -- a )
	;;        Given the PFA of a word, return the address of its name string.

	doLIT(2)		; 3
	.word dw_sub		; -
	.word dw_fetch		; @ \ dereference
	.word dw_EXIT



;; // End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/3100_find.asm
//
///////////////////////////////////////////////////////////////////////////////


;; // -*- asm -*-
;; //
;; // Dictionary search

//.page

	;; word:  FIND
	;; flags: DOCOL ROM
        ;;   word FIND defined in primitives/3100_find.asm:8.
//dwn_FIND:
//        .strp "FIND" 0
dw_FIND_head:
        .word FFL_T_DOCOL FFL_ROM 2 ; Flags & hash
        .word dwn_FIND          ; Pointer to word name (above)
        .word dw_to_NAME_head   ; Link to previous dictionary entry
dw_FIND:
        CFA_doCOL()       ; Code entry point: next instruction
dw_FIND_pfa:
	;; notes: FIND ( a1 -- a2 n )
	;;
	;;        a1 is the address of a packed string. The string contains a
        ;;        word name to be located in the currently active search order.
        ;;        If the word is not found, a2 is the string address a1, and n
        ;;        is zero.  If the word is found, a2 is the compilation address
        ;;        and n is set to one of two non- zero values.  If the word
        ;;        found has the immediate attribute, n is set to one.  If the
        ;;        word is non-immediate, n is set to minus one (true).

	;; COUNT OVER >R SWAP HASH R> ( a1 -- hash a1 ) \ Generate the hash
	.word dw_COUNT		; COUNT ( a1 len )
	.word dw_OVER		; OVER ( a1 len a1 )
	.word dw_to_R		; >R ( a1 len )
	.word dw_SWAP		; SWAP ( len a1 )
	.word dw_HASH		; HASH ( hash )
	.word dw_R_from		; R> ( hash a1 )

	.word dw_voc0		; voc0 ( hash a1 I va )

	;; ( hash a1 I va )
_find_loop:
	.word dw_SWAP		; SWAP ( hash a1 va I )
	.word dw_to_R		; >R ( hash a1 va )

	.word dw_voc_find	; ( hash a1 va ) voc.find ( hash a2 n )

	.word dw_DUP		; DUP ( hash a2 n n )
	.word dw_if_branch	; n == 0 ? ( hash a2 n )
	.word _find_nextvoc

	// ( hash a2 n ) \ Got it. Clean up and return
	.word dw_RDROP
	.word dw_ROT		; ( a2 n hash )
	.word dw_DROP		; ( a2 n )
	.word dw_EXIT

	// ( hash a2 0 ) \ Try the next vocabulary
_find_nextvoc:
	.word dw_DROP		; DROP ( hash a2 )
	.word dw_R_from		; R> ( hash a2 I )
	.word dw_voc_plus	; voc+ ( hash a2 I va )

	.word dw_DUP		; ?DUP ( hash a2 I va va )
	.word dw_if_branch	; if done... ( hash a2 I va )
	.word _find_fail	;    ... go to end ( )

	.word dw_branch		; loop again ( hash a2 I va )
	.word _find_loop

	;; ( hash a2 n ) \ Not found, return a2 0
_find_fail:
	.word dw_ROT		; ROT ( a2 n hash )
	.word dw_2DROP		; 2DROP ( a2 )
	doLIT(0)		; 0 ( a2 0 )
	.word dw_EXIT

_find_hash_mask:
	.word 7			; bit mask for the hash function



	;; word:  COMPILE-ONLY?
	;; alias: COMPILE_ONLYq
	;; flags: DOCOL ROM CFT
        ;;   word COMPILE-ONLY? defined in primitives/3100_find.asm:73.
//dwn_COMPILE_ONLYq:
//        .strp "COMPILE-ONLY?" 0
dw_COMPILE_ONLYq_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 6 ; Flags & hash
        .word dwn_COMPILE_ONLYq ; Pointer to word name (above)
        .word dw_FIND_head      ; Link to previous dictionary entry
dw_COMPILE_ONLYq:
        CFA_doCOL()       ; Code entry point: next instruction
dw_COMPILE_ONLYq_pfa:
	;; notes: COMPILE-ONLY? ( flags -- f )
	;;        Returns true if the compile-only bit is set in the flag value.
	;; code:  : COMPILE-ONLY? ( flags -- f ) 16 AND 0> ;

	doLIT(FFL_COMPILE)
	.word dw_AND
	.word dw_zero_greater
	.word dw_EXIT



	;; word:  IMMEDIATE?
	;; alias: IMMEDIATEq
	;; flags: DOCOL ROM CFT
        ;;   word IMMEDIATE? defined in primitives/3100_find.asm:87.
//dwn_IMMEDIATEq:
//        .strp "IMMEDIATE?" 0
dw_IMMEDIATEq_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 3 ; Flags & hash
        .word dwn_IMMEDIATEq    ; Pointer to word name (above)
        .word dw_COMPILE_ONLYq_head ; Link to previous dictionary entry
dw_IMMEDIATEq:
        CFA_doCOL()       ; Code entry point: next instruction
dw_IMMEDIATEq_pfa:
	;; notes: IMMEDIATE? ( flags -- f )
	;;        Returns true if the immediate bit is set in the flag value.
	;; code:  : IMMEDIATE? ( flags -- f ) 8 AND 0> ;

	doLIT(FFL_IMMEDIATE)
	.word dw_AND
	.word dw_zero_greater
	.word dw_EXIT



	;; word:  voc.find
	;; flags: CODE ROM CFT
        ;;   word voc.find defined in primitives/3100_find.asm:100.
//dwn_voc_find:
//        .strp "VOC.FIND" 0
dw_voc_find_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 6 ; Flags & hash
        .word dwn_voc_find      ; Pointer to word name (above)
        .word dw_IMMEDIATEq_head ; Link to previous dictionary entry
dw_voc_find:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_voc_find_pfa:
	;; notes: voc.find ( hash a1 va -- hash a2 flags )
	;;
	;;        va is a pointer to vocabulary to search (an indirect address
	;;        as yielded by, e.g. CONTEXT@).
	;;        a1 is the address of a packed string; hash is its dictionary
	;;        hash (as calculated by HASH). The string contains a word name to be located in
        ;;        the specified vocabulary.  If the word is not found,
        ;;        a2 is the string address a1, and n is zero.  If the word is
        ;;        found, a2 is the word's compilation address and flags contains the flags for
	;;        this word. COMPILE-ONLY? and IMMEDIATE? may be used to test the corresponding flags.
	;;
	;;        ==Dictionary Hashes==
	;;
	;;        The word uses a 3-bit hash to speed up searches. The hash is
        ;;        simply the length of a string XOR the codepoint of its first
        ;;        character. The lower three bits of this are used. This is
        ;;        quite easy to calculate and yields decent results, reducint
        ;;        the search space to approximately one eighth (in a perfect
        ;;        world).
	;;
	;;        ==Register Allocation==
	;;
	;;        This word has a lot of allocated registers:
	;;
	;;        TMP0: stack macros, hash
	;;        TMP1: word code address
	;;        TMP2: link (loop register)
	;;        TMP3: hash to search for.
	;;        TMP4: dictionary flags | hash
	;;        TMP5: string ptr of the word to search for
	;;        TMP6: the hash of the word to search for.
	;;        I1:   autoinc copy of TMP5 for _pstrcmp
	;;        I2:   autoinc dict word name ptr for _pstrcmp

	RPOP(TMP2, SP)		; TMP2 = vocabulary address (to be dereferenced)
	RPOP(TMP5, SP)		; TMP5 = word to search for.
	RPOP(TMP3, SP)	   	; TMP3 = hash
	//PRINTH

	;; Start going through the dictionary.

	RMOV (TMP2, I TMP2)	; TMP2 = mem[TMP2] (address of last word in vocab)
	STORE TMP2

	;; dict format:
	;;   link + 00: flags
	;;   link + 01: pointer to string
	;;   link + 02: link
	;;   link + 03: entry point

_vocfind_loop:
	LOAD TMP2
	SNZ
	JMP _vocfind_nfound

	STORE I0		; Use autoincrement for convenience
	//PRINTA
	RMOV(TMP4, I I0)	; TMP4 = mem[I0++] (flags)
	//PRINTH
	RMOV(I2, I I0)		; I0 = mem[I0++] (name pointer)
	RMOV(TMP2, I I0)	; TMP2 = mem[I0++] (link)
	RMOV(TMP1, I0)		; TMP1 = I0 (code)

	;; Compare hashes.
	LOAD TMP4		; bits 0..2 of the flags contain the hash
	XOR TMP3		; compare against the desired hash.
	AND _find_hash_mask     ; only check the least significant 3 bits.
	SZA			; zero == potential hit.
	JMP _vocfind_loop       ; No. Don't bother comparing strings. Loop again.

	;; The hashes match. Compare the string to ensure we have what we need.
	RMOV(I1, TMP5)		; Prepare for comparison
	JSR I _vocfind_pstrcmp
	SNZ			; zero == found.
	JMP _vocfind_found	; Yes, it's been found
	JMP _vocfind_loop	; No. Loop again.

_vocfind_pstrcmp:
	.word _pstrcmp		; string comparison routine

_vocfind_found:
	RPUSH(SP, TMP3)		; Push the hash
	RPUSH(SP, TMP1)		; Push the code address
	RPUSH(SP, TMP4)		; Push the word flags
	NEXT

;; 	LI FFL_COMPILE		; Check for compile-only words.
;; 	AND TMP4		; Check the flags.
;; 	SZA
;; 	JMP _vocfind_cplonly	; Yes, it's compile-only.

;; 	LI FFL_IMMEDIATE	; Check for immediate words.
;; 	AND TMP4		; Check the flags.
;; 	SZA
;; 	JMP _vocfind_immediate	; Yes, it's immediate.

;; 	RPUSH(SP, MINUS1)	; It's a plain word. Push -1.
;; 	NEXT

;; _vocfind_immediate:
;; 	LI 1
;; 	PUSH(SP)
;; 	NEXT

;; _vocfind_cplonly:
;; 	LI 2
;; 	PUSH(SP)
;; 	NEXT

_vocfind_nfound:
	RPUSH(SP, TMP3)		; Push the hash
	RPUSH(SP, TMP5)		; The string address
	LI 0			; Push 0
	PUSH(SP)
	NEXT



// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/3500_numoutput.asm
//
///////////////////////////////////////////////////////////////////////////////


;; // -*- asm -*-
;; //
;; // rudimentary line editing and terminal buffering



	;; word:  DIGIT
	;; flags: DOCOL ROM
        ;;   word DIGIT defined in primitives/3500_numoutput.asm:8.
//dwn_DIGIT:
//        .strp "DIGIT" 0
dw_DIGIT_head:
        .word FFL_T_DOCOL FFL_ROM 1 ; Flags & hash
        .word dwn_DIGIT         ; Pointer to word name (above)
        .word dw_voc_find_head  ; Link to previous dictionary entry
dw_DIGIT:
        CFA_doCOL()       ; Code entry point: next instruction
dw_DIGIT_pfa:
	;; notes: DIGIT ( u -- c )
	;;        Converts an integer to a digit. The integer should
	;;        be <= BASE.

	.word dw_doLIT		; 9
	.word 9
	.word dw_OVER		; OVER
	.word dw_lt		; <
	.word dw_doLIT		; 7
	.word 7
	.word dw_AND		; AND
	.word dw_add		; +
	.word dw_doLIT		; 48
	.word 48
	.word dw_add		; +
	.word dw_EXIT



	;; /ord:  EXTRACT
	;; /lags: DOCOL ROM
	;; /otes: EXTRACT ( n base -- n c )
	;;        Extracts the least significant digit of n, in preparation for
	;;        output in the specified base. Returns a character ready to
	;;        EMIT and the remainder of n.

	;; /MOD SWAP DIGIT ;

	;; .word dw_U_DIV_MOD	; UM/MOD ( rem quot )
	;; .word dw_SWAP		; SWAP ( quot rem )
	;; .word dw_DIGIT		; DIGIT ( quot char )
	;; .word dw_EXIT



	;; word:  EXTRACT
	;; flags: DOCOL ROM
        ;;   word EXTRACT defined in primitives/3500_numoutput.asm:45.
//dwn_EXTRACT:
//        .strp "EXTRACT" 0
dw_EXTRACT_head:
        .word FFL_T_DOCOL FFL_ROM 2 ; Flags & hash
        .word dwn_EXTRACT       ; Pointer to word name (above)
        .word dw_DIGIT_head     ; Link to previous dictionary entry
dw_EXTRACT:
        CFA_doCOL()       ; Code entry point: next instruction
dw_EXTRACT_pfa:
	;; notes: EXTRACT ( d base -- d c )
	;;        Extracts the least significant digit of double integer d, in
	;;        preparation for output in the specified base. Returns a
	;;        character ready to EMIT and the remainder of d.
	;; code:  : EXTRACT ( d base -- d c ) DM/MOD ROT DROP ROT DIGIT ;

	.word dw_UM_DIV_MOD	; UM/MOD ( rl 0 ql qh )
	.word dw_ROT		; ROT ( rl ql qh 0 )
	.word dw_DROP		; DROP ( rl ql qh )
	.word dw_ROT		; ROT ( ql qh rl )
	.word dw_DIGIT		; DIGIT ( quot char )
	.word dw_EXIT



	;; word:  <#
	;; alias: bkt-number
	;; flags: DOCOL ROM
        ;;   word <# defined in primitives/3500_numoutput.asm:63.
//dwn_bkt_number:
//        .strp "<#" 0
dw_bkt_number_head:
        .word FFL_T_DOCOL FFL_ROM 6 ; Flags & hash
        .word dwn_bkt_number    ; Pointer to word name (above)
        .word dw_EXTRACT_head   ; Link to previous dictionary entry
dw_bkt_number:
        CFA_doCOL()       ; Code entry point: next instruction
dw_bkt_number_pfa:
	;; notes: <# ( -- )
	;;        Begin number conversion.

_bkt_number_jumpin:
	.word dw_PAD		; PAD
	.word dw_HLD		; HLD
	.word dw_store		; !
	.word dw_EXIT		; EXIT



	;; word:  N<#
	;; alias: N-bkt-number
	;; flags: DOCOL ROM
        ;;   word N<# defined in primitives/3500_numoutput.asm:77.
//dwn_N_bkt_number:
//        .strp "N<#" 0
dw_N_bkt_number_head:
        .word FFL_T_DOCOL FFL_ROM 5 ; Flags & hash
        .word dwn_N_bkt_number  ; Pointer to word name (above)
        .word dw_bkt_number_head ; Link to previous dictionary entry
dw_N_bkt_number:
        CFA_doCOL()       ; Code entry point: next instruction
dw_N_bkt_number_pfa:
	;; notes: N<# ( -- )
	;;        Begin number conversion for signed single-precision numbers.

	.word dw_N_to_D		; Sign-extend
	.word dw_branch
	.word _bkt_number_jumpin



	;; word:  U<#
	;; alias: U-bkt-number
	;; flags: DOCOL ROM
        ;;   word U<# defined in primitives/3500_numoutput.asm:89.
//dwn_U_bkt_number:
//        .strp "U<#" 0
dw_U_bkt_number_head:
        .word FFL_T_DOCOL FFL_ROM 6 ; Flags & hash
        .word dwn_U_bkt_number  ; Pointer to word name (above)
        .word dw_N_bkt_number_head ; Link to previous dictionary entry
dw_U_bkt_number:
        CFA_doCOL()       ; Code entry point: next instruction
dw_U_bkt_number_pfa:
	;; notes: U<# ( -- )
	;;        Begin number conversion for unsigned single-precision numbers.

	doLIT(0)		; 0 \ push zero high bits
	.word dw_branch
	.word _bkt_number_jumpin



	;; word:  HOLD
	;; flags: DOCOL ROM
        ;;   word HOLD defined in primitives/3500_numoutput.asm:100.
//dwn_HOLD:
//        .strp "HOLD" 0
dw_HOLD_head:
        .word FFL_T_DOCOL FFL_ROM 4 ; Flags & hash
        .word dwn_HOLD          ; Pointer to word name (above)
        .word dw_U_bkt_number_head ; Link to previous dictionary entry
dw_HOLD:
        CFA_doCOL()       ; Code entry point: next instruction
dw_HOLD_pfa:
	;; notes: HOLD ( c -- )
	;;        Add a character to the number hold buffer.

	;; : HOLD ( c -- ) HLD @ 1 - DUP HLD ! C! ;

	.word dw_HLD		; HLD
	.word dw_fetch		; @
	.word dw_doLIT		; 1
	.word 1
	.word dw_sub		; -
	.word dw_DUP		; DUP
	.word dw_HLD		; HLD
	.word dw_store		; !
	.word dw_store		; C! ( which is identical to ! )
	.word dw_EXIT		; EXIT



	;; /ord:  #
	;; /lias: number
	;; /lags: DOCOL ROM
	;; /otes: # ( u -- u )
	;;        Extract a digit.
	;; code:  : # ( u -- u ) BASE @ EXTRACT HOLD ;

	;; .word dw_BASE		; BASE
	;; .word dw_fetch		; @
	;; .word dw_EXTRACT	; EXTRACT
	;; .word dw_HOLD		; HOLD
	;; .word dw_EXIT		; EXIT



	;; /ord:  #S
	;; /lias: number-s
	;; /lags: DOCOL ROM
	;; /otes: #S ( u -- 0 )
	;;        Extract all remaining digits.
	;; code:  : #S ( u -- 0 ) BEGIN # DUP WHILE REPEAT ;

;; _number_s_loop:			; BEGIN
;; 	.word dw_number		; #
;; 	.word dw_DUP		; DUP
;; 	.word dw_if_branch	; branch? ( if zero )
;; 	.word _number_s_end	; ( destination )
;; 	.word dw_branch	ct	; branch
;; 	.word _number_s_loop	; ( destination )
;; _number_s_end:
;; 	.word dw_EXIT		; EXIT



	;; word:  #
	;; alias: number
	;; flags: DOCOL ROM
        ;;   word # defined in primitives/3500_numoutput.asm:155.
//dwn_number:
//        .strp "#" 0
dw_number_head:
        .word FFL_T_DOCOL FFL_ROM 2 ; Flags & hash
        .word dwn_number        ; Pointer to word name (above)
        .word dw_HOLD_head      ; Link to previous dictionary entry
dw_number:
        CFA_doCOL()       ; Code entry point: next instruction
dw_number_pfa:
	;; notes: # ( d -- d )
	;;        Extract a digit from double integer d.
	;; code:  : # ( d -- d ) BASE @ DEXTRACT HOLD ;

	.word dw_BASE		; BASE
	.word dw_fetch		; @
	.word dw_EXTRACT	; DEXTRACT
	.word dw_HOLD		; HOLD
	.word dw_EXIT		; EXIT



	;; word:  #S
	;; alias: number-s
	;; flags: DOCOL ROM
        ;;   word #S defined in primitives/3500_numoutput.asm:170.
//dwn_number_s:
//        .strp "#S" 0
dw_number_s_head:
        .word FFL_T_DOCOL FFL_ROM 1 ; Flags & hash
        .word dwn_number_s      ; Pointer to word name (above)
        .word dw_number_head    ; Link to previous dictionary entry
dw_number_s:
        CFA_doCOL()       ; Code entry point: next instruction
dw_number_s_pfa:
	;; notes: #S ( d -- 0 )
	;;        Extract all remaining digits from double integer d.

	;; BEGIN # DUP WHILE REPEAT ;

_dnumber_s_loop:		; BEGIN
	.word dw_number		; # ( d )
	.word dw_2DUP		; 2DUP ( d d )
	.word dw_OR		; OR ( d dl|dh )
	.word dw_if_branch	; branch? ( if zero )
	.word _dnumber_s_end	; ( destination )
	.word dw_branch		; branch
	.word _dnumber_s_loop	; ( destination )
_dnumber_s_end:
	.word dw_EXIT		; EXIT



	;; word:  0#S
	;; alias: 0-number-s
	;; flags: DOCOL ROM
        ;;   word 0#S defined in primitives/3500_numoutput.asm:191.
//dwn_0_number_s:
//        .strp "0#S" 0
dw_0_number_s_head:
        .word FFL_T_DOCOL FFL_ROM 3 ; Flags & hash
        .word dwn_0_number_s    ; Pointer to word name (above)
        .word dw_number_s_head  ; Link to previous dictionary entry
dw_0_number_s:
        CFA_doCOL()       ; Code entry point: next instruction
dw_0_number_s_pfa:
	;; notes: 0#S ( d +n -- u )
	;;        Extract n zero-padded digits of d.

	.word dw_inc		; 1+ ( dl dh +n++ )
_znumber_s_loop:
	.word dw_dec		; 1- ( dl dh +n-1 )
	.word dw_DUP		; DUP ( dl dh +n-1 +n-1 )
	.word dw_if_branch	; branch? ( dl dh +n-1 )
	.word _znumber_s_end	;

	.word dw_not_ROT	; -ROT ( +n-1 dl dh )
	.word dw_number		; # ( +n dl dh )
	.word dw_ROT		; ROT ( dl dh +n )

	.word dw_branch		; branch
	.word _znumber_s_loop	;

_znumber_s_end:
	.word dw_DROP		; DROP ( u )
	.word dw_EXIT		; EXIT



	;; word:  SIGN
	;; flags: DOCOL ROM
        ;;   word SIGN defined in primitives/3500_numoutput.asm:216.
//dwn_SIGN:
//        .strp "SIGN" 0
dw_SIGN_head:
        .word FFL_T_DOCOL FFL_ROM 7 ; Flags & hash
        .word dwn_SIGN          ; Pointer to word name (above)
        .word dw_0_number_s_head ; Link to previous dictionary entry
dw_SIGN:
        CFA_doCOL()       ; Code entry point: next instruction
dw_SIGN_pfa:
	;; notes: SIGN ( d -- )
	;;        Adds a sign indicator.

	;; : SIGN ( d -- ) 0< IF 45 HOLD THEN ;

	.word dw_zero_less	; 0< ( dl f )
	.word dw_if_branch	; ?branch ( IF )
	.word _sign_end		; \ not less than zero
	doCHAR("-")		; 45 ( dl 45 )
	.word dw_HOLD		; HOLD ( dl )
_sign_end:
	.word dw_DROP		; DROP ( )
	.word dw_EXIT		; EXIT



	;; word:  #>
	;; alias: number-bkt
	;; flags: DOCOL ROM
        ;;   word #> defined in primitives/3500_numoutput.asm:235.
//dwn_number_bkt:
//        .strp "#>" 0
dw_number_bkt_head:
        .word FFL_T_DOCOL FFL_ROM 1 ; Flags & hash
        .word dwn_number_bkt    ; Pointer to word name (above)
        .word dw_SIGN_head      ; Link to previous dictionary entry
dw_number_bkt:
        CFA_doCOL()       ; Code entry point: next instruction
dw_number_bkt_pfa:
	;; notes: #> ( w -- a n )
	;;        End conversion. Return string details.

	;; : #> ( d -- b u ) DROP HLD @ PAD OVER - ;

	.word dw_2DROP		; 2DROP ( )
	.word dw_HLD		; HLD ( va )
	.word dw_fetch		; @ ( a )
	.word dw_DUMPSTATE
	.word dw_HALT

	.word dw_PAD		; PAD ( a a2 )
	.word dw_OVER		; OVER ( a a2 a )
	.word dw_sub		; - ( a n )
	.word dw_EXIT		; EXIT



// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/3550_numformats.asm
//
///////////////////////////////////////////////////////////////////////////////


;; // -*- asm -*-
;; //
;; // rudimentary line editing and terminal buffering



	;; word:  _N$
	;; alias: _Nstr
	;; flags: DOCOL ROM CFT
        ;;   word _N$ defined in primitives/3550_numformats.asm:9.
//dwn__Nstr:
//        .strp "_N$" 0
dw__Nstr_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 4 ; Flags & hash
        .word dwn__Nstr         ; Pointer to word name (above)
        .word dw_number_bkt_head ; Link to previous dictionary entry
dw__Nstr:
        CFA_doCOL()       ; Code entry point: next instruction
dw__Nstr_pfa:
	;; notes: _N$ ( u -- b u )
	;;        Converts an integer to an unpacked string. Returns the string
	;;        address and length.

	.word dw_DUP		; DUP ( u u )
	.word dw_to_R		; >R ( u )
	.word dw_ABS		; ABS ( u )
	.word dw_U_bkt_number	; U<# ( u 0 )
	.word dw_number_s	; #S ( 0 0 )
	.word dw_R_from		; R> ( 0 0 u )
	.word dw_N_to_D		; N>D ( 0 0 d )
	.word dw_SIGN		; SIGN ( 0 0 )
	.word dw_number_bkt	; #> ( )
	.word dw_EXIT		; EXIT



	;; word:  _U$
	;; alias: _Ustr
	;; flags: DOCOL ROM CFT
        ;;   word _U$ defined in primitives/3550_numformats.asm:29.
//dwn__Ustr:
//        .strp "_U$" 0
dw__Ustr_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 4 ; Flags & hash
        .word dwn__Ustr         ; Pointer to word name (above)
        .word dw__Nstr_head     ; Link to previous dictionary entry
dw__Ustr:
        CFA_doCOL()       ; Code entry point: next instruction
dw__Ustr_pfa:
	;; notes: _U$ ( u -- b u )
	;;        Converts an unsigned integer to a string. Returns the string
	;;        address and length.

	.word dw_U_to_D		; U>D ( d )
	.word dw_branch
	.word _DUstr_jumpin



	;; word:  $DUstr
	;; alias: _DUstr
	;; flags: DOCOL ROM CFT
        ;;   word $DUstr defined in primitives/3550_numformats.asm:42.
//dwn__DUstr:
//        .strp "$DUSTR" 0
dw__DUstr_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn__DUstr        ; Pointer to word name (above)
        .word dw__Ustr_head     ; Link to previous dictionary entry
dw__DUstr:
        CFA_doCOL()       ; Code entry point: next instruction
dw__DUstr_pfa:
	;; notes: $DUstr ( d -- b u )
	;;        Converts an unsigned double integer to a string. Returns the string
	;;        address and length.

_DUstr_jumpin:
	.word dw_bkt_number	; <#
	.word dw_number_s	; #S
	.word dw_number_bkt	; #>
	.word dw_EXIT		; EXIT



	;; word:  _D$
	;; alias: _Dstr
	;; flags: DOCOL ROM CFT
        ;;   word _D$ defined in primitives/3550_numformats.asm:57.
//dwn__Dstr:
//        .strp "_D$" 0
dw__Dstr_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 4 ; Flags & hash
        .word dwn__Dstr         ; Pointer to word name (above)
        .word dw__DUstr_head    ; Link to previous dictionary entry
dw__Dstr:
        CFA_doCOL()       ; Code entry point: next instruction
dw__Dstr_pfa:
	;; notes: D$str ( d -- b u )
	;;        Converts a double integer to a signed string. Returns the string
	;;        address and length.

	.word dw_2DUP		; 2DUP ( dl dh dl dh )
	.word dw_to_R		; >R ( dl dh dl ) ( dh )
	.word dw_to_R		; >R ( dl dh ) ( dh dl )
	.word dw_DABS		; ABS ( dl dh )
	.word dw_bkt_number	; <# ( dl dh)
	.word dw_number_s	; #S ( 0 0 )
	.word dw_R_from		; R> ( 0 0 dl )
	.word dw_R_from		; R> ( 0 0 dl dh )
	.word dw_SIGN		; SIGN ( 0 0 )
	.word dw_number_bkt	; ># ( )
	.word dw_EXIT		; EXIT



	;; word:  BINARY
	;; flags: CODE ROM CFT
        ;;   word BINARY defined in primitives/3550_numformats.asm:77.
//dwn_BINARY:
//        .strp "BINARY" 0
dw_BINARY_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 4 ; Flags & hash
        .word dwn_BINARY        ; Pointer to word name (above)
        .word dw__Dstr_head     ; Link to previous dictionary entry
dw_BINARY:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_BINARY_pfa:
	;; notes: BINARY ( -- )
	;;   Set base 2.

	LSTOREUP(UAOFS_BASE, 2)
	NEXT



	;; word:  OCTAL
	;; flags: CODE ROM CFT
        ;;   word OCTAL defined in primitives/3550_numformats.asm:87.
//dwn_OCTAL:
//        .strp "OCTAL" 0
dw_OCTAL_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn_OCTAL         ; Pointer to word name (above)
        .word dw_BINARY_head    ; Link to previous dictionary entry
dw_OCTAL:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_OCTAL_pfa:
	;; notes: OCTAL ( -- )
	;;   Set base 8.

	LSTOREUP(UAOFS_BASE, 8)
	NEXT



	;; word:  DECIMAL
	;; flags: CODE ROM
        ;;   word DECIMAL defined in primitives/3550_numformats.asm:97.
//dwn_DECIMAL:
//        .strp "DECIMAL" 0
dw_DECIMAL_head:
        .word FFL_T_CODE FFL_ROM 3 ; Flags & hash
        .word dwn_DECIMAL       ; Pointer to word name (above)
        .word dw_OCTAL_head     ; Link to previous dictionary entry
dw_DECIMAL:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_DECIMAL_pfa:
	;; notes: DECIMAL ( -- )
	;;   Set base 10.

	LSTOREUP(UAOFS_BASE, 10)
	NEXT



	;; word:  HEX
	;; flags: CODE ROM
        ;;   word HEX defined in primitives/3550_numformats.asm:107.
//dwn_HEX:
//        .strp "HEX" 0
dw_HEX_head:
        .word FFL_T_CODE FFL_ROM 3 ; Flags & hash
        .word dwn_HEX           ; Pointer to word name (above)
        .word dw_DECIMAL_head   ; Link to previous dictionary entry
dw_HEX:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_HEX_pfa:
	;; notes: HEX ( -- )
	;;   Set base 16.

	LSTOREUP(UAOFS_BASE, 16)
	NEXT



	;; word:  .R
	;; alias: dot_r
	;; flags: DOCOL ROM CFT
        ;;   word .R defined in primitives/3550_numformats.asm:118.
//dwn_dot_r:
//        .strp ".R" 0
dw_dot_r_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 4 ; Flags & hash
        .word dwn_dot_r         ; Pointer to word name (above)
        .word dw_HEX_head       ; Link to previous dictionary entry
dw_dot_r:
        CFA_doCOL()       ; Code entry point: next instruction
dw_dot_r_pfa:
	;; notes: .R ( n +n -- )
	;;        Right-justify signed integer n in a field of +n characters.
	;;

	.word dw_to_R		; >R
	.word dw__Nstr		; _N$
	.word dw_R_from		; >R
	.word dw_OVER		; OVER
	.word dw_sub		; -
	.word dw_SPACES		; SPACES
	.word dw_TYPE		; TYPE
	.word dw_EXIT		; EXIT



	;; word:  .0R
	;; alias: dot_0r
	;; flags: DOCOL ROM CFT
        ;;   word .0R defined in primitives/3550_numformats.asm:136.
//dwn_dot_0r:
//        .strp ".0R" 0
dw_dot_0r_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 5 ; Flags & hash
        .word dwn_dot_0r        ; Pointer to word name (above)
        .word dw_dot_r_head     ; Link to previous dictionary entry
dw_dot_0r:
        CFA_doCOL()       ; Code entry point: next instruction
dw_dot_0r_pfa:
	;; notes: .0R ( n +n -- )
	;;        Zero-pad a signed integer n to a length of +n characters.
	;;

	.word dw_to_R		; >R
	.word dw__Nstr		; _N$
	.word dw_R_from		; >R
	.word dw_OVER		; OVER
	.word dw_sub		; -
	.word dw_ZEROES		; ZEROES
	.word dw_TYPE		; TYPE

	.word dw_EXIT		; EXIT



	;; word:  U.R
	;; alias: u_dot_r
	;; flags: DOCOL ROM CFT
        ;;   word U.R defined in primitives/3550_numformats.asm:155.
//dwn_u_dot_r:
//        .strp "U.R" 0
dw_u_dot_r_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 6 ; Flags & hash
        .word dwn_u_dot_r       ; Pointer to word name (above)
        .word dw_dot_0r_head    ; Link to previous dictionary entry
dw_u_dot_r:
        CFA_doCOL()       ; Code entry point: next instruction
dw_u_dot_r_pfa:
	;; notes: U.R ( u +n -- )
	;;        Right-justify unsigned integer u in a field of +n characters.
	;;

	.word dw_to_R		; >R
	doLIT(0)		; 0 \ set high cell
	.word dw_bkt_number	; <#
	.word dw_number_s	; #S
	.word dw_number_bkt	; #>
	.word dw_R_from		; R>
	.word dw_OVER		; OVER
	.word dw_sub		; -
	.word dw_SPACES		; SPACES
	.word dw_TYPE		; TYPE
	.word dw_EXIT		; EXIT



	;; word:  U.0R
	;; alias: u_dot_0r
	;; flags: DOCOL ROM CFT
        ;;   word U.0R defined in primitives/3550_numformats.asm:176.
//dwn_u_dot_0r:
//        .strp "U.0R" 0
dw_u_dot_0r_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 1 ; Flags & hash
        .word dwn_u_dot_0r      ; Pointer to word name (above)
        .word dw_u_dot_r_head   ; Link to previous dictionary entry
dw_u_dot_0r:
        CFA_doCOL()       ; Code entry point: next instruction
dw_u_dot_0r_pfa:
	;; notes: U.R ( u +n -- )
	;;        Zero-fill unsigned integer u to a length of +n characters.
	;;

	.word dw_to_R		; >R ( u )
	doLIT(0)		; 0 \ set high cell
	.word dw_bkt_number	; <#
	.word dw_number_s	; #S
	.word dw_number_bkt	; #> ( a n )
	.word dw_R_from		; R> ( a n u )
	.word dw_OVER		; OVER ( a n u n )
	.word dw_sub		; - ( a n pad )
	.word dw_ZEROES		; ZEROES ( a n )
	.word dw_TYPE		; TYPE ( )

	.word dw_EXIT		; EXIT



	;; word:  U.
	;; alias: u_dot
	;; flags: DOCOL ROM CFT
        ;;   word U. defined in primitives/3550_numformats.asm:198.
//dwn_u_dot:
//        .strp "U." 0
dw_u_dot_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 7 ; Flags & hash
        .word dwn_u_dot         ; Pointer to word name (above)
        .word dw_u_dot_0r_head  ; Link to previous dictionary entry
dw_u_dot:
        CFA_doCOL()       ; Code entry point: next instruction
dw_u_dot_pfa:
	;; notes: U. ( u -- )
	;;        Display an unsigned integer in free format
	;; code:  : U. ( u -- ) 0 DU. ;

	doLIT(0)
	.word dw_branch
	.word _DU_dot_jumpin



	;; word:  DU.
	;; alias: DU_dot
	;; flags: DOCOL ROM CFT
        ;;   word DU. defined in primitives/3550_numformats.asm:211.
//dwn_DU_dot:
//        .strp "DU." 0
dw_DU_dot_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 7 ; Flags & hash
        .word dwn_DU_dot        ; Pointer to word name (above)
        .word dw_u_dot_head     ; Link to previous dictionary entry
dw_DU_dot:
        CFA_doCOL()       ; Code entry point: next instruction
dw_DU_dot_pfa:
	;; notes: DU. ( d -- )
	;;        Display an unsigned double integer in free format
	;;

_DU_dot_jumpin:
	.word dw_bkt_number	; <#
	.word dw_number_s	; #S
	.word dw_number_bkt	; #>
	.word dw_SPACE		; SPACE
	.word dw_TYPE		; TYPE

	.word dw_EXIT		; EXIT



	;; word:  .
	;; alias: dot
	;; flags: DOCOL ROM CFT
        ;;   word . defined in primitives/3550_numformats.asm:229.
//dwn_dot:
//        .strp "." 0
dw_dot_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 7 ; Flags & hash
        .word dwn_dot           ; Pointer to word name (above)
        .word dw_DU_dot_head    ; Link to previous dictionary entry
dw_dot:
        CFA_doCOL()       ; Code entry point: next instruction
dw_dot_pfa:
	;; notes: . ( w -- )
	;;        Display a signed integer in free format
	;;
	;; src:   : . ( w -- ) BASE @ 10 XOR IF U. EXIT THEN $str SPACE TYPE ;

	.word dw_BASE		; BASE
	.word dw_fetch		; @
	.word dw_doLIT		; 10
	.word 10
	.word dw_XOR		; XOR
	.word dw_if_branch	; ?branch
	.word _dot_else
	.word dw_u_dot		; U.
	.word dw_EXIT		; EXIT
_dot_else:
	.word dw__Nstr		; _N$
	.word dw_SPACE		; SPACE
	.word dw_TYPE		; TYPE
	.word dw_EXIT		; EXIT



	;; word:  D.
	;; alias: D_dot
	;; flags: DOCOL ROM CFT
        ;;   word D. defined in primitives/3550_numformats.asm:254.
//dwn_D_dot:
//        .strp "D." 0
dw_D_dot_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 6 ; Flags & hash
        .word dwn_D_dot         ; Pointer to word name (above)
        .word dw_dot_head       ; Link to previous dictionary entry
dw_D_dot:
        CFA_doCOL()       ; Code entry point: next instruction
dw_D_dot_pfa:
	;; notes: D. ( d -- )
	;;        Display a signed double integer in free format
	;;
	;; src:   : D. ( w -- ) BASE @ 10 XOR IF U. EXIT THEN $str SPACE TYPE ;

	.word dw_BASE		; BASE
	.word dw_fetch		; @
	.word dw_doLIT		; 10
	.word 10
	.word dw_XOR		; XOR
	.word dw_if_branch	; ?branch
	.word _d_dot_else
	.word dw_DU_dot		; DU.
	.word dw_EXIT		; EXIT
_d_dot_else:
	.word dw__Dstr		; D$str
	.word dw_SPACE		; SPACE
	.word dw_TYPE		; TYPE
	.word dw_EXIT		; EXIT



// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/4000_interpreter.asm
//
///////////////////////////////////////////////////////////////////////////////


;; // -*- asm -*-
;; //
;; // INTERPRETER



	;; word:  .OK
	;; alias: dot-ok
	;; flags: DOCOL ROM CFT
        ;;   word .OK defined in primitives/4000_interpreter.asm:9.
//dwn_dot_ok:
//        .strp ".OK" 0
dw_dot_ok_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 5 ; Flags & hash
        .word dwn_dot_ok        ; Pointer to word name (above)
        .word dw_D_dot_head     ; Link to previous dictionary entry
dw_dot_ok:
        CFA_doCOL()       ; Code entry point: next instruction
dw_dot_ok_pfa:
	;; notes: .OK ( -- )
	;;   Print out the "ok " prompt.

	.word dw_STATE		; STATE
	.word dw_fetch		; @
	.word dw_if_branch
	.word _dot_ok_interpret

	.word dw_doLIT
	.word _dot_ok_compiled
	.word dw_typep0
	.word dw_EXIT

_dot_ok_interpret:
	.word dw_doLIT
	.word _dot_ok_prompt
	.word dw_typep0
	.word dw_EXIT

_dot_ok_prompt:
	.strp " ok" 10 0

_dot_ok_compiled:
	.strp " compiled" 10 0



	;; word:  _DONE
	;; alias: _DONE
	;; flags: DOCOL ROM CFT
        ;;   word _DONE defined in primitives/4000_interpreter.asm:39.
//dwn__DONE:
//        .strp "_DONE" 0
dw__DONE_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn__DONE         ; Pointer to word name (above)
        .word dw_dot_ok_head    ; Link to previous dictionary entry
dw__DONE:
        CFA_doCOL()       ; Code entry point: next instruction
dw__DONE_pfa:
	;; notes: _DONE ( -- )
	;;   	  Execution trampoline. Prints out "Done" and terminates.

	doLIT(1)
	.word dw_doABORT_str	; ABORT" trampoline"
	.word @+18
	.strp "trampoline error (bounce bounce)" 0



	;; word:  [
	;; alias: open-bkt
	;; flags: DOCOL ROM IMMEDIATE
        ;;   word [ defined in primitives/4000_interpreter.asm:52.
//dwn_open_bkt:
//        .strp "[" 0
dw_open_bkt_head:
        .word FFL_T_DOCOL FFL_ROM FFL_IMMEDIATE 2 ; Flags & hash
        .word dwn_open_bkt      ; Pointer to word name (above)
        .word dw__DONE_head     ; Link to previous dictionary entry
dw_open_bkt:
        CFA_doCOL()       ; Code entry point: next instruction
dw_open_bkt_pfa:
	;; notes: [ ( -- )
	;;        Enter interpreter mode.

	doLIT(FSF_INTERPRET)	; FSF_INTERPRET
	.word dw_STATE		; STATE
	.word dw_store		; !

	doLIT(dw_EVAL_INTERPRET) ; EVAL.INTERPRET
	.word dw_tick_EVAL	; 'EVAL
	.word dw_store		; !

	.word dw_EXIT



	;; word:  EVAL.INTERPRET
	;; flags: DOCOL ROM
        ;;   word EVAL.INTERPRET defined in primitives/4000_interpreter.asm:69.
//dwn_EVAL_INTERPRET:
//        .strp "EVAL.INTERPRET" 0
dw_EVAL_INTERPRET_head:
        .word FFL_T_DOCOL FFL_ROM 3 ; Flags & hash
        .word dwn_EVAL_INTERPRET ; Pointer to word name (above)
        .word dw_open_bkt_head  ; Link to previous dictionary entry
dw_EVAL_INTERPRET:
        CFA_doCOL()       ; Code entry point: next instruction
dw_EVAL_INTERPRET_pfa:
	;; notes: EVAL.INTERPRET ( a -- )
	;;        Interpret a token.

	// COUNT SWAP ( +n a ) \ Get the token length
	//.word dw_COUNT
	//.word dw_SWAP

	.word dw_FIND		; FIND ( word-addr u | token-addr FALSE )

	.word dw_if_DUP	        ; ?DUP ( token-addr u u | token-addr FALSE )
	.word dw_if_branch	; ( token-addr ) \ Not a word. Try a number
	.word _eval_interpret_num

	// DUP COMPILE-ONLY? ABORT" compile-only word" \ Check for a compilation-only word.
	.word dw_COMPILE_ONLYq
	.word dw_doABORT_str	; ABORT" compile-only word"
	.word @+10
	.strp "compile-only word" 0

	// EXECUTE \ Execute the word
	.word dw_EXECUTE
	.word dw_EXIT

_eval_interpret_num:
	.word dw_tick_NUMBER
	.word dw_fetch_EXECUTE
	.word dw_if_branch
	.word _eval_interpret_fail
	.word dw_EXIT

_eval_interpret_fail:
	.word dw_THROW
	.word dw_FAIL		; Should never reach this




	;; word:  ?STACK
	;; alias: qSTACK
	;; flags: DOCOL ROM IMMEDIATE
        ;;   word ?STACK defined in primitives/4000_interpreter.asm:109.
//dwn_qSTACK:
//        .strp "?STACK" 0
dw_qSTACK_head:
        .word FFL_T_DOCOL FFL_ROM FFL_IMMEDIATE 1 ; Flags & hash
        .word dwn_qSTACK        ; Pointer to word name (above)
        .word dw_EVAL_INTERPRET_head ; Link to previous dictionary entry
dw_qSTACK:
        CFA_doCOL()       ; Code entry point: next instruction
dw_qSTACK_pfa:
	;; notes: ?STACK ( -- )
	;;        Check for stack underflow, throw an exception if it's
	;;        detected.

	.word dw_DEPTH		; DEPTH
	.word dw_zero_less	; 0<

	.word dw_if_branch
	.word _underflow_ok

	;; SP0 @ SP! \ Reset the stack pointer
	.word dw_SP0
	.word dw_fetch
	.word dw_SP_store

	.word dw_doABORT_str	; ABORT" stack underflow"
	.word @+9
	.strp "stack underflow" 0

_underflow_ok:
	.word dw_EXIT



	;; word:  EVAL
	;; flags: DOCOL ROM
        ;;   word EVAL defined in primitives/4000_interpreter.asm:135.
//dwn_EVAL:
//        .strp "EVAL" 0
dw_EVAL_head:
        .word FFL_T_DOCOL FFL_ROM 1 ; Flags & hash
        .word dwn_EVAL          ; Pointer to word name (above)
        .word dw_qSTACK_head    ; Link to previous dictionary entry
dw_EVAL:
        CFA_doCOL()       ; Code entry point: next instruction
dw_EVAL_pfa:
	;; notes: EVAL ( -- )
	;;        Forth interpreter loop.

_eval_loop:
	;; TOKEN ?DUP (branch)  \ Parse a token, skip if end encountered
	.word dw_TOKEN
	.word dw_if_DUP
	.word dw_if_branch
	.word _eval_end

	;; 'EVAL @EXECUTE \ Execute the interpreter or compiler on this token
	.word dw_tick_EVAL
	.word dw_fetch_EXECUTE

	;; ?STACK \ Check for stack underflow
	.word dw_qSTACK

	.word dw_branch
	.word _eval_loop

_eval_end:
	.word dw_EXIT



	;; word:  .READY
	;; alias: dot_READY
	;; flags: DOCOL ROM
        ;;   word .READY defined in primitives/4000_interpreter.asm:163.
//dwn_dot_READY:
//        .strp ".READY" 0
dw_dot_READY_head:
        .word FFL_T_DOCOL FFL_ROM 0 ; Flags & hash
        .word dwn_dot_READY     ; Pointer to word name (above)
        .word dw_EVAL_head      ; Link to previous dictionary entry
dw_dot_READY:
        CFA_doCOL()       ; Code entry point: next instruction
dw_dot_READY_pfa:
	;; notes: .READY ( -- )
	;;        Print out the "Ready." prompt.

	.word dw_dot_str
	.word @+5
	.strp "Ready." 10 0
	.word dw_EXIT



	;; word:  INTERPRET
	;; flags: DOCOL ROM
        ;;   word INTERPRET defined in primitives/4000_interpreter.asm:175.
//dwn_INTERPRET:
//        .strp "INTERPRET" 0
dw_INTERPRET_head:
        .word FFL_T_DOCOL FFL_ROM 0 ; Flags & hash
        .word dwn_INTERPRET     ; Pointer to word name (above)
        .word dw_dot_READY_head ; Link to previous dictionary entry
dw_INTERPRET:
        CFA_doCOL()       ; Code entry point: next instruction
dw_INTERPRET_pfa:
	;; notes: INTERPRET ( -- )
	;;        Interpret a line of input.

	doLIT(dw_EVAL)
	.word dw_CATCH

	.word dw_if_DUP
	.word dw_if_branch
	.word _interpret_noerror

	;; \ Errors
	.word dw_typep0
	.word dw_dot_str
	.word @+4
	.strp "  ? " 0
	.word dw_QUIT		; NB: QUIT clears stacks etc, so this is a jump, not a call.

_interpret_noerror:
	.word dw_EXIT



	;; word:  QUIT
	;; flags: DOCOL ROM
        ;;   word QUIT defined in primitives/4000_interpreter.asm:199.
//dwn_QUIT:
//        .strp "QUIT" 0
dw_QUIT_head:
        .word FFL_T_DOCOL FFL_ROM 5 ; Flags & hash
        .word dwn_QUIT          ; Pointer to word name (above)
        .word dw_INTERPRET_head ; Link to previous dictionary entry
dw_QUIT:
        CFA_doCOL()       ; Code entry point: next instruction
dw_QUIT_pfa:
	;; notes: QUIT ( -- )
	;;        Enter the main Forth loop.

	;; Disable debugging
	.word dw_DEBUGOFF

	;; TODO: Select default input device
	;; 0 BLK ! \ Deselect loading from blocks.
	doLIT(0)
	.word dw_BLK
	.word dw_store

	;; TIBADDR TIB ! \ Reset the TIB
	.word dw_TIBADDR
	.word dw_TIB
	.word dw_store

	;; RP0 @ RP! \ Clear the return stack
	.word dw_RP0
	.word dw_fetch
	.word dw_RP_store

	;; SP0 @ SP! \ Clear the data stack
	.word dw_SP0
	.word dw_fetch
	.word dw_SP_store

	;; Print out the Ready. prompt
	.word dw_tick_dot_READY
	.word dw_fetch_EXECUTE

	;; [ \ Set interpreter state.
	.word dw_open_bkt

_quit_loop:
	;; '.PS1 @EXECUTE \ Print optional prompt.
	.word dw_tick_dot_PS1
	.word dw_fetch_EXECUTE

	;; QUERY \ Read one line of input
	.word dw_QUERY

	;; '.PS2 @EXECUTE \ Print optional prompt.
	.word dw_tick_dot_PS2
	.word dw_fetch_EXECUTE

	;; INTERPRET \ Interpret the line
	.word dw_INTERPRET

	;; Print ok prompt
	;; '.OK @EXECUTE
	.word dw_tick_dot_OK
	.word dw_fetch_EXECUTE


	;; Go again.
	.word dw_branch		; Loop again
	.word _quit_loop


;; // End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/4100_errors.asm
//
///////////////////////////////////////////////////////////////////////////////


;; // -*- asm -*-
;; //
;; // Error frames



	;; word:  CATCH
	;; flags: DOCOL ROM
        ;;   word CATCH defined in primitives/4100_errors.asm:8.
//dwn_CATCH:
//        .strp "CATCH" 0
dw_CATCH_head:
        .word FFL_T_DOCOL FFL_ROM 6 ; Flags & hash
        .word dwn_CATCH         ; Pointer to word name (above)
        .word dw_QUIT_head      ; Link to previous dictionary entry
dw_CATCH:
        CFA_doCOL()       ; Code entry point: next instruction
dw_CATCH_pfa:
	;; notes: CATCH ( a -- error | 0 )
	;;   	  Execute a in an error frame.

	;; SP@ R> \ Save the stack pointer on the return stack.
	.word dw_SP_fetch	; SP@ ( a sp )
	.word dw_to_R		; >R ( a )

	;; HANDLER @ >R \ Save the current handler on the return stack
	.word dw_HANDLER	; HANDLER ( a va )
	.word dw_fetch		; @ ( a handler )
	.word dw_to_R		; >R ( a )

	;; RP@ HANDLER ! \ Save the handler frame pointer in HANDLER
	.word dw_RP_fetch	; RP@ ( a rp )
	.word dw_HANDLER	; HANDLER ( a rp handler )
	.word dw_store		; ! ( a  )

	;; Execute the specified word.
	.word dw_EXECUTE	; EXECUTE ( )

	;; Normal return.
	.word dw_R_from		; R> ( handler )
	.word dw_HANDLER	; HANDLER ( handler va )
	.word dw_store		; ! ( )
	.word dw_RDROP		; RDROP ( )

	;; Push a no-error flag.
	doLIT(0)

	.word dw_EXIT		; Exit.



	;; word:  THROW
	;; flags: DOCOL ROM
        ;;   word THROW defined in primitives/4100_errors.asm:43.
//dwn_THROW:
//        .strp "THROW" 0
dw_THROW_head:
        .word FFL_T_DOCOL FFL_ROM 1 ; Flags & hash
        .word dwn_THROW         ; Pointer to word name (above)
        .word dw_CATCH_head     ; Link to previous dictionary entry
dw_THROW:
        CFA_doCOL()       ; Code entry point: next instruction
dw_THROW_pfa:
	;; notes: THROW ( error -- error )
	;;   	  Reset system to current local error frame and update error
	;;        flag.

	;; Latest error handler -> stack.
	;; HANDLER @ RP! ( error )
	.word dw_HANDLER
	.word dw_fetch
	.word dw_RP_store

	;; Restore latest error handler frame
	;; R> HANDLER ! ( error )
	.word dw_R_from
	.word dw_HANDLER
	.word dw_store

	;; R> SWAP >R
	.word dw_R_from
	.word dw_SWAP
	.word dw_to_R

	;; Restore the stack pointer.
	.word dw_SP_store
	.word dw_DROP
	.word dw_R_from

	.word dw_EXIT



	;; word:  pNULL
	;; flags: VARIABLE ROM
        ;;   word pNULL defined in primitives/4100_errors.asm:75.
//dwn_pNULL:
//        .strp "PNULL" 0
dw_pNULL_head:
        .word FFL_T_VAR FFL_ROM 5 ; Flags & hash
        .word dwn_pNULL         ; Pointer to word name (above)
        .word dw_THROW_head     ; Link to previous dictionary entry
dw_pNULL:
        CFA_doVAR()       ; Code entry point: next instruction
dw_pNULL_pfa:
	;; notes: pNULL ( -- a )
	;;   	  The address of an empty string. This string is empty if
	;;        interpreted as a counted string, as an unpacked null-
	;;        terminated string, or as a bit-packed null-terminated
	;;        string.

	.word @+1
	.word 0



	;; word:  ABORT
	;; flags: DOCOL ROM
        ;;   word ABORT defined in primitives/4100_errors.asm:88.
//dwn_ABORT:
//        .strp "ABORT" 0
dw_ABORT_head:
        .word FFL_T_DOCOL FFL_ROM 4 ; Flags & hash
        .word dwn_ABORT         ; Pointer to word name (above)
        .word dw_pNULL_head     ; Link to previous dictionary entry
dw_ABORT:
        CFA_doCOL()       ; Code entry point: next instruction
dw_ABORT_pfa:
	;; notes: ABORT ( -- )
	;;   	  Abort execution.

	.word dw_pNULL
	.word dw_THROW



	;; word:  doABORT"
	;; alias: doABORT_str
	;; flags: DOCOL ROM
        ;;   word doABORT" defined in primitives/4100_errors.asm:99.
//dwn_doABORT_str:
//        .strp "DOABORT\"" 0
dw_doABORT_str_head:
        .word FFL_T_DOCOL FFL_ROM 4 ; Flags & hash
        .word dwn_doABORT_str   ; Pointer to word name (above)
        .word dw_ABORT_head     ; Link to previous dictionary entry
dw_doABORT_str:
        CFA_doCOL()       ; Code entry point: next instruction
dw_doABORT_str_pfa:
	;; notes: doABORT" ( f -- )
	;;        If f is non-zero, abort returning a string error message.

	.word dw_if_branch	; ( f ) ?branch ( )
	.word _abort_str_no
	.word dw_do_str		; do$ ( a )
	.word dw_THROW		; THROW ( )

_abort_str_no:
	.word dw_do_str		; do$ ( a )
	.word dw_DROP		; DROP ( )
	.word dw_EXIT



;; // End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/5000_compiler.asm
//
///////////////////////////////////////////////////////////////////////////////


;; // -*- asm -*-
;; //
;; // The compiler



	;; word:  ALLOT
	;; flags: CODE ROM
        ;;   word ALLOT defined in primitives/5000_compiler.asm:8.
//dwn_ALLOT:
//        .strp "ALLOT" 0
dw_ALLOT_head:
        .word FFL_T_CODE FFL_ROM 4 ; Flags & hash
        .word dwn_ALLOT         ; Pointer to word name (above)
        .word dw_doABORT_str_head ; Link to previous dictionary entry
dw_ALLOT:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_ALLOT_pfa:
	;; notes: ALLOT ( w -- )
	;;   Allots w words on the dictionary, changes HERE accordingly.

	POP (SP)		; Pop value
	ADD CP			; Add to CP
	STORE CP		; Store it
	NEXT



	;; word:  HERE!
	;; alias: HERE_store
	;; flags: CODE ROM
        ;;   word HERE! defined in primitives/5000_compiler.asm:21.
//dwn_HERE_store:
//        .strp "HERE!" 0
dw_HERE_store_head:
        .word FFL_T_CODE FFL_ROM 5 ; Flags & hash
        .word dwn_HERE_store    ; Pointer to word name (above)
        .word dw_ALLOT_head     ; Link to previous dictionary entry
dw_HERE_store:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_HERE_store_pfa:
	;; notes: HERE! ( w -- )
	;;        Set HERE explicitly.

	RPOP (CP, SP)		; CP = Pop value
	NEXT



	;; word:  ,
	;; alias: comma
	;; flags: CODE ROM
        ;;   word , defined in primitives/5000_compiler.asm:32.
//dwn_comma:
//        .strp "," 0
dw_comma_head:
        .word FFL_T_CODE FFL_ROM 5 ; Flags & hash
        .word dwn_comma         ; Pointer to word name (above)
        .word dw_HERE_store_head ; Link to previous dictionary entry
dw_comma:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_comma_pfa:
	;; notes: , ( w -- )
	;;        Allots space for w, then stores word at HERE 1-.

	LOAD CP
	POP (SP)		; Pop value
	STORE I CP		; CP autoincrements.
	NEXT



	;; word:  [CHAR]
	;; alias: bkt-CHAR-bkt
	;; flags: DOCOL ROM CFT COMPILE IMMEDIATE
        ;;   word [CHAR] defined in primitives/5000_compiler.asm:45.
//dwn_bkt_CHAR_bkt:
//        .strp "[CHAR]" 0
dw_bkt_CHAR_bkt_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT FFL_COMPILE FFL_IMMEDIATE 5 ; Flags & hash
        .word dwn_bkt_CHAR_bkt  ; Pointer to word name (above)
        .word dw_comma_head     ; Link to previous dictionary entry
dw_bkt_CHAR_bkt:
        CFA_doCOL()       ; Code entry point: next instruction
dw_bkt_CHAR_bkt_pfa:
	;; notes: [CHAR] ( -- )
	;;        Parse a space-delimited token and compile it.

	.word dw_CHAR		; CHAR
	doLIT(dw_doLIT_pfa)	; [COMPILE] doLIT
	.word dw_comma
	.word dw_comma
	.word dw_EXIT		; EXIT



	;; word:  [']
	;; alias: bkt-tick-bkt
	;; flags: DOCOL ROM IMMEDIATE
        ;;   word ['] defined in primitives/5000_compiler.asm:59.
//dwn_bkt_tick_bkt:
//        .strp "[']" 0
dw_bkt_tick_bkt_head:
        .word FFL_T_DOCOL FFL_ROM FFL_IMMEDIATE 0 ; Flags & hash
        .word dwn_bkt_tick_bkt  ; Pointer to word name (above)
        .word dw_bkt_CHAR_bkt_head ; Link to previous dictionary entry
dw_bkt_tick_bkt:
        CFA_doCOL()       ; Code entry point: next instruction
dw_bkt_tick_bkt_pfa:
	;; notes: ['] ( -- )
	;;   	  Compiles the next word literally (even immediate words).

	.word dw_tick		; ' ( a )
	doLIT(dw_doLIT_pfa)	; [COMPILE] doLIT
	.word dw_comma
	.word dw_comma		; , ( )
	.word dw_EXIT



	;; word:  [COMPILE]
	;; alias: bkt-COMPILE-bkt
	;; flags: DOCOL ROM IMMEDIATE
        ;;   word [COMPILE] defined in primitives/5000_compiler.asm:73.
//dwn_bkt_COMPILE_bkt:
//        .strp "[COMPILE]" 0
dw_bkt_COMPILE_bkt_head:
        .word FFL_T_DOCOL FFL_ROM FFL_IMMEDIATE 2 ; Flags & hash
        .word dwn_bkt_COMPILE_bkt ; Pointer to word name (above)
        .word dw_bkt_tick_bkt_head ; Link to previous dictionary entry
dw_bkt_COMPILE_bkt:
        CFA_doCOL()       ; Code entry point: next instruction
dw_bkt_COMPILE_bkt_pfa:
	;; notes: [COMPILE] ( -- )
	;;   	  Compiles the next word literally (even immediate words).

	.word dw_tick		; ' ( a )
	.word dw_comma		; , ( )
	.word dw_EXIT



	;; word:  COMPILE
	;; flags: DOCOL ROM
        ;;   word COMPILE defined in primitives/5000_compiler.asm:84.
//dwn_COMPILE:
//        .strp "COMPILE" 0
dw_COMPILE_head:
        .word FFL_T_DOCOL FFL_ROM 4 ; Flags & hash
        .word dwn_COMPILE       ; Pointer to word name (above)
        .word dw_bkt_COMPILE_bkt_head ; Link to previous dictionary entry
dw_COMPILE:
        CFA_doCOL()       ; Code entry point: next instruction
dw_COMPILE_pfa:
	;; notes: COMPILE ( -- )
	;;   	  Compiles the next word.

	.word dw_R_from		; R> ( a )
	.word dw_DUP		; DUP ( a a )
	.word dw_fetch		; @ ( a va )
	.word dw_comma		; , ( a )
	.word dw_cell_inc	; CELL+ ( a+1 )
	.word dw_to_R		; >R ( )
	.word dw_EXIT



	;; word:  LITERAL
	;; flags: DOCOL ROM IMMEDIATE
        ;;   word LITERAL defined in primitives/5000_compiler.asm:99.
//dwn_LITERAL:
//        .strp "LITERAL" 0
dw_LITERAL_head:
        .word FFL_T_DOCOL FFL_ROM FFL_IMMEDIATE 3 ; Flags & hash
        .word dwn_LITERAL       ; Pointer to word name (above)
        .word dw_COMPILE_head   ; Link to previous dictionary entry
dw_LITERAL:
        CFA_doCOL()       ; Code entry point: next instruction
dw_LITERAL_pfa:
	;; notes: LITERAL ( -- )
	;;   	  Compiles doLIT, which puts a word on the stack.

	.word dw_COMPILE	; COMPILE
	.word dw_doLIT
	.word dw_comma		; , ( a )
	.word dw_EXIT



	;; word:  ,"
	;; alias: comma_str
	;; flags: DOCOL ROM
        ;;   word ," defined in primitives/5000_compiler.asm:112.
//dwn_comma_str:
//        .strp ",\"" 0
dw_comma_str_head:
        .word FFL_T_DOCOL FFL_ROM 6 ; Flags & hash
        .word dwn_comma_str     ; Pointer to word name (above)
        .word dw_LITERAL_head   ; Link to previous dictionary entry
dw_comma_str:
        CFA_doCOL()       ; Code entry point: next instruction
dw_comma_str_pfa:
	;; notes: ," ( -- )
	;;   	  Parses a string and compiles its length followed by its packed,
	;;        null-terminated representation.

	;; CHAR " PARSE \ Parse a string
	doLIT(34)		; CHAR "
	.word dw_PARSE		; PARSE ( b u )

	;; Ensure a string was parsed correctly
	.word dw_DUP		; DUP ( b u u )
	.word dw_if_branch	; ( b u )
	.word _comma_quote_empty

	;; HERE 1+ $cPACK \ Pack the string starting at HERE+1.
	.word dw_HERE		; HERE ( b u a )
	.word dw_inc		; 1+ ( b u a+1 )
	.word dw__cPACK		; $cPACK ( a3 a4 )

	;; DUP HERE ! \ Store the a4 address (last packed string address + 1)
	.word dw_DUP		; DUP ( a3 a4 a4 )
	.word dw_HERE		; HERE ( a3 a4 a4 a )
	.word dw_store		; ! ( a3 a4 )

	;; HERE! DROP \ Update the dictionary pointer
	.word dw_HERE_store	; HERE! ( a3 )
	.word dw_DROP		; ( )

	.word dw_EXIT

_comma_quote_empty:
	.word dw_doABORT_str	; ABORT" unmatched quote"
	.word @+9
	.strp "unmatched quote" 0



	;; word:  ABORT"
	;; alias: ABORT_str
	;; flags: DOCOL ROM IMMEDIATE
        ;;   word ABORT" defined in primitives/5000_compiler.asm:151.
//dwn_ABORT_str:
//        .strp "ABORT\"" 0
dw_ABORT_str_head:
        .word FFL_T_DOCOL FFL_ROM FFL_IMMEDIATE 7 ; Flags & hash
        .word dwn_ABORT_str     ; Pointer to word name (above)
        .word dw_comma_str_head ; Link to previous dictionary entry
dw_ABORT_str:
        CFA_doCOL()       ; Code entry point: next instruction
dw_ABORT_str_pfa:
	;; notes: ABORT" ( -- )
	;;   	  Compile a doABORT" that aborts execution with a string error message.

	.word dw_COMPILE
	.word dw_doABORT_str
	.word dw_comma_str
	.word dw_EXIT



	;; word:  HASH
	;; alias: HASH
	;; flags: DOCOL ROM CFT
        ;;   word HASH defined in primitives/5000_compiler.asm:164.
//dwn_HASH:
//        .strp "HASH" 0
dw_HASH_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 4 ; Flags & hash
        .word dwn_HASH          ; Pointer to word name (above)
        .word dw_ABORT_str_head ; Link to previous dictionary entry
dw_HASH:
        CFA_doCOL()       ; Code entry point: next instruction
dw_HASH_pfa:
	;; notes: HASH ( u a -- u )
	;;        Calculates a dictionary hash. The hash is the
	;;        first character at address a XOR the length u. Only the first 3 bits
	;;        are used.
	;; code:  ,HASH ( u a -- u ) @ XOR 7 AND , ;

	;;  Generate the hash: (strlen(s) ^ s[0]) & 7
	;; XOR I TMP5		; AC = len ^ s[0]
	;; AND _find_hash_mask	; AC = AC & 7
	;; STORE TMP3

	.word dw_fetch
	.word dw_XOR
	doLIT(FFL_HASHMASK)
	.word dw_AND
	.word dw_EXIT



	;; word:  ,HEAD
	;; alias: comma_HEAD
	;; flags: DOCOL ROM CFT
        ;;   word ,HEAD defined in primitives/5000_compiler.asm:186.
//dwn_comma_HEAD:
//        .strp ",HEAD" 0
dw_comma_HEAD_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 1 ; Flags & hash
        .word dwn_comma_HEAD    ; Pointer to word name (above)
        .word dw_HASH_head      ; Link to previous dictionary entry
dw_comma_HEAD:
        CFA_doCOL()       ; Code entry point: next instruction
dw_comma_HEAD_pfa:
	;; notes: ,HEAD ( a -- head )
	;;        Compile the head of a new definition. Return its address.
	;; code:  : ,HEAD ( a -- a ) CCOUNT DUP ALLOT DUP >R OVER HASH , R> ;

	.word dw_COUNT		; COUNT ( name len )
	.word dw_DUP		; DUP ( name len len )
	.word dw_to_CCOUNT	; >CCOUNT ( name len cells )
	.word dw_ALLOT		; ALLOT ( name len ) \ Allocate space for the string

	;; HERE now points to the head of the new entry. REVEAL will need this.
	.word dw_HERE		; DUP ( name len head )
	.word dw_to_R		; >R ( name len )

	;; Compile the flags and dictionary hash value.
	.word dw_OVER		; OVER ( name len name )
	.word dw_HASH		; HASH ( name hash )
	.word dw_comma		; , ( name )

	;; Compile the name string pointer
	.word dw_comma		; ,

	;; Return the head pointer
	.word dw_R_from		; R> ( head )
	.word dw_EXIT



	;; word:  ,CFA
	;; alias: comma_CFA
	;; flags: DOCOL ROM CFT
        ;;   word ,CFA defined in primitives/5000_compiler.asm:216.
//dwn_comma_CFA:
//        .strp ",CFA" 0
dw_comma_CFA_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 0 ; Flags & hash
        .word dwn_comma_CFA     ; Pointer to word name (above)
        .word dw_comma_HEAD_head ; Link to previous dictionary entry
dw_comma_CFA:
        CFA_doCOL()       ; Code entry point: next instruction
dw_comma_CFA_pfa:
	;; notes: ,CFA ( a -- )
	;;        Compile a jump to a vectored codeword at address a.
	;; code:  : ,CFA ( a -- a ) CCOUNT DUP ALLOT DUP >R OVER ,HASH , R> ;

	doLIT(&7c00)		; CFT Assembly: JSR I R
	.word dw_OR		; OR
	.word dw_comma		; ,
	.word dw_EXIT		; EXIT



	;; word:  REVEAL
	;; flags: DOCOL ROM CFT
        ;;   word REVEAL defined in primitives/5000_compiler.asm:229.
//dwn_REVEAL:
//        .strp "REVEAL" 0
dw_REVEAL_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 4 ; Flags & hash
        .word dwn_REVEAL        ; Pointer to word name (above)
        .word dw_comma_CFA_head ; Link to previous dictionary entry
dw_REVEAL:
        CFA_doCOL()       ; Code entry point: next instruction
dw_REVEAL_pfa:
	;; notes: REVEAL ( a -- )
	;;        Link the dictionary entry at address a to the CURRENT vocabulary.
	;; code:  : REVEAL ( a -- ) CURRENT@ ! ;

	.word dw_CURRENT_fetch	; CURRENT@
	.word dw_store		; !
	.word dw_EXIT		; EXIT



	;; word:  WORDFLAG
	;; flags: DOCOL ROM CFT
        ;;   word WORDFLAG defined in primitives/5000_compiler.asm:241.
//dwn_WORDFLAG:
//        .strp "WORDFLAG" 0
dw_WORDFLAG_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 7 ; Flags & hash
        .word dwn_WORDFLAG      ; Pointer to word name (above)
        .word dw_REVEAL_head    ; Link to previous dictionary entry
dw_WORDFLAG:
        CFA_doCOL()       ; Code entry point: next instruction
dw_WORDFLAG_pfa:
	;; notes: WORDFLAG ( u -- )
	;;        Or u with the flags of the most recently defined word.
	;; code:  : WORDFLAG ( u -- ) CURRENT@ DUP @

	.word dw_CURRENT_fetch	; CURRENT@ ( u a )
	.word dw_fetch
	.word dw_set_FLAG_store ; +FLAG! ( )
	.word dw_EXIT		; EXIT



	;; word:  WORDCFA
	;; flags: DOCOL ROM
        ;;   word WORDCFA defined in primitives/5000_compiler.asm:254.
//dwn_WORDCFA:
//        .strp "WORDCFA" 0
dw_WORDCFA_head:
        .word FFL_T_DOCOL FFL_ROM 0 ; Flags & hash
        .word dwn_WORDCFA       ; Pointer to word name (above)
        .word dw_WORDFLAG_head  ; Link to previous dictionary entry
dw_WORDCFA:
        CFA_doCOL()       ; Code entry point: next instruction
dw_WORDCFA_pfa:
	;; notes: WORDCFA ( a -- )
	;;        Change the CFA of the most recently defined word.

	.word dw_CURRENT_fetch	; CURRENT@ ( a a )
	.word dw_fetch		; @ ( a head )
	doLIT(3)
	.word dw_add		; 3 + ( a head+3 )
	.word dw_store		; !
	.word dw_EXIT		; EXIT



	;; word:  IMMEDIATE
	;; flags: DOCOL ROM CFT
        ;;   word IMMEDIATE defined in primitives/5000_compiler.asm:268.
//dwn_IMMEDIATE:
//        .strp "IMMEDIATE" 0
dw_IMMEDIATE_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 0 ; Flags & hash
        .word dwn_IMMEDIATE     ; Pointer to word name (above)
        .word dw_WORDCFA_head   ; Link to previous dictionary entry
dw_IMMEDIATE:
        CFA_doCOL()       ; Code entry point: next instruction
dw_IMMEDIATE_pfa:
	;; notes: IMMEDIATE ( -- )
	;;        Set the IMMEDIATE flag for the recently defined word.

	doLIT(FFL_IMMEDIATE)
	.word dw_WORDFLAG
	.word dw_EXIT		; EXIT



	;; word:  COMPILE-ONLY
	;; flags: DOCOL ROM CFT
        ;;   word COMPILE-ONLY defined in primitives/5000_compiler.asm:279.
//dwn_COMPILE_ONLY:
//        .strp "COMPILE-ONLY" 0
dw_COMPILE_ONLY_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 7 ; Flags & hash
        .word dwn_COMPILE_ONLY  ; Pointer to word name (above)
        .word dw_IMMEDIATE_head ; Link to previous dictionary entry
dw_COMPILE_ONLY:
        CFA_doCOL()       ; Code entry point: next instruction
dw_COMPILE_ONLY_pfa:
	;; notes: COMPILE-ONLY ( -- )
	;;        Set the COMPILE-ONLY flag for the recently defined word.

	doLIT(FFL_COMPILE)
	.word dw_WORDFLAG
	.word dw_EXIT		; EXIT



	;; word:  'doCOL
	;; alias: tick_doCOL
	;; flags: CONST ROM CFT
        ;;   word 'doCOL defined in primitives/5000_compiler.asm:291.
//dwn_tick_doCOL:
//        .strp "'DOCOL" 0
dw_tick_doCOL_head:
        .word FFL_T_CONST FFL_ROM FFL_CFT 1 ; Flags & hash
        .word dwn_tick_doCOL    ; Pointer to word name (above)
        .word dw_COMPILE_ONLY_head ; Link to previous dictionary entry
dw_tick_doCOL:
        CFA_doCONST()     ; Code entry point: next instruction
dw_tick_doCOL_pfa:
	;; notes: 'doCOL ( a -- )
	;;        The address of the doCOL CFA.

	.word @_vector_table+VTOFS_doCOL



	;; word:  'doVAR
	;; alias: tick_doVAR
	;; flags: CONST ROM CFT
        ;;   word 'doVAR defined in primitives/5000_compiler.asm:301.
//dwn_tick_doVAR:
//        .strp "'DOVAR" 0
dw_tick_doVAR_head:
        .word FFL_T_CONST FFL_ROM FFL_CFT 1 ; Flags & hash
        .word dwn_tick_doVAR    ; Pointer to word name (above)
        .word dw_tick_doCOL_head ; Link to previous dictionary entry
dw_tick_doVAR:
        CFA_doCONST()     ; Code entry point: next instruction
dw_tick_doVAR_pfa:
	;; notes: 'doVAR ( a -- )
	;;        The address of the doVAR CFA.

	.word @_vector_table+VTOFS_doVAR



	;; word:  'doCONST
	;; alias: tick_doCONST
	;; flags: CONST ROM CFT
        ;;   word 'doCONST defined in primitives/5000_compiler.asm:311.
//dwn_tick_doCONST:
//        .strp "'DOCONST" 0
dw_tick_doCONST_head:
        .word FFL_T_CONST FFL_ROM FFL_CFT 7 ; Flags & hash
        .word dwn_tick_doCONST  ; Pointer to word name (above)
        .word dw_tick_doVAR_head ; Link to previous dictionary entry
dw_tick_doCONST:
        CFA_doCONST()     ; Code entry point: next instruction
dw_tick_doCONST_pfa:
	;; notes: 'doCONST ( a -- )
	;;        The address of the doCONST CFA.

	.word @_vector_table+VTOFS_doCONST



	;; word:  'do2CONST
	;; alias: tick_do2CONST
	;; flags: CONST ROM CFT
        ;;   word 'do2CONST defined in primitives/5000_compiler.asm:321.
//dwn_tick_do2CONST:
//        .strp "'DO2CONST" 0
dw_tick_do2CONST_head:
        .word FFL_T_CONST FFL_ROM FFL_CFT 6 ; Flags & hash
        .word dwn_tick_do2CONST ; Pointer to word name (above)
        .word dw_tick_doCONST_head ; Link to previous dictionary entry
dw_tick_do2CONST:
        CFA_doCONST()     ; Code entry point: next instruction
dw_tick_do2CONST_pfa:
	;; notes: 'do2CONST ( a -- )
	;;        The address of the do2CONST CFA.

	.word @_vector_table+VTOFS_do2CONST



	;; word:  'doUSER
	;; alias: tick_doUSER
	;; flags: CONST ROM CFT
        ;;   word 'doUSER defined in primitives/5000_compiler.asm:331.
//dwn_tick_doUSER:
//        .strp "'DOUSER" 0
dw_tick_doUSER_head:
        .word FFL_T_CONST FFL_ROM FFL_CFT 0 ; Flags & hash
        .word dwn_tick_doUSER   ; Pointer to word name (above)
        .word dw_tick_do2CONST_head ; Link to previous dictionary entry
dw_tick_doUSER:
        CFA_doCONST()     ; Code entry point: next instruction
dw_tick_doUSER_pfa:
	;; notes: 'doUSER ( a -- )
	;;        The address of the doUSER CFA.

	.word @_vector_table+VTOFS_doUSER



	;; word:  EVAL.COMPILE
	;; flags: DOCOL ROM
        ;;   word EVAL.COMPILE defined in primitives/5000_compiler.asm:340.
//dwn_EVAL_COMPILE:
//        .strp "EVAL.COMPILE" 0
dw_EVAL_COMPILE_head:
        .word FFL_T_DOCOL FFL_ROM 1 ; Flags & hash
        .word dwn_EVAL_COMPILE  ; Pointer to word name (above)
        .word dw_tick_doUSER_head ; Link to previous dictionary entry
dw_EVAL_COMPILE:
        CFA_doCOL()       ; Code entry point: next instruction
dw_EVAL_COMPILE_pfa:
	;; notes: EVAL.COMPILE ( a -- )
	;;        Compile a token

	.word dw_FIND		; FIND ( word-addr u | token-addr FALSE )

	.word dw_if_DUP	        ; ?DUP ( token-addr u u | token-addr FALSE )
	.word dw_if_branch	; ( token-addr ) \ Not a word. Try a number
	.word _eval_compile_num

	;; 1 = \ Check for immediate words (FIND returns 1)
	.word dw_IMMEDIATEq	; IMMEDIATE?
	.word dw_if_branch	; branch... ( token-addr )
	.word _eval_compile_word

	;; ( token-addr ) EXECUTE \ The word is immediate. Execute it.
	.word dw_EXECUTE
	.word dw_EXIT

_eval_compile_word:
	;; (token-addr) , \ Non-immediate word. Compile it.
	.word dw_comma		; ,
	.word dw_EXIT

_eval_compile_num:
	;; ( token-addr ) 'NUMBER @EXECUTE ,
	.word dw_tick_NUMBER	; 'NUMBER ( token-addr )
	.word dw_fetch_EXECUTE	; @EXECUTE ( num true | token-addr false )
	.word dw_if_branch
	.word _eval_compile_fail
	doLIT(dw_doLIT_pfa)	; [COMPILE] doLIT
	.word dw_comma
	.word dw_comma		; , ( )
	.word dw_EXIT

_eval_compile_fail:
	.word dw_THROW		; ( token-addr )
	.word dw_FAIL		; Should never reach this



	;; word:  ]
	;; alias: close-bkt
	;; flags: DOCOL ROM IMMEDIATE
        ;;   word ] defined in primitives/5000_compiler.asm:383.
//dwn_close_bkt:
//        .strp "]" 0
dw_close_bkt_head:
        .word FFL_T_DOCOL FFL_ROM FFL_IMMEDIATE 4 ; Flags & hash
        .word dwn_close_bkt     ; Pointer to word name (above)
        .word dw_EVAL_COMPILE_head ; Link to previous dictionary entry
dw_close_bkt:
        CFA_doCOL()       ; Code entry point: next instruction
dw_close_bkt_pfa:
	;; notes: ] ( -- )
	;;        Enter compiler mode.

	doLIT(FSF_COMPILE)	; FSF_COMPILE
	.word dw_STATE		; STATE
	.word dw_store		; !

	doLIT(dw_EVAL_COMPILE)	; EVAL.COMPILE
	.word dw_tick_EVAL	; 'EVAL
	.word dw_store		; !

	.word dw_EXIT



	;; word:  :
	;; alias: colon
	;; flags: DOCOL ROM
        ;;   word : defined in primitives/5000_compiler.asm:401.
//dwn_colon:
//        .strp ":" 0
dw_colon_head:
        .word FFL_T_DOCOL FFL_ROM 3 ; Flags & hash
        .word dwn_colon         ; Pointer to word name (above)
        .word dw_close_bkt_head ; Link to previous dictionary entry
dw_colon:
        CFA_doCOL()       ; Code entry point: next instruction
dw_colon_pfa:
	;; notes: : ( -- head )
	;;        Begins compilation of the next token.
	;;        Leaves the head of the word definition on the stack.

	;; TOKEN ,HEAD \ Begin the entry head
	.word dw_TOKEN
	.word dw_comma_HEAD	; ( head )

	;; CURRENT , \ Compile the link to the previous definition.
	.word dw_CURRENT_fetch	; CURRENT@
	.word dw_fetch		; @
	.word dw_comma		; ( head )

	;; 'doVAR ,CFA \ Compile the code word. This needs some assembly.
	.word dw_tick_doCOL	; 'doCOL
	.word dw_comma_CFA	; ,CFA ( head )

	;; Switch to the compiler
	.word dw_close_bkt	; ] ( head )

	.word dw_EXIT



	;; word:  ;
	;; alias: semicolon
	;; flags: DOCOL ROM IMMEDIATE COMPILE
        ;;   word ; defined in primitives/5000_compiler.asm:428.
//dwn_semicolon:
//        .strp ";" 0
dw_semicolon_head:
        .word FFL_T_DOCOL FFL_ROM FFL_IMMEDIATE FFL_COMPILE 2 ; Flags & hash
        .word dwn_semicolon     ; Pointer to word name (above)
        .word dw_colon_head     ; Link to previous dictionary entry
dw_semicolon:
        CFA_doCOL()       ; Code entry point: next instruction
dw_semicolon_pfa:
	;; notes: ; ( -- )
	;;        Ends compilation and returns to the interpreter.
	;; code:  [ ' EXIT ] , REVEAL [

	doLIT(dw_EXIT)		; COMPILE EXIT ( a )
	.word dw_comma		; , ( )
	.word dw_REVEAL		; REVEAL ( ) \ link the last definition
	.word dw_open_bkt	; [ ( ) \ Enter the interpreter
	.word dw_EXIT



;; // End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/5100_defs.asm
//
///////////////////////////////////////////////////////////////////////////////


;; // -*- asm -*-
;; //
;; // Defining words



	;; word:  DTP
	;; flags: CONST ROM
        ;;   word DTP defined in primitives/5100_defs.asm:8.
//dwn_DTP:
//        .strp "DTP" 0
dw_DTP_head:
        .word FFL_T_CONST FFL_ROM 7 ; Flags & hash
        .word dwn_DTP           ; Pointer to word name (above)
        .word dw_semicolon_head ; Link to previous dictionary entry
dw_DTP:
        CFA_doCONST()     ; Code entry point: next instruction
dw_DTP_pfa:
	;; notes: DTP ( -- a )
	;;        The address of the DOES> jumptable register.

	.word @DTP&&3ff



	;; word:  DTPMAX
	;; alias: DTPMAX
	;; flags: CONST ROM
        ;;   word DTPMAX defined in primitives/5100_defs.asm:18.
//dwn_DTPMAX:
//        .strp "DTPMAX" 0
dw_DTPMAX_head:
        .word FFL_T_CONST FFL_ROM 2 ; Flags & hash
        .word dwn_DTPMAX        ; Pointer to word name (above)
        .word dw_DTP_head       ; Link to previous dictionary entry
dw_DTPMAX:
        CFA_doCONST()     ; Code entry point: next instruction
dw_DTPMAX_pfa:
	;; notes: DTPMAX ( -- +n )
	;;        The maximum value of the DTP (plus one).

	.word _does_table_end



	;; word:  DTP?
	;; alias: DTPq
	;; flags: DOCOL ROM
        ;;   word DTP? defined in primitives/5100_defs.asm:28.
//dwn_DTPq:
//        .strp "DTP?" 0
dw_DTPq_head:
        .word FFL_T_DOCOL FFL_ROM 0 ; Flags & hash
        .word dwn_DTPq          ; Pointer to word name (above)
        .word dw_DTPMAX_head    ; Link to previous dictionary entry
dw_DTPq:
        CFA_doCOL()       ; Code entry point: next instruction
dw_DTPq_pfa:
	;; notes: DTP? ( -- )
	;;        Abort if the DOES> jumptable is out of space.
	;; code:  : DTP? ( -- ) DTP @ DTPMAX >= ABORT" DOES> jumptable full" ;

	.word dw_DTP
	.word dw_fetch
	.word dw_DTPMAX
	.word dw_geq
	.word dw_doABORT_str	; ABORT" unmatched quote"
	.word @+12
	.strp "DOES> jumptable full" 0
	.word dw_EXIT



	;; word:  >DTP
	;; alias: to_DTP
	;; flags: CODE ROM CFT
        ;;   word >DTP defined in primitives/5100_defs.asm:46.
//dwn_to_DTP:
//        .strp ">DTP" 0
dw_to_DTP_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn_to_DTP        ; Pointer to word name (above)
        .word dw_DTPq_head      ; Link to previous dictionary entry
dw_to_DTP:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_to_DTP_pfa:
	;; notes: >DTP ( n -- a )
	;;        Stores n at the next available DOES> table register. Returns the value of that register.

	SPEEK(SP)		; Peek TOS
	STORE TMP1		; Keep it for later
	LOAD DTP		; Get current value of DTP
	OR _to_DTP_data		; Add the instruction template
	SPOKE0(SP)		; Put it at TOS
	RMOV(I DTP, TMP1)	; mem[DTP++] = TMP1
	NEXT
_to_DTP_data:
	.word JSR I R		; The base of the CFA (instruction without operand)



	;; word:  DOES>
	;; flags: DOCOL ROM IMMEDIATE COMPILE
        ;;   word DOES> defined in primitives/5100_defs.asm:63.
//dwn_DOES_:
//        .strp "DOES>" 0
dw_DOES__head:
        .word FFL_T_DOCOL FFL_ROM FFL_IMMEDIATE FFL_COMPILE 1 ; Flags & hash
        .word dwn_DOES_         ; Pointer to word name (above)
        .word dw_to_DTP_head    ; Link to previous dictionary entry
dw_DOES_:
        CFA_doCOL()       ; Code entry point: next instruction
dw_DOES__pfa:
	;; notes: DOES> ( -- )
	;;

	// TODO: code this
	.word dw_HERE		; TODO: adjust it
	doLIT(4)
	.word dw_add		; 3 + (one cell after the code we compile here)

	.word dw_to_DTP		; >DTP ( cfa )
	doLIT(dw_doLIT)	        ; [COMPILE] doLIT ( cfa ) \ +0: LITERAL
	.word dw_comma
	.word dw_comma		; , ( ) \                     +1: cfa
	doLIT(dw_WORDCFA)	; [COMPILE] WORDCFA
	.word dw_comma		; \                           +2: WORDCFA
	doLIT(dw_EXIT)		; [COMPILE] EXIT
	.word dw_comma		; \                           +3: EXIT

	;; This is HERE+3, which is where the DOES> CFA JSRs to.
	doLIT(TRAP I R vec_doDOES) ; Compile assembly: TRAP I R vec_DOCOL
	.word dw_comma

	.word dw_EXIT



	;; word:  ,ENTRY
	;; alias: comma_ENTRY
	;; flags: DOCOL ROM CFT
        ;;   word ,ENTRY defined in primitives/5100_defs.asm:91.
//dwn_comma_ENTRY:
//        .strp ",ENTRY" 0
dw_comma_ENTRY_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn_comma_ENTRY   ; Pointer to word name (above)
        .word dw_DOES__head     ; Link to previous dictionary entry
dw_comma_ENTRY:
        CFA_doCOL()       ; Code entry point: next instruction
dw_comma_ENTRY_pfa:
	;; notes: ,ENTRY ( cfa -- head )
	;;        Start a new dictionary entry using the specified CFA. Return
        ;;        the new entry's head.

	;; TOKEN ,HEAD \ Begin the entry head
	.word dw_TOKEN
	.word dw_comma_HEAD	; ( cfa head )

	;; CURRENT , \ Compile the link to the previous definition.
	.word dw_CURRENT_fetch	; CURRENT@
	.word dw_fetch		; @
	.word dw_comma		; ( cfa head )

	;; ( cfa head ) ,CFA ( ) \ Compile the code word.
	.word dw_SWAP		; SWAP ( head cfa )
	.word dw_comma_CFA	; ,CFA ( head )

	.word dw_EXIT



	;; word:  USER
	;; flags: DOCOL ROM
        ;;   word USER defined in primitives/5100_defs.asm:114.
//dwn_USER:
//        .strp "USER" 0
dw_USER_head:
        .word FFL_T_DOCOL FFL_ROM 1 ; Flags & hash
        .word dwn_USER          ; Pointer to word name (above)
        .word dw_comma_ENTRY_head ; Link to previous dictionary entry
dw_USER:
        CFA_doCOL()       ; Code entry point: next instruction
dw_USER_pfa:
	;; notes: USER ( +n -- )
	;;        Create a user variable with the given offset.

	.word dw_tick_doUSER	; 'doUSER
	.word dw_comma_ENTRY	; ,ENTRY ( head )

	;; SWAP , \ Compile the provided offset.
	.word dw_SWAP		; SWAP ( head n )
	.word dw_comma		; , ( head )

	;; REVEAL \ Reveal the definition
	.word dw_REVEAL		; ( )

	;; \ Set variable flags
	doLIT(FFL_T_USER)	; FFL_T_USER (whatever it is)
	.word dw_WORDFLAG	; FLAGWORD ( )
	.word dw_EXIT



	;; word:  CREATE
	;; flags: DOCOL ROM
        ;;   word CREATE defined in primitives/5100_defs.asm:136.
//dwn_CREATE:
//        .strp "CREATE" 0
dw_CREATE_head:
        .word FFL_T_DOCOL FFL_ROM 5 ; Flags & hash
        .word dwn_CREATE        ; Pointer to word name (above)
        .word dw_USER_head      ; Link to previous dictionary entry
dw_CREATE:
        CFA_doCOL()       ; Code entry point: next instruction
dw_CREATE_pfa:
	;; notes: CREATE ( -- )
	;;

	.word dw_tick_doVAR	; 'doVAR ( cfa )
	.word dw_comma_ENTRY	; ,ENTRY ( head )

	;; REVEAL \ Reveal the definition
	.word dw_REVEAL		; ( )

	;; \ Set variable flags
	doLIT(FFL_T_VAR)	; FFL_T_VAR (whatever it is)
	.word dw_WORDFLAG	; FLAGWORD ( )
	.word dw_EXIT



	;; word:  VARIABLE
	;; flags: DOCOL ROM
        ;;   word VARIABLE defined in primitives/5100_defs.asm:154.
//dwn_VARIABLE:
//        .strp "VARIABLE" 0
dw_VARIABLE_head:
        .word FFL_T_DOCOL FFL_ROM 6 ; Flags & hash
        .word dwn_VARIABLE      ; Pointer to word name (above)
        .word dw_CREATE_head    ; Link to previous dictionary entry
dw_VARIABLE:
        CFA_doCOL()       ; Code entry point: next instruction
dw_VARIABLE_pfa:
	;; notes: VARIABLE ( -- )
	;;

	.word dw_CREATE		; CREATE
	doLIT(0)		; 0 ( head 0 )
	.word dw_comma		; , ( head )
	.word dw_EXIT



	;; word:  2VARIABLE
	;; flags: DOCOL ROM
        ;;   word 2VARIABLE defined in primitives/5100_defs.asm:166.
//dwn_2VARIABLE:
//        .strp "2VARIABLE" 0
dw_2VARIABLE_head:
        .word FFL_T_DOCOL FFL_ROM 3 ; Flags & hash
        .word dwn_2VARIABLE     ; Pointer to word name (above)
        .word dw_VARIABLE_head  ; Link to previous dictionary entry
dw_2VARIABLE:
        CFA_doCOL()       ; Code entry point: next instruction
dw_2VARIABLE_pfa:
	;; notes: 2VARIABLE ( -- )
	;;

	.word dw_VARIABLE
	doLIT(0)		; Store the high cell
	.word dw_comma
	.word dw_EXIT



	;; word:  CONSTANT
	;; flags: DOCOL ROM
        ;;   word CONSTANT defined in primitives/5100_defs.asm:178.
//dwn_CONSTANT:
//        .strp "CONSTANT" 0
dw_CONSTANT_head:
        .word FFL_T_DOCOL FFL_ROM 3 ; Flags & hash
        .word dwn_CONSTANT      ; Pointer to word name (above)
        .word dw_2VARIABLE_head ; Link to previous dictionary entry
dw_CONSTANT:
        CFA_doCOL()       ; Code entry point: next instruction
dw_CONSTANT_pfa:
	;; notes: CONSTANT ( u -- )
	;;

	.word dw_tick_doCONST	; 'doCONST ( u cfa )
	.word dw_comma_ENTRY	; ,ENTRY ( u head )

	;; 0 , \ Allocate space for the const value itself.
	.word dw_SWAP		; SWAP ( head u )
	.word dw_comma		; , ( head )

	;; REVEAL \ Reveal the definition
	.word dw_REVEAL		; ( )

	;; \ Set variable flags
	doLIT(FFL_T_CONST)	; FFL_T_CONST (whatever it is)
	.word dw_WORDFLAG	; FLAGWORD ( )
	.word dw_EXIT



	;; word:  2CONSTANT
	;; flags: DOCOL ROM
        ;;   word 2CONSTANT defined in primitives/5100_defs.asm:200.
//dwn_2CONSTANT:
//        .strp "2CONSTANT" 0
dw_2CONSTANT_head:
        .word FFL_T_DOCOL FFL_ROM 3 ; Flags & hash
        .word dwn_2CONSTANT     ; Pointer to word name (above)
        .word dw_CONSTANT_head  ; Link to previous dictionary entry
dw_2CONSTANT:
        CFA_doCOL()       ; Code entry point: next instruction
dw_2CONSTANT_pfa:
	;; notes: 2CONSTANT ( d -- )
	;;

	.word dw_tick_do2CONST	; 'doCONST ( d cfa )
	.word dw_comma_ENTRY	; ,ENTRY ( d head )


	;; ( dl dh head ) -ROT SWAP , , \ Allocate space for the constant value itself.
	.word dw_not_ROT	; -ROT ( head dl dh )
	.word dw_SWAP		; SWAP ( head dh dl )
	.word dw_comma		; , ( head dh )
	.word dw_comma		; , ( head )

	;; REVEAL \ Reveal the definition
	.word dw_REVEAL		; ( )

	;; \ Set variable flags
	doLIT(FFL_T_CONST)	; FFL_T_CONST (whatever it is)
	.word dw_WORDFLAG	; FLAGWORD ( )
	.word dw_EXIT



;; // End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/5200_flow.asm
//
///////////////////////////////////////////////////////////////////////////////


;; // -*- asm -*-
;; //
;; // Flow control



	;; word:  <MARK
	;; alias: pre-MARK
	;; flags: DOCOL ROM COMPILE
        ;;   word <MARK defined in primitives/5200_flow.asm:9.
//dwn_pre_MARK:
//        .strp "<MARK" 0
dw_pre_MARK_head:
        .word FFL_T_DOCOL FFL_ROM FFL_COMPILE 1 ; Flags & hash
        .word dwn_pre_MARK      ; Pointer to word name (above)
        .word dw_2CONSTANT_head ; Link to previous dictionary entry
dw_pre_MARK:
        CFA_doCOL()       ; Code entry point: next instruction
dw_pre_MARK_pfa:
	;; notes: <MARK ( -- a )
	;;   	  Control flow mark.

	.word dw_HERE		; HERE
	.word dw_EXIT		; Exit.



	;; word:  <RESOLVE
	;; alias: pre-RESOLVE
	;; flags: DOCOL ROM COMPILE
        ;;   word <RESOLVE defined in primitives/5200_flow.asm:20.
//dwn_pre_RESOLVE:
//        .strp "<RESOLVE" 0
dw_pre_RESOLVE_head:
        .word FFL_T_DOCOL FFL_ROM FFL_COMPILE 4 ; Flags & hash
        .word dwn_pre_RESOLVE   ; Pointer to word name (above)
        .word dw_pre_MARK_head  ; Link to previous dictionary entry
dw_pre_RESOLVE:
        CFA_doCOL()       ; Code entry point: next instruction
dw_pre_RESOLVE_pfa:
	;; notes: <RESOLVE ( a -- )
	;;   	  Resolve control flow mark.

	.word dw_comma		; ,
	.word dw_EXIT		; Exit.



	;; word:  >MARK
	;; alias: post-MARK
	;; flags: DOCOL ROM COMPILE
        ;;   word >MARK defined in primitives/5200_flow.asm:31.
//dwn_post_MARK:
//        .strp ">MARK" 0
dw_post_MARK_head:
        .word FFL_T_DOCOL FFL_ROM FFL_COMPILE 3 ; Flags & hash
        .word dwn_post_MARK     ; Pointer to word name (above)
        .word dw_pre_RESOLVE_head ; Link to previous dictionary entry
dw_post_MARK:
        CFA_doCOL()       ; Code entry point: next instruction
dw_post_MARK_pfa:
	;; notes: >MARK ( -- a )
	;;   	  Control flow mark.

	.word dw_HERE		; HERE
	doLIT(0)		; 0
	.word dw_comma		; HERE
	.word dw_EXIT		; Exit.



	;; word:  >RESOLVE
	;; alias: post-RESOLVE
	;; flags: DOCOL ROM COMPILE
        ;;   word >RESOLVE defined in primitives/5200_flow.asm:44.
//dwn_post_RESOLVE:
//        .strp ">RESOLVE" 0
dw_post_RESOLVE_head:
        .word FFL_T_DOCOL FFL_ROM FFL_COMPILE 6 ; Flags & hash
        .word dwn_post_RESOLVE  ; Pointer to word name (above)
        .word dw_post_MARK_head ; Link to previous dictionary entry
dw_post_RESOLVE:
        CFA_doCOL()       ; Code entry point: next instruction
dw_post_RESOLVE_pfa:
	;; notes: >RESOLVE ( a -- )
	;;   	  Resolve control flow mark.

	.word dw_dot_s
	.word dw_CR
	.word dw_HERE		; HERE
	.word dw_SWAP		; SWAP
	.word dw_store		; !
	.word dw_EXIT		; Exit.



	;; word:  IF
	;; flags: DOCOL ROM IMMEDIATE COMPILE
        ;;   word IF defined in primitives/5200_flow.asm:58.
//dwn_IF:
//        .strp "IF" 0
dw_IF_head:
        .word FFL_T_DOCOL FFL_ROM FFL_IMMEDIATE FFL_COMPILE 3 ; Flags & hash
        .word dwn_IF            ; Pointer to word name (above)
        .word dw_post_RESOLVE_head ; Link to previous dictionary entry
dw_IF:
        CFA_doCOL()       ; Code entry point: next instruction
dw_IF_pfa:
	;; notes: IF ( -- a ) \ Compile semantics
	;;        IF ( f -- ) \ Runtime semantics
	;;        Compile the beginning of an IF structure

	doLIT(dw_if_branch)	; [COMPILE] if_branch
	.word dw_comma		; ,
	.word dw_post_MARK	; >MARK
	.word dw_EXIT



	;; word:  THEN
	;; flags: DOCOL ROM IMMEDIATE COMPILE
        ;;   word THEN defined in primitives/5200_flow.asm:71.
//dwn_THEN:
//        .strp "THEN" 0
dw_THEN_head:
        .word FFL_T_DOCOL FFL_ROM FFL_IMMEDIATE FFL_COMPILE 0 ; Flags & hash
        .word dwn_THEN          ; Pointer to word name (above)
        .word dw_IF_head        ; Link to previous dictionary entry
dw_THEN:
        CFA_doCOL()       ; Code entry point: next instruction
dw_THEN_pfa:
	;; notes: THEN ( a -- ) \ Compile semantics
	;;        THEN ( -- ) \ Runtime semantics
	;;        Compile the THEN part of an IF...THEN...ELSE structure

	.word dw_post_RESOLVE
	.word dw_EXIT



	;; word:  ELSE
	;; flags: DOCOL ROM IMMEDIATE COMPILE
        ;;   word ELSE defined in primitives/5200_flow.asm:82.
//dwn_ELSE:
//        .strp "ELSE" 0
dw_ELSE_head:
        .word FFL_T_DOCOL FFL_ROM FFL_IMMEDIATE FFL_COMPILE 1 ; Flags & hash
        .word dwn_ELSE          ; Pointer to word name (above)
        .word dw_THEN_head      ; Link to previous dictionary entry
dw_ELSE:
        CFA_doCOL()       ; Code entry point: next instruction
dw_ELSE_pfa:
	;; notes: ELSE ( a -- a ) \ Compile semantics
	;;        ELSE ( -- ) \ Runtime semantics
	;;        Compile the ELSE part of an IF...THEN...ELSE structure
	;; code:  : ELSE ( a -- a ) ( -- ) [COMPILE] AHEAD SWAP [COMPILE] THEN ; IMMEDIATE

	doLIT(dw_AHEAD)		; [COMPILE] AHEAD
	.word dw_comma
	.word dw_SWAP		; SWAP
	doLIT(dw_THEN)		; [COMPILE] THEN
	.word dw_comma
	.word dw_EXIT



	;; word:  AHEAD
	;; flags: DOCOL ROM IMMEDIATE COMPILE
        ;;   word AHEAD defined in primitives/5200_flow.asm:98.
//dwn_AHEAD:
//        .strp "AHEAD" 0
dw_AHEAD_head:
        .word FFL_T_DOCOL FFL_ROM FFL_IMMEDIATE FFL_COMPILE 4 ; Flags & hash
        .word dwn_AHEAD         ; Pointer to word name (above)
        .word dw_ELSE_head      ; Link to previous dictionary entry
dw_AHEAD:
        CFA_doCOL()       ; Code entry point: next instruction
dw_AHEAD_pfa:
	;; notes: AHEAD ( -- a ) \ Compile semantics
	;;        AHEAD ( -- ) \ Runtime semantics
	;; code:  : AHEAD ( -- a ) ( -- ) COMPILE branch >MARK ; IMMEDIATE

	.word dw_COMPILE
	.word dw_branch
	.word dw_post_MARK
	.word dw_EXIT



	;; word:  FOR
	;; flags: DOCOL ROM IMMEDIATE COMPILE
        ;;   word FOR defined in primitives/5200_flow.asm:111.
//dwn_FOR:
//        .strp "FOR" 0
dw_FOR_head:
        .word FFL_T_DOCOL FFL_ROM FFL_IMMEDIATE FFL_COMPILE 5 ; Flags & hash
        .word dwn_FOR           ; Pointer to word name (above)
        .word dw_AHEAD_head     ; Link to previous dictionary entry
dw_FOR:
        CFA_doCOL()       ; Code entry point: next instruction
dw_FOR_pfa:
	;; notes: FOR ( -- a ) \ Compile semantics
	;;        FOR ( -- ) \ Runtime semantics
	;; code:  : FOR ( -- a ) ( -- ) COMPILE >R <MARK ; IMMEDIATE

	.word dw_COMPILE
	.word dw_to_R
	.word dw_pre_MARK
	.word dw_EXIT



	;; word:  BEGIN
	;; flags: DOCOL ROM IMMEDIATE COMPILE
        ;;   word BEGIN defined in primitives/5200_flow.asm:124.
//dwn_BEGIN:
//        .strp "BEGIN" 0
dw_BEGIN_head:
        .word FFL_T_DOCOL FFL_ROM FFL_IMMEDIATE FFL_COMPILE 7 ; Flags & hash
        .word dwn_BEGIN         ; Pointer to word name (above)
        .word dw_FOR_head       ; Link to previous dictionary entry
dw_BEGIN:
        CFA_doCOL()       ; Code entry point: next instruction
dw_BEGIN_pfa:
	;; notes: BEGIN ( -- a ) \ Compile semantics
	;;        BEGIN ( -- ) \ Runtime semantics
	;; code:  : BEGIN ( -- a ) ( -- ) <MARK ; IMMEDIATE

	.word dw_pre_MARK
	.word dw_EXIT



	;; word:  NEXT
	;; flags: DOCOL ROM IMMEDIATE COMPILE
        ;;   word NEXT defined in primitives/5200_flow.asm:135.
//dwn_NEXT:
//        .strp "NEXT" 0
dw_NEXT_head:
        .word FFL_T_DOCOL FFL_ROM FFL_IMMEDIATE FFL_COMPILE 2 ; Flags & hash
        .word dwn_NEXT          ; Pointer to word name (above)
        .word dw_BEGIN_head     ; Link to previous dictionary entry
dw_NEXT:
        CFA_doCOL()       ; Code entry point: next instruction
dw_NEXT_pfa:
	;; notes: NEXT ( a -- ) \ Compile semantics
	;;        NEXT ( -- ) \ Runtime semantics
	;; code:  : NEXT ( a -- ) ( -- ) ( what goes here? ) ; IMMEDIATE

	// TODO: Implement this
	.word dw_FAIL



	;; word:  UNTIL
	;; flags: DOCOL ROM IMMEDIATE COMPILE
        ;;   word UNTIL defined in primitives/5200_flow.asm:146.
//dwn_UNTIL:
//        .strp "UNTIL" 0
dw_UNTIL_head:
        .word FFL_T_DOCOL FFL_ROM FFL_IMMEDIATE FFL_COMPILE 0 ; Flags & hash
        .word dwn_UNTIL         ; Pointer to word name (above)
        .word dw_NEXT_head      ; Link to previous dictionary entry
dw_UNTIL:
        CFA_doCOL()       ; Code entry point: next instruction
dw_UNTIL_pfa:
	;; notes: UNTIL ( a -- ) \ Compile semantics
	;;        UNTIL ( -- ) \ Runtime semantics
	;; code:  : UNTIL ( a -- ) ( -- ) [COMPILE] ?branch <RESOLVE ; IMMEDIATE

	doLIT(dw_if_branch)	; [COMPILE] ?branch
	.word dw_comma
	.word dw_pre_RESOLVE	; <RESOLVE
	.word dw_EXIT



	;; word:  AGAIN
	;; flags: DOCOL ROM IMMEDIATE COMPILE
        ;;   word AGAIN defined in primitives/5200_flow.asm:159.
//dwn_AGAIN:
//        .strp "AGAIN" 0
dw_AGAIN_head:
        .word FFL_T_DOCOL FFL_ROM FFL_IMMEDIATE FFL_COMPILE 4 ; Flags & hash
        .word dwn_AGAIN         ; Pointer to word name (above)
        .word dw_UNTIL_head     ; Link to previous dictionary entry
dw_AGAIN:
        CFA_doCOL()       ; Code entry point: next instruction
dw_AGAIN_pfa:
	;; notes: AGAIN ( a -- ) \ Compile semantics
	;;        AGAIN ( -- ) \ Runtime semantics
	;; code:  : AGAIN ( a -- ) ( -- ) COMPILE branch <RESOLVE ; IMMEDIATE

	.word dw_COMPILE
	.word dw_branch
	.word dw_pre_RESOLVE
	.word dw_EXIT



	;; word:  REPEAT
	;; flags: DOCOL ROM IMMEDIATE COMPILE
        ;;   word REPEAT defined in primitives/5200_flow.asm:172.
//dwn_REPEAT:
//        .strp "REPEAT" 0
dw_REPEAT_head:
        .word FFL_T_DOCOL FFL_ROM FFL_IMMEDIATE FFL_COMPILE 4 ; Flags & hash
        .word dwn_REPEAT        ; Pointer to word name (above)
        .word dw_AGAIN_head     ; Link to previous dictionary entry
dw_REPEAT:
        CFA_doCOL()       ; Code entry point: next instruction
dw_REPEAT_pfa:
	;; notes: REPEAT ( a a -- ) \ Compile semantics
	;;        REPEAT ( -- ) \ Runtime semantics
	;; code:  : REPEAT ( a a -- ) ( -- ) [COMPILE] AGAIN >RESOLVE ; IMMEDIATE

	.word dw_bkt_COMPILE_bkt
	.word dw_AGAIN
	.word dw_post_RESOLVE
	.word dw_EXIT



	;; word:  AFT
	;; flags: DOCOL ROM IMMEDIATE COMPILE
        ;;   word AFT defined in primitives/5200_flow.asm:185.
//dwn_AFT:
//        .strp "AFT" 0
dw_AFT_head:
        .word FFL_T_DOCOL FFL_ROM FFL_IMMEDIATE FFL_COMPILE 2 ; Flags & hash
        .word dwn_AFT           ; Pointer to word name (above)
        .word dw_REPEAT_head    ; Link to previous dictionary entry
dw_AFT:
        CFA_doCOL()       ; Code entry point: next instruction
dw_AFT_pfa:
	;; notes: AFT ( a -- a a ) \ Compile semantics
	;;        AFT ( -- ) \ Runtime semantics
	;; code:  : AFT ( a -- a a ) ( -- ) DROP [COMPILE] AHEAD [COMPILE] BEGIN SWAP ; IMMEDIATE

	.word dw_DROP
	.word dw_bkt_COMPILE_bkt
	.word dw_AHEAD
	.word dw_bkt_COMPILE_bkt
	.word dw_BEGIN
	.word dw_SWAP
	.word dw_EXIT



	;; word:  WHEN
	;; flags: DOCOL ROM IMMEDIATE COMPILE
        ;;   word WHEN defined in primitives/5200_flow.asm:201.
//dwn_WHEN:
//        .strp "WHEN" 0
dw_WHEN_head:
        .word FFL_T_DOCOL FFL_ROM FFL_IMMEDIATE FFL_COMPILE 3 ; Flags & hash
        .word dwn_WHEN          ; Pointer to word name (above)
        .word dw_AFT_head       ; Link to previous dictionary entry
dw_WHEN:
        CFA_doCOL()       ; Code entry point: next instruction
dw_WHEN_pfa:
	;; notes: WHEN ( a a -- a a a ) \ Compile semantics
	;;        WHEN ( -- ) \ Runtime semantics
	;; code:  : WHEN ( a a -- a a a ) ( -- ) [COMPILE] IF OVER ; IMMEDIATE

	.word dw_bkt_COMPILE_bkt
	.word dw_IF
	.word dw_OVER
	.word dw_EXIT



	;; word:  WHILE
	;; flags: DOCOL ROM IMMEDIATE
        ;;   word WHILE defined in primitives/5200_flow.asm:214.
//dwn_WHILE:
//        .strp "WHILE" 0
dw_WHILE_head:
        .word FFL_T_DOCOL FFL_ROM FFL_IMMEDIATE 2 ; Flags & hash
        .word dwn_WHILE         ; Pointer to word name (above)
        .word dw_WHEN_head      ; Link to previous dictionary entry
dw_WHILE:
        CFA_doCOL()       ; Code entry point: next instruction
dw_WHILE_pfa:
	;; notes: WHILE ( a -- a a ) \ Compile semantics
	;;        WHILE ( -- ) \ Runtime semantics
	;; code:  : WHILE ( a -- a a ) ( -- ) [COMPILE] IF SWAP ; IMMEDIATE

	.word dw_bkt_COMPILE_bkt
	.word dw_IF
	.word dw_SWAP
	.word dw_EXIT



	;; word:  DO
	;; flags: DOCOL ROM IMMEDIATE
        ;;   word DO defined in primitives/5200_flow.asm:227.
//dwn_DO:
//        .strp "DO" 0
dw_DO_head:
        .word FFL_T_DOCOL FFL_ROM FFL_IMMEDIATE 6 ; Flags & hash
        .word dwn_DO            ; Pointer to word name (above)
        .word dw_WHILE_head     ; Link to previous dictionary entry
dw_DO:
        CFA_doCOL()       ; Code entry point: next instruction
dw_DO_pfa:
	;; notes: DO ( -- sys ) \ compile-time semantics
	;;        DO ( w2 w1 -- w1 ) \ runtime semantics
	;;        Starts a DO-LOOP loop which will run once, or w2-w1+1,
	;;        whichever is greatest. The end of the loop body is
	;;        signalled with LOOP.
	;; code:  : DO ( -- sys ) [COMPILE] >R BEGIN ; IMMEDIATE

	doLIT(dw_to_R)		; [COMPILE] >R
	.word dw_comma		; ,
	.word dw_BEGIN		; BEGIN ( -- sys )
	.word dw_EXIT



	;; word:  LOOP
	;; flags: DOCOL ROM IMMEDIATE
        ;;   word LOOP defined in primitives/5200_flow.asm:243.
//dwn_LOOP:
//        .strp "LOOP" 0
dw_LOOP_head:
        .word FFL_T_DOCOL FFL_ROM FFL_IMMEDIATE 0 ; Flags & hash
        .word dwn_LOOP          ; Pointer to word name (above)
        .word dw_DO_head        ; Link to previous dictionary entry
dw_LOOP:
        CFA_doCOL()       ; Code entry point: next instruction
dw_LOOP_pfa:
	;; notes: LOOP ( sys -- ) \ compile-time semantics
	;;        Terminates a DO-LOOP loop.
	;; code:  : LOOP ( sys -- ) [COMPILE] doLOOP >RESOLVE ; IMMEDIATE

	doLIT(dw_doLOOP)	; [COMPILE] doLOOP
	.word dw_comma		; ,
	.word dw_UNTIL		; >RESOLVE ( )
	.word dw_EXIT



	;; word:  doLOOP
	;; flags: CODE ROM CFT IMMEDIATE
        ;;   word doLOOP defined in primitives/5200_flow.asm:256.
//dwn_doLOOP:
//        .strp "DOLOOP" 0
dw_doLOOP_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT FFL_IMMEDIATE 2 ; Flags & hash
        .word dwn_doLOOP        ; Pointer to word name (above)
        .word dw_LOOP_head      ; Link to previous dictionary entry
dw_doLOOP:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_doLOOP_pfa:
	;; notes: doLOOP ( w2 -- w2 u ) \ compile-time semantics
	;;        Compile-time behaviour of LOOP. w2 is the last value of the loop
	;;        counter. u is 0 if the last value has not yet been reached, non-
	;;        zero otherwise.

	POP RP			; Increment the loop counter (on Return Stack)
	ADD PLUS1
	PUSH RP
	STORE TMP0		; Keep it in TMP0 for now.

	SPEEK(SP)		; Peek w2 on the data stack
	XOR TMP0		; counter == w2?
	SZA
	JMP _doLOOP_notdone	; No.

	;; We're done. Clean up and tell ?branch not to.
	POP RP			; Drop the loop counter from the RS.
	POP SP		        ; Drop w2 from the DS
	LI 1
	PUSH SP		        ; Push 1.
	NEXT

_doLOOP_notdone:
	;; We're not done yet. Push 0 onto the stack. ?branch branches on zero.
	LI 0
	PUSH SP	                ; Push 0 onto the stack. (?branch will loop again)
	NEXT



	;; word:  I
	;; flags: CODE ROM
        ;;   word I defined in primitives/5200_flow.asm:288.
//dwn_I:
//        .strp "I" 0
dw_I_head:
        .word FFL_T_CODE FFL_ROM 0 ; Flags & hash
        .word dwn_I             ; Pointer to word name (above)
        .word dw_doLOOP_head    ; Link to previous dictionary entry
dw_I:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_I_pfa:
	;; notes: I ( -- u )
	;;        Returns the innermost loop counter.

	POP RP			; Easiest way
	PUSH RP
	PUSH SP
	NEXT



	;; word:  J
	;; flags: CODE ROM
        ;;   word J defined in primitives/5200_flow.asm:300.
//dwn_J:
//        .strp "J" 0
dw_J_head:
        .word FFL_T_CODE FFL_ROM 3 ; Flags & hash
        .word dwn_J             ; Pointer to word name (above)
        .word dw_I_head         ; Link to previous dictionary entry
dw_J:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_J_pfa:
	;; notes: J ( -- u )
	;;        Returns the second-innermost loop counter.

	SPEEKn(RP, 2)
	PUSH SP
	NEXT



	;; word:  K
	;; flags: CODE ROM
        ;;   word K defined in primitives/5200_flow.asm:311.
//dwn_K:
//        .strp "K" 0
dw_K_head:
        .word FFL_T_CODE FFL_ROM 2 ; Flags & hash
        .word dwn_K             ; Pointer to word name (above)
        .word dw_J_head         ; Link to previous dictionary entry
dw_K:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_K_pfa:
	;; notes: K ( -- u )
	;;        Returns the third-innermost loop counter.

	SPEEKn(RP, 3)
	PUSH SP
	NEXT



	;; word:  +LOOP
	;; alias: plus_LOOP
	;; flags: CODE ROM
        ;;   word +LOOP defined in primitives/5200_flow.asm:323.
//dwn_plus_LOOP:
//        .strp "+LOOP" 0
dw_plus_LOOP_head:
        .word FFL_T_CODE FFL_ROM 6 ; Flags & hash
        .word dwn_plus_LOOP     ; Pointer to word name (above)
        .word dw_K_head         ; Link to previous dictionary entry
dw_plus_LOOP:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_plus_LOOP_pfa:
	;; notes: +LOOP ( n -- )
	;;        n is added to the loop index.  If the new index was
        ;;        incremented across the boundary between limit-1 and limit
        ;;        then the loop is terminated and loop control parameters are
        ;;        discarded.  When the loop is not terminated, execution
        ;;        continues to just after the corresponding DO .  sys is
        ;;        balanced with its corresponding DO .

	;; TODO: code this.
	FAIL




;; // End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/7000_utils.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// Utility words



	;; word:  1MS
	;; flags: CODE ROM
        ;;   word 1MS defined in primitives/7000_utils.asm:8.
//dwn_1MS:
//        .strp "1MS" 0
dw_1MS_head:
        .word FFL_T_CODE FFL_ROM 2 ; Flags & hash
        .word dwn_1MS           ; Pointer to word name (above)
        .word dw_plus_LOOP_head ; Link to previous dictionary entry
dw_1MS:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_1MS_pfa:
	;; notes: 1MS ( -- )
	;;        Delay for approximately 1 millisecond.

	;; STT
	LOAD MS_4MHZ
	STORE TMP15
_1ms_loop:
	ISZ TMP15
	JMP _1ms_loop
	;; LTL
	;; PRINTLO
	;; LTH
	;; PRINTHI
	NEXT


.page

	;; word:  MS
	;; flags: CODE ROM
        ;;   word MS defined in primitives/7000_utils.asm:28.
//dwn_MS:
//        .strp "MS" 0
dw_MS_head:
        .word FFL_T_CODE FFL_ROM 7 ; Flags & hash
        .word dwn_MS            ; Pointer to word name (above)
        .word dw_1MS_head       ; Link to previous dictionary entry
dw_MS:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_MS_pfa:
	;; notes: MS ( n -- )
	;;        Delay for approximately n milliseconds.

	;; STT
	POP(SP)
	NEG
	STORE TMP14
_ms_loop1:
	LOAD MS_4MHZ
	STORE TMP15
_ms_loop2:
	ISZ TMP15
	JMP _ms_loop2
	ISZ TMP14
	JMP _ms_loop1
	;; LTL
	;; PRINTLO
	;; LTH
	;; PRINTHI
	NEXT



	;; word:  .ROTOR
	;; alias: dot_ROTOR
	;; flags: DOCOL ROM
        ;;   word .ROTOR defined in primitives/7000_utils.asm:54.
//dwn_dot_ROTOR:
//        .strp ".ROTOR" 0
dw_dot_ROTOR_head:
        .word FFL_T_DOCOL FFL_ROM 0 ; Flags & hash
        .word dwn_dot_ROTOR     ; Pointer to word name (above)
        .word dw_MS_head        ; Link to previous dictionary entry
dw_dot_ROTOR:
        CFA_doCOL()       ; Code entry point: next instruction
dw_dot_ROTOR_pfa:
	;; notes: .ROTOR ( -- )
	;;        Emits a rotor character, and backspaces in anticipation of
        ;;        the next one (or anything else)

	.word dw_ROTOR
	.word dw_fetch
	.word dw_inc
	.word dw_DUP
	.word dw_ROTOR
	.word dw_store
	doLIT(3)
	.word dw_AND
	doLIT(_rotor_data)
	.word dw_add
	.word dw_fetch
	.word dw_EMIT
	doLIT(8)
	.word dw_EMIT
	.word dw_EXIT

_rotor_data:
	.str "|/-\\"



	;; word:  PROGRESS
	;; flags: DOCOL ROM CFT
        ;;   word PROGRESS defined in primitives/7000_utils.asm:81.
//dwn_PROGRESS:
//        .strp "PROGRESS" 0
dw_PROGRESS_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 0 ; Flags & hash
        .word dwn_PROGRESS      ; Pointer to word name (above)
        .word dw_dot_ROTOR_head ; Link to previous dictionary entry
dw_PROGRESS:
        CFA_doCOL()       ; Code entry point: next instruction
dw_PROGRESS_pfa:
	;; notes: PROGRESS ( u -- )
	;;        Output a rotor character and Wait for u milliseconds.

	.word dw_MS
	.word dw_dot_ROTOR
	.word dw_EXIT



	;; word:  WHAT?
	;; alias: WHAT_q
	;; flags: DOCOL ROM
        ;;   word WHAT? defined in primitives/7000_utils.asm:93.
//dwn_WHAT_q:
//        .strp "WHAT?" 0
dw_WHAT_q_head:
        .word FFL_T_DOCOL FFL_ROM 2 ; Flags & hash
        .word dwn_WHAT_q        ; Pointer to word name (above)
        .word dw_PROGRESS_head  ; Link to previous dictionary entry
dw_WHAT_q:
        CFA_doCOL()       ; Code entry point: next instruction
dw_WHAT_q_pfa:
	;; notes: WHAT? ( a -- )
	;;        Prints out the name of the word whose CFA address is a.
	;; src:   : WHAT? ( a -- ) >NAME typep0 ;

	.word dw_to_NAME	; >NAME ( a )
	.word dw_typep0		; typep0 ( )
	.word dw_EXIT



	;; word:  .s
	;; alias: dot_s
	;; flags: DOCOL ROM
        ;;   word .s defined in primitives/7000_utils.asm:106.
//dwn_dot_s:
//        .strp ".S" 0
dw_dot_s_head:
        .word FFL_T_DOCOL FFL_ROM 4 ; Flags & hash
        .word dwn_dot_s         ; Pointer to word name (above)
        .word dw_WHAT_q_head    ; Link to previous dictionary entry
dw_dot_s:
        CFA_doCOL()       ; Code entry point: next instruction
dw_dot_s_pfa:
	;; notes: .s ( -- )
	;;        Prints out the stack non-destructively.
	;; src:   DEPTH FOR AFT R@ PICK . THEN NEXT;

	.word dw_DEPTH		; DEPTH              ( d )     ( )
_dot_s_loop:
	.word dw_DUP		; DUP                ( d d )   ( )
	.word dw_to_R		; >R                 ( d )     ( d )
	.word dw_if_branch	;   ?branch ( FOR )  ( )       ( d )
	.word _dot_s_end
	.word dw_R_from		; R>                 ( d )     ( )
	.word dw_dec 		; 1-                 ( d )     ( )
	.word dw_DUP		; DUP                ( d d )   ( )
	.word dw_to_R		; >R                 ( d )     ( d )
	.word dw_PICK		; PICK               ( w )     ( d )
	.word dw_dot 		; .                  ( )       ( d )
	.word dw_R_from		;   R>               ( d )     ( )
	.word dw_branch		;   THEN NEXT        ( d )
	.word _dot_s_loop
_dot_s_end:
	.word dw_RDROP		; RDROP
  	.word dw_EXIT		; EXIT



	;; word:  .rs
	;; alias: dot_rs
	;; flags: DOCOL ROM
        ;;   word .rs defined in primitives/7000_utils.asm:134.
//dwn_dot_rs:
//        .strp ".RS" 0
dw_dot_rs_head:
        .word FFL_T_DOCOL FFL_ROM 5 ; Flags & hash
        .word dwn_dot_rs        ; Pointer to word name (above)
        .word dw_dot_s_head     ; Link to previous dictionary entry
dw_dot_rs:
        CFA_doCOL()       ; Code entry point: next instruction
dw_dot_rs_pfa:
	;; notes: .rs ( -- )
	;;        Prints out the return stack non-destructively.
	;; src:   DEPTH FOR AFT R@ PICK . THEN NEXT;

	.word dw_RDEPTH		; RDEPTh             ( d )     ( )
_dot_rs_loop:
	.word dw_DUP		; DUP                ( d d )   ( )
	.word dw_if_branch	;   ?branch ( FOR )  ( d )     ( )
	.word _dot_rs_end
	.word dw_dec 		; 1-                 ( d )     ( )
	.word dw_DUP		; DUP                ( d d )   ( )
	.word dw_RPICK		; RPICK              ( d w )   ( )
	.word dw_dot 		; .                  ( d )     ( )
	.word dw_branch		;   branch           ( d d )
	.word _dot_rs_loop
_dot_rs_end:
	.word dw_DROP		; DROP               ( )
  	.word dw_EXIT		; EXIT



	;; word:  .BASE
	;; alias: dot_BASE
	;; flags: DOCOL ROM
        ;;   word .BASE defined in primitives/7000_utils.asm:158.
//dwn_dot_BASE:
//        .strp ".BASE" 0
dw_dot_BASE_head:
        .word FFL_T_DOCOL FFL_ROM 3 ; Flags & hash
        .word dwn_dot_BASE      ; Pointer to word name (above)
        .word dw_dot_rs_head    ; Link to previous dictionary entry
dw_dot_BASE:
        CFA_doCOL()       ; Code entry point: next instruction
dw_dot_BASE_pfa:
	;; notes: .BASE ( -- )
	;;        Prints out the base.
	;; src:   BASE @ DECIMAL DUP . BASE !

	.word dw_BASE
	.word dw_fetch
	.word dw_DECIMAL
	.word dw_DUP
	.word dw_dot
	.word dw_BASE
	.word dw_store
	.word dw_EXIT



	;; word:  DUMPCHARS
	;; flags: DOCOL ROM CFT
        ;;   word DUMPCHARS defined in primitives/7000_utils.asm:175.
//dwn_DUMPCHARS:
//        .strp "DUMPCHARS" 0
dw_DUMPCHARS_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 5 ; Flags & hash
        .word dwn_DUMPCHARS     ; Pointer to word name (above)
        .word dw_dot_BASE_head  ; Link to previous dictionary entry
dw_DUMPCHARS:
        CFA_doCOL()       ; Code entry point: next instruction
dw_DUMPCHARS_pfa:
	;; notes: DUMPCHARS ( a n -- )
	;;        Prints out n characters starting at address a.
	;;        Replaces unprintable characters with dots.

	.word dw_to_R		; >R ( a )

_dumpchars_loop:
	.word dw_R_fetch	; R@ ( a n )
	.word dw_if_branch	;   ?branch ( a )
	.word _dumpchars_end
	.word dw_R_from		; R> ( a n )
	.word dw_dec		; 1- ( a n )
	.word dw_to_R		; >R ( a )

	.word dw_DUP		; ( a a )
	.word dw_c_fetch	; C@ ( a w ) \ or just @ on the CFT )
	.word dw_to_char	; >CHAR ( a w )
	.word dw_EMIT		; EMIT ( a )

	.word dw_inc		; 1+ ( a )

	.word dw_branch		;   branch
	.word _dumpchars_loop

_dumpchars_end:
	.word dw_RDROP		; RDROP
	.word dw_DROP		; DROP ( )

	.word dw_EXIT		; EXIT



	;; word:  DUMPPCHARS
	;; flags: DOCOL ROM CFT
        ;;   word DUMPPCHARS defined in primitives/7000_utils.asm:209.
//dwn_DUMPPCHARS:
//        .strp "DUMPPCHARS" 0
dw_DUMPPCHARS_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 6 ; Flags & hash
        .word dwn_DUMPPCHARS    ; Pointer to word name (above)
        .word dw_DUMPCHARS_head ; Link to previous dictionary entry
dw_DUMPPCHARS:
        CFA_doCOL()       ; Code entry point: next instruction
dw_DUMPPCHARS_pfa:
	;; notes: DUMPPCHARS ( a n -- )
	;;        Prints out 2n packed (8-bit) characters starting at address a.
	;;        Replaces unprintable characters with dots.

	.word dw_to_R		; >R ( a )

_dumppchars_loop:
	.word dw_R_fetch	; R@ ( a n )
	.word dw_if_branch	;   ?branch ( a )
	.word _dumppchars_end
	.word dw_R_from		; R> ( a n )
	.word dw_dec		; 1- ( a n )
	.word dw_to_R		; >R ( a )

	.word dw_2CHARS		; 2CHARS ( a+1 c2 c1 )
	.word dw_to_char	; >CHAR ( a+1 c2 w )
	.word dw_EMIT		; EMIT ( a+1 c2 )
	.word dw_to_char	; >CHAR ( a+1 w )
	.word dw_EMIT		; EMIT ( a+1 )

	.word dw_branch		;   branch
	.word _dumppchars_loop

_dumppchars_end:
	.word dw_RDROP		; RDROP
	.word dw_DROP		; DROP ( )

	.word dw_EXIT		; EXIT



	;; word:  DUMPHEX
	;; flags: DOCOL ROM CFT
        ;;   word DUMPHEX defined in primitives/7000_utils.asm:242.
//dwn_DUMPHEX:
//        .strp "DUMPHEX" 0
dw_DUMPHEX_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 3 ; Flags & hash
        .word dwn_DUMPHEX       ; Pointer to word name (above)
        .word dw_DUMPPCHARS_head ; Link to previous dictionary entry
dw_DUMPHEX:
        CFA_doCOL()       ; Code entry point: next instruction
dw_DUMPHEX_pfa:
	;; notes: DUMPHEX ( a n -- )
	;;        Prints out n hex words starting at address a.

	.word dw_to_R		; >R ( a )

_dumphex_loop:
	.word dw_R_fetch	; R@ ( a n )

	.word dw_if_branch	;   ?branch ( a )
	.word _dumphex_end
	.word dw_R_from		; R> ( a n )
	.word dw_dec		; 1- ( a n )
	.word dw_to_R		; >R ( a )

	.word dw_DUP		; ( a a )
	.word dw_c_fetch	; C@ ( a w ) \ or just @ on the CFT )
	.word dw_doLIT		; ( a w 4 )
	.word 4
	.word dw_u_dot_0r	; U.0R (a )
	.word dw_SPACE

	.word dw_inc		; 1+ ( a )

	.word dw_branch		;   branch
	.word _dumphex_loop

_dumphex_end:
	.word dw_RDROP		; RDROP
	.word dw_DROP		; DROP ( )

	.word dw_EXIT		; EXIT



	;; word:  DUMP
	;; flags: DOCOL ROM CFT
        ;;   word DUMP defined in primitives/7000_utils.asm:278.
//dwn_DUMP:
//        .strp "DUMP" 0
dw_DUMP_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 0 ; Flags & hash
        .word dwn_DUMP          ; Pointer to word name (above)
        .word dw_DUMPHEX_head   ; Link to previous dictionary entry
dw_DUMP:
        CFA_doCOL()       ; Code entry point: next instruction
dw_DUMP_pfa:
	;; notes: DUMP ( a n --  a )
	;;        Dumps (in hex and ASCII) n>>3 words starting at address a.
	;;        Returns the last address so that dumps can be continued
	;;        incrementally.

	.word dw_BASE		; BASE ( a n ab )
	.word dw_fetch		; @ ( a n b )
	.word dw_to_R		; >R ( a n )

	.word dw_HEX		; ( a n )

	.word dw_shl1		; >>1 ( a n/2 )
	.word dw_shl1		; >>1 ( a n/4 )
	.word dw_shl1		; >>1 ( a n/8 )
	.word dw_to_R		; >R ( a )

	.word dw_CR		; CR ( a )

_dump_loop:
	;; Done yet?
	.word dw_R_fetch	; R@ ( a n )
	.word dw_if_branch	;   ?branch ( a )
	.word _dump_end

	.word dw_NUF_if		; NUF? ( a f )
	.word dw_NOT		; NOT ( a !f )
	.word dw_if_branch	;   ?branch ( a )
	.word _dump_end

	.word dw_R_from		; R> ( a n )
	.word dw_dec		; 1- ( a n )
	.word dw_to_R		; >R ( a )

	;; Print out the address column
	.word dw_DUP		; ( a a )
	.word dw_doLIT		; 4
	.word 4
	.word dw_u_dot_0r	; U.0R ( a )
	.word dw_doLIT		; ( a ':' )
	.word 58
	.word dw_EMIT		; EMIT ( a )
	.word dw_SPACE		; EMIT ( a )

	;; Print out a line
	.word dw_DUP		; DUP ( a )
	.word dw_doLIT		; 8 ( a a 8 )
	.word 8
	.word dw_2DUP		; DUP ( a a 8 a 8 )
	.word dw_DUMPHEX	; DUMPLINE ( a a 8 )
	.word dw_2DUP		; DUP ( a a 8 a 8 )
	.word dw_DUMPCHARS	; DUMPCHARS ( a a 8 )
	.word dw_SPACE		; SPACE ( a a 8 )
	.word dw_DUMPPCHARS	; DUMPPCHARS ( a )
	.word dw_CR		; CR ( a )

	.word dw_doLIT		; 8 ( a 8 )
	.word 8
 	.word dw_add		; + ( a+8 )

	.word dw_branch		;   branch
	.word _dump_loop

_dump_end:
	.word dw_RDROP		; RDROP ( a )
	//.word dw_DROP		; DROP ( )

	;; Restore the base
	.word dw_R_from		; R> ( a ab b )
	.word dw_BASE		; BASE ( a ab )
	.word dw_store		; ! ( a )

	.word dw_EXIT		; EXIT



	;; word:  .WORDS
	;; alias: dot_WORDS
	;; flags: DOCOL ROM CFT
        ;;   word .WORDS defined in primitives/7000_utils.asm:356.
//dwn_dot_WORDS:
//        .strp ".WORDS" 0
dw_dot_WORDS_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 0 ; Flags & hash
        .word dwn_dot_WORDS     ; Pointer to word name (above)
        .word dw_DUMP_head      ; Link to previous dictionary entry
dw_dot_WORDS:
        CFA_doCOL()       ; Code entry point: next instruction
dw_dot_WORDS_pfa:
	;; notes: .WORDS ( -- )
	;;        Prints out a verbose list of words.

	.word dw_CR		; CR ( )
	.word dw_HEX		; HEX ( )
	doLIT(0)
	.word dw_CONTEXT_fetch	; CONTEXT@ ( a )

_wordsv_loop:
	;; Had enough yet?
	.word dw_NUF_if		; NUF? ( a f )
	.word dw_NOT		; NOT ( a !f )
	.word dw_if_branch	;   ?branch ( a )
	.word _wordsv_end

	.word dw_fetch		; @ ( a' )
	.word dw_DUP		; @ ( a' a' )
 	.word dw_if_branch	; ?branch ( a' )
	.word _words_end	;

	;; Print out the address
	.word dw_DUP		; DUP ( a' a' )
	.word dw_doLIT		; DUP ( a' a' 4 )
	.word 4
	.word dw_u_dot_0r	; U.0R ( a' )
	.word dw_SPACE		; SPACE ( a' )

	;; Print out the flags.
	.word dw_DUP		; DUP ( a' a' )
	.word dw_fetch		; @ ( a' flags )
	.word dw_doLIT		; DUP ( a' flags 4 )
	.word 4
	.word dw_u_dot_0r	; U.0R ( a' )
	.word dw_SPACE		; SPACE ( a' )

	;; Print out the label (padded to 16 characters)
	.word dw_inc		; 1+ ( a'+1 ) \ start + 1: word name ptr (pstr)
	.word dw_DUP		; DUP ( a'+1 a'+1 ) \ start + 1: word name ptr (pstr)
	.word dw_fetch		; @ ( a'+1 a'' ) \ string address
	.word dw_COUNT		; COUNT ( a'+1 a'' n ) string address
	.word dw_SWAP		; SWAP ( a'+1 n a'' )
	.word dw_typep0		; TYPEP0 ( a'+1 n )
	.word dw_doLIT		; 16 ( a'+1 n 16 )
	.word 16
	.word dw_SWAP		; SWAP ( a'+1 16 n )
	.word dw_sub		; - ( a'+1 16 n- )
	.word dw_SPACES		; SPACES ( a'+1 )

	;; End the line.
	.word dw_CR		; CR

	;; Link to the next word
	.word dw_inc		; 1+ ( a'+2 ) \ start + 2: link.
	.word dw_branch		; branch
	.word _wordsv_loop

_wordsv_end:
	.word dw_DROP		; DROP ( )
	.word dw_EXIT



	;; word:  @.
	;; alias: fetch-dot
	;; flags: DOCOL ROM CFT
        ;;   word @. defined in primitives/7000_utils.asm:421.
//dwn_fetch_dot:
//        .strp "@." 0
dw_fetch_dot_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn_fetch_dot     ; Pointer to word name (above)
        .word dw_dot_WORDS_head ; Link to previous dictionary entry
dw_fetch_dot:
        CFA_doCOL()       ; Code entry point: next instruction
dw_fetch_dot_pfa:
	;; notes: @. ( addr -- )
	;;        Prints out the contents of a memory cell.
	;;
	;; src:   : @. ( a -- ) @ . ;

	.word dw_fetch		; @
	.word dw_dot		; .
	.word dw_EXIT		; EXIT



// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/7500_forth83.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// Assert Forth-83 compliance.



	;; word:  FORTH-83
	;; flags: CODE ROM
        ;;   word FORTH-83 defined in primitives/7500_forth83.asm:8.
//dwn_FORTH_83:
//        .strp "FORTH-83" 0
dw_FORTH_83_head:
        .word FFL_T_CODE FFL_ROM 6 ; Flags & hash
        .word dwn_FORTH_83      ; Pointer to word name (above)
        .word dw_fetch_dot_head ; Link to previous dictionary entry
dw_FORTH_83:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_FORTH_83_pfa:
	;; notes: FORTH ( -- )
	;;        Verifies this is a Forth 83 system.

	NEXT



// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/8000_cft.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// CFT-specific code.



	;; word:  PANEL>
	;; alias: panel-from
	;; flags: CODE ROM CFT
        ;;   word PANEL> defined in primitives/8000_cft.asm:9.
//dwn_panel_from:
//        .strp "PANEL>" 0
dw_panel_from_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 6 ; Flags & hash
        .word dwn_panel_from    ; Pointer to word name (above)
        .word dw_FORTH_83_head  ; Link to previous dictionary entry
dw_panel_from:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_panel_from_pfa:
	;; notes: PANEL> ( -- w )
	;;   Reads the front panel switches and pushes the result.

	LSR			; Read panel Switch Register
	PUSH SP
	NEXT



	;; word:  >PANEL
	;; alias: to-panel
	;; flags: CODE ROM CFT
        ;;   word >PANEL defined in primitives/8000_cft.asm:21.
//dwn_to_panel:
//        .strp ">PANEL" 0
dw_to_panel_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 0 ; Flags & hash
        .word dwn_to_panel      ; Pointer to word name (above)
        .word dw_panel_from_head ; Link to previous dictionary entry
dw_to_panel:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_to_panel_pfa:
	;; notes: >PANEL ( W -- )
	;;   Write to the front panel output register (OR).

	POP SP
	SOR			; Set Output Register
	NEXT



	;; word:  DIP>
	;; alias: DIP-from
	;; flags: CODE ROM CFT
        ;;   word DIP> defined in primitives/8000_cft.asm:33.
//dwn_DIP_from:
//        .strp "DIP>" 0
dw_DIP_from_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 0 ; Flags & hash
        .word dwn_DIP_from      ; Pointer to word name (above)
        .word dw_to_panel_head  ; Link to previous dictionary entry
dw_DIP_from:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_DIP_from_pfa:
	;; notes: DIP> ( -- w )
	;;   Write to the front panel output register (OR).

	LDSR			; Read DIP-Switch Register
	PUSH SP
	NEXT



	;; word:  IO@
	;; alias: IO_fetch
	;; flags: CODE ROM CFT
        ;;   word IO@ defined in primitives/8000_cft.asm:45.
//dwn_IO_fetch:
//        .strp "IO@" 0
dw_IO_fetch_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn_IO_fetch      ; Pointer to word name (above)
        .word dw_DIP_from_head  ; Link to previous dictionary entry
dw_IO_fetch:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_IO_fetch_pfa:
	;; notes: IO@ ( a -- w )
	;;   Reads a word from the I/O address at a.

	RPOP(TMP0, SP)
	IN I TMP0
	PUSH SP
	NEXT



	;; word:  IO!
	;; alias: IO_store
	;; flags: CODE ROM CFT
        ;;   word IO! defined in primitives/8000_cft.asm:58.
//dwn_IO_store:
//        .strp "IO!" 0
dw_IO_store_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn_IO_store      ; Pointer to word name (above)
        .word dw_IO_fetch_head  ; Link to previous dictionary entry
dw_IO_store:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_IO_store_pfa:
	;; notes: IO! ( w a -- )
	;;   Write w to the I/O address at a.

	RPOP(TMP0,SP)		; a
	POP SP			; w
	OUT I TMP0
	NEXT



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
	;; flags: CODE ROM CFT
        ;;   word PRINTA defined in primitives/8000_cftdebug.asm:6.
//dwn_PRINTA:
//        .strp "PRINTA" 0
dw_PRINTA_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 6 ; Flags & hash
        .word dwn_PRINTA        ; Pointer to word name (above)
        .word dw_IO_store_head  ; Link to previous dictionary entry
dw_PRINTA:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_PRINTA_pfa:
	;; notes: PRINTD ( w -- )
	;;   Prints out an address to the debugging interface.

	POP SP
	PRINTA
	NEXT

	;; word:  PRINTC
	;; flags: CODE ROM CFT
        ;;   word PRINTC defined in primitives/8000_cftdebug.asm:15.
//dwn_PRINTC:
//        .strp "PRINTC" 0
dw_PRINTC_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 6 ; Flags & hash
        .word dwn_PRINTC        ; Pointer to word name (above)
        .word dw_PRINTA_head    ; Link to previous dictionary entry
dw_PRINTC:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_PRINTC_pfa:
	;; notes: PRINTD ( c -- )
	;;   Issues the PRINTC debugging instruction to the test harness,
	;;   which should print out the character c.

	POP SP
	PRINTC
	NEXT

	;; word:  PRINTD
	;; flags: CODE ROM CFT
        ;;   word PRINTD defined in primitives/8000_cftdebug.asm:25.
//dwn_PRINTD:
//        .strp "PRINTD" 0
dw_PRINTD_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 6 ; Flags & hash
        .word dwn_PRINTD        ; Pointer to word name (above)
        .word dw_PRINTC_head    ; Link to previous dictionary entry
dw_PRINTD:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_PRINTD_pfa:
	;; notes: PRINTD ( w -- )
	;;   Issues the PRINTD debugging instruction to the test harness,
	;;   which should print out w as a signed integer.

	POP SP
	PRINTD
	NEXT

	;; word:  PRINTU
	;; flags: CODE ROM CFT
        ;;   word PRINTU defined in primitives/8000_cftdebug.asm:35.
//dwn_PRINTU:
//        .strp "PRINTU" 0
dw_PRINTU_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 6 ; Flags & hash
        .word dwn_PRINTU        ; Pointer to word name (above)
        .word dw_PRINTD_head    ; Link to previous dictionary entry
dw_PRINTU:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_PRINTU_pfa:
	;; notes: PRINTU ( u -- )
	;;   Issues the PRINTU debugging instruction to the test harness,
	;;   which should print out u as an unsigned integer.

	POP SP
	PRINTU
	NEXT

	;; word:  PRINTH
	;; flags: CODE ROM CFT
        ;;   word PRINTH defined in primitives/8000_cftdebug.asm:45.
//dwn_PRINTH:
//        .strp "PRINTH" 0
dw_PRINTH_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 6 ; Flags & hash
        .word dwn_PRINTH        ; Pointer to word name (above)
        .word dw_PRINTU_head    ; Link to previous dictionary entry
dw_PRINTH:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_PRINTH_pfa:
	;; notes: PRINTH ( w -- )
	;;   Issues the PRINTH debugging instruction to the test harness,
	;;   which should print out w in hex.

	POP SP
	PRINTH
	NEXT

	;; word:  PRINTB
	;; flags: CODE ROM CFT
        ;;   word PRINTB defined in primitives/8000_cftdebug.asm:55.
//dwn_PRINTB:
//        .strp "PRINTB" 0
dw_PRINTB_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 6 ; Flags & hash
        .word dwn_PRINTB        ; Pointer to word name (above)
        .word dw_PRINTH_head    ; Link to previous dictionary entry
dw_PRINTB:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_PRINTB_pfa:
	;; notes: PRINTB ( w -- )
	;;   Issues the PRINTB debugging instruction to the test harness,
	;;   which should print out w in binary.

	POP SP
	PRINTB
	NEXT

	;; word:  PRINTSP
	;; flags: CODE ROM CFT
        ;;   word PRINTSP defined in primitives/8000_cftdebug.asm:65.
//dwn_PRINTSP:
//        .strp "PRINTSP" 0
dw_PRINTSP_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 7 ; Flags & hash
        .word dwn_PRINTSP       ; Pointer to word name (above)
        .word dw_PRINTB_head    ; Link to previous dictionary entry
dw_PRINTSP:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_PRINTSP_pfa:
	;; notes: PRINTSP ( -- )
	;;   Issues the PRINTB debugging instruction to the test harness,
	;;   which should print out a space (ASCII 32).

	PRINTSP
	NEXT

	;; word:  PRINTNL
	;; flags: CODE ROM CFT
        ;;   word PRINTNL defined in primitives/8000_cftdebug.asm:74.
//dwn_PRINTNL:
//        .strp "PRINTNL" 0
dw_PRINTNL_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 7 ; Flags & hash
        .word dwn_PRINTNL       ; Pointer to word name (above)
        .word dw_PRINTSP_head   ; Link to previous dictionary entry
dw_PRINTNL:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_PRINTNL_pfa:
	;; notes: PRINTNL ( -- )
	;;   Issues the PRINTB debugging instruction to the test harness,
	;;   which should print out a line feed character (ASCII 10).

	PRINTNL
	NEXT

	;; word:  DEBUGON
	;; flags: CODE ROM CFT
        ;;   word DEBUGON defined in primitives/8000_cftdebug.asm:83.
//dwn_DEBUGON:
//        .strp "DEBUGON" 0
dw_DEBUGON_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 3 ; Flags & hash
        .word dwn_DEBUGON       ; Pointer to word name (above)
        .word dw_PRINTNL_head   ; Link to previous dictionary entry
dw_DEBUGON:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_DEBUGON_pfa:
	;; notes: DEBUGON ( -- )
	;;   Enables debug logging.

	DEBUGON
	NEXT

	;; word:  DEBUGOFF
	;; flags: CODE ROM CFT
        ;;   word DEBUGOFF defined in primitives/8000_cftdebug.asm:91.
//dwn_DEBUGOFF:
//        .strp "DEBUGOFF" 0
dw_DEBUGOFF_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 4 ; Flags & hash
        .word dwn_DEBUGOFF      ; Pointer to word name (above)
        .word dw_DEBUGON_head   ; Link to previous dictionary entry
dw_DEBUGOFF:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_DEBUGOFF_pfa:
	;; notes: DEBUGOFF ( -- )
	;;   DISABLES debug logging.

	DEBUGOFF
	NEXT

	;; word:  DUMPSTATE
	;; flags: CODE ROM CFT
        ;;   word DUMPSTATE defined in primitives/8000_cftdebug.asm:99.
//dwn_DUMPSTATE:
//        .strp "DUMPSTATE" 0
dw_DUMPSTATE_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 5 ; Flags & hash
        .word dwn_DUMPSTATE     ; Pointer to word name (above)
        .word dw_DEBUGOFF_head  ; Link to previous dictionary entry
dw_DUMPSTATE:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_DUMPSTATE_pfa:
	;; notes: DUMPSTATE ( -- )
	;;   Issues the DUMP debugging instruction to the test harness,
	;;   which should dump the machine state.

	DUMP
	NEXT

	;; word:  SUCCESS
	;; flags: CODE ROM CFT
        ;;   word SUCCESS defined in primitives/8000_cftdebug.asm:108.
//dwn_SUCCESS:
//        .strp "SUCCESS" 0
dw_SUCCESS_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 4 ; Flags & hash
        .word dwn_SUCCESS       ; Pointer to word name (above)
        .word dw_DUMPSTATE_head ; Link to previous dictionary entry
dw_SUCCESS:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_SUCCESS_pfa:
	;; notes: SUCCESS ( -- )
	;;   Issues the SUCCESS debugging instruction to the test harness,
	;;   which should report a successful testing checkpoint.

	SUCCESS
	NEXT



	;; word:  FAIL
	;; flags: CODE ROM CFT
        ;;   word FAIL defined in primitives/8000_cftdebug.asm:119.
//dwn_FAIL:
//        .strp "FAIL" 0
dw_FAIL_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn_FAIL          ; Pointer to word name (above)
        .word dw_SUCCESS_head   ; Link to previous dictionary entry
dw_FAIL:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_FAIL_pfa:
	;; notes: FAIL ( -- )
	;;   Issues the FAIL debugging instruction to the test harness,
	;;   which should report a failed testing checkpoint.

	FAIL
	NEXT



	;; word:  PRINT32
	;; flags: CODE ROM CFT
        ;;   word PRINT32 defined in primitives/8000_cftdebug.asm:130.
//dwn_PRINT32:
//        .strp "PRINT32" 0
dw_PRINT32_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 7 ; Flags & hash
        .word dwn_PRINT32       ; Pointer to word name (above)
        .word dw_FAIL_head      ; Link to previous dictionary entry
dw_PRINT32:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_PRINT32_pfa:
	;; notes: PRINT32 ( d -- )
	;;   Prints out a double unsigned number in hex.

	RPOP(TMP1, SP)
	RPOP(TMP2, SP)
	PRINT32(TMP1,TMP2)
	NEXT



	;; word:  $t0
	;; alias: _t0
	;; flags: CODE ROM CFT
        ;;   word $t0 defined in primitives/8000_cftdebug.asm:143.
//dwn__t0:
//        .strp "$T0" 0
dw__t0_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 7 ; Flags & hash
        .word dwn__t0           ; Pointer to word name (above)
        .word dw_PRINT32_head   ; Link to previous dictionary entry
dw__t0:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw__t0_pfa:
	;; notes: $t0 ( -- )
	;;   Reset the tick timer.

	STT			; Start timing
	NEXT



	;; word:  $t1
	;; alias: _t1
	;; flags: CODE ROM CFT
        ;;   word $t1 defined in primitives/8000_cftdebug.asm:154.
//dwn__t1:
//        .strp "$T1" 0
dw__t1_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 7 ; Flags & hash
        .word dwn__t1           ; Pointer to word name (above)
        .word dw__t0_head       ; Link to previous dictionary entry
dw__t1:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw__t1_pfa:
	;; notes: $t1 ( -- d )
	;;   Return number of ticks as a double integer.

	LTL			; Load ticks low
	PUSH(SP)
	LTH			; Load ticks high
	PUSH(SP)
	NEXT



// End of file.



///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/8000_nvram.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// CFT-specific code.



	;; word:  NVRAM?
	;; alias: NVRAMq
	;; flags: CODE ROM CFT
        ;;   word NVRAM? defined in primitives/8000_nvram.asm:9.
//dwn_NVRAMq:
//        .strp "NVRAM?" 0
dw_NVRAMq_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 0 ; Flags & hash
        .word dwn_NVRAMq        ; Pointer to word name (above)
        .word dw__t1_head       ; Link to previous dictionary entry
dw_NVRAMq:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_NVRAMq_pfa:
	;; notes: NVRAM? ( -- f )
	;;        Returns non-zero if the 2 KByte timekeeper/NVRAM chip is present.

	LI CFG_NVR
	AND SYSCFG
	PUSH(SP)
	NEXT



	;; word:  RTC?
	;; alias: RTCq
	;; flags: CODE ROM CFT
        ;;   word RTC? defined in primitives/8000_nvram.asm:22.
//dwn_RTCq:
//        .strp "RTC?" 0
dw_RTCq_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 6 ; Flags & hash
        .word dwn_RTCq          ; Pointer to word name (above)
        .word dw_NVRAMq_head    ; Link to previous dictionary entry
dw_RTCq:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_RTCq_pfa:
	;; notes: RTC? ( -- f )
	;;        Returns non-zero if the 2 KByte timekeeper/NVRAM chip is present.

	LI CFG_RTC
	AND SYSCFG
	PUSH(SP)
	NEXT



	;; word:  NVC@
	;; alias: NVC_fetch
	;; flags: CODE ROM CFT
        ;;   word NVC@ defined in primitives/8000_nvram.asm:35.
//dwn_NVC_fetch:
//        .strp "NVC@" 0
dw_NVC_fetch_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn_NVC_fetch     ; Pointer to word name (above)
        .word dw_RTCq_head      ; Link to previous dictionary entry
dw_NVC_fetch:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_NVC_fetch_pfa:
	;; notes: NVC@ ( a -- w )
	;;        Read a byte from the NVRAM. The high bits are clear.

	SPEEK(SP)		; get address
	STORE TMP1		; store for later

	;; Get the window offset. This is address >> 4. The NVRAM has
	;; 800 (2,048) addresses in total, so mask the necessary bits
	;; too.

	RNR			; >>4
	AND PLUS127		; AND &7f
	OUT NVRAMWIN		; Set the NVRAM window.

	RAND(TMP1, PLUS15, TMP1) ; TMP1 = TMP1 & 0xf
	LI NVRAMOFS		; TMP1 += NVRAMOFS
	ADD TMP1
	STORE TMP1

	IN I TMP1		; AC = io[TMP1]
	AND BYTELO		; keep the lower 8 bits (all the NVRAM can give)

	SPOKE0(SP)		; Put it on the stack.
	NEXT



	;; word:  NVC!
	;; alias: NVC_store
	;; flags: CODE ROM CFT
        ;;   word NVC! defined in primitives/8000_nvram.asm:65.
//dwn_NVC_store:
//        .strp "NVC!" 0
dw_NVC_store_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn_NVC_store     ; Pointer to word name (above)
        .word dw_NVC_fetch_head ; Link to previous dictionary entry
dw_NVC_store:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_NVC_store_pfa:
	;; notes: NVC@ ( w a -- )
	;;        Read a byte from the NVRAM. The high bits are clear.

	RPOP(TMP0, SP)		; TMP0 = a
	RPOP(TMP1, SP)		; TMP1 = w

	;; Get the window offset. This is address >> 4. The NVRAM has
	;; 800 (2,048) addresses in total, so mask the necessary bits
	;; too.

	LOAD TMP0		; TMP0
	RNR			; >>4
	AND PLUS127		; AND &7f
	OUT NVRAMWIN		; Set the NVRAM window.

	RAND(TMP0, PLUS15, TMP0) ; TMP0 = TMP0 & 0xf
	LI NVRAMOFS		 ; TMP0 += NVRAMOFS
	ADD TMP0
	STORE TMP0

	LOAD TMP1
	OUT I TMP0

	NEXT



	;; word:  NV@
	;; alias: NV_fetch
	;; flags: DOCOL ROM CFT
        ;;   word NV@ defined in primitives/8000_nvram.asm:95.
//dwn_NV_fetch:
//        .strp "NV@" 0
dw_NV_fetch_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 5 ; Flags & hash
        .word dwn_NV_fetch      ; Pointer to word name (above)
        .word dw_NVC_store_head ; Link to previous dictionary entry
dw_NV_fetch:
        CFA_doCOL()       ; Code entry point: next instruction
dw_NV_fetch_pfa:
	;; notes: NVC@ ( a -- w )
	;;        Read a word from the NVRAM. The address a is converted to a
        ;;        word-aligned address by clearing bit 0. The byte at address
        ;;        a+0 occupies bits 0..7 of w. The byte at address a+1 occupies
        ;;        bits 8..15.
	;; code:  : NV@ ( a -- w ) &fffe AND DUP NVC@ SWAP 1+ NVC@ 256* OR ;

	doLIT(&fffe)		; &fffe ( a &fffe )
	.word dw_AND		; AND ( a&fffe )
	.word dw_DUP		; DUP ( a&fffe a&fffe )
	.word dw_NVC_fetch	; NVC@ ( a&fffe lo )
	.word dw_SWAP		; SWAP ( lo a&fffe )
	.word dw_inc		; 1+ ( lo a&fffe|1)
	.word dw_NVC_fetch	; NVC@ ( lo hi )
	.word dw_256mul		; 256* ( lo hi<<8 )
	.word dw_OR		; OR ( lo|hi<<8 )
	.word dw_EXIT



	;; word:  NV!
	;; alias: NV_store
	;; flags: DOCOL ROM CFT
        ;;   word NV! defined in primitives/8000_nvram.asm:118.
//dwn_NV_store:
//        .strp "NV!" 0
dw_NV_store_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 5 ; Flags & hash
        .word dwn_NV_store      ; Pointer to word name (above)
        .word dw_NV_fetch_head  ; Link to previous dictionary entry
dw_NV_store:
        CFA_doCOL()       ; Code entry point: next instruction
dw_NV_store_pfa:
	;; notes: NV! ( w a -- )
	;;        WRite a word to the NVRAM. The address a is converted to a
        ;;        word-aligned address by clearing bit 0. The byte at address
        ;;        a+0 occupies bits 0..7 of w. The byte at address a+1 occupies
        ;;        bits 8..15.
	;; code:  : NV@ ( a -- w ) &fffe AND DUP NVC@ SWAP 1+ NVC@ 256* OR ;

	;; SWAP >R &fffe AND DUP ( a a ) \ Prepare
	.word dw_SWAP		; SWAP ( a w )
	.word dw_to_R		; >R ( a )
	doLIT(&fffe)		; &fffe ( a &fffe )
	.word dw_AND		; AND ( a&fffe )
	.word dw_DUP		; DUP ( a&fffe a&fffe )

	;; R@ LOBYTE SWAP NVC! ( a ) \ Store low byte
	.word dw_R_fetch	; R@ ( a&fffe a&fffe w )
	.word dw_LOBYTE		; LOBYTE ( a&fffe a&fffe w&ff )
	.word dw_SWAP		; SWAP ( a&fffe w&ff a&fffe )
	.word dw_NVC_store	; NVC! ( a&fffe )

	;; 1+ R> HIBYTE SWAP NVC!
	.word dw_inc		; 1+ ( a&fffe|1 )
	.word dw_R_from		; R> ( a&fffe|1 w )
	.word dw_HIBYTE		; HIBYTE ( a&fffe|1 w>>8 )
	.word dw_SWAP		; SWAP ( w>>8 a&fffe|1 )
	.word dw_NVC_store	; NVC!
	.word dw_EXIT



	;; word:  RTC.INIT
	;; flags: CODE ROM CFT
        ;;   word RTC.INIT defined in primitives/8000_nvram.asm:150.
//dwn_RTC_INIT:
//        .strp "RTC.INIT" 0
dw_RTC_INIT_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn_RTC_INIT      ; Pointer to word name (above)
        .word dw_NV_store_head  ; Link to previous dictionary entry
dw_RTC_INIT:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_RTC_INIT_pfa:
	;; notes: RTC.INIT ( -- )
	;;        Initialises the real-time clock.

	;; Is the chip present?
	LI &00			; Set window #0
	OUT NVRAMWIN
	IN NVRAMOFS 0		; Load a byte from location &000
	AND BYTELO
	STORE TMP0		; Store value for later

	LI &01			; Set window #1
	OUT NVRAMWIN
	IN NVRAMOFS 0		; Load a byte from location &008
	AND BYTELO
	STORE TMP1		; Store value for later

	XOR TMP0		; Is TMP1==TMP0?
	SZA
	JMP _rtc_init1

	LOAD TMP1		; Equal. Change #008.
	XOR MINUS1
	OUT NVRAMOFS 0		; Store it back

_rtc_init1:
	;; At this point, if the RTC/NVRAM chip is present, locations
	;; &000 and &008 will differ.
	IN NVRAMOFS 0
	STORE TMP2
	LI &00
	OUT NVRAMWIN
	IN NVRAMOFS 0
	XOR TMP2
	SNZ
	JMP _rtc_init_nope	; They're equal.

	LI &08
	OUT NVRAMWIN
	LOAD TMP1		; Restore location &008
	OUT NVRAMOFS 0

_rtc_init_init:
	;; Now initialise.

	;; Select the RTC registers in the NVRAM chip.
	LI &7f
	OUT NVRAMWIN

	;; Set up for reading.
	LI &40
	OUT NVRAMOFS 8

	;; Load the seconds.
	IN NVRAMOFS 9
	STORE TMP0

	;; Set up for writing.
	LI &80
	OUT NVRAMOFS 8

	;; Clear the STOP bit and write the STOP/seconds byte back.
	LOAD TMP0
	AND PLUS127
	OUT NVRAMOFS 9

	;; Set up for reading again.
	LI &40
	OUT NVRAMOFS 8

	;; Done.
	LI CFG_RTC CFG_NVR   ; Update the system configuration bitmap.
	OR SYSCFG
	STORE SYSCFG
	LI 1

_rtc_init_end:
	PUSH(SP)
	NEXT

_rtc_init_nope:
	LI 0
	JMP _rtc_init_end




	;; word:  DATE.EPY
	;; flags: CONST ROM CFT
        ;;   word DATE.EPY defined in primitives/8000_nvram.asm:238.
//dwn_DATE_EPY:
//        .strp "DATE.EPY" 0
dw_DATE_EPY_head:
        .word FFL_T_CONST FFL_ROM FFL_CFT 4 ; Flags & hash
        .word dwn_DATE_EPY      ; Pointer to word name (above)
        .word dw_RTC_INIT_head  ; Link to previous dictionary entry
dw_DATE_EPY:
        CFA_doCONST()     ; Code entry point: next instruction
dw_DATE_EPY_pfa:
	;; notes: DATE.EPY ( -- 2000 )
	;;        Returns the CFT Epoch year (2000).

	.word 2000



	;; word:  DATE
	;; flags: DOCOL ROM CFT
        ;;   word DATE defined in primitives/8000_nvram.asm:247.
//dwn_DATE:
//        .strp "DATE" 0
dw_DATE_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 0 ; Flags & hash
        .word dwn_DATE          ; Pointer to word name (above)
        .word dw_DATE_EPY_head  ; Link to previous dictionary entry
dw_DATE:
        CFA_doCOL()       ; Code entry point: next instruction
dw_DATE_pfa:
	;; notes: DATE ( -- y m d dow )
	;;        Read the date from the RTC and push the year (with century),
        ;;        month (1-12), day of the month (1-31) and day of the week
        ;;        (1-7).

	doLIT(&7ff)		; &7ff ( &7ff )
	.word dw_NVC_fetch	; NVC@ ( ybcd )
	.word dw_BCD8_from	; BCD8> ( y ybcd )
	.word dw_DROP		; DROP ( y )
	.word dw_DATE_EPY	; DATE_EPY ( y )
	.word dw_add		; + ( y )

	doLIT(&7fe)		; &7fe ( y &7fe )
	.word dw_NVC_fetch	; NVC@ ( y mbcd )
	.word dw_BCD8_from	; BCD8> ( y m mbcd )
	.word dw_DROP		; DROP ( y m )

	doLIT(&7fd)		; &7fd ( y m &7fd )
	.word dw_NVC_fetch	; NVC@ ( y m dbcd )
	.word dw_BCD8_from	; BCD8> ( y m d dbcd )
	.word dw_DROP		; DROP ( y m d )

	doLIT(&7fc)		; &7fc ( y m d &7fc )
	.word dw_NVC_fetch	; NVC@ ( y m d dbcd )
	doLIT(7)		; 7
	.word dw_AND		; AND ( y m d dow )

	.word dw_EXIT



	;; word:  TIME
	;; flags: DOCOL ROM CFT
        ;;   word TIME defined in primitives/8000_nvram.asm:280.
//dwn_TIME:
//        .strp "TIME" 0
dw_TIME_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 0 ; Flags & hash
        .word dwn_TIME          ; Pointer to word name (above)
        .word dw_DATE_head      ; Link to previous dictionary entry
dw_TIME:
        CFA_doCOL()       ; Code entry point: next instruction
dw_TIME_pfa:
	;; notes: TIME ( -- h m s )
	;;        Read the time from the RTC and push the h, m and s fields.

	doLIT(&7fb)		; &7fb ( &7fb )
	.word dw_NVC_fetch	; NVC@ ( hbcd )
	.word dw_BCD8_from	; BCD8> ( h hbcd )
	.word dw_DROP		; DROP ( h )

	doLIT(&7fa)		; &7fa ( h &7fa )
	.word dw_NVC_fetch	; NVC@ ( h mbcd )
	.word dw_BCD8_from	; BCD8> ( h m mbcd )
	.word dw_DROP		; DROP ( h m )

	doLIT(&7f9)		; &7f9 ( y m &7f9 )
	.word dw_NVC_fetch	; NVC@ ( y m sbcd )
	.word dw_BCD8_from	; BCD8> ( y m d sbcd )
	.word dw_DROP		; DROP ( y m s )

	.word dw_EXIT



	;; word:  .DATE
	;; alias: dot_DATE
	;; flags: DOCOL ROM CFT
        ;;   word .DATE defined in primitives/8000_nvram.asm:305.
//dwn_dot_DATE:
//        .strp ".DATE" 0
dw_dot_DATE_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 3 ; Flags & hash
        .word dwn_dot_DATE      ; Pointer to word name (above)
        .word dw_TIME_head      ; Link to previous dictionary entry
dw_dot_DATE:
        CFA_doCOL()       ; Code entry point: next instruction
dw_dot_DATE_pfa:
	;; notes: .DATE ( -- )
	;;        Read and print out the date from the the real-time clock.

	.word dw_DATE		; DATE ( y m d dow )
	.word dw_DROP		; DROP ( y m d )

	.word dw_bkt_number	; <# ( y m d 0 )
	doLIT(0)
	doLIT(2)
	.word dw_0_number_s	; 0#S ( y m 0 0 )

	.word dw_2DROP		; 2DROP ( y m )
	doCHAR("-")		; CHAR - ( y m '-' )
	.word dw_HOLD		; HOLD ( y m )

	doLIT(0)
	doLIT(2)
	.word dw_0_number_s	; 0#S ( y 0 0 )
	.word dw_2DROP		; 2DROP ( y )
	doCHAR("-")		; CHAR - ( y '-' )
	.word dw_HOLD		; HOLD ( y )

	doLIT(0)
	doLIT(4)
	.word dw_0_number_s	; 0#S ( 0 0 )
	.word dw_number_bkt	; #> ( b u )
	.word dw_EXIT



	;; word:  .TIME
	;; alias: dot_TIME
	;; flags: DOCOL ROM CFT
        ;;   word .TIME defined in primitives/8000_nvram.asm:338.
//dwn_dot_TIME:
//        .strp ".TIME" 0
dw_dot_TIME_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 3 ; Flags & hash
        .word dwn_dot_TIME      ; Pointer to word name (above)
        .word dw_dot_DATE_head  ; Link to previous dictionary entry
dw_dot_TIME:
        CFA_doCOL()       ; Code entry point: next instruction
dw_dot_TIME_pfa:
	;; notes: .TIME ( -- )
	;;        Read and print out the time from the the real-time clock.

	.word dw_TIME		; DATE ( h m s )

	.word dw_bkt_number	; <# ( h m s )
	doLIT(0)
	doLIT(2)
	.word dw_0_number_s	; 0#S ( h m 0 )

	.word dw_2DROP		; 2DROP ( h m )
	doCHAR(":")		; CHAR - ( h m '-' )
	.word dw_HOLD		; HOLD ( h m )

	doLIT(0)
	doLIT(2)
	.word dw_0_number_s	; 0#S ( h 0 )
	.word dw_2DROP		; 2DROP ( h )
	doCHAR(":")		; CHAR - ( h '-' )
	.word dw_HOLD		; HOLD ( h )

	doLIT(0)
	doLIT(2)
	.word dw_0_number_s	; 0#S ( 0 )
	.word dw_number_bkt	; #> ( b u )
	.word dw_EXIT



// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/8100_banking.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// The Memory Banking Unit.



	;; word:  SANITY-
	;; alias: SANITY_off
	;; flags: CODE ROM CFT
        ;;   word SANITY- defined in primitives/8100_banking.asm:9.
//dwn_SANITY_off:
//        .strp "SANITY-" 0
dw_SANITY_off_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 4 ; Flags & hash
        .word dwn_SANITY_off    ; Pointer to word name (above)
        .word dw_dot_TIME_head  ; Link to previous dictionary entry
dw_SANITY_off:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_SANITY_off_pfa:
	;; notes: SANITY- ( -- )
	;;        Disables emulator sanity checking. Used when scanning the bus.

	LI EMF_SANITY
	DISEF
	NEXT



	;; word:  SANITY+
	;; alias: SANITY_on
	;; flags: CODE ROM CFT
        ;;   word SANITY+ defined in primitives/8100_banking.asm:21.
//dwn_SANITY_on:
//        .strp "SANITY+" 0
dw_SANITY_on_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 4 ; Flags & hash
        .word dwn_SANITY_on     ; Pointer to word name (above)
        .word dw_SANITY_off_head ; Link to previous dictionary entry
dw_SANITY_on:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_SANITY_on_pfa:
	;; notes: SANITY+ ( -- )
	;;        Enables emulator sanity checking. Used when scanning the bus.

	LI EMF_SANITY
	ENEF
	NEXT



	;; word:  BANKS
	;; alias: BANKS
	;; flags: CODE ROM CFT
        ;;   word BANKS defined in primitives/8100_banking.asm:33.
//dwn_BANKS:
//        .strp "BANKS" 0
dw_BANKS_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 7 ; Flags & hash
        .word dwn_BANKS         ; Pointer to word name (above)
        .word dw_SANITY_on_head ; Link to previous dictionary entry
dw_BANKS:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_BANKS_pfa:
	;; notes: BANKS ( +n -- a )
	;;        1. Given a bank number, produce its first address in memory.
	;;        2. Converts a number of 8kW blocks (e.g. as returned by SYSMEM)
	;;           to machine words (16-bit cells). Values up to 7 are valid.

	POP SP
	AND PLUS15
	OP1 CLL RNL		; << 4 (also clear L)
	RNL			; << 8
	RNL			; << 12
	SBL			; << 13
	PUSH SP
	NEXT



	;; word:  kWBANKS
	;; alias: kWBANKS
	;; flags: CODE ROM CFT
        ;;   word kWBANKS defined in primitives/8100_banking.asm:52.
//dwn_kWBANKS:
//        .strp "KWBANKS" 0
dw_kWBANKS_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 4 ; Flags & hash
        .word dwn_kWBANKS       ; Pointer to word name (above)
        .word dw_BANKS_head     ; Link to previous dictionary entry
dw_kWBANKS:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_kWBANKS_pfa:
	;; notes: kWBANKS ( +n -- a )
	;;        Converts a number of 8kW blocks (e.g. as returned by SYSMEM)
	;;           to kWords (1024 16-bit cells). Values up to 8191 are valid.

	POP SP
	OP1 CLL RNL		; << 4 (also clear L)
	SBR			; << 3
	AND _kwBANKS_data
	PUSH SP
	NEXT

_kwBANKS_data:
	.word &fff8



	;; word:  MBU!
	;; alias: MBU_store
	;; flags: CODE ROM CFT
        ;;   word MBU! defined in primitives/8100_banking.asm:71.
//dwn_MBU_store:
//        .strp "MBU!" 0
dw_MBU_store_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 1 ; Flags & hash
        .word dwn_MBU_store     ; Pointer to word name (above)
        .word dw_kWBANKS_head   ; Link to previous dictionary entry
dw_MBU_store:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_MBU_store_pfa:
	;; notes: MBU! ( a +n -- )
	;;        Set up MBU register +n (only the lower three bits of which
        ;;        are used) for address a. Each register maps an 8kW area of
        ;;        memory to a block of physical ROM or RAM. Register 0 maps
        ;;        addresses &0000-&1FFF, register 7 maps addresses
        ;;        &E000-&FFFF. The offset into physical memory is 8192*n.

	POP SP			; Bank number (+n)
	AND _dw_MBU_data
	STORE TMP1		; TMP1 = +n & 7
	ADD MBUB0
	STORE TMP0		; Pointer to MBUB[n&7]
	LOAD TMP1
	ADD MBU
	STORE TMP2		; Pointer to MBU register #n

	POP SP			; Address to assign to register
	STORE I TMP0		; MBUB[n&7] = a
	OUT I TMP2		; Set the MBU register

	NEXT

_dw_MBU_data:
	.word 7



	;; word:  MBU@
	;; alias: MBU_fetch
	;; flags: CODE ROM CFT
        ;;   word MBU@ defined in primitives/8100_banking.asm:101.
//dwn_MBU_fetch:
//        .strp "MBU@" 0
dw_MBU_fetch_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 1 ; Flags & hash
        .word dwn_MBU_fetch     ; Pointer to word name (above)
        .word dw_MBU_store_head ; Link to previous dictionary entry
dw_MBU_fetch:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_MBU_fetch_pfa:
	;; notes: MBU! ( +n -- a )
	;;        Returns the physical location of bank +n. Only the 3 least
        ;;        significant bits of +n are used.

	POP SP
	AND _dw_MBU_data	; +n & 7
	ADD MBUB0		; MBUB[n&7]
	STORE TMP0		; Store array pointer
	LOAD I TMP0		; Read from array
	PUSH SP			; Push it
	NEXT



	;; word:  .BANKS
	;; alias: dot_BANKS
	;; flags: DOCOL ROM CFT
        ;;   word .BANKS defined in primitives/8100_banking.asm:118.
//dwn_dot_BANKS:
//        .strp ".BANKS" 0
dw_dot_BANKS_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 0 ; Flags & hash
        .word dwn_dot_BANKS     ; Pointer to word name (above)
        .word dw_MBU_fetch_head ; Link to previous dictionary entry
dw_dot_BANKS:
        CFA_doCOL()       ; Code entry point: next instruction
dw_dot_BANKS_pfa:
	;; notes: .BANKS ( -- )
	;;        Prints out the current memory banking scheme.

	.word dw_BASE_to_R
	.word dw_HEX
	doLIT(8)		; 8 ( max )
	doLIT(0)		; 0 ( max i )

_dot_BANKS_loop:
	.word dw_DUP		; DUP ( max i i )
	.word dw_MBU_fetch	; MBU@ ( max i a )
	doLIT(2)
	.word dw_u_dot_0r	; U.0R ( max i )
	.word dw_SPACE		; SPACE ( max i )
	.word dw_inc		; 1+ ( max i+1 )
	.word dw_2DUP		; 2DUP ( max i+1 max i+1 )
	.word dw_equal		; = ( max i+1 f )
	.word dw_if_branch	; ?branch
	.word _dot_BANKS_loop
	.word dw_2DROP
	.word dw_R_to_BASE
	.word dw_EXIT



	;; word:  MBU.GO
	;; flags: CODE ROM CFT
        ;;   word MBU.GO defined in primitives/8100_banking.asm:145.
//dwn_MBU_GO:
//        .strp "MBU.GO" 0
dw_MBU_GO_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 3 ; Flags & hash
        .word dwn_MBU_GO        ; Pointer to word name (above)
        .word dw_dot_BANKS_head ; Link to previous dictionary entry
dw_MBU_GO:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_MBU_GO_pfa:
	;; notes: MBU.GO ( -- )
	;;        Set up the default memory banking scheme.

	LIA _mbu_go_data
	STORE I0
	LI MBUB0
	STORE I1
	LI MBU
	STORE I2

	RMOV(TMP0, I I0)

_mbu_go_loop:
	LOAD I I0
	STORE I I1
	OUT I I2
	ISZ TMP0
	JMP _mbu_go_loop

	;; Also enable the unit. Doing it multiple times can't hurt.
	OUT MBUEN
	NEXT

_mbu_go_data:
	.word -8
	;; For 8kW ROM systems:
	;; .word &00		; RAM bank 0
	;; .word &01		; RAM bank 1
	;; .word &02		; RAM bank 2
	;; .word &03		; RAM bank 3
	;; .word &04		; RAM bank 4
	;; .word &05		; RAM bank 5
	;; .word &06		; RAM bank 6
	;; .word &80		; ROM bank 0

	;; For 16kW ROM systems:
	.word &00		; RAM bank 0
	.word &01		; RAM bank 1
	.word &02		; RAM bank 2
	.word &03		; RAM bank 3
	.word &04		; RAM bank 4
	.word &05		; RAM bank 5
	.word &80		; ROM bank 0
	.word &81		; ROM bank 1



_mbu_data:
	.word &2000


	;; word:  MBU.INIT
	;; flags: CODE ROM CFT
        ;;   word MBU.INIT defined in primitives/8100_banking.asm:198.
//dwn_MBU_INIT:
//        .strp "MBU.INIT" 0
dw_MBU_INIT_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 5 ; Flags & hash
        .word dwn_MBU_INIT      ; Pointer to word name (above)
        .word dw_MBU_GO_head    ; Link to previous dictionary entry
dw_MBU_INIT:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_MBU_INIT_pfa:
	;; notes: MBU.INIT ( -- )
	;;        Detect and initialise the MBU. Be verbose.

	;; Ensure the emulator doesn't crash at this point. On hardware, these
	;; instructions are basically NOPs.

	LI EMF_SANITY
	DISEF

	;; Chick & Egg: to initialise the MBU, we'll need to enable it. To
	;; enable it, we need to set up a mapping. So we'll do just that: set
	;; up the default banking scheme, enable banking, then detect if it
	;; worked. If the MBU card isn't present, all this will do nothing.

	FORTH(dw_MBU_GO)

	;; Now, on to the detection

	;; Detection strategy: read value at &2000. Set bank 1 to ROM bank 0
        ;; (&80). Read value at &1FF8. If the values differ, we have an MBU. If
        ;; not, change the value. Read it back. If the value has not been
        ;; changed, the bank is ROM (the values just happened to be the
        ;; same). Otherwise, the bank is still RAM. We don't have an MBU.

	LOAD I _mbu_data
	STORE TMP0

	LI &80			; Select ROM bank 0.
	OUT MBU 1		; Map it to &2000-&3fff.

	LOAD I _mbu_data
	XOR TMP0
	SZA
	JMP _mbu_init_yes

	;; Change the data. If the ROM bank has been selected, that won't
	;; happen. Note: this is safe even for Flash chips (they don't normally
	;; obey write instructions unless unlocked via a sequence of special
	;; accesses).

	LOAD I _mbu_data	; This is already the same as TMP0
	XOR MINUS1
	STORE I _mbu_data	; Try to write it.
	LOAD I _mbu_data	; Read it back and compare
	XOR TMP0
	SNZ
	JMP _mbu_init_yes	; It's identical: this *IS* the ROM.

_mbu_init_no:
	LI EMF_SANITY
	ENEF

	LI 0			; Return 0.
	PUSH(SP)

	NEXT

_mbu_init_yes:
	LI EMF_SANITY		; Re-enable emulator sanity checks.
	ENEF

	LI CFG_MBU		; Update the system configuration bitmap.
	OR SYSCFG
	STORE SYSCFG

	LI 1			; Return 1.
	PUSH(SP)
	NEXT




	;; word:  MBU?
	;; alias: MBUq
	;; flags: CODE ROM CFT
        ;;   word MBU? defined in primitives/8100_banking.asm:273.
//dwn_MBUq:
//        .strp "MBU?" 0
dw_MBUq_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 1 ; Flags & hash
        .word dwn_MBUq          ; Pointer to word name (above)
        .word dw_MBU_INIT_head  ; Link to previous dictionary entry
dw_MBUq:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_MBUq_pfa:
	;; notes: MBU? ( -- f )
	;;        Returns a non-zero value if the MBU has been detected.

	LI CFG_MBU		; Update the system configuration bitmap.
	AND SYSCFG
	PUSH(SP)
	NEXT



// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/8100_ide.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// IDE interfacing.
//
// This is one of the most complex drivers, so a number of
// macros and 'local' definitions are kept here.


.page


;; Where data is buffered initially.
;; TODO: fix this

.equ    IDE_EARLYBUF   &1f00

;; NB: These are NOT meant to be changed.
.equ    BKSIZE         1024	; block size in machine words (cells)
.equ    BKSIZE_SECTORS 4	; block size in sectors (256 cells)

;; IDE register offsets (based on IDE0 or IDE1)

.equ    IDE_OFS_DCR    &06    ; Address offset of the Control Register
.equ    IDE_OFS_ASR    &06    ; The Alternate Status Register
.equ    IDE_OFS_DATA   &10    ; The data register
.equ    IDE_OFS_ERROR  &11
.equ    IDE_OFS_SCOUNT &12
.equ    IDE_OFS_LBA0   &13
.equ    IDE_OFS_LBA1   &14
.equ    IDE_OFS_LBA2   &15
.equ    IDE_OFS_LBA3   &16
.equ    IDE_OFS_DHR    &16
.equ    IDE_OFS_CMD    &17	; The command register

;; IDE commands

.equ    IDE_RECAL      &10	; Recalibrate
.equ 	IDE_READR      &20	; Read with retry
.equ 	IDE_READMULT   &c4	; Read multiple
.equ 	IDE_WRITER     &30	; Write with retry
.equ 	IDE_WRITEMULT  &c5	; Write multiple
.equ    IDE_SETMULT    &c6	; Set multiple mod
.equ    IDE_IDENTIFY   &ec	; Identify

;; Values for the Drive/Head register.

.equ IDE_DHR  #111'-'----	; Base value (also enables LBA)
.equ IDE_DRV0 #---'0'----
.equ IDE_DRV1 #---'1'----

;; IDE macrocommands

.equ 	HDDCR		OUT I IDEDCR
.equ    HDCMD 		OUT I IDECMD
.equ    HDSCR		OUT I IDESCR

.equ    HDINASR 	IN I IDEASR

;; Assembler macros



// Macro: IDE_DCR(val)
//
// Sets the IDE DCR register.
//
// Side effects:
//   A.

.macro IDE_DCR(val)
	LI %val			; IDE_DCR(%val)
	HDDCR
.end



// Macro: IDE_DATACMD(cmd, buf, n)
//
// Sends a command to the currently selected IDE disk, and transfers
// n 16-bit words to the buffer starting at address buf.
//
// Side effects:
//   A.

.macro IDE_DATACMD(cmd, buf, n)
	LI %cmd			; IDE_DCR(%cmd)
	JSR _ide_datacmd
	.word %n		; This will be skipped by the subroutine.
	.word %buf		; So will this.
.end



// Macro: IDE_SELDRVL(n)
//
// Select the specified IDE drive. The parameter must be a 0 or 1 literal.
// No checking is carried out.
//
// Side effects:
//   A.

.macro IDE_SELDRVL(n)
	LI IDE_DHR IDE_DRV%n	; SLDRV(%n)
	OUT I IDEDHR		; Set drive/head reg
.end



///////////////////////////////////////////////////////////////////////////////
//
// CODE
//
///////////////////////////////////////////////////////////////////////////////


	;; Set up the IDE registers
	;;
	;; Inputs:
	;;   TMP1 = IDE controller base port.
	;;
	;; Output:
	;;   The IDEx register registers are all updated with the I/O
	;;   addresses of the IDE registers. AC and L are also modified.
	;;
	;; Side effects:
	;;   I0 is clobbered.
	;;   I1 is clobbered.
	;;   TMP0 is clobbered.
	;;   TMP1 is clobbered.

_ide_setup:
	LOAD TMP1
	XOR IDEDCR		; Compare against DCR
	AND PLUSFFF0		; Drop the lease significant 16 bits
	SNZ			; Same?
	RET			; Yes: already selected. Bail out.

	LI &3ff			; Invalidate the current unit register.
	STORE IDECURU		; ... This forces _ide_selunit to act.

	LIA IDEDCR		; Start of the IDE register block
	STORE I0
	LIA _ide_setup_data
	STORE I1
	RMOV(I2, I I1)

_ide_setup_loop:
	RADD(I I0, TMP1, I I1)	; mem[I0++] = TMP0 + mem[I1++]
	LOAD I0
	ISZ I2
	JMP _ide_setup_loop
	RET

_ide_setup_data:
	.word @_ide_setup_data1-_ide_setup_data_end
_ide_setup_data1:
	.word IDE_OFS_DCR
	.word IDE_OFS_DATA
	.word IDE_OFS_ERROR
	.word IDE_OFS_SCOUNT
	.word IDE_OFS_LBA0
	.word IDE_OFS_LBA1
	.word IDE_OFS_LBA2
	.word IDE_OFS_DHR
	.word IDE_OFS_CMD
_ide_setup_data_end:



	;; Select IDE unit 0/1
	;;
	;; Inputs:
	;;   TMP2 = unit to select. Must be 0 or 1.
	;;
	;; Output:
	;;   None.
	;;
	;; Side effects:
	;;   Disk n is selected on the current IDE channel.
	;;   TMP3 is clobbered.

_ide_selunit:
	LOAD IDECURU		; Check the currently selected unit.
	XOR TMP2		; Same as the one requested?
	SNZ
	RET			; Yes. Bail out

	RMOV(IDECURU, TMP2)	; Store the current unit.
	LIA _ide_selunit_data
	ADD TMP2
	STORE TMP3
	LOAD I TMP3		; Load the value itself.
	OUT I IDEDHR
	STORE IDEDHRB
	RET

_ide_selunit_data:
	.word IDE_DHR IDE_DRV0
	.word IDE_DHR IDE_DRV1



	;; Send a command to an IDE disk and read back data.
	;;
	;; Inputs:
	;;   AC = command.
	;;   [RETV]: number of words to read.
	;;   [RETV+1]: where to store them.
	;;
	;; Output:
	;;
	;; Side effects:

_ide_datacmd:
	;; First things first! Send the command to the drive while we set up.
	HDCMD

	;; Now set up.
	LOAD I RETV		; How many words to read
	NEG
	STORE TMP0		; TMP0 = loop counter
	ISZ RETV

	LOAD I RETV
	STORE I0		; Autoindex buffer pointer
	ISZ RETV		; Adjust RETV so we skip the data words on exit.
	STORE TMP1		; Keep the value for later.

	;; Wait for the drive to clear BUSY, and assert DRQ.
	;; TODO: this currently doesn't time out. This will eventually be needed.
_ide_datacmd_ready_loop:
	IN I IDESR		; Check drive status.
	AND _ide_datacmd_mask	; Check BSY and DRDY bits
	XOR _ide_datacmd_val	; Ensure only DRDY is set
	SZA
	JMP _ide_datacmd_ready_loop

	;; The drive is ready for us. Start copying.
_ide_datacmd_read_loop:
	IN I IDEDATA
	STORE I I0
	ISZ TMP0
	JMP _ide_datacmd_read_loop

	;; Done.
	JMP I TMP1		; Return to RETV+2

_ide_datacmd_mask:
	.word #1000'1000	; BSY|DRQ
_ide_datacmd_val:
	.word #0000'1000	; DRQ



	;; word:  _HDSEL
	;; flags: CODE ROM CFT
        ;;   word _HDSEL defined in primitives/8100_ide.asm:256.
//dwn__HDSEL:
//        .strp "_HDSEL" 0
dw__HDSEL_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 1 ; Flags & hash
        .word dwn__HDSEL        ; Pointer to word name (above)
        .word dw_MBUq_head      ; Link to previous dictionary entry
dw__HDSEL:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw__HDSEL_pfa:
	;; notes: _HDSEL ( a n -- f )
	;;        Select disk n (0 or 1) on bus with base address a.

	RPOP(TMP2, SP)		; Unit number n
	RPOP(TMP1, SP)		; Base address a

	JSR _ide_setup		; Set the address and registers
	JSR _ide_selunit	; Select the drive unit.

	NEXT



	;; word:  _HDRST
	;; flags: CODE ROM CFT
        ;;   word _HDRST defined in primitives/8100_ide.asm:271.
//dwn__HDRST:
//        .strp "_HDRST" 0
dw__HDRST_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 1 ; Flags & hash
        .word dwn__HDRST        ; Pointer to word name (above)
        .word dw__HDSEL_head    ; Link to previous dictionary entry
dw__HDRST:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw__HDRST_pfa:
	;; notes: _HDRST ( -- f )
	;;        Reset the currently selected IDE channel and detect if a
        ;;        controller is present. Returns a non-zero flag if this is the
        ;;        case.

	;; Only reset if the first disk unit is selected.
	LOAD IDECURU
	SZA
	JMP _ide_rst_loop_fast	; Check to see if the unit is present.

	;; Assert SRST
	LI &0c
	HDDCR

	;; Wait 200ms (longer than the longest minimum reset pulse)
	LI 200
	PUSH(SP)
	FORTH(dw_MS)		; note: clobbers TMP0, TMP15, TMP14

	;; Deassert RST
	LI &08
	HDDCR

	LI 30		        ; Timeout after a bit
	NEG
	STORE I0

	;; Wait for BSY to clear and DRDY to set. Don't wait forever.
	;; Also ensure a controller is present.
	JMP _ide_rst_loop_fast	; Don't wait on the first iteration

_ide_rst_loop:
	LI &200
	PUSH(SP)
	FORTH(dw_PROGRESS)	; note: clobbers TMP0, TMP15, TMP14

_ide_rst_loop_fast:
	HDINASR			; Read the alt status register
	STORE TMP0

	;; Make sure there IS a controller present.
	XOR MINUS1		; If &FFFF, we're reading bus pull-ups.
	SNZ			; There's nothing there; bail out.
	JMP _ide_rst_no

	LOAD TMP0
	SNZ			; If &0000, we're reading bus pull-downs.
	JMP _ide_rst_no		; Bail out.

	;; Right. A controller is probably there. Check the status bits.
	LOAD TMP0
	AND _ide_BSY		; BSY set?
	SZA
	JMP _ide_rst_not_yet	; Yes. Go again.

	LOAD TMP0
	AND _ide_DRDY		; DRDY set?
	SZA
	JMP _ide_rst_yes	; Yes. We've got it.

_ide_rst_not_yet:
	ISZ I0
	JMP _ide_rst_loop

_ide_rst_no:
	LI 0
	JMP @_ide_rst_yes+1

_ide_rst_yes:
	LI 1
	PUSH(SP)
	NEXT



	;; TODO: Fix this: detect errors
	;; word:  IDE.BSY...
	;; alias: IDE_BSY_wait
	;; flags: CODE ROM CFT
        ;;   word IDE.BSY... defined in primitives/8100_ide.asm:350.
//dwn_IDE_BSY_wait:
//        .strp "IDE.BSY..." 0
dw_IDE_BSY_wait_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 3 ; Flags & hash
        .word dwn_IDE_BSY_wait  ; Pointer to word name (above)
        .word dw__HDRST_head    ; Link to previous dictionary entry
dw_IDE_BSY_wait:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_IDE_BSY_wait_pfa:
	;; notes: IDE.BSY... ( -- )
	;;        Wait for the disk to stop being busy.

_ide_bsy_loop:
	HDINASR
	AND _ide_BSY
	SZA
	JMP _ide_bsy_loop
	NEXT



	;; TODO: Fix this: detect errors
	;; word:  ...IDE.DRQ
	;; alias: IDE_DRQ_wait
	;; flags: CODE ROM CFT
        ;;   word ...IDE.DRQ defined in primitives/8100_ide.asm:366.
//dwn_IDE_DRQ_wait:
//        .strp "...IDE.DRQ" 0
dw_IDE_DRQ_wait_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 4 ; Flags & hash
        .word dwn_IDE_DRQ_wait  ; Pointer to word name (above)
        .word dw_IDE_BSY_wait_head ; Link to previous dictionary entry
dw_IDE_DRQ_wait:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_IDE_DRQ_wait_pfa:
	;; notes: IDE.DRQ... ( -- )
	;;        Wait until the disk has (or can accept) data.

_ide_drq_loop:
	HDINASR
	AND _ide_DRQ
	SNZ
	JMP _ide_drq_loop
	NEXT



	;; word:  idescr
	;; flags: CODE ROM CFT
        ;;   word idescr defined in primitives/8100_ide.asm:380.
//dwn_idescr:
//        .strp "IDESCR" 0
dw_idescr_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 7 ; Flags & hash
        .word dwn_idescr        ; Pointer to word name (above)
        .word dw_IDE_DRQ_wait_head ; Link to previous dictionary entry
dw_idescr:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_idescr_pfa:
	;; notes: idescr ( +n -- )
	;;        Set number of sectors for next command

	POP(SP)
	HDSCR
	NEXT



	;; TODO: Fix this: detect errors
	;; word:  idecmd
	;; flags: CODE ROM CFT
        ;;   word idecmd defined in primitives/8100_ide.asm:392.
//dwn_idecmd:
//        .strp "IDECMD" 0
dw_idecmd_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 7 ; Flags & hash
        .word dwn_idecmd        ; Pointer to word name (above)
        .word dw_idescr_head    ; Link to previous dictionary entry
dw_idecmd:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_idecmd_pfa:
	;; notes: idecmd ( x -- )
	;;        Issue an IDE command

	FORTH(dw_IDE_BSY_wait)
	POP(SP)
	OUT I IDECMD
	NEXT

_idecmd_data:
_ide_DRDY:
	.word &0040		; DRDY
_ide_BSY:
	.word &0080		; BSY
_ide_DRQ:
	.word &0008		; DRQ



	;; TODO: Fix this: timeout and issue error.
	;; word:  idewait
	;; flags: CODE ROM CFT
        ;;   word idewait defined in primitives/8100_ide.asm:413.
//dwn_idewait:
//        .strp "IDEWAIT" 0
dw_idewait_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 6 ; Flags & hash
        .word dwn_idewait       ; Pointer to word name (above)
        .word dw_idecmd_head    ; Link to previous dictionary entry
dw_idewait:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_idewait_pfa:
	;; notes: idewait ( -- )
	;;        Issue an IDE command

_idewait_loop:
	IN R &a6
	AND _ide_BSY
	SNZ
	JMP _idewait_loop
	NEXT

_ide_rst_kw:
	.strp " kW, " 0

	;; word:  _HDIDENT
	;; flags: CODE ROM CFT
        ;;   word _HDIDENT defined in primitives/8100_ide.asm:428.
//dwn__HDIDENT:
//        .strp "_HDIDENT" 0
dw__HDIDENT_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 7 ; Flags & hash
        .word dwn__HDIDENT      ; Pointer to word name (above)
        .word dw_idewait_head   ; Link to previous dictionary entry
dw__HDIDENT:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw__HDIDENT_pfa:
	;; notes: _HDIDENT ( )
	;;        Send IDENTIFY command to current drive, see what it has to
	;;        say for itself. Copy some information about them to the
	;;        relevant registers.

	LIA HD0SZLO
	STORE I0

	;; Drive 0 first.
	IDE_SELDRVL(0)

	;; Wait for the disk to be ready.
	FORTH(dw_IDE_BSY_wait)	; IDE.BSY...

	;; Send an identify command and transfer the first 60 words to
	;; IDE_EARLYBUF
	IDE_DATACMD(IDE_IDENTIFY, IDE_EARLYBUF, 63)

	;; Copy the disk capacity
	LI 57			; Word 57 (capacity low)
	ADD _ide_rst_buf
	STORE I0
	RMOV(HD0SZLO, I I0)
	STORE TMP15
	RMOV(HD0SZHI, I I0)	; Word 58 (capacity high)
	STORE TMP14

	;; Output the size in kW (sectors / 4)
	LOAD TMP14
	PUSH(SP)
	SBR
	STORE TMP14
	LOAD TMP15
	PUSH(SP)
	RBR
	STORE TMP15
	LOAD TMP14
	SBR
	STORE TMP14
	LOAD TMP15
	RBR
	STORE TMP15
	PUSH(SP)
	RPUSH(SP, TMP14)
	FORTH(dw__Dstr)

	FORTH(dw_TYPE)
	LIA _ide_rst_kw
	PUSH(SP)
	FORTH(dw_typep0)

	;; Output the model name
	LI 27
	ADD _ide_rst_buf
	PUSH(SP)
	LI 40
	PUSH(SP)
	FORTH(dw_dash_cTRAILING)
	FORTH(dw_TYPEp)
	FORTH(dw_SPACE)

	NEXT

_ide_rst_buf:
	.word IDE_EARLYBUF

	;; word:  _HDSMLT
	;; flags: DOCOL ROM CFT
        ;;   word _HDSMLT defined in primitives/8100_ide.asm:496.
//dwn__HDSMLT:
//        .strp "_HDSMLT" 0
dw__HDSMLT_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 0 ; Flags & hash
        .word dwn__HDSMLT       ; Pointer to word name (above)
        .word dw__HDIDENT_head  ; Link to previous dictionary entry
dw__HDSMLT:
        CFA_doCOL()       ; Code entry point: next instruction
dw__HDSMLT_pfa:
	;; notes: _HDSMLT ( n )
	;;        Set multiple mode to the given number of sectors.

	.word dw_idescr	        ; idescr ( ) \ Set the Sector Count Register
	doLIT(IDE_SETMULT)
	.word dw_idecmd		; idecmd ( ) \ Set multiple mode
	.word dw_EXIT



	;; word:  HD.INIT
	;; flags: DOCOL ROM CFT
        ;;   word HD.INIT defined in primitives/8100_ide.asm:508.
//dwn_HD_INIT:
//        .strp "HD.INIT" 0
dw_HD_INIT_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 7 ; Flags & hash
        .word dwn_HD_INIT       ; Pointer to word name (above)
        .word dw__HDSMLT_head   ; Link to previous dictionary entry
dw_HD_INIT:
        CFA_doCOL()       ; Code entry point: next instruction
dw_HD_INIT_pfa:
	;; notes: HD.INIT ( n -- f )
	;;        Initialise disk device HDn to be the disk on bus with base
	;;        address a and the specified unit number.  Returns flag f if a
	;;        drive was found. Sets configuration flags and makes disk
	;;        available for access.

 	.word dw_DUP		; DUP ( n n )
	.word dw_to_R		; >R ( n )
	.word dw__HD_set	; _HD! ( ) \ Select drive <a,n>.
	.word dw__HDRST		; _HDRST ( f ) \ Reset & detect.

	.word dw_if_branch	;   \ Skip the rest if no disk
	.word _ide_init_no
	.word dw__HDIDENT	; _HDIDENT ( sizelo sizehi ) \ Identify disk.
	.word dw_SWAP 		; SWAP ( sizehi sizelo )
	doLIT(4)		; 4 sectors = one kiloword
	.word dw__HDSMLT	; _HDSMLT ( sizehi sizelo ) \ Set multiple mode.
	doLIT(1)		;  ( sizehi sizelo 1 )
	.word dw_not_ROT	; -ROT ( 1 sizehi sizelo )

_ide_init_done:
	.word dw_R_from		; R> ( f sizehi sizelo n )
	.word dw__IDE_addr	; IDE@ ( f sizehi sizelo addr )

	.word dw_DUP		; DUP ( f sizehi sizelo addr addr )
	.word dw_to_R		; >R ( f sizehi sizelo addr )
	.word dw_store		; ! ( f sizehi )
	.word dw_R_from		; R> ( f sizehi addr )
	.word dw_inc		; 1+ ( f sizehi addr+1 )
	.word dw_store		; ! ( f )
	.word dw_EXIT

_ide_init_no:
	doLIT(0)		; 0 ( 0 )
	.word dw_2DUP		; 0 ( 0 0 0 )
	.word dw_branch
	.word _ide_init_done



	;; word:  _IDE@
	;; alias: _IDE_addr
	;; flags: DOCOL ROM CFT
        ;;   word _IDE@ defined in primitives/8100_ide.asm:551.
//dwn__IDE_addr:
//        .strp "_IDE@" 0
dw__IDE_addr_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn__IDE_addr     ; Pointer to word name (above)
        .word dw_HD_INIT_head   ; Link to previous dictionary entry
dw__IDE_addr:
        CFA_doCOL()       ; Code entry point: next instruction
dw__IDE_addr_pfa:
	;; notes: _IDE@ ( n -- addr )
	;;        Returns the address of the dist structure for disk unit n.
	;; code:  : _HDaddr ( n -- addr ) 2* HD0SZLO + ;

	.word dw_2mul		; 2* ( 2n )
	doREG(HD0SZLO)		; base address ( 2n addr )
	.word dw_add		; + ( addr )
	.word dw_EXIT



	;; word:  _IDE!
	;; alias: _HD_set
	;; flags: DOCOL ROM CFT
        ;;   word _IDE! defined in primitives/8100_ide.asm:565.
//dwn__HD_set:
//        .strp "_IDE!" 0
dw__HD_set_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn__HD_set       ; Pointer to word name (above)
        .word dw__IDE_addr_head ; Link to previous dictionary entry
dw__HD_set:
        CFA_doCOL()       ; Code entry point: next instruction
dw__HD_set_pfa:
	;; notes: _HD! ( n -- )
	;;        Select the specified disk unit.

	doLIT(3)		; 3
	.word dw_AND		; AND ( n )

	;; Bit 1 is the IDE bus.
	.word dw_DUP		; DUP ( n n )
	doLIT(2)		; 2 ( n n 2 )
	.word dw_AND		; AND ( n f )
	.word dw_2div		; 2/ ( n f )
	doREG(SYSIDE0)		; SYSIDE0 ( n f addr )
	.word dw_add		; + ( n addr )
	.word dw_fetch		; @ ( n ioaddr )
	.word dw_SWAP		; SWAP ( ioaddr n )
	;; Bit 0 is the unit number.
	doLIT(1)		; 1 ( ioaddr n 1 )
	.word dw_AND		; AND ( ioaddr unit )
	.word dw__HDSEL		; _HDSEL
	.word dw_EXIT



	;; word:  HDSET
	;; alias: HDSET
	;; flags: DOCOL ROM CFT
        ;;   word HDSET defined in primitives/8100_ide.asm:591.
//dwn_HDSET:
//        .strp "HDSET" 0
dw_HDSET_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 5 ; Flags & hash
        .word dwn_HDSET         ; Pointer to word name (above)
        .word dw__HD_set_head   ; Link to previous dictionary entry
dw_HDSET:
        CFA_doCOL()       ; Code entry point: next instruction
dw_HDSET_pfa:
	;; notes: HDSET ( n -- )
	;;        Select the specified disk unit. Throw an error if not present.
	;; code:  : HDSET ( n -- ) DUP HD? OR 0= ABORT" HD not present" _HD! ;

	.word dw_DUP
	.word dw_HDq
	.word dw_OR
	.word dw_zero_equals
	.word dw_doABORT_str
	.word @+9
	.strp "HD not present" 0
	;;     223344556677889.
	.word dw__HD_set
	.word dw_EXIT



	;; word:  HD?
	;; alias: HDq
	;; flags: DOCOL ROM CFT
        ;;   word HD? defined in primitives/8100_ide.asm:611.
//dwn_HDq:
//        .strp "HD?" 0
dw_HDq_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 3 ; Flags & hash
        .word dwn_HDq           ; Pointer to word name (above)
        .word dw_HDSET_head     ; Link to previous dictionary entry
dw_HDq:
        CFA_doCOL()       ; Code entry point: next instruction
dw_HDq_pfa:
	;; notes: HD? ( n -- d )
	;;        Returns a non-zero double integer if IDE disk IDE n
        ;;        is present. The value represents the number of
        ;;        sectors on the disk.
	;; code:  : HD? ( n -- d ) HD 2fetch ;

	.word dw__IDE_addr
	.word dw_two_fetch
	.word dw_EXIT



	;; word:  IDE.INIT
	;; flags: DOCOL ROM CFT
        ;;   word IDE.INIT defined in primitives/8100_ide.asm:625.
//dwn_IDE_INIT:
//        .strp "IDE.INIT" 0
dw_IDE_INIT_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 1 ; Flags & hash
        .word dwn_IDE_INIT      ; Pointer to word name (above)
        .word dw_HDq_head       ; Link to previous dictionary entry
dw_IDE_INIT:
        CFA_doCOL()       ; Code entry point: next instruction
dw_IDE_INIT_pfa:
	;; notes: IDE.INIT ( n addr -- )
	;;        Initialise IDE channel #n at address addr.

	.word dw_SWAP		; SWAP ( addr n )
	doREG(SYSIDE0)		; SWAP SYSIDE0 ( addr n addr )
	.word dw_add		; SWAP SYSIDE ( addr addr )
	.word dw_store		; ! ( )
	.word dw_EXIT



	;; word:  IDE.RB
	;; flags: CODE ROM CFT
        ;;   word IDE.RB defined in primitives/8100_ide.asm:638.
//dwn_IDE_RB:
//        .strp "IDE.RB" 0
dw_IDE_RB_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 7 ; Flags & hash
        .word dwn_IDE_RB        ; Pointer to word name (above)
        .word dw_IDE_INIT_head  ; Link to previous dictionary entry
dw_IDE_RB:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_IDE_RB_pfa:
	;; notes: IDE.rd ( addr -- )
	;;        Read an IDE block from the current drive, store at addresses a1 to a1+BKSIZE-1.

	FORTH(dw_IDE_DRQ_wait)	; IDE_DRQ... (wait for DRQ to be set)

	RPOP(I0, SP)		; buffer addr
	RMOV(I1, _iderb_count)

_iderb_loop:
	IN I IDEDATA
	STORE I I0
	ISZ I1
	JMP _iderb_loop
	NEXT

 _iderb_count:
 	.word @0-BKSIZE		; -BKSIZE



	;; word:  IDE.WB
	;; flags: CODE ROM CFT
        ;;   word IDE.WB defined in primitives/8100_ide.asm:660.
//dwn_IDE_WB:
//        .strp "IDE.WB" 0
dw_IDE_WB_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 7 ; Flags & hash
        .word dwn_IDE_WB        ; Pointer to word name (above)
        .word dw_IDE_RB_head    ; Link to previous dictionary entry
dw_IDE_WB:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_IDE_WB_pfa:
	;; notes: IDE.wr ( addr -- )
	;;        Copy a block from a1 to the current drive's buffer. BKSIZE cells are copied.

	FORTH(dw_IDE_DRQ_wait)	; IDE_DRQ... (wait for DRQ to be set)

	RPOP(I0, SP)		; buffer addr
	STORE I0
	RMOV(I1, _iderb_count)

_idewb_loop:

	LOAD I I0
	OUT I IDEDATA
	ISZ I1
	JMP _idewb_loop
	NEXT



	;; word:  IDE.SEEKB
	;; flags: CODE ROM CFT
        ;;   word IDE.SEEKB defined in primitives/8100_ide.asm:681.
//dwn_IDE_SEEKB:
//        .strp "IDE.SEEKB" 0
dw_IDE_SEEKB_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 0 ; Flags & hash
        .word dwn_IDE_SEEKB     ; Pointer to word name (above)
        .word dw_IDE_WB_head    ; Link to previous dictionary entry
dw_IDE_SEEKB:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_IDE_SEEKB_pfa:
	;; notes: IDE.SEEKB ( d -- )
	;;        Set the block number for subsequent operations.
	;;        Blocks are hardwired to 4 disk sectors, and block numbers
	;;        are IDE LBA blocks << 2. Perform this conversion here.

	POP(SP)			; Pop high block number (sector bits 18-33)
	STORE TMP1
	RNR			; >>4
	RBR			; >>1
	RBR			; >>1 --> total 6 bits
	AND PLUS15		; AND 15
	OR IDEDHRB		; Base DHR value
	OUT I IDEDHR		; Set drive/head (aka LBA3) reg

	LOAD TMP1		; Load sector bits 18-33
	AND BYTELO		; Get bits 16-23
	OUT I IDELBA2		; Output to LBA 16-23 reg

	POP(SP)			; Pop low block number (sector bits 2-17)
	STORE TMP1

	RNR			; >>4
	RBR			; >>1
	RBR			; >>1 --> total 6 bits
	AND BYTELO		; Get low 8 bits
	OUT I IDELBA1		; Out to LBA 8-15 reg

	LOAD TMP1		; Load bits 2-17
	AND BYTELO		; Bits 16-23
	OUT I IDELBA0		; Output to LBA 0-8 reg

	NEXT



	;; word:  IDE.SEEK
	;; flags: CODE ROM CFT
        ;;   word IDE.SEEK defined in primitives/8100_ide.asm:718.
//dwn_IDE_SEEK:
//        .strp "IDE.SEEK" 0
dw_IDE_SEEK_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 1 ; Flags & hash
        .word dwn_IDE_SEEK      ; Pointer to word name (above)
        .word dw_IDE_SEEKB_head ; Link to previous dictionary entry
dw_IDE_SEEK:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_IDE_SEEK_pfa:
	;; notes: IDE.SEEK ( d -- )
	;;        Set the sector number for subsequent operations.

	POP(SP)			; Pop high LBA (bits 16-31)
	STORE TMP1
	RNR			; >>4
	RNR			; >>4
	AND PLUS15		; AND 15
	OR IDEDHRB		; Base DHR value
	OUT I IDEDHR		; Set drive/head (aka LBA3) reg

	LOAD TMP1		; Load bits 16-31
	AND BYTELO		; Get bits 16-23
	OUT I IDELBA2		; Output to LBA 16-23 reg

	POP(SP)			; Pop low LBA (bits 0-15)
	STORE TMP1

	RNR			; >>4
	RNR			; >>4
	AND BYTELO		; Get low 8 bits
	OUT I IDELBA1		; Out to LBA 8-15 reg

	LOAD TMP1		; Load bits 16-31
	AND BYTELO		; Get bits 16-23
	OUT I IDELBA0		; Output to LBA 0-8 reg

	NEXT



	;; word:  HD>
	;; alias: HD_from
	;; flags: DOCOL ROM CFT
        ;;   word HD> defined in primitives/8100_ide.asm:752.
//dwn_HD_from:
//        .strp "HD>" 0
dw_HD_from_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 3 ; Flags & hash
        .word dwn_HD_from       ; Pointer to word name (above)
        .word dw_IDE_SEEK_head  ; Link to previous dictionary entry
dw_HD_from:
        CFA_doCOL()       ; Code entry point: next instruction
dw_HD_from_pfa:
	;; notes: HD> ( d addr -- )
	;;        Read the specified BKSIZE-cell block number (a double integer)
        ;;        from the current disk unit and store it in memory starting at
        ;;        address addr.
	;;        Note: disk block addresses are sectors times 4.

	.word dw_IDE_BSY_wait	; IDE.BSY... ( lo hi addr ) \ Wait for disk to be ready.

	;; Seek to the sector
	.word dw_not_ROT	; SWAP ( addr lo hi )
	.word dw_IDE_SEEK	; IDE.SEEK ( addr )

	;; Request one sector
	doLIT(1)
	.word dw_idescr

	;; Read it
	;doLIT(IDE_READR)	; ( addr cmd )
	doLIT(IDE_READMULT)	; ( addr cmd )
	.word dw_idecmd		; ( addr )

	;; Copy it to memory.
	.word dw_IDE_RB		; IDE.RB ( )
	.word dw_EXIT



	;; word:  >HD
	;; alias: to_HD
	;; flags: DOCOL ROM CFT
        ;;   word >HD defined in primitives/8100_ide.asm:782.
//dwn_to_HD:
//        .strp ">HD" 0
dw_to_HD_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 5 ; Flags & hash
        .word dwn_to_HD         ; Pointer to word name (above)
        .word dw_HD_from_head   ; Link to previous dictionary entry
dw_to_HD:
        CFA_doCOL()       ; Code entry point: next instruction
dw_to_HD_pfa:
	;; notes: >HD ( d addr -- )
	;;        Write 256 words starting at address addr to the disk sector
        ;;        specified in d (a double integer).

	.word dw_IDE_BSY_wait	; IDE.BSY... ( lo hi addr ) \ Wait for disk to be ready.

	;; Seek to the sector
	.word dw_not_ROT	; SWAP ( addr lo hi )
	.word dw_IDE_SEEK	; IDE.SEEK ( addr )

	;; Request one sector
	doLIT(1)
	.word dw_idescr

	;; Write it
	doLIT(IDE_WRITER)	; ( addr cmd )
	.word dw_idecmd		; ( addr )

	;; Copy the buffer from memory to the drive.
	.word dw_IDE_WB		; IDE.WB ( )

	;; At this point, the drive writes the sector. Wait for it to finish.
	.word dw_IDE_BSY_wait	; IDE.BSY... ( )

	.word dw_EXIT



	;; word:  pstate
	;; flags: DOCOL ROM CFT
        ;;   word pstate defined in primitives/8100_ide.asm:812.
//dwn_pstate:
//        .strp "PSTATE" 0
dw_pstate_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 6 ; Flags & hash
        .word dwn_pstate        ; Pointer to word name (above)
        .word dw_to_HD_head     ; Link to previous dictionary entry
dw_pstate:
        CFA_doCOL()       ; Code entry point: next instruction
dw_pstate_pfa:

	doLIT(_pstate1)
	.word dw_typep0
	.word dw_HEX
	.word dw_BLK
	.word dw_fetch_dot

	doLIT(_pstate2)
	.word dw_typep0
	.word dw_ofsIN
	.word dw_fetch_dot

	doLIT(_pstate3)
	.word dw_typep0
	.word dw_TIB
	.word dw_fetch_dot

	doLIT(_pstate4)
	.word dw_typep0
	.word dw_cTIB
	.word dw_fetch_dot

	doLIT(_pstate5)
	.word dw_typep0
	.word dw_BLKBUF
	.word dw_fetch_dot

	doLIT(_pstate6)
	.word dw_typep0
	.word dw_pBLK
	.word dw_fetch_dot

	doLIT(_pstate7)
	.word dw_typep0
	.word dw_cBLK
	.word dw_fetch_dot

	doLIT(_pstate9)
	.word dw_typep0
	.word dw_EOBq
	.word dw_dot

	doLIT(_pstatea)
	.word dw_typep0
	.word dw_pLINE
	.word dw_fetch_dot

	doLIT(_pstateb)
	.word dw_typep0
	.word dw_cLINE
	.word dw_fetch_dot

	doLIT(_pstate8)
	.word dw_typep0
	.word dw_EOLq
	.word dw_dot

	.word dw_CR

	.word dw_EXIT


_pstate1:	.strp 10 "Parse state: BLK" 0
_pstate2:	.strp ", >IN" 0
_pstate3:	.strp ", TIB" 0
_pstate4:	.strp ", #TIB" 0
_pstate5:	.strp ", BLKBUF" 0
_pstate6:	.strp ", >BLK" 0
_pstate7:	.strp ", #BLK" 0
_pstate9:	.strp ", EOB?" 0
_pstate8:	.strp ", EOL?" 0
_pstatea:	.strp ", >LINE" 0
_pstateb:	.strp ", #LINE" 0



	;; word:  test
	;; flags: DOCOL ROM CFT
        ;;   word test defined in primitives/8100_ide.asm:890.
//dwn_test:
//        .strp "TEST" 0
dw_test_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 0 ; Flags & hash
        .word dwn_test          ; Pointer to word name (above)
        .word dw_pstate_head    ; Link to previous dictionary entry
dw_test:
        CFA_doCOL()       ; Code entry point: next instruction
dw_test_pfa:

	;; Choose disk #0.
	doLIT(0)		; 0
	.word dw_HDSET		; HDSET ( )

	;; Read the first sector
	doLIT(0)		; 0 ( 0 )
	doLIT(0)		; 0 ( 0 0 )
	doLIT(&8000)		; &1000 ( 0 0 &1000)
	.word dw_HD_from	; HD> ( 0 )

	;; Dump some of the sector
	;; doLIT(&8000)
	;; doLIT(&70)
	;; .word dw_DUMP
	;; .word dw_DROP

	;; Set block parser
	doLIT(1)
	.word dw_BLK
	.word dw_store

	;; Reset >BLK
	doLIT(0)
	.word dw_pBLK
	.word dw_store

	;; Set BLKBUF
	doLIT(&8000)
	.word dw_BLKBUF
	.word dw_store

	.word dw_BLKBUF
	.word dw_fetch
	.word dw_BLKBS
	.word dw_dash_TRAILING
	.word dw_cBLK		; #BLK ( a n va )
	.word dw_store		; ! ( a )
	.word dw_DROP		; DROP ( )

	;; Save parse state.
	.word dw_cTIB
	.word dw_fetch
	.word dw_to_R

	.word dw_TIB
	.word dw_fetch
	.word dw_to_R

	.word dw_ofsIN
	.word dw_fetch
	.word dw_to_R

_test_loop:
	.word dw_EOBq		; EOB? ( f )
	.word dw_NOT		; NOT ( f )
	.word dw_if_branch	;   (if false...)
	.word _test_end		;   ... then read a line

	.word dw_getline
	.word dw_INTERPRET

	.word dw_branch
	.word _test_loop

_test_end:
	.word dw_R_from
	.word dw_ofsIN
	.word dw_store

	.word dw_R_from
	.word dw_TIB
	.word dw_store

	.word dw_R_from
	.word dw_cTIB
	.word dw_store

	doLIT(0)
	.word dw_BLK
	.word dw_store

	.word dw_EXIT



// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/8100_memory.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// Memory detection.


_mem_init_strmem:
	.strp "MEM:" 0
_mem_init_strram:
	.strp " kw RAM," 0
_mem_init_strrom:
	.strp " kW ROM " 0



	;; word:  MEM.INIT
	;; flags: DOCOL ROM CFT
        ;;   word MEM.INIT defined in primitives/8100_memory.asm:16.
//dwn_MEM_INIT:
//        .strp "MEM.INIT" 0
dw_MEM_INIT_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 5 ; Flags & hash
        .word dwn_MEM_INIT      ; Pointer to word name (above)
        .word dw_test_head      ; Link to previous dictionary entry
dw_MEM_INIT:
        CFA_doCOL()       ; Code entry point: next instruction
dw_MEM_INIT_pfa:
	;; notes: MBU.INIT ( -- )
	;;        Scan and initialise memory.

	doLIT(_mem_init_strmem)
	.word dw_typep0

	;; Disable emulator sanity checking.
	.word dw_SANITY_off

	;; If the MBU is present, scan physical memory. If not, scan just the
	;; standard address space.

	.word dw_MBUq		; MBU? ( f ) \ 1 if MBU present
	.word dw_if_branch	; \ branch if zero
	.word _mem_init_nonbanking

_mem_init_banking:

	;; Store the previous setting of bank 3

	doLIT(3)		; 3 ( 3 )
	.word dw_MBU_fetch	; MBU@ ( a )
	.word dw_to_R		; >R ( )

	;; Go through all 256 memory blocks

	doLIT(255)		; 255 ( a )
	.word dw_to_R		; >R ( )
	doLIT(0)		; 0 ( u )
	.word dw_DUP		; DUP ( nrom nram )


_mem_init_loop1:

	;; .word dw_R_fetch	; R@ ( nrom nram bank )
	;; .word dw_PRINTD

	;; Set the bank
	.word dw_R_fetch	; R@ ( nrom nram bank )
	doLIT(3)
	.word dw_MBU_store	; MBU! (nrom nram )

	;; .word dw_times_BANK	; *BANK ( nrom nram addr )
	doLIT(&6000)		; &6000 ( nrom nram &6000 ) \Start of bank #3
	.word dw__MEMq		; MEM? ( nrom nram f1 f2 )
	.word dw_DPLUS		; D+ ( nrom' nram' )


	.word dw_R_from		; R> ( nrom nram bank )
	.word dw_if_DUP		; ?DUP ( nrom nram bank bank | nrom nram 0 )
	.word dw_if_branch	;   branch
	.word _mem_init_end1

	.word dw_dec		; 1- ( nrom nram bank-1 )
	.word dw_to_R		; >R ( nrom nram )
	.word dw_branch
	.word _mem_init_loop1

_mem_init_end1:

	;; Restore the bank configuration
	.word dw_R_from		; R> ( bank )
	doLIT(3)		; 3 ( bank 3 )
	.word dw_MBU_store	; MBU!

_mem_init_report:

	;; Disable emulator sanity checking.
	.word dw_SANITY_on

	;; ( nrom nram )
	.word dw_2DUP		; 2DUP ( nrom nram nrom nram )
	.word dw_256mul		; 256* ( nrom nram nrom nram<<8 )
	.word dw_OR		; OR ( nrom nram nram<<8|nrom )
	doLIT(@SYSMEM&&3ff)	; SYSMEM (remove R bit to get actual address)
	.word dw_store		; Store it.

	.word dw_16mul		; 16*
	.word dw_2div		; 2/
	.word dw_dot		; . ( nrom )
	doLIT(_mem_init_strram)
	.word dw_typep0

	.word dw_16mul		; 16*
	.word dw_2div		; 2/
	.word dw_dot		; . ( )

	doLIT(_mem_init_strrom)
	.word dw_typep0

	.word dw_EXIT

_mem_init_nonbanking:

	;; Go through all 8 memory, 8kW at a time.

	doLIT(7)		; 7 ( a )
	.word dw_to_R		; >R ( )
	doLIT(0)		; 0 ( u )
	.word dw_DUP		; DUP ( nrom nram )

_mem_init_loop2:

	;; Get the address
	.word dw_R_fetch	; R@ ( nrom nram bank )
	.word dw_BANKS		; BANKS ( nrom nram bank<<13 )
	.word dw__MEMq		; MEM? ( nrom nram f1 f2 )
	.word dw_DPLUS		; D+ ( nrom' nram' )

	.word dw_R_from		; R> ( nrom nram bank )
	.word dw_if_DUP		; ?DUP ( nrom nram bank bank | nrom nram 0 )
	.word dw_if_branch	;   branch
	.word _mem_init_report

	.word dw_dec		; 1- ( nrom nram bank-1 )
	.word dw_to_R		; >R ( nrom nram )
	.word dw_branch
	.word _mem_init_loop2



	;; word:  _MEM?
	;; alias: _MEMq
	;; flags: CODE ROM CFT
        ;;   word _MEM? defined in primitives/8100_memory.asm:140.
//dwn__MEMq:
//        .strp "_MEM?" 0
dw__MEMq_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn__MEMq         ; Pointer to word name (above)
        .word dw_MEM_INIT_head  ; Link to previous dictionary entry
dw__MEMq:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw__MEMq_pfa:
	;; notes: _MEM? ( a -- 1 0 | 0 1 | 0 0 )
	;;        Checks address a for writeability. Returns f1 which is 1 iff
        ;;        ROM was found, and f2 which is 1 iff RAM was found. The test is based
	;;        on whether certain values may be written to memory addresses. If
	;;        a value is read back as &FFFF or &0000 it is assumed to be non-memory
	;;        (bus pull-ups or pull-downs) and f1=f2=0 is returned.

	//DEBUGON
	POP SP
	STORE TMP1		; TMP1 = address
	LOAD I TMP1		; Load original data
	STORE TMP2		; Store in TMP2

	XOR MINUS1		; Toggle all bits.
	STORE I TMP1		; Write the value back
	LOAD I TMP1		; And read it again
	XOR TMP2		; Is it still the same?

	SNZ
	JMP _MEMq_maybe_ROM	; Write had no effect. Probably ROM.

_MEMq_RAM:
	LOAD TMP2		; Restore the value, since it's RAM.
	STORE I TMP1
	LI 0
	PUSH SP
	LI 1
	PUSH SP			; ( -- 0 1 ) \ RAM
	NEXT

_MEMq_maybe_ROM:
	LOAD TMP2
	XOR MINUS1		; Is it &FFFF?
	SNZ
	JMP _MEMq_no		; Yes. It's probably not memory (bus pull-up).

	LI 0
	XOR TMP2		; Is it &0000?
	SZA
	JMP _MEMq_ROM		; Yes. It's probably not memory (bus pull-up).

_MEMq_no:
	LI 0
	PUSH SP
	PUSH SP			; ( -- 0 0 ) \ No memory at this location
	NEXT

_MEMq_ROM:
	LI 1
	PUSH SP
	LI 0
	PUSH SP			; ( -- 1 0) \ ROM
	NEXT



// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/8500_vtio.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// CFT-specific code.



	;; word:  ESC
	;; flags: DOCOL ROM CFT
        ;;   word ESC defined in primitives/8500_vtio.asm:8.
//dwn_ESC:
//        .strp "ESC" 0
dw_ESC_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 6 ; Flags & hash
        .word dwn_ESC           ; Pointer to word name (above)
        .word dw__MEMq_head     ; Link to previous dictionary entry
dw_ESC:
        CFA_doCOL()       ; Code entry point: next instruction
dw_ESC_pfa:
	;; notes: ESC ( -- )
	;;        Emits an ESC character (codepoint 27).
	;; code: : ESC ( -- ) 27 EMIT ;

	doLIT(27)
	.word dw_EMIT
	.word dw_EXIT



	;; word:  vt.
	;; alias: vt_dot
	;; flags: DOCOL ROM CFT
        ;;   word vt. defined in primitives/8500_vtio.asm:21.
//dwn_vt_dot:
//        .strp "VT." 0
dw_vt_dot_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 5 ; Flags & hash
        .word dwn_vt_dot        ; Pointer to word name (above)
        .word dw_ESC_head       ; Link to previous dictionary entry
dw_vt_dot:
        CFA_doCOL()       ; Code entry point: next instruction
dw_vt_dot_pfa:
	;; notes: vt. ( u -- )
	;;        Display an unsigned integer in free format
	;; code: : vt. ( u -- ) <# #S #> TYPE EXIT ;

	.word dw__Ustr		; $ustr
	.word dw_TYPE		; TYPE
	.word dw_EXIT		; EXIT



	;; word:  vt.c
	;; alias: vt_dot_c
	;; flags: DOCOL ROM CFT
        ;;   word vt.c defined in primitives/8500_vtio.asm:34.
//dwn_vt_dot_c:
//        .strp "VT.C" 0
dw_vt_dot_c_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn_vt_dot_c      ; Pointer to word name (above)
        .word dw_vt_dot_head    ; Link to previous dictionary entry
dw_vt_dot_c:
        CFA_doCOL()       ; Code entry point: next instruction
dw_vt_dot_c_pfa:
	;; notes: vt. ( u -- )
	;;        Display an unsigned integer in free format
	;; code: : vt. ( u -- ) HEX <# # # #> TYPE EXIT ;

	.word dw_HEX		; HEX
	.word dw_bkt_number	; <#
	.word dw_number		; #
	.word dw_number		; #
	.word dw_number_bkt	; #>
	.word dw_TYPE		; TYPE
	.word dw_EXIT		; EXIT



	;; word:  <$VT
	;; alias: start_VT
	;; flags: DOCOL ROM CFT
        ;;   word <$VT defined in primitives/8500_vtio.asm:51.
//dwn_start_VT:
//        .strp "<$VT" 0
dw_start_VT_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 0 ; Flags & hash
        .word dwn_start_VT      ; Pointer to word name (above)
        .word dw_vt_dot_c_head  ; Link to previous dictionary entry
dw_start_VT:
        CFA_doCOL()       ; Code entry point: next instruction
dw_start_VT_pfa:
	;; notes: <$VT ( -- )
	;;        Add a CSI sequence which starts a DEC VTxxx terminal directive.

	.word dw_DECIMAL
	.word dw_ESC		; ESC
	doLIT(91)		; 91
	.word dw_EMIT		; EMIT
	.word dw_EXIT



	;; word:  VT$>
	;; alias: end_VT
	;; flags: DOCOL ROM CFT
        ;;   word VT$> defined in primitives/8500_vtio.asm:65.
//dwn_end_VT:
//        .strp "VT$>" 0
dw_end_VT_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn_end_VT        ; Pointer to word name (above)
        .word dw_start_VT_head  ; Link to previous dictionary entry
dw_end_VT:
        CFA_doCOL()       ; Code entry point: next instruction
dw_end_VT_pfa:
	;; notes: VT$> ( -- )
	;;        Ends a DEC VTxxx terminal directive.

	.word dw_EXIT



	;; word:  VTm$>
	;; alias: end_VTm
	;; flags: DOCOL ROM CFT
        ;;   word VTm$> defined in primitives/8500_vtio.asm:75.
//dwn_end_VTm:
//        .strp "VTM$>" 0
dw_end_VTm_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 3 ; Flags & hash
        .word dwn_end_VTm       ; Pointer to word name (above)
        .word dw_end_VT_head    ; Link to previous dictionary entry
dw_end_VTm:
        CFA_doCOL()       ; Code entry point: next instruction
dw_end_VTm_pfa:
	;; notes: VTm$> ( -- )
	;;   Ends a CSI ... m sequence.

	doCHAR("m")		; 'm'
	.word dw_EMIT		; EMIT
	.word dw_end_VT		; VT$>
	.word dw_EXIT



	;; word:  vt.NORMAL
	;; flags: DOCOL ROM CFT
        ;;   word vt.NORMAL defined in primitives/8500_vtio.asm:87.
//dwn_vt_NORMAL:
//        .strp "VT.NORMAL" 0
dw_vt_NORMAL_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 7 ; Flags & hash
        .word dwn_vt_NORMAL     ; Pointer to word name (above)
        .word dw_end_VTm_head   ; Link to previous dictionary entry
dw_vt_NORMAL:
        CFA_doCOL()       ; Code entry point: next instruction
dw_vt_NORMAL_pfa:
	;; notes: vt.NORMAL ( w -- )
	;;        Normal text.

	.word dw_start_VT	; <$VT
	doCHAR("0")		; same as DECIMAL 3 DIGIT
	.word dw_EMIT
	.word dw_end_VTm	; VTm$>
	.word dw_EXIT



	;; word:  vt.INK
	;; flags: DOCOL ROM CFT
        ;;   word vt.INK defined in primitives/8500_vtio.asm:100.
//dwn_vt_INK:
//        .strp "VT.INK" 0
dw_vt_INK_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 0 ; Flags & hash
        .word dwn_vt_INK        ; Pointer to word name (above)
        .word dw_vt_NORMAL_head ; Link to previous dictionary entry
dw_vt_INK:
        CFA_doCOL()       ; Code entry point: next instruction
dw_vt_INK_pfa:
	;; notes: vt.INK ( w -- )
	;;   Set the foreground colour using the lower three bits of w.

	.word dw_start_VT	; <$VT
	doCHAR("3")		; same as DECIMAL 3 DIGIT
	.word dw_EMIT		; EMIT
	doLIT(7)		; 7
	.word dw_AND		; AND
	.word dw_DIGIT		; DIGIT \ no need to use expensive division
	.word dw_EMIT		; EMIT
	.word dw_end_VTm	; VTm$>
	.word dw_EXIT



	;; word:  vt.BRIGHT
	;; flags: DOCOL ROM CFT
        ;;   word vt.BRIGHT defined in primitives/8500_vtio.asm:117.
//dwn_vt_BRIGHT:
//        .strp "VT.BRIGHT" 0
dw_vt_BRIGHT_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 7 ; Flags & hash
        .word dwn_vt_BRIGHT     ; Pointer to word name (above)
        .word dw_vt_INK_head    ; Link to previous dictionary entry
dw_vt_BRIGHT:
        CFA_doCOL()       ; Code entry point: next instruction
dw_vt_BRIGHT_pfa:
	;; notes: vt.BRIGHT ( -- )
	;;        Set bold mode.

	.word dw_start_VT	; <$VT
	doCHAR("1")
	.word dw_EMIT
	.word dw_end_VTm	; VTm$>
	.word dw_EXIT



	;; word:  vt.DIM
	;; flags: DOCOL ROM CFT
        ;;   word vt.DIM defined in primitives/8500_vtio.asm:130.
//dwn_vt_DIM:
//        .strp "VT.DIM" 0
dw_vt_DIM_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 0 ; Flags & hash
        .word dwn_vt_DIM        ; Pointer to word name (above)
        .word dw_vt_BRIGHT_head ; Link to previous dictionary entry
dw_vt_DIM:
        CFA_doCOL()       ; Code entry point: next instruction
dw_vt_DIM_pfa:
	;; notes: vt.DIM ( -- )
	;;        Normal mode (neither bold nor faint)

	.word dw_start_VT	; <$VT
	doCHAR("2")		; same as DECIMAL 3 DIGIT
	.word dw_DUP
	.word dw_EMIT		; EMIT
	.word dw_EMIT		; EMIT
	.word dw_end_VTm	; VTm$>
	.word dw_EXIT



	;; word:  vt.UNDERLINE
	;; flags: DOCOL ROM CFT
        ;;   word vt.UNDERLINE defined in primitives/8500_vtio.asm:145.
//dwn_vt_UNDERLINE:
//        .strp "VT.UNDERLINE" 0
dw_vt_UNDERLINE_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn_vt_UNDERLINE  ; Pointer to word name (above)
        .word dw_vt_DIM_head    ; Link to previous dictionary entry
dw_vt_UNDERLINE:
        CFA_doCOL()       ; Code entry point: next instruction
dw_vt_UNDERLINE_pfa:
	;; notes: vt.UNDERLINE ( -- )
	;;        Underline.

	.word dw_start_VT	; <$VT
	doCHAR("4")		; same as DECIMAL 3 DIGIT
	.word dw_EMIT		; EMIT
	.word dw_end_VTm	; VTm$>
	.word dw_EXIT



	;; word:  vt.UNDOFF
	;; flags: DOCOL ROM CFT
        ;;   word vt.UNDOFF defined in primitives/8500_vtio.asm:158.
//dwn_vt_UNDOFF:
//        .strp "VT.UNDOFF" 0
dw_vt_UNDOFF_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 7 ; Flags & hash
        .word dwn_vt_UNDOFF     ; Pointer to word name (above)
        .word dw_vt_UNDERLINE_head ; Link to previous dictionary entry
dw_vt_UNDOFF:
        CFA_doCOL()       ; Code entry point: next instruction
dw_vt_UNDOFF_pfa:
	;; notes: vt.UNDOFF ( -- )
	;;        Turn off underline.

	.word dw_start_VT	; <$VT
	doCHAR("2")		;
	.word dw_EMIT		; EMIT
	doCHAR("4")		;
	.word dw_EMIT		; EMIT
	.word dw_end_VTm	; VTm$>
	.word dw_EXIT



	;; word:  vt.PAPER
	;; flags: DOCOL ROM CFT
        ;;   word vt.PAPER defined in primitives/8500_vtio.asm:173.
//dwn_vt_PAPER:
//        .strp "VT.PAPER" 0
dw_vt_PAPER_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 6 ; Flags & hash
        .word dwn_vt_PAPER      ; Pointer to word name (above)
        .word dw_vt_UNDOFF_head ; Link to previous dictionary entry
dw_vt_PAPER:
        CFA_doCOL()       ; Code entry point: next instruction
dw_vt_PAPER_pfa:
	;; notes: PAPER ( w -- )
	;;   Set the background colour using the lower three bits of w.

	.word dw_start_VT	; <$VT
	doCHAR("4")		; same as DECIMAL 4 DIGIT
	.word dw_EMIT		; EMIT
	doLIT(7)		; 7
	.word dw_AND		; AND
	.word dw_DIGIT		; DIGIT \ no need to use expensive division
	.word dw_EMIT		; EMIT
	.word dw_end_VTm	; VTm$>
	.word dw_EXIT



	;; word:  vt.HOME
	;; flags: DOCOL ROM CFT
        ;;   word vt.HOME defined in primitives/8500_vtio.asm:190.
//dwn_vt_HOME:
//        .strp "VT.HOME" 0
dw_vt_HOME_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 1 ; Flags & hash
        .word dwn_vt_HOME       ; Pointer to word name (above)
        .word dw_vt_PAPER_head  ; Link to previous dictionary entry
dw_vt_HOME:
        CFA_doCOL()       ; Code entry point: next instruction
dw_vt_HOME_pfa:
	;; notes: vt.HOME ( -- )
	;;   Moves the cursor to the home position, (1,1).

	.word dw_start_VT	; <$VT
	doCHAR("H")		; same as DECIMAL 3 DIGIT
	.word dw_EMIT		; EMIT
	.word dw_end_VT		; VT$>
	.word dw_EXIT



	;; word:  vt.GOTOXY
	;; flags: DOCOL ROM CFT
        ;;   word vt.GOTOXY defined in primitives/8500_vtio.asm:203.
//dwn_vt_GOTOXY:
//        .strp "VT.GOTOXY" 0
dw_vt_GOTOXY_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 7 ; Flags & hash
        .word dwn_vt_GOTOXY     ; Pointer to word name (above)
        .word dw_vt_HOME_head   ; Link to previous dictionary entry
dw_vt_GOTOXY:
        CFA_doCOL()       ; Code entry point: next instruction
dw_vt_GOTOXY_pfa:
	;; notes: vt.GOTOXY ( x y -- )
	;;   Moves the cursor to the position (x,y), where position (1,1) is
	;;   the top-left corner of the terminal screen.
	;;
	;; code: vt.GOTOXY ( x y -- ) <$VT . 59 EMIT . 72 EMIT VT$> ;

	.word dw_start_VT	; <$VT
	.word dw_vt_dot		; .
	doCHAR(";")		; same as DECIMAL 3 DIGIT
	.word dw_EMIT		; EMIT
	.word dw_vt_dot		; .
	doCHAR("H")		;
	.word dw_EMIT		; EMIT
	.word dw_end_VT		; VT$>
	.word dw_EXIT



	;; word:  vt.ERASE
	;; flags: DOCOL ROM CFT
        ;;   word vt.ERASE defined in primitives/8500_vtio.asm:223.
//dwn_vt_ERASE:
//        .strp "VT.ERASE" 0
dw_vt_ERASE_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 6 ; Flags & hash
        .word dwn_vt_ERASE      ; Pointer to word name (above)
        .word dw_vt_GOTOXY_head ; Link to previous dictionary entry
dw_vt_ERASE:
        CFA_doCOL()       ; Code entry point: next instruction
dw_vt_ERASE_pfa:
	;; notes: vt.HOME ( w -- )
	;;   w = 0: erase below.
	;;   w = 1: erase above.
	;;   w = 2: erase all.

	.word dw_start_VT	; <$VT
	doLIT(3)		; 3
	.word dw_AND		; AND
	.word dw_DIGIT		; DIGIT \ no need to use expensive division
	.word dw_EMIT		; EMIT
	doCHAR("J")		;
	.word dw_EMIT		; EMIT
	.word dw_end_VT		; VT$>
	.word dw_EXIT



	;; word:  PAGE
	;; flags: DOCOL ROM
        ;;   word PAGE defined in primitives/8500_vtio.asm:242.
//dwn_PAGE:
//        .strp "PAGE" 0
dw_PAGE_head:
        .word FFL_T_DOCOL FFL_ROM 4 ; Flags & hash
        .word dwn_PAGE          ; Pointer to word name (above)
        .word dw_vt_ERASE_head  ; Link to previous dictionary entry
dw_PAGE:
        CFA_doCOL()       ; Code entry point: next instruction
dw_PAGE_pfa:
	;; notes: PAGE ( -- )
	;;        Clears the screen (per F83 standard)
	;;
	;; code:  : PAGE ( -- ) vt.HOME 0 vt.ERASE ;

	.word dw_vt_HOME
	doLIT(0)
	.word dw_vt_ERASE
	.word dw_EXIT



	;; word:  vt.SETRGB
	;; flags: DOCOL ROM CFT
        ;;   word vt.SETRGB defined in primitives/8500_vtio.asm:256.
//dwn_vt_SETRGB:
//        .strp "VT.SETRGB" 0
dw_vt_SETRGB_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 7 ; Flags & hash
        .word dwn_vt_SETRGB     ; Pointer to word name (above)
        .word dw_PAGE_head      ; Link to previous dictionary entry
dw_vt_SETRGB:
        CFA_doCOL()       ; Code entry point: next instruction
dw_vt_SETRGB_pfa:
	;; notes: vt.SETRGB ( r g b i -- )
	;;        Set color index i to RGB triplet <r,g,b>. Only the lower 8
	;;        bits of r, g and b are used.
	;; TODO: Improve this. It's too long.

	.word dw_dot_str	; ." ( r g b i )
	.word @+5
	.strp 27 "]4;" 0	;

	.word dw_DECIMAL	; DECIMAL
	.word dw_LOBYTE		; LOBYTE
	.word dw_vt_dot		; vt. ( r g b )

	.word dw_to_R		; >R ( r g )
	.word dw_to_R		; >R ( r )

	.word dw_dot_str	; ."
	.word @+5
	.strp ";rgb:" 0		;

	;; Output r
	.word dw_HEX		; HEX
	.word dw_LOBYTE		; LOBYTE
	.word dw_vt_dot_c	; vt.c ( )
	doCHAR("/")		; CHAR /
	.word dw_EMIT

	;; Output g
	.word dw_R_from		; R> ( g )
	.word dw_LOBYTE		; LOBYTE
	.word dw_vt_dot_c	; vt.c ( )
	doCHAR("/")		; CHAR /
	.word dw_EMIT

	;; Output b
	.word dw_R_from		; R> ( b )
	.word dw_LOBYTE		; LOBYTE
	.word dw_vt_dot_c	; vt.c ( )
	.word dw_ESC		; ESC
	doLIT(92)
	.word dw_EMIT

	.word dw_EXIT



	;; word:  vt.FG
	;; flags: DOCOL ROM CFT
        ;;   word vt.FG defined in primitives/8500_vtio.asm:304.
//dwn_vt_FG:
//        .strp "VT.FG" 0
dw_vt_FG_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 3 ; Flags & hash
        .word dwn_vt_FG         ; Pointer to word name (above)
        .word dw_vt_SETRGB_head ; Link to previous dictionary entry
dw_vt_FG:
        CFA_doCOL()       ; Code entry point: next instruction
dw_vt_FG_pfa:
	;; notes: vt.FG ( u -- )
	;;        Set foreground in an 88-colour or 256-colour setup.

	.word dw_start_VT	; <$VT

	.word dw_dot_str	; ." 38;5;"
	.word @+5
	.strp "38;5;" 0

	.word dw_LOBYTE		; LOBYTE
	.word dw_vt_dot		; vt. \ output u

	.word dw_end_VTm	; VTm$> \ end sequence.
	.word dw_EXIT



	;; word:  vt.BG
	;; flags: DOCOL ROM CFT
        ;;   word vt.BG defined in primitives/8500_vtio.asm:323.
//dwn_vt_BG:
//        .strp "VT.BG" 0
dw_vt_BG_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 3 ; Flags & hash
        .word dwn_vt_BG         ; Pointer to word name (above)
        .word dw_vt_FG_head     ; Link to previous dictionary entry
dw_vt_BG:
        CFA_doCOL()       ; Code entry point: next instruction
dw_vt_BG_pfa:
	;; notes: vt.BG ( u -- )
	;;        Set background in an 88-colour or 256-colour setup.

	.word dw_start_VT	; <$VT

	.word dw_dot_str	; ." 38;5;"
	.word @+4
	.strp "48;5;" 0

	.word dw_LOBYTE		; LOBYTE
	.word dw_vt_dot		; vt. \ output u

	.word dw_end_VTm	; VTm$> \ end sequence.

	.word dw_EXIT



// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/8600_video.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// Video board.

	.page

	.equ VDU_BASE R &1f0

	.equ VDU_SR    VDU_BASE &0
	.equ VDU_MCR0  VDU_BASE &0
	.equ VDU_MCR1  VDU_BASE &1
	.equ VDU_SCR0  VDU_BASE &2
	.equ VDU_SCR1  VDU_BASE &3
	.equ VDU_SAR0  VDU_BASE &4
	.equ VDU_SAR1  VDU_BASE &5
	.equ VDU_MAR0  VDU_BASE &6
	.equ VDU_MAR1  VDU_BASE &7
	.equ VDU_CCR   VDU_BASE &8
	.equ VDU_CAR   VDU_BASE &9
	.equ VDU_HAR   VDU_BASE &a
	.equ VDU_KBD   VDU_BASE &b
	.equ VDU_RSVD  VDU_BASE &c ;reserved
	.equ VDU_CRR   VDU_BASE &d
	.equ VDU_CPORT VDU_BASE &e
	.equ VDU_CMD   VDU_BASE &f

	;;                 fedcba9876543210
	.equ VDU_MCR_EN     #1_______________
	.equ VDU_MCR_VMASK  #_111111_________
	.equ VDU_MCR_VERS   #_000101_________
	.equ VDU_MCR_KBI    #_______1________
	.equ VDU_MCR_SCI    #________1_______
	.equ VDU_MCR_VSI    #_________1______
	.equ VDU_MCR_C40    #____________1___
	.equ VDU_MCR_R30    #_____________000
	.equ VDU_MCR_R60    #_____________001
	.equ VDU_MCR_R120   #_____________010
	.equ VDU_MCR_R240   #_____________011
	.equ VDU_MCR_R480   #_____________100

	;; Default mode settings: video on, keyboard interrupts
	.equ VDU_MCR_DEF    VDU_MCR_EN VDU_MCR_KBI

	.equ VDU_CCR_OFF    #________00______
	.equ VDU_CCR_ON     #________01______
	.equ VDU_CCR_FBLN   #________10______
	.equ VDU_CCR_SBLN   #________11______

	.equ VDU_CURSOR VDU_CCR_FBLN &0b00

	;; Commands

	.equ VDU_INCX       #_______1________
	.equ VDU_INCY       #______1_________
	.equ VDU_WBC        #__0000__________
	.equ VDU_WB         #__0001__________
	.equ VDU_ODBC       #__0010__________
	.equ VDU_ORB        #__0011__________
	.equ VDU_ANDBC      #__0100__________
	.equ VDU_ANDB       #__0101__________
	.equ VDU_XORBC      #__0110__________
	.equ VDU_XORB       #__0111__________
	.equ VDU_WC         #__1000__________
	.equ VDU_WCG        #__1011__________
	.equ VDU_RBC        #__1101__________






	;; word:  VDU.INIT
	;; flags: CODE ROM CFT
        ;;   word VDU.INIT defined in primitives/8600_video.asm:73.
//dwn_VDU_INIT:
//        .strp "VDU.INIT" 0
dw_VDU_INIT_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 6 ; Flags & hash
        .word dwn_VDU_INIT      ; Pointer to word name (above)
        .word dw_vt_BG_head     ; Link to previous dictionary entry
dw_VDU_INIT:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_VDU_INIT_pfa:
	;; notes: VDU.INIT ( -- )
	;;        Detect and initialise the video display unit (VDU). This
	;;        includes the PS/2 keyboard input.

	;; Ensure the emulator doesn't crash at this point. On hardware, these
	;; instructions are basically NOPs.
	LI EMF_SANITY
	DISEF

	LIA _vdu_init_data
	STORE I0
	IN VDU_SR
	AND I I0		; Mask
	XOR I I0		; Compare

	SNZ
	JMP _vdu_init_present

	LI 0			; Not found
	JMP _vdu_init_done

_vdu_init_present:

	;; Initialise the keyboard state
	LI 0
	STORE VDUKBST
	STORE VDUKBM

	;; Set 80x30 mode
	FORTH(dw_VDU_80x30)
	FORTH(dw_VDU_CLS)
	LI 1			; VDU detected

_vdu_init_done:
	PUSH(SP)
	;; Restore sanity settings.
	LI EMF_SANITY
	ENEF

	FORTH(dw_KBD_INIT)	; Also initialise the keyboard interface



	;; Subroutine to initialise the ROM font using a table of
	;; stored repeat/CG write commands.

	;; Initialise the basic ROM font.
	LIA _romfont0
	STORE I0		; Autoindex
	LI 0
	STORE TMP1		; Address counter

	LOAD I I0		; This is the data count, negated
	STORE TMP2		; TMP2 = loop counter

_romfont_dl_loop:
	LOAD TMP1		; Set the address
	OUT VDU_HAR

	LOAD I I0
	STORE TMP0
	RNR
	RNR
	AND BYTELO
	OUT VDU_CRR
	//PRINTD			; Print out the length

	ADD PLUS1		; Update the address
	ADD TMP1
	STORE TMP1
	//PRINTA			; Print out the new address

	LOAD TMP0
	AND BYTELO
	OR @_vdu_init_data+2
	OUT VDU_CMD		; Go for it.

	ISZ TMP2
	JMP _romfont_dl_loop

	NEXT

_vdu_init_data:
	.word VDU_MCR_VMASK	; VDU version mask
	.word VDU_MCR_VERS	; version expected value
	.word VDU_WCG VDU_INCX	; Character pattern command



.include "_generated_romfont.asm"


	;; SYSTEM VARIABLES

	;; word:  VDU.ATTR
	;; flags: CONST ROM CFT
        ;;   word VDU.ATTR defined in primitives/8600_video.asm:169.
//dwn_VDU_ATTR:
//        .strp "VDU.ATTR" 0
dw_VDU_ATTR_head:
        .word FFL_T_CONST FFL_ROM FFL_CFT 6 ; Flags & hash
        .word dwn_VDU_ATTR      ; Pointer to word name (above)
        .word dw_VDU_INIT_head  ; Link to previous dictionary entry
dw_VDU_ATTR:
        CFA_doCONST()     ; Code entry point: next instruction
dw_VDU_ATTR_pfa:
	;; notes: VDU.ATTR ( -- a )
	;;        The address of the VDU.ATTR variable, which holds the current
	;;        colour attribute.

	REGADDR(VDUATTR)


	;; word:  VDU.STADDR
	;; flags: CONST ROM CFT
        ;;   word VDU.STADDR defined in primitives/8600_video.asm:178.
//dwn_VDU_STADDR:
//        .strp "VDU.STADDR" 0
dw_VDU_STADDR_head:
        .word FFL_T_CONST FFL_ROM FFL_CFT 4 ; Flags & hash
        .word dwn_VDU_STADDR    ; Pointer to word name (above)
        .word dw_VDU_ATTR_head  ; Link to previous dictionary entry
dw_VDU_STADDR:
        CFA_doCONST()     ; Code entry point: next instruction
dw_VDU_STADDR_pfa:
	;; notes: VDU.STADDR ( -- a )
	;;        The address of the VDU.STADDR variable, which holds the address of the
	;;        top left corner of the viewport.

	REGADDR(VDUSTADDR)


	;; word:  VDU.ROWS
	;; flags: CONST ROM CFT
        ;;   word VDU.ROWS defined in primitives/8600_video.asm:187.
//dwn_VDU_ROWS:
//        .strp "VDU.ROWS" 0
dw_VDU_ROWS_head:
        .word FFL_T_CONST FFL_ROM FFL_CFT 6 ; Flags & hash
        .word dwn_VDU_ROWS      ; Pointer to word name (above)
        .word dw_VDU_STADDR_head ; Link to previous dictionary entry
dw_VDU_ROWS:
        CFA_doCONST()     ; Code entry point: next instruction
dw_VDU_ROWS_pfa:
	;; notes: VDU.ROWS ( -- a )
	;;        The address of the VDU.ROWS variable, which holds the height of the viewport.

	REGADDR(VDUROWS)


	;; word:  VDU.COLS
	;; flags: CONST ROM CFT
        ;;   word VDU.COLS defined in primitives/8600_video.asm:195.
//dwn_VDU_COLS:
//        .strp "VDU.COLS" 0
dw_VDU_COLS_head:
        .word FFL_T_CONST FFL_ROM FFL_CFT 6 ; Flags & hash
        .word dwn_VDU_COLS      ; Pointer to word name (above)
        .word dw_VDU_ROWS_head  ; Link to previous dictionary entry
dw_VDU_COLS:
        CFA_doCONST()     ; Code entry point: next instruction
dw_VDU_COLS_pfa:
	;; notes: VDU.COLS ( -- a )
	;;        The address of the VDU.COLS variable, which holds the width of the viewport.

	REGADDR(VDUCOLS)


	;; word:  VDU.CRSADDR
	;; flags: CONST ROM CFT
        ;;   word VDU.CRSADDR defined in primitives/8600_video.asm:203.
//dwn_VDU_CRSADDR:
//        .strp "VDU.CRSADDR" 0
dw_VDU_CRSADDR_head:
        .word FFL_T_CONST FFL_ROM FFL_CFT 5 ; Flags & hash
        .word dwn_VDU_CRSADDR   ; Pointer to word name (above)
        .word dw_VDU_COLS_head  ; Link to previous dictionary entry
dw_VDU_CRSADDR:
        CFA_doCONST()     ; Code entry point: next instruction
dw_VDU_CRSADDR_pfa:
	;; notes: VDU.CRSADDR ( -- a )
	;;        The address of the VDU.CRSADDR variable, which holds the VDU address of the cursor.

	REGADDR(VDUCRSADDR)



	;; DISPLAY MODES



	;; word:  VDU.80x30
	;; flags: CODE ROM CFT
        ;;   word VDU.80x30 defined in primitives/8600_video.asm:216.
//dwn_VDU_80x30:
//        .strp "VDU.80X30" 0
dw_VDU_80x30_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 7 ; Flags & hash
        .word dwn_VDU_80x30     ; Pointer to word name (above)
        .word dw_VDU_CRSADDR_head ; Link to previous dictionary entry
dw_VDU_80x30:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_VDU_80x30_pfa:
	;; notes: VDU.80x30 ( -- )
	;;        Sets a basic 80x25 mode.

	LIA _80x30_data
	JMP _vdu_mode

_80x30_data:
	.word VDU_MCR_DEF VDU_MCR_R30   ; MCR0
	.word 0				; MCR1
	.word 0				; SAR1
	.word &ffff			; MAR0
	.word &ffff			; MAR1
	.word VDU_CURSOR		; CCR
	.word 80			; columns
	.word 30			; rows

_vdu_mode:
	STORE I0		; Source address for autoincrement

	LOAD I I0		;
	OUT VDU_MCR0		; Set the MCR0
	LOAD I I0		;
	OUT VDU_MCR1		; Set the MCR1
	LOAD I I0		;
	OUT VDU_SAR1		; Set the SAR1
	LOAD I I0		;
	OUT VDU_MAR0		; Set the MAR0
	LOAD I I0		;
	OUT VDU_MAR1		; Set the MAR1
	LOAD I I0		;
	OUT VDU_CCR		; Set the CCR

	LI 0
	OUT VDU_SCR0		; SCR0 = 0
	OUT VDU_SCR1		; SCR1 = 0
	OUT VDU_SAR0		; SAR0 = 0
	OUT VDU_CAR		; CAR = 0
	OUT VDU_HAR		; HAR = 0
	STORE VDUSTADDR		; Store start of screen
	STORE VDUCRSADDR	; And cursor address
	LI &3f			; White on black
	OUT VDU_CPORT
	STORE VDUATTR		; Also store it internally

	;; Set housekeeping variables

	RMOV(VDUCOLS, I I0)	; Set number of columns
	RMOV(VDUROWS, I I0)	; Set number of rows

	//JMP _vdu_page		; Reset the terminal
	NEXT



	;; word:  VDU.40x30
	;; flags: CODE ROM CFT
        ;;   word VDU.40x30 defined in primitives/8600_video.asm:272.
//dwn_VDU_40x30:
//        .strp "VDU.40X30" 0
dw_VDU_40x30_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 7 ; Flags & hash
        .word dwn_VDU_40x30     ; Pointer to word name (above)
        .word dw_VDU_80x30_head ; Link to previous dictionary entry
dw_VDU_40x30:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_VDU_40x30_pfa:
	;; notes: VDU.40x30 ( -- )
	;;        Sets a basic 40x30 mode.

	LIA _40x30_data
	LJMP(_vdu_mode)

_40x30_data:
	.word VDU_MCR_DEF VDU_MCR_C40 VDU_MCR_R30    ; MCR0
	.word 0				; MCR1
	.word 0				; SAR1
	.word &ffff			; MAR0
	.word &ffff			; MAR1
	.word VDU_CURSOR		; CCR
	.word 40			; columns
	.word 30			; rows



	;; word:  VDU.80x50
	;; flags: CODE ROM CFT
        ;;   word VDU.80x50 defined in primitives/8600_video.asm:292.
//dwn_VDU_80x50:
//        .strp "VDU.80X50" 0
dw_VDU_80x50_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 7 ; Flags & hash
        .word dwn_VDU_80x50     ; Pointer to word name (above)
        .word dw_VDU_40x30_head ; Link to previous dictionary entry
dw_VDU_80x50:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_VDU_80x50_pfa:
	;; notes: VDU.80x50 ( -- )
	;;        Sets a basic 40x50 mode.

	LIA _80x50_data
	LJMP(_vdu_mode)

_80x50_data:
	.word VDU_MCR_DEF VDU_MCR_R60   ; MCR0
	.word 0				; MCR1
	.word 0				; SAR1
	.word &ffff			; MAR0
	.word &ffff			; MAR1
	.word VDU_CURSOR		; CCR
	.word 80			; columns
	.word 50			; rows



	;; VDU OPERATIONS



	;; word:  VDU.BCFILL
	;; flags: CODE ROM CFT
        ;;   word VDU.BCFILL defined in primitives/8600_video.asm:316.
//dwn_VDU_BCFILL:
//        .strp "VDU.BCFILL" 0
dw_VDU_BCFILL_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 4 ; Flags & hash
        .word dwn_VDU_BCFILL    ; Pointer to word name (above)
        .word dw_VDU_80x50_head ; Link to previous dictionary entry
dw_VDU_BCFILL:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_VDU_BCFILL_pfa:
	;; notes: VDU.BCFILL ( a w h b c -- )
	;;        Fill a part of the VDU memory with character `b` and
	;;        colour/attributes `c`.  The filled area starts at address `a`
	;;        and is `w` columns wide and `h` columns high.
	;;
	;;        Only the lower 8 bits of `b` are used. The VDU registers `MAR0/1` are
	;;        ignored when performing the fill, so wrapping around may not
        ;;        work as expected.

	POP(SP)
	OUT VDU_CPORT		; Pop c, set it.

	POP(SP)
	AND BYTELO		; Safety first! Ensure b is 0-255.
	OR _vdu_cmd_wbc		; Set VDU command (write B & C, inc X)
	STORE TMP4		; TMP4 = B port and VDU command

	POP(SP)
	NEG
	STORE TMP2		; TMP2 = -h (for looping)

	POP(SP)
	ADD MINUS1		; w-1
	STORE TMP1		; TMP1 = w-1 (for VDU repetition register)

	RPOP(TMP3, SP)		; TMP3 = a

_bcfill_loop:
	LOAD TMP1
	OUT VDU_CRR		; Set repetitions
	LOAD TMP3
	OUT VDU_HAR		; Set address
	LOAD TMP4
	OUT VDU_CMD		; Write B and command

	LADD(TMP3, TMP3, &80)
	ISZ TMP2
	JMP _bcfill_loop

	NEXT

_vdu_cmd_wbc:
	.word VDU_WBC VDU_INCX ; VDU command: write B & C, X increment



	;; word:  VDU.CLS
	;; flags: DOCOL ROM CFT
        ;;   word VDU.CLS defined in primitives/8600_video.asm:364.
//dwn_VDU_CLS:
//        .strp "VDU.CLS" 0
dw_VDU_CLS_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 1 ; Flags & hash
        .word dwn_VDU_CLS       ; Pointer to word name (above)
        .word dw_VDU_BCFILL_head ; Link to previous dictionary entry
dw_VDU_CLS:
        CFA_doCOL()       ; Code entry point: next instruction
dw_VDU_CLS_pfa:
	;; notes: VDU.CLS ( -- )
	;;        Clear the current viewport using the current attribute.
	;; code: : VDU.CLS ( -- ) VDU.HOME VDU.STADDR @ VDU.COLS @ VDU.ROWS BL VDU.ATTR VDU.BCFILL ;

	.word dw_DUMPSTATE
	.word dw_VDU_HOME
	.word dw_VDU_STADDR
	.word dw_fetch
	.word dw_VDU_COLS
	.word dw_fetch
	.word dw_VDU_ROWS
	.word dw_fetch
	doLIT(32)
	.word dw_DUMPSTATE
	.word dw_VDU_ATTR
	.word dw_fetch
	.word dw_dot_s
	.word dw_VDU_BCFILL
	.word dw_EXIT



	;; word:  VDU.HOME
	;; flags: CODE ROM CFT
        ;;   word VDU.HOME defined in primitives/8600_video.asm:388.
//dwn_VDU_HOME:
//        .strp "VDU.HOME" 0
dw_VDU_HOME_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 6 ; Flags & hash
        .word dwn_VDU_HOME      ; Pointer to word name (above)
        .word dw_VDU_CLS_head   ; Link to previous dictionary entry
dw_VDU_HOME:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_VDU_HOME_pfa:
	;; notes: VDU.HOME ( -- )
	;;        Move the cursor to the top left of the viewport.
	;; code: : VDU.HOME ( -- ) VDU.STADDR @ DUP VDU.CRSADDR ! &1f9 IO!

	LOAD VDUSTADDR
	STORE VDUCRSADDR
	OUT VDU_CAR
	NEXT



	;; word:  VDU.EMIT
	;; flags: CODE ROM CFT
        ;;   word VDU.EMIT defined in primitives/8600_video.asm:401.
//dwn_VDU_EMIT:
//        .strp "VDU.EMIT" 0
dw_VDU_EMIT_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 6 ; Flags & hash
        .word dwn_VDU_EMIT      ; Pointer to word name (above)
        .word dw_VDU_HOME_head  ; Link to previous dictionary entry
dw_VDU_EMIT:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_VDU_EMIT_pfa:
	;; notes: VDU.EMIT ( c -- )
	;;        Draw a character at the current location, advancing the location (and cursor).
	;;        Interpret terminal characters.
	POP(SP)
	AND BYTELO
	STORE TMP0

	LI 10			; New line?
	XOR TMP0
	SNZ
	JMP _vdu_nl

	LI 7			; Bell?
	XOR TMP0
	SNZ
	NEXT			; Ignore for now.

	JMP _vdu_putc



	;; word:  VDU.PUTC
	;; flags: CODE ROM CFT
        ;;   word VDU.PUTC defined in primitives/8600_video.asm:424.
//dwn_VDU_PUTC:
//        .strp "VDU.PUTC" 0
dw_VDU_PUTC_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 6 ; Flags & hash
        .word dwn_VDU_PUTC      ; Pointer to word name (above)
        .word dw_VDU_EMIT_head  ; Link to previous dictionary entry
dw_VDU_PUTC:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_VDU_PUTC_pfa:
	;; notes: VDU.PUTC ( c -- )
	;;        Draw a character at the current location, advancing the location (and cursor).
	;;        No character interpretation is performed.

	POP(SP)
	AND BYTELO
	STORE TMP0

_vdu_putc:
	LOAD VDUATTR
	OUT VDU_CPORT
	LOAD VDUCRSADDR
	OUT VDU_HAR
	LOAD TMP0
	OUT VDU_CMD		; Command 0 = Write B & C

	;; Step the cursor.
	LI 1
	ADD VDUCRSADDR
	STORE VDUCRSADDR
	OUT VDU_CAR

	;; Do we need to go to the next line?
	LOAD VDUSTADDR
	ADD VDUCOLS
	STORE TMP1
	XOR VDUCRSADDR
	AND PLUS127
	SZA
	NEXT			; No need to wrap

	;; Wrap to next line
_vdu_nl:
	LOAD VDUCRSADDR
	ADD PLUS128
	AND VDUROWMASK
	STORE VDUCRSADDR
	OUT VDU_CAR

	;; Do we need to scroll?
	LOAD VDUROWS
	RNL
	RNL
	RBR
	AND VDUROWMASK
	STORE TMP0
	ADD VDUSTADDR
	STORE TMP0
	LOAD VDUCRSADDR
	XOR TMP0
	AND VDUROWMASK
	SZA
	NEXT			; No need to scroll

	LOAD VDUSTADDR
	ADD PLUS128
	STORE VDUSTADDR
	OUT VDU_SAR0

	JSR _vdu_clreol
	NEXT


	;; word:  VDU.NL
	;; flags: CODE ROM CFT
        ;;   word VDU.NL defined in primitives/8600_video.asm:489.
//dwn_VDU_NL:
//        .strp "VDU.NL" 0
dw_VDU_NL_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 0 ; Flags & hash
        .word dwn_VDU_NL        ; Pointer to word name (above)
        .word dw_VDU_PUTC_head  ; Link to previous dictionary entry
dw_VDU_NL:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_VDU_NL_pfa:
	;; notes: VDU.NL ( -- )
	;;        Start a new line on the VDU.
	JMP _vdu_nl



	;; word:  VDU.CLREOL
	;; flags: CODE ROM CFT
        ;;   word VDU.CLREOL defined in primitives/8600_video.asm:497.
//dwn_VDU_CLREOL:
//        .strp "VDU.CLREOL" 0
dw_VDU_CLREOL_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 4 ; Flags & hash
        .word dwn_VDU_CLREOL    ; Pointer to word name (above)
        .word dw_VDU_NL_head    ; Link to previous dictionary entry
dw_VDU_CLREOL:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_VDU_CLREOL_pfa:
	;; notes: VDU.CLREOL ( -- )
	;;        Clears from the current position to the end of the line,
	;;        setting the current attribute.

	JSR _vdu_clreol
	NEXT

_vdu_clreol:
	LOAD VDUCRSADDR
	AND PLUS127
	//PRINTD
	NEG
	STORE TMP1
	//PRINTD

	LOAD VDUCOLS
	ADD MINUS1
	ADD TMP1
	//PRINTD
	OUT VDU_CRR

	LOAD VDUCRSADDR
	//PRINTA
	OUT VDU_HAR

	LOAD VDUATTR
	OUT VDU_CPORT

	LI &120		; Command: write B & C, inc x, ASCII 32
	OUT VDU_CMD
	RET



	;; word:  VDU.X
	;; flags: CODE ROM CFT
        ;;   word VDU.X defined in primitives/8600_video.asm:533.
//dwn_VDU_X:
//        .strp "VDU.X" 0
dw_VDU_X_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 3 ; Flags & hash
        .word dwn_VDU_X         ; Pointer to word name (above)
        .word dw_VDU_CLREOL_head ; Link to previous dictionary entry
dw_VDU_X:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_VDU_X_pfa:
	;; notes: VDU.X ( -- )
	;;        Temp

	POP(SP)
	NEG
	STORE TMP9
	LI 33
	STORE TMP8

_x_loop:
	LOAD TMP8
	PUSH(SP)
	FORTH(dw_VDU_EMIT)
	LI 1
	ADD TMP8
	STORE TMP8

	ISZ TMP9
	JMP _x_loop
	NEXT


	;; word:  VDU.HELLO
	;; flags: CODE ROM CFT
        ;;   word VDU.HELLO defined in primitives/8600_video.asm:557.
//dwn_VDU_HELLO:
//        .strp "VDU.HELLO" 0
dw_VDU_HELLO_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 7 ; Flags & hash
        .word dwn_VDU_HELLO     ; Pointer to word name (above)
        .word dw_VDU_X_head     ; Link to previous dictionary entry
dw_VDU_HELLO:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_VDU_HELLO_pfa:
	;; notes: VDU.HELLO ( -- )
	;;        Temporary

	LI 0
	OUT VDU_HAR
	LIA _hello_data
	STORE I0
hello_loop:
	LOAD I I0
	SNZ
	JMP hello_done

	OR _hello_cmd
	OUT VDU_CMD
	JMP hello_loop

hello_done:
	LI 4
	OUT R &1f3
	IN VDU_HAR
	OUT VDU_CAR
	NEXT

_hello_cmd:
	.word VDU_WBC VDU_INCX
_hello_data:
	.str "Hello, world! This is the new VDU in the CFT emulator." 0




































	;; ;; word:  VDU.CA
	;; ;; flags: USER ROM CFT
        ;;   word VDU.CA defined in primitives/8600_video.asm:622.
//dwn_VDU_CA:
//        .strp "VDU.CA" 0
dw_VDU_CA_head:
        .word FFL_T_USER FFL_ROM FFL_CFT 0 ; Flags & hash
        .word dwn_VDU_CA        ; Pointer to word name (above)
        .word dw_VDU_HELLO_head ; Link to previous dictionary entry
dw_VDU_CA:
        CFA_doUSER()      ; Code entry point: next instruction
dw_VDU_CA_pfa:
	;; ;; notes: VDU.CA ( -- a )
	;; ;;        The address of the VDU.CA variable, which holds the VDU cursor address.

	;; .word	UAOFS_VDU_CA



	;; ;; word:  VDU.SSZ
	;; ;; flags: USER ROM CFT
        ;;   word VDU.SSZ defined in primitives/8600_video.asm:631.
//dwn_VDU_SSZ:
//        .strp "VDU.SSZ" 0
dw_VDU_SSZ_head:
        .word FFL_T_USER FFL_ROM FFL_CFT 1 ; Flags & hash
        .word dwn_VDU_SSZ       ; Pointer to word name (above)
        .word dw_VDU_CA_head    ; Link to previous dictionary entry
dw_VDU_SSZ:
        CFA_doUSER()      ; Code entry point: next instruction
dw_VDU_SSZ_pfa:
	;; ;; notes: VDU.SSZ ( -- a )
	;; ;;        The address of the VDU.SSZ variable, which holds the current
	;; ;;        number of characters per screen.

	;; .word	UAOFS_VDU_SSZ



;; _vdu_dat:
;; 	.word &1000
;; 	.word &0fff

;; 	;; word:  VDU.CHAR
;; 	;; flags: CODE ROM CFT
        ;;   word VDU.CHAR defined in primitives/8600_video.asm:645.
//dwn_VDU_CHAR:
//        .strp "VDU.CHAR" 0
dw_VDU_CHAR_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 6 ; Flags & hash
        .word dwn_VDU_CHAR      ; Pointer to word name (above)
        .word dw_VDU_SSZ_head   ; Link to previous dictionary entry
dw_VDU_CHAR:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_VDU_CHAR_pfa:
;; 	;; notes: VDU.CHAR ( c -- )
;; 	;;        Output a character to the VDU.

;; 	;; Display the character
;; 	RPOP(TMP1, SP)		; TMP1 = character to output.
;; 	JSR _vdu_char
;; 	JSR _vdu_step
;; 	NEXT

;; _vdu_char:
;; 	RMOV(I VDUBPOS, TMP1) ; Put the character onto the character plane
;; 	RMOV(I VDUCPOS, VDUATTR) ; Set the attribute
;; 	RET

;; _vdu_step:
;; 	;; Move the cursor left, update.

;; 	;; Update the cursor address.
;; 	LI 1
;; 	ADD VDUCA
;; 	STORE VDUCA
;; 	OUT VDU_CAR

;; 	;; Update the cursor co-ordinates.
;; 	INCM(VDUCPX)		; VDUCPX++
;; 	XOR VDUSCNC		; Reached the right edge?
;; 	SZA
;; 	RET			; No. End here.

;; _vdu_step_line:
;; 	LSET(VDUCPX, 0)		; VDUCPX = 0
;; 	INCM(VDUCPY)		; VDUCPY++
;; 	XOR VDUSCNR		; Reached the bottom edge?
;; 	SZA
;; 	RET

;; _vdu_step_scroll:
;; 	RMOV(TMP15, RETV)
;; 	JSR _vdu_home
;; 	JSR _vdu_roll
;; 	JSR _vdu_clreol
;; 	JMP I TMP15		; Return to saved address



;; _vtest_dat:
;; 	.word -1000
;; 	.word _vdu_char

;; 	;; word:  VTEST
;; 	;; flags: CODE ROM CFT
        ;;   word VTEST defined in primitives/8600_video.asm:696.
//dwn_VTEST:
//        .strp "VTEST" 0
dw_VTEST_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 3 ; Flags & hash
        .word dwn_VTEST         ; Pointer to word name (above)
        .word dw_VDU_CHAR_head  ; Link to previous dictionary entry
dw_VTEST:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_VTEST_pfa:
;; 	;; notes: VTEST ( w -- )
;; 	;;        Writes to the Cursor Control Register.

;; 	LSET(R0, 32)		; R0 = 32
;; 	RMOV(R1, _vtest_dat)	; R1 = -4000

;; _vtest_loop:
;; 	RADD(R0, R0, PLUS1)	; R0++
;; 	STORE TMP1
;; 	JSR _vdu_char
;; 	JSR _vdu_step
;; 	ISZ R1
;; 	JMP _vtest_loop

;; 	NEXT



;; 	;; word:  VTEST2
;; 	;; flags: CODE ROM CFT
        ;;   word VTEST2 defined in primitives/8600_video.asm:716.
//dwn_VTEST2:
//        .strp "VTEST2" 0
dw_VTEST2_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 0 ; Flags & hash
        .word dwn_VTEST2        ; Pointer to word name (above)
        .word dw_VTEST_head     ; Link to previous dictionary entry
dw_VTEST2:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_VTEST2_pfa:
;; 	;; notes: VTEST ( w -- )
;; 	;;        Writes to the Cursor Control Register.

;; _vtest2_loop:
;; 	LI 50
;; 	PUSH(SP)
;; 	FORTH(dw_MS)

;; 	LI 80
;; 	ADD VDUSCR
;; 	STORE TMP1

;; 	XOR VDUSCRSZ
;; 	SNZ
;; 	JMP _vtest2_mod

;; 	LOAD TMP1
;; 	STORE VDUSCR
;; 	OUT VDU_SCR
;; 	JMP _vtest2_loop

;; _vtest2_mod:
;; 	LOAD VDUSSR
;; 	STORE VDUSCR
;; 	OUT VDU_SCR
;; 	JMP _vtest2_loop

;; 	NEXT



;; 	;; word:  VTEST3
;; 	;; flags: CODE ROM CFT
        ;;   word VTEST3 defined in primitives/8600_video.asm:749.
//dwn_VTEST3:
//        .strp "VTEST3" 0
dw_VTEST3_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 0 ; Flags & hash
        .word dwn_VTEST3        ; Pointer to word name (above)
        .word dw_VTEST2_head    ; Link to previous dictionary entry
dw_VTEST3:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_VTEST3_pfa:
;; 	;; notes: VTEST ( w -- )
;; 	;;        Play with the screen end register.

;; 	FORTH(dw_VDU_640x400)
;; 	LOAD VDUSSR
;; 	OUT VDU_SSR
;; 	OUT VDU_SCR

;; 	RMOV(TMP2, VDUSCNC)	; TMP2 = 80
;; 	NEG
;; 	STORE TMP3		; TMP3 = -80
;; 	RADD(TMP1, VDUSSR, VDUSCNC) ; TMP1 = current value of SER
;; 	OUT VDU_SER

;; _vtest3_loop1:
;; 	LI 50
;; 	PUSH(SP)
;; 	FORTH(dw_MS)

;; 	RADD(TMP1, TMP1, TMP2)
;; 	OUT VDU_SER

;; 	XOR VDUSCRSZ
;; 	SZA
;; 	JMP _vtest3_loop1	; Keep incrementing

;; _vtest3_loop2:
;; 	LI 50
;; 	PUSH(SP)
;; 	FORTH(dw_MS)

;; 	RADD(TMP1, TMP1, TMP3)
;; 	OUT VDU_SER

;; 	XOR VDUSSR
;; 	SZA
;; 	JMP _vtest3_loop2	; Keep decrementing
;; 	JMP _vtest3_loop1	; Back to the top



	;; word:  VDU.ROLL
	;; flags: CODE ROM CFT
        ;;   word VDU.ROLL defined in primitives/8600_video.asm:792.
//dwn_VDU_ROLL:
//        .strp "VDU.ROLL" 0
dw_VDU_ROLL_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 6 ; Flags & hash
        .word dwn_VDU_ROLL      ; Pointer to word name (above)
        .word dw_VTEST3_head    ; Link to previous dictionary entry
dw_VDU_ROLL:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_VDU_ROLL_pfa:
	;; notes: VDU.ROLL ( -- )
	;;        Scrolls the VDU display downwards by one line.
	;;        Does not clear the new bottom line.

	;; Calculate the new top-left origin address

;; 	JSR _vdu_roll
;; 	NEXT

;; _vdu_roll:
;; 	RADD(TMP1, VDUSCR, VDUSCNC)

;; 	;; Check if we need to wrap around (mod VDUSCRSZ)
;; 	NEG
;; 	ADD VDUSCRSZ		; size - top_left_address
;; 	SPA			; if size >= top_left_address...
;; 	JMP _vdu_roll_mod	; ... then wrap around

;; 	;; Set the scroll register
;; 	RMOV(VDUSCR, TMP1)
;; 	OUT VDU_SCR
;; 	RET

;; _vdu_roll_mod:
;; 	RMOV(VDUSCR, VDUSSR)	; Back to the starting address
;; 	OUT VDU_SCR
;; 	RET



	;; word:  VDU.SCROLL
	;; flags: CODE ROM CFT
        ;;   word VDU.SCROLL defined in primitives/8600_video.asm:824.
//dwn_VDU_SCROLL:
//        .strp "VDU.SCROLL" 0
dw_VDU_SCROLL_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 4 ; Flags & hash
        .word dwn_VDU_SCROLL    ; Pointer to word name (above)
        .word dw_VDU_ROLL_head  ; Link to previous dictionary entry
dw_VDU_SCROLL:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_VDU_SCROLL_pfa:
	;; notes: VDU.SCROLL ( -- )
	;;        Scrolls the VDU display downwards by one line.
	;;        Clears the new bottom line and places the cursor
	;;        on column 0 of that line.

	;; JSR _vdu_home
	;; JSR _vdu_roll
	;; JSR _vdu_clreol
	;; NEXT







;; 	;; word:  VDU.160x100
;; 	;; flags: CODE ROM CFT
        ;;   word VDU.160x100 defined in primitives/8600_video.asm:842.
//dwn_VDU_160x100:
//        .strp "VDU.160X100" 0
dw_VDU_160x100_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 5 ; Flags & hash
        .word dwn_VDU_160x100   ; Pointer to word name (above)
        .word dw_VDU_SCROLL_head ; Link to previous dictionary entry
dw_VDU_160x100:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_VDU_160x100_pfa:
;; 	;; notes: VDU.160x100 ( -- )
;; 	;;        Sets 160x100 mode

;; 	LIA _160x100_data
;; 	JMP _vdu_mode

;; _160x100_data:
;; 	.word VDU_MCR_VEN VDU_MCR_CLH4  ; MCR
;; 	.word 8000			; SER
;; 	.word 0				; CCR (cursor off)
;; 	.word 80
;; 	.word 100



;; 	;; word:  VDU.320x200
;; 	;; flags: CODE ROM CFT
        ;;   word VDU.320x200 defined in primitives/8600_video.asm:859.
//dwn_VDU_320x200:
//        .strp "VDU.320X200" 0
dw_VDU_320x200_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 5 ; Flags & hash
        .word dwn_VDU_320x200   ; Pointer to word name (above)
        .word dw_VDU_160x100_head ; Link to previous dictionary entry
dw_VDU_320x200:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_VDU_320x200_pfa:
;; 	;; notes: VDU.320x200 ( -- )
;; 	;;        Sets 320x200 mode

;; 	LIA _320x200_data
;; 	JMP _vdu_mode

;; _320x200_data:
;; 	.word VDU_MCR_VEN VDU_MCR_CLH2  ; MCR
;; 	.word 16000			; SER
;; 	.word 0				; CCR (cursor off)
;; 	.word 80
;; 	.word 200



;; 	;; word:  VDU.640x400
;; 	;; flags: CODE ROM CFT
        ;;   word VDU.640x400 defined in primitives/8600_video.asm:876.
//dwn_VDU_640x400:
//        .strp "VDU.640X400" 0
dw_VDU_640x400_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 5 ; Flags & hash
        .word dwn_VDU_640x400   ; Pointer to word name (above)
        .word dw_VDU_320x200_head ; Link to previous dictionary entry
dw_VDU_640x400:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_VDU_640x400_pfa:
;; 	;; notes: VDU.640x400 ( -- )
;; 	;;        Sets 640x400 mode

;; 	LIA _640x400_data
;; 	JMP _vdu_mode

;; _640x400_data:
;; 	.word VDU_MCR_VEN VDU_MCR_HGR   ; MCR
;; 	.word 32000			; SER
;; 	.word 0				; CCR (cursor off)
;; 	.word 80
;; 	.word 400




// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/8601_kbd.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// The PS/2 interface on the Video board.

	.page


	.equ VDU_KBD R &1fb


	;; word:  KBD.INIT
	;; flags: CODE ROM CFT
        ;;   word KBD.INIT defined in primitives/8601_kbd.asm:12.
//dwn_KBD_INIT:
//        .strp "KBD.INIT" 0
dw_KBD_INIT_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 3 ; Flags & hash
        .word dwn_KBD_INIT      ; Pointer to word name (above)
        .word dw_VDU_640x400_head ; Link to previous dictionary entry
dw_KBD_INIT:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_KBD_INIT_pfa:
	;; notes: KBD.INIT ( -- x )
	;;        Initialise keyboard state machines.

	;; Keyboard interrupts are enabled when modes are set.
	LI 0
	STORE VDUKBST
	STORE VDUKBM

	;; The keyboard may have already sent a byte. This will be
	;; ignored, so clear and re-enable the receiver now.
	IN VDU_KBD

	;; TODO: Move this elsewhere
	;; Enable interrupts
	LI #0011		; IRQ1, enable
	OUT R &30		; IRQ 1

	NEXT


	;; word:  VDU.KBD
	;; flags: CODE ROM CFT
        ;;   word VDU.KBD defined in primitives/8601_kbd.asm:34.
//dwn_VDU_KBD:
//        .strp "VDU.KBD" 0
dw_VDU_KBD_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 1 ; Flags & hash
        .word dwn_VDU_KBD       ; Pointer to word name (above)
        .word dw_KBD_INIT_head  ; Link to previous dictionary entry
dw_VDU_KBD:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_VDU_KBD_pfa:
	;; notes: VDU.KBD ( -- x )
	;;        PS/2 keyboard state machine.


	;; bits 0-7: key
	;; bit 8: ext
	;; bit 15: 1 = release, 0 = press

	;; Algorithm:
	;; 	* Read port
	;;      * E0? Flag extended
	;;      * F0? Flag release
	;;      * Otherwise, store flags & clear

	IN VDU_KBD
	STORE TMP0
	SNA
	JMP _kbd_have_byte

_kbd_have_nothing:
	LI 0			; We have nothing
	PUSH(SP)
	NEXT

_kbd_have_byte:
	LI &e0
	XOR TMP0
	SNZ
	JMP _kbd_have_e0

	LI &f0
	XOR TMP0
	SNZ
	JMP _kbd_have_f0

	LOAD TMP0
	AND BYTELO		; Return last byte + flags
	OR VDUKBST
	PUSH(SP)

	JSR _kbd_mods

	LI 0			; Clear state
	STORE VDUKBST
	NEXT

_kbd_have_e0:
	LI &100
	OR VDUKBST
	STORE VDUKBST
	JMP _kbd_have_nothing

_kbd_have_f0:
	LOAD BIT15
	OR VDUKBST
	STORE VDUKBST
	JMP _kbd_have_nothing



	;; Keyboard Modifier State machine
	;;

	;; This subroutine reads output from the PS/2 keyboard state machine
	;; and updates the VDUKBM modifier bitmap. The map is as follows:
	;;
	;; -------1 Left Shift
	;; ------1- Right Shift
	;; -----1-- Left Ctrl
	;; ----1--- Right Ctrl
	;; ---1---- Left Alt
	;; --1----- Right Alt
	;; -1------ Left Super
	;; 1------- Right Super

	.equ KBM_LSHIFT #-------1
	.equ KBM_RSHIFT #------1-
	.equ KBM_LCTRL  #-----1--
	.equ KBM_RCTRL  #----1---
	.equ KBM_LALT   #---1----
	.equ KBM_RALT   #--1-----
	.equ KBM_LSUPER #-1------
	.equ KBM_RSUPER #1-------

	.equ KBM_SHIFT KBM_LSHIFT KBM_RSHIFT
	.equ KBM_CTRL KBM_LCTRL KBM_RCTRL
	.equ KBM_ALT KBM_LALT KBM_RALT
	.equ KBM_SUPER KBM_LSUPER KBM_RSUPER


_kbd_mods:
	STORE TMP0
	LI 1
	STORE TMP9		; TMP9 = bit value
	LIA _kbd_modtable
	STORE I0
	RMOV(TMP8, I I0)	; TMP8 = count

_kbd_modloop:
	LOAD I I0
	XOR TMP0		; match make code?
	SNZ
	JMP _kbd_modloop_make

	XOR BIT15		; match break code?
	SNZ
	JMP _kbd_modloop_break

_kbd_modloop2:
	RSBL(TMP9, TMP9)	; next bit value

	ISZ TMP8
	JMP _kbd_modloop

	RET			; Done!

_kbd_modloop_make:
	ROR(VDUKBM, VDUKBM, TMP9) ; Set a bit.
	JMP _kbd_modloop2

_kbd_modloop_break:
	LOAD TMP9		; Clear a bit.
	NOT
	AND VDUKBM
	STORE VDUKBM
	JMP _kbd_modloop2

_kbd_modtable:
	.word -8		; 8 modifier bits
	.word &12		; left shift
	.word &59		; right shift
	.word &14		; left ctrl
	.word &114		; right ctrl
	.word &11		; left alt
	.word &111		; right alt
	.word &11f		; left super
	.word &127		; right super



	;; word:  EMITBOTH
	;; flags: DOCOL ROM CFT
        ;;   word EMITBOTH defined in primitives/8601_kbd.asm:176.
//dwn_EMITBOTH:
//        .strp "EMITBOTH" 0
dw_EMITBOTH_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 5 ; Flags & hash
        .word dwn_EMITBOTH      ; Pointer to word name (above)
        .word dw_VDU_KBD_head   ; Link to previous dictionary entry
dw_EMITBOTH:
        CFA_doCOL()       ; Code entry point: next instruction
dw_EMITBOTH_pfa:
	;; notes: X ( -- x )
	;;        Temporary

	.word dw_DUP
	.word dw_TTY_EMIT
	.word dw_VDU_EMIT
	.word dw_EXIT


	;; word:  A
	;; flags: DOCOL ROM CFT
        ;;   word A defined in primitives/8601_kbd.asm:187.
//dwn_A:
//        .strp "A" 0
dw_A_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 0 ; Flags & hash
        .word dwn_A             ; Pointer to word name (above)
        .word dw_EMITBOTH_head  ; Link to previous dictionary entry
dw_A:
        CFA_doCOL()       ; Code entry point: next instruction
dw_A_pfa:
	;; notes: A ( -- x )
	;;        Temporary

	.word dw_VDU_CLS
	doLIT(dw_EMITBOTH)
	.word dw_tick_EMIT
	.word dw_store
	.word dw_EXIT


	;; word:  S
	;; flags: DOCOL ROM CFT
        ;;   word S defined in primitives/8601_kbd.asm:199.
//dwn_S:
//        .strp "S" 0
dw_S_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 2 ; Flags & hash
        .word dwn_S             ; Pointer to word name (above)
        .word dw_A_head         ; Link to previous dictionary entry
dw_S:
        CFA_doCOL()       ; Code entry point: next instruction
dw_S_pfa:
	;; notes: S ( -- x )
	;;        Temporary

	doLIT(&1f0)
	.word dw_IO_fetch
	.word dw_BINARY
	.word dw_dot
	.word dw_HEX
	.word dw_EXIT


	;; word:  X
	;; flags: DOCOL ROM CFT
        ;;   word X defined in primitives/8601_kbd.asm:212.
//dwn_X:
//        .strp "X" 0
dw_X_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 1 ; Flags & hash
        .word dwn_X             ; Pointer to word name (above)
        .word dw_S_head         ; Link to previous dictionary entry
dw_X:
        CFA_doCOL()       ; Code entry point: next instruction
dw_X_pfa:
	;; notes: X ( -- x )
	;;        Temporary

	.word dw_HEX
	.word dw_VDU_KBD
	.word dw_dot
	.word dw_EXIT


	;; word:  KBD.MODS
	;; flags: CONST ROM
        ;;   word KBD.MODS defined in primitives/8601_kbd.asm:223.
//dwn_KBD_MODS:
//        .strp "KBD.MODS" 0
dw_KBD_MODS_head:
        .word FFL_T_CONST FFL_ROM 3 ; Flags & hash
        .word dwn_KBD_MODS      ; Pointer to word name (above)
        .word dw_X_head         ; Link to previous dictionary entry
dw_KBD_MODS:
        CFA_doCONST()     ; Code entry point: next instruction
dw_KBD_MODS_pfa:
	;; notes: KBD.MODS ( -- a )
	;;   	  The address of a word where current keyboard modifiers are stored.

	REGADDR(VDUKBM)


	.word @+1
	.word 0
	;; word:  T
	;; flags: DOCOL ROM CFT
        ;;   word T defined in primitives/8601_kbd.asm:233.
//dwn_T:
//        .strp "T" 0
dw_T_head:
        .word FFL_T_DOCOL FFL_ROM FFL_CFT 5 ; Flags & hash
        .word dwn_T             ; Pointer to word name (above)
        .word dw_KBD_MODS_head  ; Link to previous dictionary entry
dw_T:
        CFA_doCOL()       ; Code entry point: next instruction
dw_T_pfa:
	;; notes: X ( -- x )
	;;        Temporary

	.word dw_A

_testkbd_loop:
	.word dw_VDU_KBD	; VDU_KBD ?DUP ( loop until non-zero)
	.word dw_if_DUP
	.word dw_if_branch
	.word _testkbd_loop

	.word dw_DUP		; DUP ( sc )
	.word dw_DUP		; DUP ( sc sc )

	.word dw_KBD_MODS	; KBD.MODS BINARY @. SPACE
	.word dw_BINARY		;
	.word dw_fetch_dot	;
	.word dw_SPACE		; (sc sc)

	.word dw_HEX		; HEX . SPACE ( sc )
	.word dw_dot		;
	.word dw_SPACE		;

	.word dw_KBD_MODS	; KBD.MODS @ SWAP ( mods sc )
	.word dw_fetch		;
	.word dw_SWAP

	.word dw_KBD_SC2C	; KBD.SC2C
	.word dw_if_branch
	.word _testkbd1
	.word dw_SPACE
	.word dw_EMIT		; EMIT
	.word dw_branch
	.word _testkbd2

_testkbd1:
	.word dw_DROP
	.word dw_DROP

_testkbd2:
	.word dw_CR

	doLIT(118)		; 118 ( scancode of Esc )
	.word dw_not_equal	; <>
	.word dw_if_branch	; no? Then loop again
	.word _testkbd_done

	.word dw_branch
	.word _testkbd_loop

_testkbd_done:
	.word dw_EXIT



	;; word:  z
	;; flags: DOCOL ROM
        ;;   word z defined in primitives/8601_kbd.asm:290.
//dwn_z:
//        .strp "Z" 0
dw_z_head:
        .word FFL_T_DOCOL FFL_ROM 3 ; Flags & hash
        .word dwn_z             ; Pointer to word name (above)
        .word dw_T_head         ; Link to previous dictionary entry
dw_z:
        CFA_doCOL()       ; Code entry point: next instruction
dw_z_pfa:
	;; notes: Z ( u -- u f )
	;;   	  Temporary.

	doLIT(0)
	.word dw_SWAP
	.word dw_KBD_SC2C
	.word dw_if_branch	; f = 0
	.word _z1
	.word dw_EMIT		; EMIT char

_z1:
	.word dw_HEX
	.word dw_dot		; Print out keysym
	.word dw_dot		; Print mods

	.word dw_EXIT

	;; word:  KBD.SC2C
	;; flags: CODE ROM
        ;;   word KBD.SC2C defined in primitives/8601_kbd.asm:309.
//dwn_KBD_SC2C:
//        .strp "KBD.SC2C" 0
dw_KBD_SC2C_head:
        .word FFL_T_CODE FFL_ROM 3 ; Flags & hash
        .word dwn_KBD_SC2C      ; Pointer to word name (above)
        .word dw_z_head         ; Link to previous dictionary entry
dw_KBD_SC2C:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_KBD_SC2C_pfa:
	;; notes: KBD.SC2C ( mods scancode -- char 1 | mods scancode 0 )
	;;   	  Convert a scancode to a character, if applicable.

	;; Peek two values off the stack
	RADD(I0, SP, MINUS2)	; I0 = SP - 2
	RMOV(TMP3, I I0)	; TMP3 = modifier bitmap, e.g. VDUKBM
	RMOV(TMP1, I I0)	; TMP1 = scancode

	;; Heap traversal code
	;; Size of heap in nodes: _kbd_heapsz
	;; Root = _kbd_heap
	;; Left child of node n: 2n + 1
	;; Right child of node n: 2n + 2
	;; Even nodes: low order byte
	;; Odd nodes: high order byte
	;; Address of node n: _kbd_heap + (n >> 1)

	;; Start with root
	LI 0
	STORE TMP2

	;; Read a node.
_kbd_sc2c_loop:
	LIA _kbd_heap
	STORE TMP0

	LOAD TMP2
	SBR			; >> 1, L=parity
	ADD TMP0		; + base addr
	STORE TMP0

	LOAD I TMP0		; Read a pair of nodes

	SSL			; L = 1?
	JMP _kbd_sc2c_even	; No. We want the even node.

_kbd_sc2c_odd:			; Yes. Get the odd node.
	RNR			; >> 4
	RNR			; >> 4
_kbd_sc2c_even:			; Yes, get the even node.
	AND BYTELO		; The even node is in the LSB

	;; Compare the node against the scancode
	NEG
	ADD TMP1		; wanted scancode - node scancode
	SNN			; wanted >= node?
	JMP _kbd_sc2c_lt	; No, it's < node. Use left child.

	SZA			; wanted == node?
	JMP _kbd_sc2c_gt	; No, it's > node. Use right child.
	JMP _kbd_sc2c_found	; Yes. Found.

	;; Branch to the left child.
_kbd_sc2c_lt:
	LOAD TMP2
	SBL			; 2 * node
	ADD PLUS1		; 2 * node + 1
	JMP _kbd_sc2c_go	; Go to node.

_kbd_sc2c_gt:
	LOAD TMP2
	SBL			; 2 * node
	ADD PLUS2		; 2 * node + 2

	;; Are we done with the heap?
_kbd_sc2c_go:
	STORE TMP2
	NEG
	ADD _kbd_heapsz		; new node < heap size?
	SPA			;
	JMP _kbd_sc2c_nfound	; Yes. The scancode wasn't found.
	JMP _kbd_sc2c_loop	; No. Check the next node.

	;; The scancode wasn't found. Return the scancode and FALSE.
_kbd_sc2c_nfound:
	LI 0
	PUSH(SP)		; Push FALSE (the rest of the stack as OK)
	NEXT

	;; The scancode was found. Return the character and TRUE.
_kbd_sc2c_found:
	SDROPn(SP, 2)		; Reduce the SP by 2, prepare to push

	// Use TMP2 as an offset into the appropriate table.
	LI KBM_SHIFT
	AND TMP3		; Shifted?
	//PRINTH
	SZA
	JMP _kbd_sc2ct0
	JMP _kbd_sc2ct1

_kbd_sc2ct0:
	LIA _kbd_map_shift	; Yes.
	JMP @+2

_kbd_sc2ct1:
	LIA _kbd_map_plain	; No.

	STORE TMP0

	LOAD TMP2		; node number
	SBR			; >> 1, L=parity
	ADD TMP0
	STORE TMP0
	//PRINTA
	LOAD I TMP0		; Load char value
	SSL			; L = 1?
	JMP _kbd_sc2c_getmsb	; No. We want the even node.
	RNR			; >> 4
	RNR			; >> 4

_kbd_sc2c_getmsb:		; Yes, get the even node.
	AND BYTELO		; The even node is in the LSB

	PUSH(SP)		; Push the character
	LPUSH(SP, 1)

	NEXT

	;; Include the keymap, which provides _kbd_heapsz, _kbd_heap,
	;; _kdb_map_plain and _kbd_map_shift.
_kbd_sc2c_tables:
	.word _kbd_map_plain
	.word _kbd_map_shift

.include "_generated_keymap.asm"


// End of file.


///////////////////////////////////////////////////////////////////////////////
//
// FILE: primitives/8610_psg.asm
//
///////////////////////////////////////////////////////////////////////////////


// -*- asm -*-
//
// The AY-3-8910 Programmable Sound Generator

	.equ PSG R &0f0


	;; word:  PSG
	;; flags: CODE ROM CFT
        ;;   word PSG defined in primitives/8610_psg.asm:9.
//dwn_PSG:
//        .strp "PSG" 0
dw_PSG_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 3 ; Flags & hash
        .word dwn_PSG           ; Pointer to word name (above)
        .word dw_KBD_SC2C_head  ; Link to previous dictionary entry
dw_PSG:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_PSG_pfa:
	;; notes: PSG ( a b -- )
	;;        Write b to PSG register a.

	POP(SP)			; Pop b
	STORE TMP1
	POP(SP)			; Pop reg name
	STORE TMP2

	LI &100			; Register select
	OR TMP2
	OUT PSG

	LOAD TMP1
	OUT PSG

	NEXT


.macro WPSG(reg,data)
	LI &100 %reg
	OUT PSG
	LI %data
	OUT PSG
.end

	;; word:  IPSG
	;; flags: CODE ROM CFT
        ;;   word IPSG defined in primitives/8610_psg.asm:36.
//dwn_IPSG:
//        .strp "IPSG" 0
dw_IPSG_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 5 ; Flags & hash
        .word dwn_IPSG          ; Pointer to word name (above)
        .word dw_PSG_head       ; Link to previous dictionary entry
dw_IPSG:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_IPSG_pfa:
	;; notes: IPSG ( a b -- )
	;;        Write b to PSG register a.

	WPSG(0,0)
	WPSG(1,0)
	WPSG(2,0)
	WPSG(3,0)
	WPSG(4,0)
	WPSG(5,0)
	WPSG(6,0)
	WPSG(7,0)
	WPSG(8,0)
	WPSG(9,0)
	WPSG(10,0)
	WPSG(11,0)
	WPSG(12,0)
	WPSG(13,0)
	WPSG(14,0)
	WPSG(12,0)
	WPSG(13,0)
	WPSG(0,237)
	WPSG(1,5)
	WPSG(8,30)
	WPSG(2,111)
	WPSG(3,1)
	WPSG(9,14)
	WPSG(7,40)
	WPSG(6,6)
	WPSG(11,48)
	WPSG(13,8)
	WPSG(0,237)
	WPSG(1,5)
	WPSG(8,30)
	WPSG(2,239)
	WPSG(3,1)
	WPSG(9,14)
	WPSG(7,56)
	WPSG(0,237)
	WPSG(1,5)
	WPSG(8,29)
	WPSG(2,111)
	WPSG(3,2)
	WPSG(9,13)
	WPSG(0,237)
	WPSG(1,5)
	WPSG(8,28)
	WPSG(2,239)
	WPSG(3,2)
	WPSG(9,13)
	WPSG(0,237)
	WPSG(1,5)
	WPSG(8,27)
	WPSG(2,111)
	WPSG(3,3)
	WPSG(9,12)
	WPSG(0,239)
	WPSG(1,5)
	WPSG(8,26)
	WPSG(2,239)
	WPSG(3,3)
	WPSG(9,11)
	WPSG(0,239)
	WPSG(1,5)
	WPSG(2,239)
	WPSG(3,4)
	WPSG(9,0)
	WPSG(0,237)
	WPSG(1,5)
	WPSG(2,239)
	WPSG(3,0)
	WPSG(9,0)
	WPSG(0,123)
	WPSG(1,1)
	WPSG(8,30)
	WPSG(2,239)
	WPSG(3,0)
	WPSG(9,0)
	WPSG(0,123)
	WPSG(1,1)
	WPSG(8,30)
	WPSG(2,239)
	WPSG(3,0)
	WPSG(9,0)
	WPSG(0,123)
	WPSG(1,1)
	WPSG(8,29)
	WPSG(2,239)
	WPSG(3,0)
	WPSG(9,0)
	WPSG(0,123)
	WPSG(1,1)
	WPSG(8,28)
	WPSG(2,239)
	WPSG(3,0)
	WPSG(9,0)
	WPSG(0,123)
	WPSG(1,1)
	WPSG(8,27)
	WPSG(2,239)
	WPSG(3,0)
	WPSG(9,0)
	WPSG(0,125)
	WPSG(1,1)

	NEXT

	;; word:  IPSG1
	;; flags: CODE ROM CFT
        ;;   word IPSG1 defined in primitives/8610_psg.asm:144.
//dwn_IPSG1:
//        .strp "IPSG1" 0
dw_IPSG1_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 4 ; Flags & hash
        .word dwn_IPSG1         ; Pointer to word name (above)
        .word dw_IPSG_head      ; Link to previous dictionary entry
dw_IPSG1:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_IPSG1_pfa:
	;; notes: IPSG1 ( -- )
	;;        Write b to PSG register a.

	WPSG(0,0)
	WPSG(1,0)
	WPSG(7,254)		; Channel A tone enable
	WPSG(8,7)		; Half amplitude

	LOAD _pd
	STORE TMP14

_ipsg1_loop:
	LI &100			; Select register 0 (channel A frequency, low)
	OUT PSG

	LOAD TMP14		; Output low 8 bits of freq
	AND BYTELO
	OUT PSG

	LI &101			; Select register 1 (channel A frequency, high)
	OUT PSG

	LOAD TMP14		; Output high 4 bits of freq
	RNR
	RNR
	AND PLUS15
	OUT PSG

	FORTH(dw_1MS)
	FORTH(dw_1MS)

	ISZ TMP14
	JMP _ipsg1_loop
	NEXT

_pd:	.word -4095



	;; word:  IPSG2
	;; flags: CODE ROM CFT
        ;;   word IPSG2 defined in primitives/8610_psg.asm:185.
//dwn_IPSG2:
//        .strp "IPSG2" 0
dw_IPSG2_head:
        .word FFL_T_CODE FFL_ROM FFL_CFT 4 ; Flags & hash
        .word dwn_IPSG2         ; Pointer to word name (above)
        .word dw_IPSG1_head     ; Link to previous dictionary entry
dw_IPSG2:
        ; None (code word -- fall through) ; Code entry point: next instruction
dw_IPSG2_pfa:
	;; notes: IPSG2 ( n -- )
	;;        Write b to PSG register a.

	WPSG(7,254)		; Channel A tone enable
	WPSG(8,7)		; Half amplitude
	POP(SP)
	STORE TMP14

	LI &100			; Select register 0 (channel A frequency, low)
	OUT PSG
	LOAD TMP14		; Output low 8 bits of freq
	AND BYTELO
	OUT PSG

	LI &101			; Select register 1 (channel A frequency, high)
	OUT PSG

	LOAD TMP14		; Output high 4 bits of freq
	RNR
	RNR
	AND PLUS15
	OUT PSG

	NEXT

// End of file.


	.equ _voc_ROMForth dw_IPSG2_head




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; START NEW VOCABULARY: EOF
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



.equ __lastromlink dw_IPSG2_head

// End of file.
dwn_ROM_ROOT:
		.strp "ROM.ROOT" 0
dwn_ROM_FORTH:
		.strp "ROM.FORTH" 0
dwn_ONLY:
		.strp "ONLY" 0
dwn_ORDER:
		.strp "ORDER" 0
dwn_WORDS:
		.strp "WORDS" 0
dwn_to_RAM:
		.strp ">RAM" 0
dwn_doLIST:
		.strp "DOLIST" 0
dwn_EXIT:
		.strp "EXIT" 0
dwn_EXECUTE:
		.strp "EXECUTE" 0
dwn_doLIT:
		.strp "DOLIT" 0
dwn_doPSTR:
		.strp "DOPSTR" 0
dwn_NOP:
		.strp "NOP" 0
dwn_branch:
		.strp "BRANCH" 0
dwn_if_branch:
		.strp "?BRANCH" 0
dwn_next:
		.strp "NEXT" 0
dwn_FALSE:
		.strp "FALSE" 0
dwn_TRUE:
		.strp "TRUE" 0
dwn_zero_less:
		.strp "0<" 0
dwn_zero_equals:
		.strp "0=" 0
dwn_zero_greater:
		.strp "0>" 0
dwn_lt:
		.strp "<" 0
dwn_leq:
		.strp "<=" 0
dwn_equal:
		.strp "=" 0
dwn_not_equal:
		.strp "<>" 0
dwn_geq:
		.strp ">=" 0
dwn_gt:
		.strp ">" 0
dwn_MIN:
		.strp "MIN" 0
dwn_MAX:
		.strp "MAX" 0
dwn_WITHIN:
		.strp "WITHIN" 0
dwn_AND:
		.strp "AND" 0
dwn_OR:
		.strp "OR" 0
dwn_XOR:
		.strp "XOR" 0
dwn_add:
		.strp "+" 0
dwn_sub:
		.strp "-" 0
dwn_NEGATE:
		.strp "NEGATE" 0
dwn_inc:
		.strp "1+" 0
dwn_inc2:
		.strp "2+" 0
dwn_dec:
		.strp "1-" 0
dwn_dec2:
		.strp "2-" 0
dwn_shl1:
		.strp ">>1" 0
dwn_2div:
		.strp "2/" 0
dwn_2mul:
		.strp "2*" 0
dwn_16div:
		.strp "16/" 0
dwn_16mul:
		.strp "16*" 0
dwn_256mul:
		.strp "256*" 0
dwn_256div:
		.strp "256/" 0
dwn_NOT:
		.strp "NOT" 0
dwn_ABS:
		.strp "ABS" 0
dwn_NOR:
		.strp "NOR" 0
dwn_NAND:
		.strp "NAND" 0
dwn_cell_dec:
		.strp "CELL-" 0
dwn_cell_inc:
		.strp "CELL+" 0
dwn_CELLS:
		.strp "CELLS" 0
dwn_ALIGNED:
		.strp "ALIGNED" 0
dwn_LOBYTE:
		.strp "LOBYTE" 0
dwn_HIBYTE:
		.strp "HIBYTE" 0
dwn_byte_swap:
		.strp "><" 0
dwn_c_store:
		.strp "C!" 0
dwn_store:
		.strp "!" 0
dwn_c_fetch:
		.strp "C@" 0
dwn_fetch:
		.strp "@" 0
dwn_plus_store:
		.strp "+!" 0
dwn_one_plus_store:
		.strp "1+!" 0
dwn_one_minus_store:
		.strp "1-!" 0
dwn_store_BITS:
		.strp "!BITS" 0
dwn_RP_fetch:
		.strp "RP@" 0
dwn_RP_store:
		.strp "RP!" 0
dwn_SP_fetch:
		.strp "SP@" 0
dwn_SP_store:
		.strp "SP!" 0
dwn_to_R:
		.strp ">R" 0
dwn_R_from:
		.strp "R>" 0
dwn_R_fetch:
		.strp "R@" 0
dwn_RDUP:
		.strp "RDUP" 0
dwn_RDROP:
		.strp "RDROP" 0
dwn_DROP:
		.strp "DROP" 0
dwn_DUP:
		.strp "DUP" 0
dwn_SWAP:
		.strp "SWAP" 0
dwn_OVER:
		.strp "OVER" 0
dwn_if_DUP:
		.strp "?DUP" 0
dwn_ROT:
		.strp "ROT" 0
dwn_not_ROT:
		.strp "-ROT" 0
dwn_ROLL:
		.strp "ROLL" 0
dwn_DEPTH:
		.strp "DEPTH" 0
dwn_RDEPTH:
		.strp "RDEPTH" 0
dwn_PICK:
		.strp "PICK" 0
dwn_RPICK:
		.strp "RPICK" 0
dwn_EMIT:
		.strp "EMIT" 0
dwn_TTY_INIT:
		.strp "TTY.INIT" 0
dwn_TTY_EMIT:
		.strp "TTY.EMIT" 0
dwn_rx_q:
		.strp "RX?" 0
dwn_rx:
		.strp "RX" 0
dwn__qPRESENT:
		.strp "_.?PRESENT" 0
dwn__DEV:
		.strp "_.DEV" 0
dwn__INIT:
		.strp "_INIT" 0
dwn_COLD:
		.strp "COLD" 0
dwn_dot_banner:
		.strp ".BANNER" 0
dwn_BYE:
		.strp "BYE" 0
dwn_HALT:
		.strp "HALT" 0
dwn_HERE:
		.strp "HERE" 0
dwn_PAD:
		.strp "PAD" 0
dwn_fetch_EXECUTE:
		.strp "@EXECUTE" 0
dwn_two_store:
		.strp "2!" 0
dwn_two_fetch:
		.strp "2@" 0
dwn_set_FLAG_store:
		.strp "+FLAG!" 0
dwn_clear_FLAG_store:
		.strp "-FLAG!" 0
dwn_BL:
		.strp "BL" 0
dwn_to_char:
		.strp ">CHAR" 0
dwn_COUNT:
		.strp "COUNT" 0
dwn_to_CCOUNT:
		.strp ">CCOUNT" 0
dwn_CCOUNT:
		.strp "CCOUNT" 0
dwn_CMOVE:
		.strp "CMOVE" 0
dwn_FILL:
		.strp "FILL" 0
dwn_ERASE:
		.strp "ERASE" 0
dwn__pack:
		.strp "$PACK" 0
dwn__cPACK:
		.strp "$CPACK" 0
dwn_2CHARS:
		.strp "2CHARS" 0
dwn_s_fetch:
		.strp "S@" 0
dwn_s_store:
		.strp "S!" 0
dwn_do_str:
		.strp "DO$" 0
dwn_dot_str:
		.strp ".$" 0
dwn_INSRC:
		.strp "INSRC" 0
dwn__EOBq:
		.strp "_EOB?" 0
dwn__EOLq:
		.strp "_EOL?" 0
dwn_EOBq:
		.strp "EOB?" 0
dwn_EOLq:
		.strp "EOL?" 0
dwn__parse:
		.strp "$PARSE" 0
dwn_PARSE:
		.strp "PARSE" 0
dwn_dash_TRAILING:
		.strp "-TRAILING" 0
dwn_dash_cTRAILING:
		.strp "-CTRAILING" 0
dwn_dot_paren:
		.strp ".(" 0
dwn_dot_quote:
		.strp ".\"" 0
dwn_quote:
		.strp "\"" 0
dwn_comment:
		.strp "(" 0
dwn_line_comment:
		.strp "\\" 0
dwn_CHAR:
		.strp "CHAR" 0
dwn_WORD:
		.strp "WORD" 0
dwn_TOKEN:
		.strp "TOKEN" 0
dwn_tick:
		.strp "'" 0
dwn_div0q:
		.strp "/0?" 0
dwn_shl:
		.strp "<<" 0
dwn_shr:
		.strp ">>" 0
dwn_U_DIV_MOD:
		.strp "U/MOD" 0
dwn_DIV_MOD:
		.strp "/MOD" 0
dwn_DIV:
		.strp "/" 0
dwn_UD_DIV_MOD:
		.strp "UD/MOD" 0
dwn_UM_DIV_MOD:
		.strp "UM/MOD" 0
dwn_D_div_MOD:
		.strp "D/MOD" 0
dwn_mul16:
		.strp "*" 0
dwn_mul10:
		.strp "*10" 0
dwn_BCD8_from:
		.strp "BCD8>" 0
dwn_BCD_from:
		.strp "BCD>" 0
dwn_UM_times:
		.strp "UM*" 0
dwn_UDtimes:
		.strp "UD*" 0
dwn_mul_div_MOD:
		.strp "*/MOD" 0
dwn_mul_div:
		.strp "*/" 0
dwn_numCONTEXT:
		.strp "#CONTEXT" 0
dwn_voc0:
		.strp "VOC0" 0
dwn_voc_plus:
		.strp "VOC+" 0
dwn_CONTEXT_fetch:
		.strp "CONTEXT@" 0
dwn_CONTEXT_store:
		.strp "CONTEXT!" 0
dwn_DEFINITIONS:
		.strp "DEFINITIONS" 0
dwn_CURRENT_fetch:
		.strp "CURRENT@" 0
dwn_ALSO:
		.strp "ALSO" 0
dwn_countwords:
		.strp "#WORDS" 0
dwn_CR:
		.strp "CR" 0
dwn_SPACE:
		.strp "SPACE" 0
dwn_SPACES:
		.strp "SPACES" 0
dwn_ZEROES:
		.strp "ZEROES" 0
dwn_TYPE:
		.strp "TYPE" 0
dwn_type0:
		.strp "TYPE0" 0
dwn_typep0:
		.strp "TYPEP0" 0
dwn_TYPEp:
		.strp "TYPEP" 0
dwn_NUF_if:
		.strp "NUF?" 0
dwn_UEMIT:
		.strp "UEMIT" 0
dwn_SYSCFG:
		.strp "SYSCFG" 0
dwn_SYSMEM:
		.strp "SYSMEM" 0
dwn_UP_fetch:
		.strp "UP@" 0
dwn_SP0:
		.strp "SP0" 0
dwn_RP0:
		.strp "RP0" 0
dwn_STATE:
		.strp "STATE" 0
dwn_BASE:
		.strp "BASE" 0
dwn_BASE_to_R:
		.strp "BASE>R" 0
dwn_R_to_BASE:
		.strp "R>BASE" 0
dwn_cTIB:
		.strp "#TIB" 0
dwn_TIB:
		.strp "TIB" 0
dwn_TIBADDR:
		.strp "TIBADDR" 0
dwn_TIBS:
		.strp "TIBS" 0
dwn_ofsIN:
		.strp ">IN" 0
dwn_SPAN:
		.strp "SPAN" 0
dwn_BLK:
		.strp "BLK" 0
dwn_pBLK:
		.strp ">BLK" 0
dwn_cBLK:
		.strp "#BLK" 0
dwn_BLKBUF:
		.strp "BLKBUF" 0
dwn_BLKBUF0:
		.strp "BLKBUF0" 0
dwn_BLKBUF1:
		.strp "BLKBUF1" 0
dwn_BLKBS:
		.strp "BLKBS" 0
dwn_pLINE:
		.strp ">LINE" 0
dwn_cLINE:
		.strp "#LINE" 0
dwn_HLD:
		.strp "HLD" 0
dwn_CURRENT:
		.strp "CURRENT" 0
dwn_pCONTEXT:
		.strp "PCONTEXT" 0
dwn_CONTEXT:
		.strp "CONTEXT" 0
dwn_CSP:
		.strp "CSP" 0
dwn_HANDLER:
		.strp "HANDLER" 0
dwn_DISKUNIT:
		.strp "DISKUNIT" 0
dwn_ROTOR:
		.strp "ROTOR" 0
dwn_tick_EMIT:
		.strp "'EMIT" 0
dwn_tick_INSRC:
		.strp "'INSRC" 0
dwn_tick_dot_READY:
		.strp "'.READY" 0
dwn_tick_dot_PS1:
		.strp "'.PS1" 0
dwn_tick_dot_PS2:
		.strp "'.PS2" 0
dwn_tick_dot_OK:
		.strp "'.OK" 0
dwn_tick_EVAL:
		.strp "'EVAL" 0
dwn_tick_NUMBER:
		.strp "'NUMBER" 0
dwn_tick_EOBq:
		.strp "'EOB?" 0
dwn_tick_EOLq:
		.strp "'EOL?" 0
dwn_pstrupper:
		.strp "PSTRUPPER" 0
dwn_pstrlower:
		.strp "PSTRLOWER" 0
dwn_pstrcmp:
		.strp "PSTRCMP" 0
dwn__isdigit:
		.strp "$DIGIT?" 0
dwn_NUMBERq:
		.strp "NUMBER?" 0
dwn_2DROP:
		.strp "2DROP" 0
dwn_2DUP:
		.strp "2DUP" 0
dwn_2OVER:
		.strp "2OVER" 0
dwn_N_to_D:
		.strp "N>D" 0
dwn_U_to_D:
		.strp "U>D" 0
dwn_DNEGATE:
		.strp "DNEGATE" 0
dwn_DABS:
		.strp "DABS" 0
dwn_DPLUS:
		.strp "D+" 0
dwn_DMINUS:
		.strp "D-" 0
dwn_PS1:
		.strp "PS1" 0
dwn_KEY:
		.strp "KEY" 0
dwn_accept:
		.strp "ACCEPT" 0
dwn_EXPECT:
		.strp "EXPECT" 0
dwn_getline:
		.strp "GETLINE" 0
dwn_QUERY:
		.strp "QUERY" 0
dwn_to_FLAGS_fetch:
		.strp ">FLAGS@" 0
dwn_to_CFA:
		.strp ">CFA" 0
dwn_to_LINK_fetch:
		.strp ">LINK@" 0
dwn_to_NAME:
		.strp ">NAME" 0
dwn_FIND:
		.strp "FIND" 0
dwn_COMPILE_ONLYq:
		.strp "COMPILE-ONLY?" 0
dwn_IMMEDIATEq:
		.strp "IMMEDIATE?" 0
dwn_voc_find:
		.strp "VOC.FIND" 0
dwn_DIGIT:
		.strp "DIGIT" 0
dwn_EXTRACT:
		.strp "EXTRACT" 0
dwn_bkt_number:
		.strp "<#" 0
dwn_N_bkt_number:
		.strp "N<#" 0
dwn_U_bkt_number:
		.strp "U<#" 0
dwn_HOLD:
		.strp "HOLD" 0
dwn_number:
		.strp "#" 0
dwn_number_s:
		.strp "#S" 0
dwn_0_number_s:
		.strp "0#S" 0
dwn_SIGN:
		.strp "SIGN" 0
dwn_number_bkt:
		.strp "#>" 0
dwn__Nstr:
		.strp "_N$" 0
dwn__Ustr:
		.strp "_U$" 0
dwn__DUstr:
		.strp "$DUSTR" 0
dwn__Dstr:
		.strp "_D$" 0
dwn_BINARY:
		.strp "BINARY" 0
dwn_OCTAL:
		.strp "OCTAL" 0
dwn_DECIMAL:
		.strp "DECIMAL" 0
dwn_HEX:
		.strp "HEX" 0
dwn_dot_r:
		.strp ".R" 0
dwn_dot_0r:
		.strp ".0R" 0
dwn_u_dot_r:
		.strp "U.R" 0
dwn_u_dot_0r:
		.strp "U.0R" 0
dwn_u_dot:
		.strp "U." 0
dwn_DU_dot:
		.strp "DU." 0
dwn_dot:
		.strp "." 0
dwn_D_dot:
		.strp "D." 0
dwn_dot_ok:
		.strp ".OK" 0
dwn__DONE:
		.strp "_DONE" 0
dwn_open_bkt:
		.strp "[" 0
dwn_EVAL_INTERPRET:
		.strp "EVAL.INTERPRET" 0
dwn_qSTACK:
		.strp "?STACK" 0
dwn_EVAL:
		.strp "EVAL" 0
dwn_dot_READY:
		.strp ".READY" 0
dwn_INTERPRET:
		.strp "INTERPRET" 0
dwn_QUIT:
		.strp "QUIT" 0
dwn_CATCH:
		.strp "CATCH" 0
dwn_THROW:
		.strp "THROW" 0
dwn_pNULL:
		.strp "PNULL" 0
dwn_ABORT:
		.strp "ABORT" 0
dwn_doABORT_str:
		.strp "DOABORT\"" 0
dwn_ALLOT:
		.strp "ALLOT" 0
dwn_HERE_store:
		.strp "HERE!" 0
dwn_comma:
		.strp "," 0
dwn_bkt_CHAR_bkt:
		.strp "[CHAR]" 0
dwn_bkt_tick_bkt:
		.strp "[']" 0
dwn_bkt_COMPILE_bkt:
		.strp "[COMPILE]" 0
dwn_COMPILE:
		.strp "COMPILE" 0
dwn_LITERAL:
		.strp "LITERAL" 0
dwn_comma_str:
		.strp ",\"" 0
dwn_ABORT_str:
		.strp "ABORT\"" 0
dwn_HASH:
		.strp "HASH" 0
dwn_comma_HEAD:
		.strp ",HEAD" 0
dwn_comma_CFA:
		.strp ",CFA" 0
dwn_REVEAL:
		.strp "REVEAL" 0
dwn_WORDFLAG:
		.strp "WORDFLAG" 0
dwn_WORDCFA:
		.strp "WORDCFA" 0
dwn_IMMEDIATE:
		.strp "IMMEDIATE" 0
dwn_COMPILE_ONLY:
		.strp "COMPILE-ONLY" 0
dwn_tick_doCOL:
		.strp "'DOCOL" 0
dwn_tick_doVAR:
		.strp "'DOVAR" 0
dwn_tick_doCONST:
		.strp "'DOCONST" 0
dwn_tick_do2CONST:
		.strp "'DO2CONST" 0
dwn_tick_doUSER:
		.strp "'DOUSER" 0
dwn_EVAL_COMPILE:
		.strp "EVAL.COMPILE" 0
dwn_close_bkt:
		.strp "]" 0
dwn_colon:
		.strp ":" 0
dwn_semicolon:
		.strp ";" 0
dwn_DTP:
		.strp "DTP" 0
dwn_DTPMAX:
		.strp "DTPMAX" 0
dwn_DTPq:
		.strp "DTP?" 0
dwn_to_DTP:
		.strp ">DTP" 0
dwn_DOES_:
		.strp "DOES>" 0
dwn_comma_ENTRY:
		.strp ",ENTRY" 0
dwn_USER:
		.strp "USER" 0
dwn_CREATE:
		.strp "CREATE" 0
dwn_VARIABLE:
		.strp "VARIABLE" 0
dwn_2VARIABLE:
		.strp "2VARIABLE" 0
dwn_CONSTANT:
		.strp "CONSTANT" 0
dwn_2CONSTANT:
		.strp "2CONSTANT" 0
dwn_pre_MARK:
		.strp "<MARK" 0
dwn_pre_RESOLVE:
		.strp "<RESOLVE" 0
dwn_post_MARK:
		.strp ">MARK" 0
dwn_post_RESOLVE:
		.strp ">RESOLVE" 0
dwn_IF:
		.strp "IF" 0
dwn_THEN:
		.strp "THEN" 0
dwn_ELSE:
		.strp "ELSE" 0
dwn_AHEAD:
		.strp "AHEAD" 0
dwn_FOR:
		.strp "FOR" 0
dwn_BEGIN:
		.strp "BEGIN" 0
dwn_NEXT:
		.strp "NEXT" 0
dwn_UNTIL:
		.strp "UNTIL" 0
dwn_AGAIN:
		.strp "AGAIN" 0
dwn_REPEAT:
		.strp "REPEAT" 0
dwn_AFT:
		.strp "AFT" 0
dwn_WHEN:
		.strp "WHEN" 0
dwn_WHILE:
		.strp "WHILE" 0
dwn_DO:
		.strp "DO" 0
dwn_LOOP:
		.strp "LOOP" 0
dwn_doLOOP:
		.strp "DOLOOP" 0
dwn_I:
		.strp "I" 0
dwn_J:
		.strp "J" 0
dwn_K:
		.strp "K" 0
dwn_plus_LOOP:
		.strp "+LOOP" 0
dwn_1MS:
		.strp "1MS" 0
dwn_MS:
		.strp "MS" 0
dwn_dot_ROTOR:
		.strp ".ROTOR" 0
dwn_PROGRESS:
		.strp "PROGRESS" 0
dwn_WHAT_q:
		.strp "WHAT?" 0
dwn_dot_s:
		.strp ".S" 0
dwn_dot_rs:
		.strp ".RS" 0
dwn_dot_BASE:
		.strp ".BASE" 0
dwn_DUMPCHARS:
		.strp "DUMPCHARS" 0
dwn_DUMPPCHARS:
		.strp "DUMPPCHARS" 0
dwn_DUMPHEX:
		.strp "DUMPHEX" 0
dwn_DUMP:
		.strp "DUMP" 0
dwn_dot_WORDS:
		.strp ".WORDS" 0
dwn_fetch_dot:
		.strp "@." 0
dwn_FORTH_83:
		.strp "FORTH-83" 0
dwn_panel_from:
		.strp "PANEL>" 0
dwn_to_panel:
		.strp ">PANEL" 0
dwn_DIP_from:
		.strp "DIP>" 0
dwn_IO_fetch:
		.strp "IO@" 0
dwn_IO_store:
		.strp "IO!" 0
dwn_PRINTA:
		.strp "PRINTA" 0
dwn_PRINTC:
		.strp "PRINTC" 0
dwn_PRINTD:
		.strp "PRINTD" 0
dwn_PRINTU:
		.strp "PRINTU" 0
dwn_PRINTH:
		.strp "PRINTH" 0
dwn_PRINTB:
		.strp "PRINTB" 0
dwn_PRINTSP:
		.strp "PRINTSP" 0
dwn_PRINTNL:
		.strp "PRINTNL" 0
dwn_DEBUGON:
		.strp "DEBUGON" 0
dwn_DEBUGOFF:
		.strp "DEBUGOFF" 0
dwn_DUMPSTATE:
		.strp "DUMPSTATE" 0
dwn_SUCCESS:
		.strp "SUCCESS" 0
dwn_FAIL:
		.strp "FAIL" 0
dwn_PRINT32:
		.strp "PRINT32" 0
dwn__t0:
		.strp "$T0" 0
dwn__t1:
		.strp "$T1" 0
dwn_NVRAMq:
		.strp "NVRAM?" 0
dwn_RTCq:
		.strp "RTC?" 0
dwn_NVC_fetch:
		.strp "NVC@" 0
dwn_NVC_store:
		.strp "NVC!" 0
dwn_NV_fetch:
		.strp "NV@" 0
dwn_NV_store:
		.strp "NV!" 0
dwn_RTC_INIT:
		.strp "RTC.INIT" 0
dwn_DATE_EPY:
		.strp "DATE.EPY" 0
dwn_DATE:
		.strp "DATE" 0
dwn_TIME:
		.strp "TIME" 0
dwn_dot_DATE:
		.strp ".DATE" 0
dwn_dot_TIME:
		.strp ".TIME" 0
dwn_SANITY_off:
		.strp "SANITY-" 0
dwn_SANITY_on:
		.strp "SANITY+" 0
dwn_BANKS:
		.strp "BANKS" 0
dwn_kWBANKS:
		.strp "KWBANKS" 0
dwn_MBU_store:
		.strp "MBU!" 0
dwn_MBU_fetch:
		.strp "MBU@" 0
dwn_dot_BANKS:
		.strp ".BANKS" 0
dwn_MBU_GO:
		.strp "MBU.GO" 0
dwn_MBU_INIT:
		.strp "MBU.INIT" 0
dwn_MBUq:
		.strp "MBU?" 0
dwn__HDSEL:
		.strp "_HDSEL" 0
dwn__HDRST:
		.strp "_HDRST" 0
dwn_IDE_BSY_wait:
		.strp "IDE.BSY..." 0
dwn_IDE_DRQ_wait:
		.strp "...IDE.DRQ" 0
dwn_idescr:
		.strp "IDESCR" 0
dwn_idecmd:
		.strp "IDECMD" 0
dwn_idewait:
		.strp "IDEWAIT" 0
dwn__HDIDENT:
		.strp "_HDIDENT" 0
dwn__HDSMLT:
		.strp "_HDSMLT" 0
dwn_HD_INIT:
		.strp "HD.INIT" 0
dwn__IDE_addr:
		.strp "_IDE@" 0
dwn__HD_set:
		.strp "_IDE!" 0
dwn_HDSET:
		.strp "HDSET" 0
dwn_HDq:
		.strp "HD?" 0
dwn_IDE_INIT:
		.strp "IDE.INIT" 0
dwn_IDE_RB:
		.strp "IDE.RB" 0
dwn_IDE_WB:
		.strp "IDE.WB" 0
dwn_IDE_SEEKB:
		.strp "IDE.SEEKB" 0
dwn_IDE_SEEK:
		.strp "IDE.SEEK" 0
dwn_HD_from:
		.strp "HD>" 0
dwn_to_HD:
		.strp ">HD" 0
dwn_pstate:
		.strp "PSTATE" 0
dwn_test:
		.strp "TEST" 0
dwn_MEM_INIT:
		.strp "MEM.INIT" 0
dwn__MEMq:
		.strp "_MEM?" 0
dwn_ESC:
		.strp "ESC" 0
dwn_vt_dot:
		.strp "VT." 0
dwn_vt_dot_c:
		.strp "VT.C" 0
dwn_start_VT:
		.strp "<$VT" 0
dwn_end_VT:
		.strp "VT$>" 0
dwn_end_VTm:
		.strp "VTM$>" 0
dwn_vt_NORMAL:
		.strp "VT.NORMAL" 0
dwn_vt_INK:
		.strp "VT.INK" 0
dwn_vt_BRIGHT:
		.strp "VT.BRIGHT" 0
dwn_vt_DIM:
		.strp "VT.DIM" 0
dwn_vt_UNDERLINE:
		.strp "VT.UNDERLINE" 0
dwn_vt_UNDOFF:
		.strp "VT.UNDOFF" 0
dwn_vt_PAPER:
		.strp "VT.PAPER" 0
dwn_vt_HOME:
		.strp "VT.HOME" 0
dwn_vt_GOTOXY:
		.strp "VT.GOTOXY" 0
dwn_vt_ERASE:
		.strp "VT.ERASE" 0
dwn_PAGE:
		.strp "PAGE" 0
dwn_vt_SETRGB:
		.strp "VT.SETRGB" 0
dwn_vt_FG:
		.strp "VT.FG" 0
dwn_vt_BG:
		.strp "VT.BG" 0
dwn_VDU_INIT:
		.strp "VDU.INIT" 0
dwn_VDU_ATTR:
		.strp "VDU.ATTR" 0
dwn_VDU_STADDR:
		.strp "VDU.STADDR" 0
dwn_VDU_ROWS:
		.strp "VDU.ROWS" 0
dwn_VDU_COLS:
		.strp "VDU.COLS" 0
dwn_VDU_CRSADDR:
		.strp "VDU.CRSADDR" 0
dwn_VDU_80x30:
		.strp "VDU.80X30" 0
dwn_VDU_40x30:
		.strp "VDU.40X30" 0
dwn_VDU_80x50:
		.strp "VDU.80X50" 0
dwn_VDU_BCFILL:
		.strp "VDU.BCFILL" 0
dwn_VDU_CLS:
		.strp "VDU.CLS" 0
dwn_VDU_HOME:
		.strp "VDU.HOME" 0
dwn_VDU_EMIT:
		.strp "VDU.EMIT" 0
dwn_VDU_PUTC:
		.strp "VDU.PUTC" 0
dwn_VDU_NL:
		.strp "VDU.NL" 0
dwn_VDU_CLREOL:
		.strp "VDU.CLREOL" 0
dwn_VDU_X:
		.strp "VDU.X" 0
dwn_VDU_HELLO:
		.strp "VDU.HELLO" 0
dwn_VDU_CA:
		.strp "VDU.CA" 0
dwn_VDU_SSZ:
		.strp "VDU.SSZ" 0
dwn_VDU_CHAR:
		.strp "VDU.CHAR" 0
dwn_VTEST:
		.strp "VTEST" 0
dwn_VTEST2:
		.strp "VTEST2" 0
dwn_VTEST3:
		.strp "VTEST3" 0
dwn_VDU_ROLL:
		.strp "VDU.ROLL" 0
dwn_VDU_SCROLL:
		.strp "VDU.SCROLL" 0
dwn_VDU_160x100:
		.strp "VDU.160X100" 0
dwn_VDU_320x200:
		.strp "VDU.320X200" 0
dwn_VDU_640x400:
		.strp "VDU.640X400" 0
dwn_KBD_INIT:
		.strp "KBD.INIT" 0
dwn_VDU_KBD:
		.strp "VDU.KBD" 0
dwn_EMITBOTH:
		.strp "EMITBOTH" 0
dwn_A:
		.strp "A" 0
dwn_S:
		.strp "S" 0
dwn_X:
		.strp "X" 0
dwn_KBD_MODS:
		.strp "KBD.MODS" 0
dwn_T:
		.strp "T" 0
dwn_z:
		.strp "Z" 0
dwn_KBD_SC2C:
		.strp "KBD.SC2C" 0
dwn_PSG:
		.strp "PSG" 0
dwn_IPSG:
		.strp "IPSG" 0
dwn_IPSG1:
		.strp "IPSG1" 0
dwn_IPSG2:
		.strp "IPSG2" 0

