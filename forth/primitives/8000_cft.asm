// -*- asm -*-
//
// CFT-specific code.


	
	;; word:  PANEL>
	;; alias: panel-from
	;; flags: CODE ROM CFT
	;; notes: PANEL> ( -- w )
	;;   Reads the front panel switches and pushes the result.

	IN FPSR
	PUSH (SP)
	NEXT


	
	;; word:  >PANEL
	;; alias: from-panel
	;; flags: CODE ROM CFT
	;; notes: >PANEL ( W -- )
	;;   Write to the front panel output register (OR).

	POP(SP)
	OUT FPOR
	NEXT


	
	;; word:  DIP>
	;; alias: DIP-from
	;; flags: CODE ROM CFT
	;; notes: DIP> ( -- w )
	;;   Write to the front panel output register (OR).

	IN FPDSR
	PUSH (SP)
	NEXT

	

	;; word:  HWTYPE
	;; flags: CODE ROM CFT
	;; notes: HWTYPE ( -- w )
	;;   Push the contents of the hardware type register.

	IN HWTYPE
	PUSH (SP)
	NEXT



	;; word:  IO@
	;; alias: IO_fetch
	;; flags: CODE ROM CFT
	;; notes: IO@ ( a -- w )
	;;   Reads a word from the I/O address at a.

	SPEEK(SP)
	STORE TMP1
	IN I TMP1
	SPOKE0(SP)
	NEXT



	;; word:  IO!
	;; alias: IO_store
	;; flags: CODE ROM CFT
	;; notes: IO! ( w a -- )
	;;   Write w to the I/O address at a.

	POP2(SP)		; w in AC, a in TMP1
	OUT I TMP1
	NEXT



	;; word:  NVC@
	;; alias: NVC_fetch
	;; flags: CODE ROM CFT
	;; notes: NVC@ ( a -- w )
	;;        Read a byte from the NVRAM. The high bits are clear.

	SPEEK(SP)		; get address
	STORE TMP1		; store for later

	;; Get the window offset. This is address >> 4. The NVRAM has
	;; 800 (2,048) addresses in total, so mask the necessary bits
	;; too.

	RNR			; >>4
	AND PLUS127		; AND &7f
	OUT NVRAMWIN		; Set the NVRAM window.

	RAND(TMP1, PLUS15, TMP1) ; TMP1 = TMP1 & 0xf
	LI NVRAMOFS		; TMP1 += NVRAMOFS
	ADD TMP1
	STORE TMP1

	IN I TMP1		; AC = io[TMP1]
	AND BYTELO		; keep the lower 8 bits (all the NVRAM can give)

	SPOKE0(SP)		; Put it on the stack.
	NEXT



	;; word:  NVC!
	;; alias: NVC_store
	;; flags: CODE ROM CFT
	;; notes: NVC@ ( w a -- )
	;;        Read a byte from the NVRAM. The high bits are clear.

	POP2(SP)		; w in AC, a in TMP1
	STORE TMP2

	;; Get the window offset. This is address >> 4. The NVRAM has
	;; 800 (2,048) addresses in total, so mask the necessary bits
	;; too.

	LOAD TMP1		; TMP1
	RNR			; >>4
	AND PLUS127		; AND &7f
	OUT NVRAMWIN		; Set the NVRAM window.

	RAND(TMP1, PLUS15, TMP1) ; TMP1 = TMP1 & 0xf
	LI NVRAMOFS		 ; TMP1 += NVRAMOFS
	ADD TMP1
	STORE TMP1

	LOAD TMP2
	OUT I TMP1

	NEXT



	;; word:  NV@
	;; alias: NV_fetch
	;; flags: DOCOL ROM CFT
	;; notes: NVC@ ( a -- w )
	;;        Read a word from the NVRAM. The address a is converted to a
        ;;        word-aligned address by clearing bit 0. The byte at address
        ;;        a+0 occupies bits 0..7 of w. The byte at address a+1 occupies
        ;;        bits 8..15.
	;; code:  : NV@ ( a -- w ) &fffe AND DUP NVC@ SWAP 1+ NVC@ 256* OR ;

	doLIT(&fffe)		; &fffe ( a &fffe )
	.word dw_AND		; AND ( a&fffe )
	.word dw_DUP		; DUP ( a&fffe a&fffe )
	.word dw_NVC_fetch	; NVC@ ( a&fffe lo )
	.word dw_SWAP		; SWAP ( lo a&fffe )
	.word dw_inc		; 1+ ( lo a&fffe|1)
	.word dw_NVC_fetch	; NVC@ ( lo hi )
	.word dw_256mul		; 256* ( lo hi<<8 )
	.word dw_OR		; OR ( lo|hi<<8 )
	.word dw_EXIT



	;; word:  NV!
	;; alias: NV_store
	;; flags: DOCOL ROM CFT
	;; notes: NV! ( w a -- )
	;;        WRite a word to the NVRAM. The address a is converted to a
        ;;        word-aligned address by clearing bit 0. The byte at address
        ;;        a+0 occupies bits 0..7 of w. The byte at address a+1 occupies
        ;;        bits 8..15.
	;; code:  : NV@ ( a -- w ) &fffe AND DUP NVC@ SWAP 1+ NVC@ 256* OR ;

	;; SWAP >R &fffe AND DUP ( a a ) \ Prepare
	.word dw_SWAP		; SWAP ( a w )
	.word dw_to_R		; >R ( a )
	doLIT(&fffe)		; &fffe ( a &fffe )
	.word dw_AND		; AND ( a&fffe )
	.word dw_DUP		; DUP ( a&fffe a&fffe )

	;; R@ LOBYTE SWAP NVC! ( a ) \ Store low byte
	.word dw_R_fetch	; R@ ( a&fffe a&fffe w )
	.word dw_LOBYTE		; LOBYTE ( a&fffe a&fffe w&ff )
	.word dw_SWAP		; SWAP ( a&fffe w&ff a&fffe )
	.word dw_NVC_store	; NVC! ( a&fffe )

	;; 1+ R> HIBYTE SWAP NVC!
	.word dw_inc		; 1+ ( a&fffe|1 )
	.word dw_R_from		; R> ( a&fffe|1 w )
	.word dw_HIBYTE		; HIBYTE ( a&fffe|1 w>>8 )
	.word dw_SWAP		; SWAP ( w>>8 a&fffe|1 )
	.word dw_NVC_store	; NVC!
	.word dw_EXIT



	;; word:  RTC.INIT
	;; flags: CODE ROM CFT
	;; notes: RTC.INIT ( -- )
	;;        Initialises the real-time clock.

	;; Select the RTC registers in the NVRAM chip.
	LI &7f
	OUT NVRAMWIN

	;; Set up for reading.
	LI &40
	OUT NVRAMOFS 8

	;; Load the seconds.
	IN NVRAMOFS 9
	STORE TMP0

	;; Set up for writing.
	LI &80
	OUT NVRAMOFS 8

	;; Clear the STOP bit and write the STOP/seconds byte back.
	LOAD TMP0
	AND PLUS127
	OUT NVRAMOFS 9

	;; Set up for reading again.
	LI &40
	OUT NVRAMOFS 8

	;; Done.
	NEXT



	;; word:  .DATE
	;; alias: dot_DATE
	;; flags: DOCOL ROM CFT
	;; notes: .DATE ( -- )
	;;        Read and print out the date from the the real-time clock.

	.word dw_BASE
	.word dw_fetch
	.word dw_to_R
	.word dw_HEX
	
	doLIT(&7ff)		; &7ff
	.word dw_NVC_fetch	; NVC@
	doLIT(&2000)		; 2000
	.word dw_add		; +
	.word dw_dot		; .
	doCHAR("-")		; CHAR -
	.word dw_EMIT		; EMIT

	doLIT(&7fe)		; &7fe
	.word dw_NVC_fetch	; NVC@
	doLIT(2)		; 2
	.word dw_dot_0r		; .0R
	doCHAR("-")		; CHAR -
	.word dw_EMIT		; EMIT
	
	doLIT(&7fd)		; &7fd
	.word dw_NVC_fetch	; NVC@
	doLIT(2)		; 2
	.word dw_dot_0r		; .0R

	.word dw_R_from
	.word dw_BASE
	.word dw_store

	.word dw_EXIT



	;; word:  .TIME
	;; alias: dot_TIME
	;; flags: DOCOL ROM CFT
	;; notes: .TIME ( -- )
	;;        Read and print out the time from the the real-time clock.

	.word dw_BASE
	.word dw_fetch
	.word dw_to_R
	.word dw_HEX
	
	doLIT(&7fb)		; &7fb
	.word dw_NVC_fetch	; NVC@
	doLIT(2)		; 2
	.word dw_dot_0r		; .0R
	doCHAR(":")		; CHAR -
	.word dw_EMIT		; EMIT

	doLIT(&7fa)		; &7fa
	.word dw_NVC_fetch	; NVC@
	doLIT(2)		; 2
	.word dw_dot_0r		; .0R
	doCHAR(":")		; CHAR -
	.word dw_EMIT		; EMIT
	
	doLIT(&7f9)		; &7f9
	.word dw_NVC_fetch	; NVC@
	doLIT(&7f)		; &7f
	.word dw_AND		; AND
	doLIT(2)		; 2
	.word dw_dot_0r		; .0R

	.word dw_R_from
	.word dw_BASE
	.word dw_store

	.word dw_EXIT



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

	doLIT(&b7)
	.word dw_IO_store
	.word dw_EXIT

_idecmd_data:
	.word &0040		; DRDY
	.word &0080		; BSY



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
	LOAD TMP1
	PRINTH
	
_ideread_loop:
	IN I TMP1
	STORE I I0
	ISZ TMP0
	JMP _ideread_loop
	NEXT
	
_ideread_count:
	.word -256



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

	doLIT(&8000)
	doLIT(&b0)
	.word dw_ideread
	doLIT(&8000)
	doLIT(&100)
	.word dw_DUMP
	.word dw_DROP



// End of file.
