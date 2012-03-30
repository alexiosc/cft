// -*- asm -*-
//
// Words to manage vocabularies.

 
	;; word:  CURRENT@
	;; alias: CURRENT_fetch
	;; flags: DOCOL ROM
	;; notes: CURRENT@ ( -- a )
	;;        The address of the dictionary to add new definitions to.
	;;        In the process of compiling a new word, LAST will become
	;;        the link in the new dictionary entry, then get updated
	;;        to point to the new dictionary entry itself.
	;; code:  : LAST ( -- a ) CURRENT @ ;

	.word dw_CURRENT	; CURRENT
	.word dw_fetch		; @
	.word dw_EXIT



	;; word:  WORDS
	;; flags: DOCOL ROM CFT
	;; notes: WORDS ( -- )
	;;        Prints out list of words.

	.word dw_CR		; CR ( )
	.word dw_CURRENT	; CURRENT ( va )

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

	
	
	;; word:  .WORDS
	;; alias: dot_WORDS
	;; flags: DOCOL ROM CFT
	;; notes: .WORDS ( -- )
	;;        Prints out a verbose list of words.

	.word dw_CR		; CR ( )
	.word dw_HEX		; HEX ( )
	.word dw_CURRENT	; CURRENT ( a )

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

	
	
	;; word:  #WORDS
	;; alias: countwords
	;; flags: DOCOL ROM CFT
	;; notes: #WORDS ( -- n )
	;;        Returns the number of words in the CURRENT vocabulary.

 	.word dw_doLIT		; 0 ( u )
 	.word 0
 	.word dw_CURRENT	; CURRENT ( u a )

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

