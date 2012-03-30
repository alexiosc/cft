// -*- asm -*-
//
// Utility words



	;; word:  .s
	;; alias: dot_s
	;; flags: DOCOL ROM
	;; notes: .s ( -- )
	;;        Prints out the stack non-destructively.
	;; src:   DEPTH FOR AFT R@ PICK . THEN NEXT;

	.word dw_DEPTH		; DEPTH              ( d )     ( )
_dot_s_loop:
	.word dw_DUP		; DUP                ( d d )   ( )
	.word dw_to_r		; >R                 ( d )     ( d )
	.word dw_if_branch	;   ?branch ( FOR )  ( )       ( d )
	.word _dot_s_end
	.word dw_r_from		; R>                 ( d )     ( )
	.word dw_dec 		; 1-                 ( d )     ( )
	.word dw_DUP		; DUP                ( d d )   ( )
	.word dw_to_r		; >R                 ( d )     ( d )
	.word dw_PICK		; PICK               ( w )     ( d )
	.word dw_dot 		; .                  ( )       ( d )
	.word dw_r_from		;   R>               ( d )     ( )
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
	.word dw_DUP		;   R>               ( d d )   ( )
	.word dw_branch		;   THEN NEXT        ( d )
	.word _dot_rs_loop
_dot_rs_end:
	.word dw_DROP		; DROP
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

	.word dw_to_r		; >R ( a )
	
_dumpchars_loop:
	.word dw_r_fetch	; R@ ( a n )
	.word dw_if_branch	;   ?branch ( a )
	.word _dumpchars_end
	.word dw_r_from		; R> ( a n )
	.word dw_dec		; 1- ( a n )
	.word dw_to_r		; >R ( a )

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

	.word dw_to_r		; >R ( a )
	
_dumppchars_loop:
	.word dw_r_fetch	; R@ ( a n )
	.word dw_if_branch	;   ?branch ( a )
	.word _dumppchars_end
	.word dw_r_from		; R> ( a n )
	.word dw_dec		; 1- ( a n )
	.word dw_to_r		; >R ( a )

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

	.word dw_to_r		; >R ( a )
	
_dumphex_loop:
	.word dw_r_fetch	; R@ ( a n )
	
	.word dw_if_branch	;   ?branch ( a )
	.word _dumphex_end
	.word dw_r_from		; R> ( a n )
	.word dw_dec		; 1- ( a n )
	.word dw_to_r		; >R ( a )

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
	.word dw_to_r		; >R ( a n )
	
	.word dw_HEX		; ( a n )
	
	.word dw_shl1		; >>1 ( a n/2 )
	.word dw_shl1		; >>1 ( a n/4 )
	.word dw_shl1		; >>1 ( a n/8 )
	.word dw_to_r		; >R ( a )

	.word dw_CR		; CR ( a )

_dump_loop:
	;; Done yet?
	.word dw_r_fetch	; R@ ( a n )
	.word dw_if_branch	;   ?branch ( a )
	.word _dump_end

	.word dw_NUF_if		; NUF? ( a f )
	.word dw_NOT		; NOT ( a !f )
	.word dw_if_branch	;   ?branch ( a )
	.word _dump_end
	
	.word dw_r_from		; R> ( a n )
	.word dw_dec		; 1- ( a n )
	.word dw_to_r		; >R ( a )

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
	.word dw_r_from		; R> ( a ab b )
	.word dw_BASE		; BASE ( a ab )
	.word dw_store		; ! ( a )
	
	.word dw_EXIT		; EXIT

	
	
// End of file.
