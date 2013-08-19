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
	;; notes: #CONTEXT ( -- a )
	;;        The number of entries in the vocabulary stack.

	.word VSS

	
 
	;; word:  voc0
	;; flags: DOCOL ROM CFT
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
