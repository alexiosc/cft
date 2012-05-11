// -*- asm -*-
//
// Forth-side boot code.



	;; word:  _.?PRESENT
	;; alias: _qPRESENT
	;; flags: DOCOL ROM CFT
	;; notes: _.?PRESENT ( f -- )
	;;        Print "present" if f is non-zero, "not present" otherwise.

	.word dw_if_branch	; if f == 0:
	.word __qPRESENT0

__qPRESENT1:
	doLIT(__qPRESENT_yes)
	.word dw_typep0
	.word dw_EXIT

__qPRESENT0:
	doLIT(__qPRESENT_no)
	.word dw_typep0
	.word dw_EXIT

__qPRESENT_no:
	.strp "not " 		; Note: even length, falls through to str3.
__qPRESENT_yes:
	.strp "present." 10 0


_dev_MBU:
	.strp "MBU" 0
_dev_RTC:
	.strp "RTC" 0
_dev_NVRAM:
	.strp "NVR" 0
_dev_HD0:
	.strp "HD0" 0
_dev_HD1:
	.strp "HD1" 0
_dev_HD2:
	.strp "HD2" 0
_dev_HD3:
	.strp "HD3" 0

	

	;; word:  _.DEV
	;; alias: _DEV
	;; flags: DOCOL ROM CFT
	;; notes: ._DEV ( a -- )
	;;        Prints out a device name during detection.

	.word dw_typep0		; TYPEp0
	doCHAR(":")		; CHAR :
	.word dw_EMIT		; EMIT
	.word dw_SPACE		; SPACE
	.word dw_EXIT

	

	;; word:  _INIT
	;; flags: DOCOL ROM CFT
	;; notes: _INIT ( -- )
	;;        Initialises hardware.


	.word dw_EXIT



	;; word:  COLD
	;; flags: DOCOL ROM CFT
	;; notes: TEST ( -- )
	;;   Test the inner interpreter

	;; Initialise the system configuration bitmap.
	doLIT(0)
	doREG(SYSCFG)		; Strip R bit from SYSCFG variable
	.word dw_store


	;; Initialise hardware
	.word dw_TTY_INIT

	;; Set up MBU
	doLIT(_dev_MBU)		; _dev_RTC ( a )
	.word dw__DEV		; _DEV ( )
	.word dw_MBU_INIT	; MBU.INIT
	.word dw__qPRESENT	; _?PRESENT

	;; Set up memory
	.word dw_MEM_INIT
	doLIT(1)
	.word dw__qPRESENT

	;; Set up RTC
	doLIT(_dev_RTC)		; _dev_RTC ( a )
	.word dw__DEV		; _DEV ( )
	.word dw_RTC_INIT	; RTC.INIT ( f )
	.word dw_DUP		; DUP ( f f )
	.word dw_if_branch	; if f == 0:
	.word _cold_nortc	;   skip
	.word dw_dot_DATE
	.word dw_TYPE
	.word dw_SPACE
	.word dw_dot_TIME
	.word dw_TYPE
	.word dw_SPACE
_cold_nortc:
	.word dw_DUP
	.word dw__qPRESENT
	doLIT(_dev_NVRAM)	; _dev_NVRAM ( a )
	.word dw__DEV		; _DEV ( )
	.word dw__qPRESENT


	;; Set up IDE
	doLIT(0)
	doREG(IDE0)
	.word dw_IDE_INIT
	doLIT(1)
	doREG(IDE1)
	.word dw_IDE_INIT
	
	doLIT(_dev_HD0)
	.word dw__DEV		; _DEV ( )
	doLIT(0)
	.word dw_HD_INIT
	.word dw__qPRESENT

	doLIT(_dev_HD1)
	.word dw__DEV		; _DEV ( )
	doLIT(1)
	.word dw_HD_INIT
	.word dw__qPRESENT

	doLIT(_dev_HD2)
	.word dw__DEV		; _DEV ( )
	doLIT(2)
	.word dw_HD_INIT
	.word dw__qPRESENT

	doLIT(_dev_HD3)
	.word dw__DEV		; _DEV ( )
	doLIT(3)
	.word dw_HD_INIT
	.word dw__qPRESENT

	;; Initialise vocabularies

	;; ONLY >RAM FORTH >RAM DEFINITIONS \ Set vocabularies
	.word dw_ONLY
	.word dw_to_RAM
	.word dw_ROM_FORTH
	.word dw_to_RAM
	.word dw_DEFINITIONS


	;; Print the Forth banner and enter Forth.

	.word dw_dot_banner	; .banner ( ) \ Print out the banner
	.word dw_QUIT		; QUIT ( ) \ Enter the interpreter
	.word dw_FAIL		; We should never get here.

	
	
	;; word:  .banner
	;; alias: dot_banner
	;; flags: DOCOL ROM CFT
	;; notes: $banner ( -- )
	;;   Prints out boot banner.
	.word dw_doLIT
	.word _banner_text1
	.word dw_typep0
	.word dw_countwords
	.word dw_DECIMAL
	.word dw_dot
	.word dw_doLIT
	.word _banner_text2
	.word dw_typep0
	.word dw_EXIT
_banner_text1:
	.strp 10 10 27 "[0;33m" 27 "#3 CFT " 10 27 "#4 CFT " 10 10 27 "[0m16-bit Mini-Computer" 10 "CFT Booted. " 10 "Forth words known:" 0
_banner_text2:
	.strp " (type WORDS for a list)" 10 0

	
	;; word:  BYE
	;; flags: DOCOL ROM
	;; copy:  HALT
	;; notes: BYE ( -- )
	;;   Leaves Forth (just runs HALT, which halts the computer)
	.word dw_HALT
	.word dw_EXIT


	
	;; word:  HALT
	;; flags: CODE ROM
	;; notes: HALT ( -- )
	;;   Halts the machine. The computer may be resumed
	;;   from the front panel, in which case execution will continue.
	HALT
	NEXT
	
	
// End of file.
