// -*- asm -*-
//
// The AY-3-8910 Programmable Sound Generator

	.equ PSG R &0f0


	;; word:  PSG
	;; flags: CODE ROM CFT
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
