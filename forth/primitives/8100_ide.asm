// -*- asm -*-
//
// IDE interfacing.
//
// This is one of the most complex drivers, so a number of
// macros and 'local' definitions are kept here.


;; Where data is buffered initially.
;; TODO: fix this
	
.equ    IDE_EARLYBUF   &1f00

;; IDE register offsets (based on IDE0 or IDE1)

.equ    IDE_OFS_DCR    &06    ; Address offset of the Control Register
.equ    IDE_OFS_ASR    &06    ; The Alternate Status Register
.equ    IDE_OFS_DATA   &10    ; The data register
.equ    IDE_OFS_ERROR  &11
.equ    IDE_OFS_SCOUNT &12
.equ    IDE_OFS_LBA0   &13
.equ    IDE_OFS_LBA1   &14
.equ    IDE_OFS_LBA2   &15
.equ    IDE_OFS_LBA3   &16
.equ    IDE_OFS_DHR    &16
.equ    IDE_OFS_CMD    &17	; The command register

;; IDE commands

.equ    IDE_RECAL     &10	; Recalibrate
.equ    IDE_IDENTIFY  &ec	; Identify

;; Values for the Drive/Head register.

.equ IDE_DHR  #111'-'----	; Base value (also enables LBA)
.equ IDE_DRV0 #---'0'----
.equ IDE_DRV1 #---'1'----

;; IDE macrocommands

.equ 	HDDCR		OUT I IDEDCR
.equ    HDCMD 		OUT I IDECMD

;; Assembler macros


	
// Macro: IDE_DCR(val)
//
// Sets the IDE DCR register.
//
// Side effects:
//   A.	

.macro IDE_DCR(val)
	LI %val			; IDE_DCR(%val)
	HDDCR
.end


	
// Macro: IDE_DATACMD(cmd, buf, n)
//
// Sends a command to the currently selected IDE disk, and transfers
// n 16-bit words to the buffer starting at address buf.
//
// Side effects:
//   A.	

.macro IDE_DATACMD(cmd, buf, n)
	LI %cmd			; IDE_DCR(%cmd)
	JSR _ide_datacmd
	.word %n		; This will be skipped by the subroutine.
	.word %buf		; So will this.
.end


	
// Macro: IDE_SELDRVL(n)
//
// Select the specified IDE drive. The parameter must be a 0 or 1 literal.
// No checking is carried out.
//
// Side effects:
//   A.	

.macro IDE_SELDRVL(n)
	LI IDE_DHR IDE_DRV%n	; SLDRV(%n)
	OUT I IDEDHR		; Set drive/head reg
.end



///////////////////////////////////////////////////////////////////////////////
//
// CODE
//
///////////////////////////////////////////////////////////////////////////////


	;; Set up the IDE registers
	;; 
	;; Inputs:
	;;   TMP1 = IDE controller base port.
	;; 
	;; Output:
	;;   The IDEx register registers are all updated with the I/O
	;;   addresses of the IDE registers. AC and L are also modified.
	;;
	;; Side effects:
	;;   I0 is clobbered.
	;;   I1 is clobbered.
	;;   TMP0 is clobbered.
	;;   TMP1 is clobbered.

_ide_setup:
	LOAD TMP1
	XOR IDEDCR		; Compare against DCR
	AND PLUSFFF0		; Drop the lease significant 16 bits
	SNZ			; Same?
	RET			; Yes: already selected. Bail out.
	
	LI &3ff			; Invalidate the current unit register.
	STORE IDECURU		; ... This forces _ide_selunit to act.

	LIA IDEDCR		; Start of the IDE register block
	STORE I0
	LIA _ide_setup_data
	STORE I1
	RMOV(I2, I I1)

_ide_setup_loop:
	RADD(I I0, TMP1, I I1)	; mem[I0++] = TMP0 + mem[I1++]
	LOAD I0
	ISZ I2
	JMP _ide_setup_loop
	RET

_ide_setup_data:
	.word @_ide_setup_data1-_ide_setup_data_end
_ide_setup_data1:
	.word IDE_OFS_DCR
	.word IDE_OFS_DATA
	.word IDE_OFS_ERROR
	.word IDE_OFS_SCOUNT
	.word IDE_OFS_LBA0
	.word IDE_OFS_LBA1
	.word IDE_OFS_LBA2
	.word IDE_OFS_DHR
	.word IDE_OFS_CMD
