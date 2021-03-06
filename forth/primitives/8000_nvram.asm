// -*- asm -*-
//
// CFT-specific code.


	
	;; word:  NVRAM?
	;; alias: NVRAMq
	;; flags: CODE ROM CFT
	;; notes: NVRAM? ( -- f )
	;;        Returns non-zero if the 2 KByte timekeeper/NVRAM chip is present.

	LI CFG_NVR
	AND SYSCFG
	PUSH(SP)
	NEXT


	
	;; word:  RTC?
	;; alias: RTCq
	;; flags: CODE ROM CFT
	;; notes: RTC? ( -- f )
	;;        Returns non-zero if the 2 KByte timekeeper/NVRAM chip is present.

	LI CFG_RTC
	AND SYSCFG
	PUSH(SP)
	NEXT


	
	;; word:  NVC@
	;; alias: NVC_fetch
	;; flags: CODE ROM CFT
	;; notes: NVC@ ( a -- w )
	;;        Read a byte from the NVRAM. The high bits are clear.

	POP SP			; get address
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

	PUSH SP			; Put it on the stack.
	NEXT



	;; word:  NVC!
	;; alias: NVC_store
	;; flags: CODE ROM CFT
	;; notes: NVC@ ( w a -- )
	;;        Read a byte from the NVRAM. The high bits are clear.

	RPOP(TMP0, SP)		; TMP0 = a
	RPOP(TMP1, SP)		; TMP1 = w

	;; Get the window offset. This is address >> 4. The NVRAM has
	;; 800 (2,048) addresses in total, so mask the necessary bits
	;; too.

	LOAD TMP0		; TMP0
	RNR			; >>4
	AND PLUS127		; AND &7f
	OUT NVRAMWIN		; Set the NVRAM window.

	RAND(TMP0, PLUS15, TMP0) ; TMP0 = TMP0 & 0xf
	LI NVRAMOFS		 ; TMP0 += NVRAMOFS
	ADD TMP0
	STORE TMP0

	LOAD TMP1
	OUT I TMP0

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

	;; Is the chip present?
	LI &00			; Set window #0
	OUT NVRAMWIN
	IN NVRAMOFS 0		; Load a byte from location &000
	AND BYTELO
	STORE TMP0		; Store value for later

	LI &01			; Set window #1
	OUT NVRAMWIN
	IN NVRAMOFS 0		; Load a byte from location &008
	AND BYTELO
	STORE TMP1		; Store value for later

	XOR TMP0		; Is TMP1==TMP0?
	SZA
	JMP _rtc_init1

	LOAD TMP1		; Equal. Change #008.
	XOR MINUS1
	OUT NVRAMOFS 0		; Store it back
	
_rtc_init1:
	;; At this point, if the RTC/NVRAM chip is present, locations
	;; &000 and &008 will differ.
	IN NVRAMOFS 0
	STORE TMP2
	LI &00
	OUT NVRAMWIN
	IN NVRAMOFS 0
	XOR TMP2
	SNZ
	JMP _rtc_init_nope	; They're equal.

	LI &08
	OUT NVRAMWIN
	LOAD TMP1		; Restore location &008
	OUT NVRAMOFS 0

_rtc_init_init:
	;; Now initialise.
	
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
	LI CFG_RTC CFG_NVR   ; Update the system configuration bitmap.
	OR SYSCFG
	STORE SYSCFG
	LI 1

_rtc_init_end:
	PUSH(SP)
	NEXT

