// -*- asm -*-
//
// Utility words



	;; word:  1MS
	;; flags: CODE ROM
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



	;; word:  MS
	;; flags: CODE ROM
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
	;; notes: PROGRESS ( u -- )
	;;        Output a rotor character and Wait for u milliseconds.

	.word dw_MS
	.word dw_dot_ROTOR
	.word dw_EXIT



	;; word:  WHAT?
	;; alias: WHAT_q
	;; flags: DOCOL ROM
	;; notes: WHAT? ( a -- )
	;;        Prints out the name of the word whose CFA address is a.
	;; src:   : WHAT? ( a -- ) >NAME typep0 ;

	.word dw_to_NAME	; >NAME ( a )
	.word dw_typep0		; typep0 ( )
	.word dw_EXIT



	;; word:  .s
	;; alias: dot_s
	;; flags: DOCOL ROM
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
	;; notes: @. ( addr -- )
	;;        Prints out the contents of a memory cell.
	;;
	;; src:   : @. ( a -- ) @ . ;

	.word dw_fetch		; @
	.word dw_dot		; .
	.word dw_EXIT		; EXIT


	
// End of file.