_ide_setup_data_end:

	

	;; Select IDE unit 0/1
	;; 
	;; Inputs:
	;;   TMP2 = unit to select. Must be 0 or 1.
	;; 
	;; Output:
	;;   None.
	;;
	;; Side effects:
	;;   Disk n is selected on the current IDE channel.
	;;   TMP3 is clobbered.

_ide_selunit:
	LOAD IDECURU		; Check the currently selected unit.
	XOR TMP2		; Same as the one requested?
	SNZ
	RET			; Yes. Bail out

	RMOV(IDECURU, TMP2)	; Store the current unit.
	LIA _ide_selunit_data
	ADD TMP2
	STORE TMP3
	LOAD I TMP3		; Load the value itself.
	OUT I IDEDHR
	STORE IDEDHRB
	RET
	
_ide_selunit_data:
	.word IDE_DHR IDE_DRV0
	.word IDE_DHR IDE_DRV1



	;; Send a command to an IDE disk and read back data.
	;; 
	;; Inputs:
	;;   AC = command.
	;;   [RETV]: number of words to read.
	;;   [RETV+1]: where to store them.
	;; 
	;; Output:
	;;
	;; Side effects:

_ide_datacmd:
	;; First things first! Send the command to the drive while we set up.
	HDCMD

	;; Now set up.
	LOAD I RETV		; How many words to read
	NEG
	STORE TMP0		; TMP0 = loop counter
	ISZ RETV

	LOAD I RETV
	STORE I0		; Autoindex buffer pointer
	ISZ RETV		; Adjust RETV so we skip the data words on exit.
	STORE TMP1		; Keep the value for later.

	;; Wait for the drive to clear BUSY, and assert DRQ.
	;; TODO: this currently doesn't time out. This will eventually be needed.
_ide_datacmd_ready_loop:
	IN I IDESR		; Check drive status.
	AND _ide_datacmd_mask	; Check BSY and DRDY bits
	XOR _ide_datacmd_val	; Ensure only DRDY is set
	SZA
	JMP _ide_datacmd_ready_loop

	;; The drive is ready for us. Start copying.
_ide_datacmd_read_loop:
	IN I IDEDATA
	STORE I I0
	ISZ TMP0
	JMP _ide_datacmd_read_loop

	;; Done.
	JMP I TMP1		; Return to RETV+2

_ide_datacmd_mask:
	.word #1000'1000	; BSY|DRQ
_ide_datacmd_val:
	.word #0000'1000	; DRQ

	
 
	;; word:  _HDSEL
	;; flags: CODE ROM CFT
	;; notes: _HDSEL ( a n -- f )
	;;        Select disk n (0 or 1) on bus with base address a.

	RPOP(TMP2, SP)		; Unit number n
	RPOP(TMP1, SP)		; Base address a

	JSR _ide_setup		; Set the address and registers
	JSR _ide_selunit	; Select the drive unit.

	NEXT



	;; word:  _HDRST
	;; flags: CODE ROM CFT
	;; notes: _HDRST ( -- f )
	;;        Reset the currently selected IDE channel and detect if a
        ;;        controller is present. Returns a non-zero flag if this is the
        ;;        case.

	;; Only reset if the first disk unit is selected.
	LOAD IDECURU
	SZA
	JMP _ide_rst_loop_fast	; Check to see if the unit is present.
	
	;; Assert SRST
	LI &0c
	HDDCR

	;; Wait 200ms (longer than the longest minimum reset pulse)
	LI 200
	PUSH(SP)
	FORTH(dw_MS)		; note: clobbers TMP0, TMP15, TMP14

	;; Deassert RST
	LI &08
	HDDCR

	LI 30		        ; Timeout after a bit
	NEG
	STORE I0

	;; Wait for BSY to clear and DRDY to set. Don't wait forever.
	;; Also ensure a controller is present.
	JMP _ide_rst_loop_fast	; Don't wait on the first iteration
	
_ide_rst_loop:
	LI &200
	PUSH(SP)
	FORTH(dw_PROGRESS)	; note: clobbers TMP0, TMP15, TMP14

