// -*- asm -*-
//
// Words to manage vocabularies.

	
 
	;; word:  #CONTEXT
	;; alias: numCONTEXT
	;; flags: CONST ROM
	;; notes: DEFINITIONS ( -- a )
	;;        The number of entries in the vocabulary stack.

	.word VSS

	
 
	;; word:  CONTEXT@
	;; alias: CONTEXT_fetch
	;; flags: DOCOL ROM CFT
	;; notes: DEFINITIONS ( u -- a )
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
	;; notes: ALSO ( -- )
	;;        Duplicate the vocabulary at the top of the stack. This
	;;        allows the 'FORTH ALSO X' idiom, which ends up with
	;;        FORTH X as the top two entries in the vocabulary stack.
	;;        An error is raised if the vocabulary stack runs out of
	;;        space.
	;; code:  : DEFINITIONS ( -- ) 0 CONTEXT@ CURRENT ! ;

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



	;; word:  ORDER
	;; flags: DOCOL ROM CFT
	;; notes: ORDER ( -- )
	;;        Prints out the vocabulary search order.

	.word dw_pCONTEXT
	.word dw_fetch		; ( u )
	.word dw_DUP
	.word dw_PRINTD

_order_loop:
	.word dw_DUP		; DUP ( u u )
	.word dw_if_branch	; IF ( u )
	.word _order_done

	.word dw_dec		; 1- ( u-1 )
	.word dw_DUP		; DUP ( u-1 u-1 )
	.word dw_CONTEXT	; CONTEXT ( u-1 u-1 a )
	.word dw_add		; + ( u-1 a+u-1 )
	.word dw_DUP
	.word dw_PRINTA
	.word dw_fetch		; @ ( u-1 a )
	.word dw_dot		; . ( u-1 )

	.word dw_branch		; loop again
	.word _order_loop

_order_done:
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

