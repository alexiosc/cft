// -*- asm -*-
//
// Tokenising words.



	;; word:  INSRC
	;; flags: DOCOL ROM
	;; notes: INSRC ( -- a +n )
	;; 	  Return the address of the current buffer. This word may be
	;;        overridden by changing the user variable 'INSRC to point to
	;;        a custom word.

	.word dw_BLK
	.word dw_fetch
	.word dw_if_branch	; if BLK == 0...
	.word _insrc_tty	; ... go to _insrc_tty

_insrc_blk:
	.word dw_BLKBUF		; BLKBUF ( va )
	.word dw_fetch		; @ ( a )
	.word dw_BLKBS		; BLKBS ( a n )
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
	;; notes: _EOB? ( -- f )
	;;   	  Return TRUE if the end of the input stream has been reached.
	;;        This is the default provider for EOB?, and deals with
	;;        terminals and block buffers.

	.word dw_ofsIN		; >IN @ ( +n )
	.word dw_fetch

	.word dw_BLK
	.word dw_fetch
	.word dw_if_branch
	.word _eob_tty

_eob_blk:
	.word dw_BLKBS		; BLKS ( +n +n )
	.word dw_geq		; >=
	.word dw_EXIT

_eob_tty:
	.word dw_cTIB		; #TIB @ ( +n +n )
	.word dw_fetch
	.word dw_geq		; >=
	.word dw_EXIT

	

	;; word:  _EOL?
	;; alias: _EOLq
	;; flags: DOCOL ROM CFT
	;; notes: _EOL? ( -- f )
	;;   	  Return TRUE if the end of the current line has been reached.
	;;        If the input stream comes from the terminal, this is equivalent
	;;        to _EOB?.
	;;        This is the default provider for EOB?, and deals with
	;;        terminals and block buffers.

	.word dw_ofsIN		; >IN @ ( +n )
	.word dw_fetch

	.word dw_BLK
	.word dw_fetch
	.word dw_if_branch
	.word _eob_tty		; Jump into _EOB? code.

_eol_blk:
	.word dw_cBLK		; #BLK @ ( +n +n )
	.word dw_fetch
	.word dw_geq		; >= ( f )
	.word dw_EXIT

	

	;; word:  EOB?
	;; alias: EOBq
	;; flags: DOCOL ROM CFT
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
	;; notes: $PARSE ( b e c  -- b u +n )
	;; 	  Ignores any leading characters with codepoint c, then parses
        ;; 	  a token (starting at address b) until the first codepoint c
	;;        is seen again. Returns the address of the token and its
	;;        length. Returns b=0 and u=0 if there is no more input. +n is
	;;        the number of characters processed.
	;;        Parsing stops if the end address e is reached.

	RPOP(TMP1, SP)		; TMP1=c
	RPOP(TMP5, SP)		; TMP5=e
	RPOP(I0, SP)		; I0=b

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

	XOR TMP1		; Compare against c
	SNZ			; Equal?
	JMP _parse_end		; Yes.

	ISZ TMP4		; Increment TMP4.
	JMP _parse_loop1	; Loop again.

_parse_end:
	RPUSH(SP, TMP3)		; Push address of token.
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
	;; notes: PARSE ( c -- b u )
	;; 	  Ignores any leading characters with codepoint c, then parses
        ;; 	  a token (starting at >IN) until the first codepoint c
	;;        is seen again. Returns the address of the token and its
	;;        length. Returns b=0 and u=0 if there is no more input.

	;; Is this needed now that we're checking end addresses?
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