_ide_rst_loop_fast:
	IN I IDEASR		; Read the alt status register
	STORE TMP0

	;; Make sure there IS a controller present.
	XOR MINUS1		; If &FFFF, we're reading bus pull-ups.
	SNZ			; There's nothing there; bail out.
	JMP _ide_rst_no

	LOAD TMP0
	SNZ			; If &0000, we're reading bus pull-downs.
	JMP _ide_rst_no		; Bail out.

	;; Right. A controller is probably there. Check the status bits.
	LOAD TMP0
	AND _ide_BSY		; BSY set?
	SZA
	JMP _ide_rst_not_yet	; Yes. Go again.

	LOAD TMP0
	AND _ide_DRDY		; DRDY set?
	SZA
	JMP _ide_rst_yes	; Yes. We've got it.

_ide_rst_not_yet:	
	ISZ I0
	JMP _ide_rst_loop

_ide_rst_no:
	LI 0
	JMP @_ide_rst_yes+1
	
_ide_rst_yes:
	LI 1
	PUSH(SP)
	NEXT



	;; TODO: Fix this
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
_ide_DRDY:
	.word &0040		; DRDY
_ide_BSY:
	.word &0080		; BSY
_ide_DRQ:
	.word &0008		; DRQ



	;; TODO: Fix this
	;; word:  idewait
	;; flags: CODE ROM CFT
	;; notes: idewait ( -- )
	;;        Issue an IDE command

_idewait_loop:
	IN R &a6
	AND _ide_DRDY
	SNZ
	JMP _idewait_loop
	NEXT



_ide_rst_buf:
	.word IDE_EARLYBUF
_ide_rst_kw:
	.strp " kW, " 0

	;; word:  _HDIDENT
	;; flags: CODE ROM CFT
	;; notes: _HDIDENT ( )
	;;        Send IDENTIFY command to current drive, see what it has to
	;;        say for itself. Copy some information about them to the
	;;        relevant registers.

	LIA HD0SZLO
	STORE I0

	;; Drive 0 first.
	IDE_SELDRVL(0)

	;; Send an identify command and transfer the first 60 words to
	;; IDE_EARLYBUF
	IDE_DATACMD(IDE_IDENTIFY, IDE_EARLYBUF, 63)

	;; Copy the disk capacity
	LI 57			; Word 57 (capacity low)
	ADD _ide_rst_buf
	STORE I0
	RMOV(HD0SZLO, I I0)
	STORE TMP15
	RMOV(HD0SZHI, I I0)	; Word 58 (capacity high)
	STORE TMP14

	;; Output the size in kW (sectors / 4)
	LOAD TMP14
	SBR
	STORE TMP14
	LOAD TMP15
	RBR
	STORE TMP15
	LOAD TMP14
	SBR
	STORE TMP14
	LOAD TMP15
	RBR
	PUSH(SP)
	RPUSH(SP, TMP14)
	FORTH(dw__Dstr)
	FORTH(dw_TYPE)
	LIA _ide_rst_kw
	PUSH(SP)
	FORTH(dw_typep0)

	;; Output the model name
	LI 27
	ADD _ide_rst_buf
	PUSH(SP)
	LI 40
	PUSH(SP)
	FORTH(dw_dash_TRAILING)
	FORTH(dw_TYPEp)
	FORTH(dw_SPACE)
	
	LI 1
_ide_rst_ret:
	PUSH(SP)		; Wing it for now.
	PUSH(SP)

	NEXT



	;; word:  IDE.INIT
	;; flags: DOCOL ROM CFT
	;; notes: IDE.INIT ( n addr unit -- f )
	;;        Initialise disk device HDn to be the disk on bus with base
	;;        address a and the specified unit number.  Returns flag f if a
	;;        drive was found. Sets configuration flags and makes disk
	;;        available for access.

	.word dw__HDSEL		; _HDSEL ( n ) \ Select drive <a,n>.
	.word dw__HDRST		; _HDRST ( n f ) \ Reset & detect.
	.word dw_DUP		; DUP ( n f f )
	.word dw_if_branch	;   \ Skip the rest if no disk
	.word _ide_init_no
	.word dw__HDIDENT	; _HDIDENT ( n f ) \ Identify disk.

_ide_init_done:
	.word dw_SWAP		; SWAP ( f n )
	.word dw_DROP		; DROP ( f )
	.word dw_EXIT

_ide_init_no:			;  ( n f )
	.word dw_SWAP		; SWAP ( f n )
	.word dw_DROP		; DROP ( f )
	.word dw_EXIT







//////////////////////////////////////////////////////////

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









	
	



	;; /ord:  ideread
	;; /lags: CODE ROM CFT
	;; /otes: idecmd ( a1 a2 -- )
	;;        Read an IDE sector from port a2, store at addresses a1 to a1+255.

