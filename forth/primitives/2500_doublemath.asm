// -*- asm -*-
//
// Double math


	
	;; word:  N>D
	;; alias: N_to_D
	;; flags: CODE ROM CFT
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
	;; notes: U>D ( u -- d )
	;;        Convert the unsigned integer n to a double integer d.

	LI 0
	PUSH(SP)
	NEXT



	;; word:  DNEGATE
	;; flags: CODE ROM
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