_rtc_init_nope:
	LI 0
	JMP _rtc_init_end
	

	

	;; word:  DATE.EPY
	;; flags: CONST ROM CFT
	;; notes: DATE.EPY ( -- 2000 )
	;;        Returns the CFT Epoch year (2000).

	.word 2000



	;; word:  DATE
	;; flags: DOCOL ROM CFT
	;; notes: DATE ( -- y m d dow )
	;;        Read the date from the RTC and push the year (with century),
        ;;        month (1-12), day of the month (1-31) and day of the week
        ;;        (1-7).

	doLIT(&7ff)		; &7ff ( &7ff )
	.word dw_NVC_fetch	; NVC@ ( ybcd )
	.word dw_BCD8_from	; BCD8> ( y ybcd )
	.word dw_DROP		; DROP ( y )
	.word dw_DATE_EPY	; DATE_EPY ( y )
	.word dw_add		; + ( y )

	doLIT(&7fe)		; &7fe ( y &7fe )
	.word dw_NVC_fetch	; NVC@ ( y mbcd )
	.word dw_BCD8_from	; BCD8> ( y m mbcd )
	.word dw_DROP		; DROP ( y m )

	doLIT(&7fd)		; &7fd ( y m &7fd )
	.word dw_NVC_fetch	; NVC@ ( y m dbcd )
	.word dw_BCD8_from	; BCD8> ( y m d dbcd )
	.word dw_DROP		; DROP ( y m d )

	doLIT(&7fc)		; &7fc ( y m d &7fc )
	.word dw_NVC_fetch	; NVC@ ( y m d dbcd )
	doLIT(7)		; 7
	.word dw_AND		; AND ( y m d dow )

	.word dw_EXIT



	;; word:  TIME
	;; flags: DOCOL ROM CFT
	;; notes: TIME ( -- h m s )
	;;        Read the time from the RTC and push the h, m and s fields.

	doLIT(&7fb)		; &7fb ( &7fb )
	.word dw_NVC_fetch	; NVC@ ( hbcd )
	.word dw_BCD8_from	; BCD8> ( h hbcd )
	.word dw_DROP		; DROP ( h )

	doLIT(&7fa)		; &7fa ( h &7fa )
	.word dw_NVC_fetch	; NVC@ ( h mbcd )
	.word dw_BCD8_from	; BCD8> ( h m mbcd )
	.word dw_DROP		; DROP ( h m )

	doLIT(&7f9)		; &7f9 ( y m &7f9 )
	.word dw_NVC_fetch	; NVC@ ( y m sbcd )
	.word dw_BCD8_from	; BCD8> ( y m d sbcd )
	.word dw_DROP		; DROP ( y m s )

	.word dw_EXIT

	

	;; word:  .DATE
	;; alias: dot_DATE
	;; flags: DOCOL ROM CFT
	;; notes: .DATE ( -- )
	;;        Read and print out the date from the the real-time clock.

	.word dw_DATE		; DATE ( y m d dow )
	.word dw_DROP		; DROP ( y m d )

	.word dw_bkt_number	; <# ( y m d 0 )
	doLIT(0)
	doLIT(2)
	.word dw_0_number_s	; 0#S ( y m 0 0 )

	.word dw_2DROP		; 2DROP ( y m )
	doCHAR("-")		; CHAR - ( y m '-' )
	.word dw_HOLD		; HOLD ( y m )

	doLIT(0)
	doLIT(2)
	.word dw_0_number_s	; 0#S ( y 0 0 )
	.word dw_2DROP		; 2DROP ( y )
	doCHAR("-")		; CHAR - ( y '-' )
	.word dw_HOLD		; HOLD ( y )

	doLIT(0)
	doLIT(4)
	.word dw_0_number_s	; 0#S ( 0 0 )
	.word dw_number_bkt	; #> ( b u )
	.word dw_EXIT



	;; word:  .TIME
	;; alias: dot_TIME
	;; flags: DOCOL ROM CFT
	;; notes: .TIME ( -- )
	;;        Read and print out the time from the the real-time clock.

	.word dw_TIME		; DATE ( h m s )

	.word dw_bkt_number	; <# ( h m s )
	doLIT(0)
	doLIT(2)
	.word dw_0_number_s	; 0#S ( h m 0 )

	.word dw_2DROP		; 2DROP ( h m )
	doCHAR(":")		; CHAR - ( h m '-' )
	.word dw_HOLD		; HOLD ( h m )

	doLIT(0)
	doLIT(2)
	.word dw_0_number_s	; 0#S ( h 0 )
	.word dw_2DROP		; 2DROP ( h )
	doCHAR(":")		; CHAR - ( h '-' )
	.word dw_HOLD		; HOLD ( h )

	doLIT(0)
	doLIT(2)
	.word dw_0_number_s	; 0#S ( 0 )
	.word dw_number_bkt	; #> ( b u )
	.word dw_EXIT



// End of file.