;; 	POP2(SP)		; a1 in AC, a2 in TMP1
;; 	STORE I0
;; 	RMOV(TMP0, _ideread_count)
	
;; _ideread_loop:
;; 	IN I TMP1
;; 	STORE I I0
;; 	ISZ TMP0
;; 	JMP _ideread_loop
;; 	NEXT
	
;; _ideread_count:
;; 	.word -256



	;; /ord:  ideseek
	;; /lags: CODE ROM CFT
	;; /otes: ideseek ( d -- )
	;;        Read an IDE sector from port a2, store at addresses a1 to a1+255.

;; 	POP(SP)			; Pop high LBA (bits 16-31)
;; 	STORE TMP1

;; 	RNR			; >>4
;; 	RNR			; >>4
;; 	AND PLUS15		; AND 15
;; 	OR @_ideseek_data+0	; LBA, drive 0
;; 	OUT R &b6
	
;; 	LOAD TMP1		; Load bits 16-31
;; 	AND BYTELO		; Get bits 16-23
;; 	OUT R &B5		; Output to LBA 16-23 reg

;; 	POP(SP)			; Pop low LBA (bits 0-15)
;; 	STORE TMP1

;; 	RNR			; >>4
;; 	RNR			; >>4
;; 	AND BYTELO		; Get low 8 bits
;; 	OUT R &b4		; Out to LBA 8-15 reg

;; 	LOAD TMP1		; Load bits 16-31
;; 	AND BYTELO		; Get bits 16-23
;; 	OUT R &B3		; Output to LBA 0-8 reg

;; 	NEXT

;; _ideseek_data:
;; 	.word #1110'0000	; LBA, drive 0.
;; 	.word #1111'0000	; LBA, drive 1.



	;; /ord:  idewrite
	;; /lags: CODE ROM CFT
	;; /otes: idewrite ( a1 a2 -- )
	;;        Write an IDE sector from addresses a1 to a1+255 to port a2.

;; 	POP2r(SP)		; a1 in AC, a2 in TMP1
;; 	STORE I0
;; 	RMOV(TMP0, _ideread_count)
	
;; _idewrite_loop:
;; 	LOAD I I0
;; 	OUT I TMP1
;; 	ISZ TMP0
;; 	JMP _idewrite_loop
;; 	NEXT



	;; /ord:  idesr
	;; /lags: DOCOL ROM CFT
	;; /otes: idesr ( -- x )
	;;        IDE Status register

	;; doLIT(&b7)
	;; .word dw_IO_fetch
	;; .word dw_EXIT



	;; /ord:  ideerr
	;; /lags: DOCOL ROM CFT
	;; /otes: ideerr ( -- x )
	;;        IDE Error register

	;; doLIT(&b1)
	;; .word dw_IO_fetch
	;; .word dw_EXIT



	;; /ord:  idetest
	;; /lags: DOCOL ROM CFT
	;; /otes: ideerr ( -- x )
	;;        IDE Error register

	;; doLIT(&ec)
	;; .word dw_idecmd
	
	;; doLIT(&e4)
	;; .word dw_idecmd

	;; doLIT(&8000)
	;; doLIT(&b0)
	;; .word dw_ideread
	;; doLIT(&8000)
	;; doLIT(&80)
	;; .word dw_DUMP
	;; .word dw_DROP

	;; .word dw_EXIT

	;; doLIT(1)
	;; doLIT(&b2)
	;; .word dw_IO_store

	;; doLIT(&20)
	;; .word dw_idecmd
	
	;; doLIT(&e4)
	;; .word dw_idecmd

	;; doLIT(&8000)
	;; doLIT(&b0)
	;; .word dw_ideread
	;; doLIT(&8000)
	;; doLIT(&100)
	;; .word dw_DUMP
	;; .word dw_DROP



	;; doLIT(1)
	;; doLIT(0)
	;; .word dw_ideseek
	
	;; doLIT(1)
	;; doLIT(&b2)
	;; .word dw_IO_store

	;; doLIT(&20)
	;; .word dw_idecmd
	
	;; doLIT(&e4)
	;; .word dw_idecmd

	;; doLIT(&8000)
	;; doLIT(&b0)
	;; .word dw_ideread
	;; doLIT(&8000)
	;; doLIT(&100)
	;; .word dw_DUMP
	;; .word dw_DROP

	
	;; .word dw_EXIT



// End of file.
