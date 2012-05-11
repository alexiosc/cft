// -*- asm -*-
//
// Supplemental multiplication-based arithmetic



	;; word:  */MOD
	;; alias: mul_div_MOD
	;; flags: DOCOL ROM
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
	;; code:  ABORT" division overflow" DROP -ROT DROP ;

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
