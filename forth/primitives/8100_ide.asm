// -*- asm -*-
//
// IDE interfacing.

	
 
	;; word:  HDn?
	;; flags: DOCOL ROM CFT
	;; notes: HDn? ( n -- f )
	;;        Returns non-zero if IDE disk IDE n is present.

	doLIT(CFG_HD0)		; CFG_HD0 ( n u )
	.word dw_SWAP		; SWAP ( u n )
	.word dw_shl		; << ( u<<n )
	.word dw_SYSCFG		; SYSCFG ( u<<n cfg )
	.word dw_AND		; AND ( f )
	.word dw_EXIT

	
 
	;; word:  ide.sel
	;; flags: CODE ROM CFT
	;; notes: HD! ( n -- )
	;;        Selects the specified IDE disk for further accesses. Valid
        ;;        values are 0-3.

	LOADUP(UAOFS_DISKUNIT)
	NEXT

	
 
	;; word:  IDE.INIT
	;; flags: CODE ROM CFT
	;; notes: IDE.INIT ( a -- f2 f1 )
	;;        Initialise the two disks at the specified address.
	;;        Returns flag f1 (non-zero if first disk exists) and f2
	;;        (non-zero if second disk exists).

	//RPOP(TMP1, SP)
	FORTH(dw_ide_rst)
	;; LI 1
	;; PUSH(SP)
	;; PUSH(SP)
	
	NEXT
	
	doLIT(1)
	PUSH(SP)
	NEXT


	
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



	;; word:  ide.rst
	;; flags: CODE ROM CFT
	;; notes: ide.rst ( a -- )
	;;        Reset IDE channel at a.

	POP(SP)
	STORE TMP13
	LI 6
	OR TMP13
	STORE TMP13		; a|6 = device control

	;; Assert SRST
	LI &0c
	OUT I TMP13		; Set device control

	;; Wait 200ms
	LI 200
	PUSH(SP)
	FORTH(dw_MS)

	;; Deassert RST
	LI &08
	OUT I TMP13		; Set device control

	LI 30		        ; Timeout after a bit
	NEG
	STORE TMP12

	;; Wait for BSY to clear. Don't wait forever.
_ide_rst_loop:
	LI &200
	PUSH(SP)
	FORTH(dw_PROGRESS)

	IN I TMP13
	STORE TMP0
	AND @_idecmd_data+1
	SNZ
	JMP _ide_rst_yes

	LOAD TMP0
	XOR MINUS1		; If &FFFF, we're reading bus pull-ups.
	SNZ			; There's nothing there; bail out.
	JMP _ide_rst_no

	LOAD TMP0
	SNZ			; If &0000, we're reading bus pull-downs.
	JMP _ide_rst_no		; Bail out.

	ISZ TMP12
	JMP _ide_rst_loop

_ide_rst_no:
	LI 0
	JMP @_ide_rst_yes+1
	
_ide_rst_yes:
	LI 1
	PUSH(SP)		; Wing it for now.
	PUSH(SP)

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

	.word dw_EXIT

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
