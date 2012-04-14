// -*- asm -*-
//
// IDE interfacing.


	
	;; word:  idecmd
	;; flags: CODE ROM CFT
	;; notes: idecmd ( x -- )
	;;        Issue an IDE command

_idecmd_wait1:
	IN R &a6
	AND @_idecmd_data+0
	SNZ
	JMP _idecmd_wait1

	POP(SP)
	OUT R &b7
	
_idecmd_wait2:
	IN R &a6
	AND @_idecmd_data+0
	SNZ
	JMP _idecmd_wait2
	NEXT

_idecmd_data:
	.word &0040		; DRDY
	.word &0080		; BSY
	.word &0008		; DRQ



	;; word:  idewait
	;; flags: CODE ROM CFT
	;; notes: idewait ( -- )
	;;        Issue an IDE command

_idewait_loop:
	IN R &a6
	AND @_idecmd_data+0
	SNZ
	JMP _idewait_loop
	NEXT



	;; word:  idereset
	;; flags: CODE ROM CFT
	;; notes: idecmd ( x -- )
	;;        Reset IDE channels

	LI &00c
	OUT &a6
	OUT &c6
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	LI &008
	OUT &a6
	OUT &c6
	NEXT



	;; word:  ideread
	;; flags: CODE ROM CFT
	;; notes: idecmd ( a1 a2 -- )
	;;        Read an IDE sector from port a2, store at addresses a1 to a1+255.

	POP2(SP)		; a1 in AC, a2 in TMP1
	STORE I0
	RMOV(TMP0, _ideread_count)
	
_ideread_loop:
	IN I TMP1
	STORE I I0
	ISZ TMP0
	JMP _ideread_loop
	NEXT
	
_ideread_count:
	.word -256



	;; word:  ideseek
	;; flags: CODE ROM CFT
	;; notes: ideseek ( d -- )
	;;        Read an IDE sector from port a2, store at addresses a1 to a1+255.

	POP(SP)			; Pop high LBA (bits 16-31)
	STORE TMP1

	RNR			; >>4
	RNR			; >>4
	AND PLUS15		; AND 15
	OR @_ideseek_data+0	; LBA, drive 0
	OUT R &b6
	
	LOAD TMP1		; Load bits 16-31
	AND BYTELO		; Get bits 16-23
	OUT R &B5		; Output to LBA 16-23 reg

	POP(SP)			; Pop low LBA (bits 0-15)
	STORE TMP1

	RNR			; >>4
	RNR			; >>4
	AND BYTELO		; Get low 8 bits
	OUT R &b4		; Out to LBA 8-15 reg

	LOAD TMP1		; Load bits 16-31
	AND BYTELO		; Get bits 16-23
	OUT R &B3		; Output to LBA 0-8 reg

	NEXT

_ideseek_data:
	.word #1110'0000	; LBA, drive 0.
	.word #1111'0000	; LBA, drive 1.



	;; word:  idewrite
	;; flags: CODE ROM CFT
	;; notes: idewrite ( a1 a2 -- )
	;;        Write an IDE sector from addresses a1 to a1+255 to port a2.

	POP2r(SP)		; a1 in AC, a2 in TMP1
	STORE I0
	RMOV(TMP0, _ideread_count)
	
_idewrite_loop:
	LOAD I I0
	OUT I TMP1
	ISZ TMP0
	JMP _idewrite_loop
	NEXT



	;; word:  idesr
	;; flags: DOCOL ROM CFT
	;; notes: idesr ( -- x )
	;;        IDE Status register

	doLIT(&b7)
	.word dw_IO_fetch
	.word dw_EXIT



	;; word:  ideerr
	;; flags: DOCOL ROM CFT
	;; notes: ideerr ( -- x )
	;;        IDE Error register

	doLIT(&b1)
	.word dw_IO_fetch
	.word dw_EXIT



	;; word:  idetest
	;; flags: DOCOL ROM CFT
	;; notes: ideerr ( -- x )
	;;        IDE Error register

	doLIT(&ec)
	.word dw_idecmd
	
	doLIT(&e4)
	.word dw_idecmd

	doLIT(&8000)
	doLIT(&b0)
	.word dw_ideread
	doLIT(&8000)
	doLIT(&80)
	.word dw_DUMP
	.word dw_DROP


	doLIT(1)
	doLIT(&b2)
	.word dw_IO_store

	doLIT(&20)
	.word dw_idecmd
	
	doLIT(&e4)
	.word dw_idecmd

	doLIT(&8000)
	doLIT(&b0)
	.word dw_ideread
	doLIT(&8000)
	doLIT(&100)
	.word dw_DUMP
	.word dw_DROP



	doLIT(1)
	doLIT(0)
	.word dw_ideseek
	
	doLIT(1)
	doLIT(&b2)
	.word dw_IO_store

	doLIT(&20)
	.word dw_idecmd
	
	doLIT(&e4)
	.word dw_idecmd

	doLIT(&8000)
	doLIT(&b0)
	.word dw_ideread
	doLIT(&8000)
	doLIT(&100)
	.word dw_DUMP
	.word dw_DROP
	

	
	.word dw_EXIT



// End of file.
