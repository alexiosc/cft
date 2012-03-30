// -*- asm -*-
//
// Double math

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
	


	;; word:  D+
	;; alias: DPLUS
	;; flags: CODE ROM
	;; notes: D+ ( d d -- d )
	;;   Add two double-words
	;;   TODO: Popping four words like this is inefficient. Fix it.
	POP (SP)		; a high
	STORE TMP0
	POP (SP)		; a low
	STORE TMP1

	POP (SP)		; b high
	STORE TMP2
	POP (SP)		; b low

_dplus_work:
	CLL
	ADD TMP1		; a_lo + b_lo
	STORE TMP1

	LOAD TMP2		; b high
	OP1 IFL INC		; propagate carry (increase if L)

	ADD TMP0		; carry + b high + b low
	STORE TMP0

	LOAD TMP1
	PUSH (SP)

	LOAD TMP0
	PUSH (SP)

	NEXT
	


	;; word:  D-
	;; alias: DMINUS
	;; flags: CODE ROM
	;; notes: D- ( d d -- d )
	;;   Subtract two double-words.
	;;   TODO: Popping four words like this is inefficient. Fix it.
	POP (SP)		; a high
	STORE TMP0
	POP (SP)		; a low
	STORE TMP1

	POP (SP)		; b high
	STORE TMP2
	POP (SP)		; b low
	NEG
	STORE TMP3

	SCL			; Skip if L clear
	ISZ TMP2		; Otherwise, increment high b

	JMP _dplus_work


	
// End of file.
