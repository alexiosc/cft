// -*- asm -*-
//
// IDE interfacing.
//
// This is one of the most complex drivers, so a number of
// macros and 'local' definitions are kept here.


.page
	

;; Where data is buffered initially.
;; TODO: fix this
	
.equ    IDE_EARLYBUF   &1f00

;; NB: These are NOT meant to be changed.
.equ    BKSIZE         1024	; block size in machine words (cells)
.equ    BKSIZE_SECTORS 4	; block size in sectors (256 cells)

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

.equ    IDE_RECAL      &10	; Recalibrate
.equ 	IDE_READR      &20	; Read with retry
.equ 	IDE_READMULT   &c4	; Read multiple
.equ 	IDE_WRITER     &30	; Write with retry
.equ 	IDE_WRITEMULT  &c5	; Write multiple
.equ    IDE_SETMULT    &c6	; Set multiple mod
.equ    IDE_IDENTIFY   &ec	; Identify

;; Values for the Drive/Head register.

.equ IDE_DHR  #111'-'----	; Base value (also enables LBA)
.equ IDE_DRV0 #---'0'----
.equ IDE_DRV1 #---'1'----

;; IDE macrocommands

.equ 	HDDCR		OUT I IDEDCR
.equ    HDCMD 		OUT I IDECMD
.equ    HDSCR		OUT I IDESCR

.equ    HDINASR 	IN I IDEASR

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
	HDINASR			; Read the alt status register
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



	;; TODO: Fix this: detect errors
	;; word:  IDE.BSY...
	;; alias: IDE_BSY_wait
	;; flags: CODE ROM CFT
	;; notes: IDE.BSY... ( -- )
	;;        Wait for the disk to stop being busy.

_ide_bsy_loop:
	HDINASR
	AND _ide_BSY
	SZA
	JMP _ide_bsy_loop
	NEXT



	;; TODO: Fix this: detect errors
	;; word:  ...IDE.DRQ
	;; alias: IDE_DRQ_wait
	;; flags: CODE ROM CFT
	;; notes: IDE.DRQ... ( -- )
	;;        Wait until the disk has (or can accept) data.

_ide_drq_loop:
	HDINASR
	AND _ide_DRQ
	SNZ
	JMP _ide_drq_loop
	NEXT



	;; word:  idescr
	;; flags: CODE ROM CFT
	;; notes: idescr ( +n -- )
	;;        Set number of sectors for next command

	POP(SP)
	HDSCR
	NEXT



	;; TODO: Fix this: detect errors
	;; word:  idecmd
	;; flags: CODE ROM CFT
	;; notes: idecmd ( x -- )
	;;        Issue an IDE command

	FORTH(dw_IDE_BSY_wait)
	POP(SP)
	OUT I IDECMD
	NEXT

_idecmd_data:
_ide_DRDY:
	.word &0040		; DRDY
_ide_BSY:
	.word &0080		; BSY
_ide_DRQ:
	.word &0008		; DRQ



	;; TODO: Fix this: timeout and issue error.
	;; word:  idewait
	;; flags: CODE ROM CFT
	;; notes: idewait ( -- )
	;;        Issue an IDE command

_idewait_loop:
	IN R &a6
	AND _ide_BSY
	SNZ
	JMP _idewait_loop
	NEXT

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

	;; Wait for the disk to be ready.
	FORTH(dw_IDE_BSY_wait)	; IDE.BSY...

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
	PUSH(SP)
	SBR
	STORE TMP14
	LOAD TMP15
	PUSH(SP)
	RBR
	STORE TMP15
	LOAD TMP14
	SBR
	STORE TMP14
	LOAD TMP15
	RBR
	STORE TMP15
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
	FORTH(dw_dash_cTRAILING)
	FORTH(dw_TYPEp)
	FORTH(dw_SPACE)

	NEXT

_ide_rst_buf:
	.word IDE_EARLYBUF
	
	;; word:  _HDSMLT
	;; flags: DOCOL ROM CFT
	;; notes: _HDSMLT ( n )
	;;        Set multiple mode to the given number of sectors.

	.word dw_idescr	        ; idescr ( ) \ Set the Sector Count Register
	doLIT(IDE_SETMULT)
	.word dw_idecmd		; idecmd ( ) \ Set multiple mode
	.word dw_EXIT
	


	;; word:  HD.INIT
	;; flags: DOCOL ROM CFT
	;; notes: HD.INIT ( n -- f )
	;;        Initialise disk device HDn to be the disk on bus with base
	;;        address a and the specified unit number.  Returns flag f if a
	;;        drive was found. Sets configuration flags and makes disk
	;;        available for access.

 	.word dw_DUP		; DUP ( n n )
	.word dw_to_R		; >R ( n )
	.word dw__HD_set	; _HD! ( ) \ Select drive <a,n>.
	.word dw__HDRST		; _HDRST ( f ) \ Reset & detect.

	.word dw_if_branch	;   \ Skip the rest if no disk
	.word _ide_init_no
	.word dw__HDIDENT	; _HDIDENT ( sizelo sizehi ) \ Identify disk.
	.word dw_SWAP 		; SWAP ( sizehi sizelo )
	doLIT(4)		; 4 sectors = one kiloword
	.word dw__HDSMLT	; _HDSMLT ( sizehi sizelo ) \ Set multiple mode.
	doLIT(1)		;  ( sizehi sizelo 1 )
	.word dw_not_ROT	; -ROT ( 1 sizehi sizelo )

_ide_init_done:
	.word dw_R_from		; R> ( f sizehi sizelo n )
	.word dw__IDE_addr	; IDE@ ( f sizehi sizelo addr )

	.word dw_DUP		; DUP ( f sizehi sizelo addr addr )
	.word dw_to_R		; >R ( f sizehi sizelo addr )
	.word dw_store		; ! ( f sizehi )
	.word dw_R_from		; R> ( f sizehi addr )
	.word dw_inc		; 1+ ( f sizehi addr+1 )
	.word dw_store		; ! ( f )
	.word dw_EXIT

_ide_init_no:
	doLIT(0)		; 0 ( 0 )
	.word dw_2DUP		; 0 ( 0 0 0 )
	.word dw_branch
	.word _ide_init_done



	;; word:  _IDE@
	;; alias: _IDE_addr
	;; flags: DOCOL ROM CFT
	;; notes: _IDE@ ( n -- addr )
	;;        Returns the address of the dist structure for disk unit n.
	;; code:  : _HDaddr ( n -- addr ) 2* HD0SZLO + ;

	.word dw_2mul		; 2* ( 2n )
	doREG(HD0SZLO)		; base address ( 2n addr )
	.word dw_add		; + ( addr )
	.word dw_EXIT



	;; word:  _IDE!
	;; alias: _HD_set
	;; flags: DOCOL ROM CFT
	;; notes: _HD! ( n -- )
	;;        Select the specified disk unit.

	doLIT(3)		; 3
	.word dw_AND		; AND ( n )
	
	;; Bit 1 is the IDE bus.
	.word dw_DUP		; DUP ( n n )
	doLIT(2)		; 2 ( n n 2 )
	.word dw_AND		; AND ( n f )
	.word dw_2div		; 2/ ( n f )
	doREG(SYSIDE0)		; SYSIDE0 ( n f addr )
	.word dw_add		; + ( n addr )
	.word dw_fetch		; @ ( n ioaddr )
	.word dw_SWAP		; SWAP ( ioaddr n )
	;; Bit 0 is the unit number.
	doLIT(1)		; 1 ( ioaddr n 1 )
	.word dw_AND		; AND ( ioaddr unit )
	.word dw__HDSEL		; _HDSEL
	.word dw_EXIT



	;; word:  HDSET
	;; alias: HDSET
	;; flags: DOCOL ROM CFT
	;; notes: HDSET ( n -- )
	;;        Select the specified disk unit. Throw an error if not present.
	;; code:  : HDSET ( n -- ) DUP HD? OR 0= ABORT" HD not present" _HD! ;

	.word dw_DUP
	.word dw_HDq
	.word dw_OR
	.word dw_zero_equals
	.word dw_doABORT_str
	.word @+9
	.strp "HD not present" 0
	;;     223344556677889.
	.word dw__HD_set
	.word dw_EXIT
	


	;; word:  HD?
	;; alias: HDq
	;; flags: DOCOL ROM CFT
	;; notes: HD? ( n -- d )
	;;        Returns a non-zero double integer if IDE disk IDE n
        ;;        is present. The value represents the number of
        ;;        sectors on the disk.
	;; code:  : HD? ( n -- d ) HD 2fetch ;

	.word dw__IDE_addr
	.word dw_two_fetch
	.word dw_EXIT



	;; word:  IDE.INIT
	;; flags: DOCOL ROM CFT
	;; notes: IDE.INIT ( n addr -- )
	;;        Initialise IDE channel #n at address addr.

	.word dw_SWAP		; SWAP ( addr n )
	doREG(SYSIDE0)		; SWAP SYSIDE0 ( addr n addr )
	.word dw_add		; SWAP SYSIDE ( addr addr )
	.word dw_store		; ! ( )
	.word dw_EXIT


	
	;; word:  IDE.RB
	;; flags: CODE ROM CFT
	;; notes: IDE.rd ( addr -- )
	;;        Read an IDE block from the current drive, store at addresses a1 to a1+BKSIZE-1.

	FORTH(dw_IDE_DRQ_wait)	; IDE_DRQ... (wait for DRQ to be set)

	RPOP(I0, SP)		; buffer addr
	RMOV(I1, _iderb_count)
	
_iderb_loop:
	IN I IDEDATA
	STORE I I0
	ISZ I1
	JMP _iderb_loop
	NEXT
	
 _iderb_count:
 	.word @0-BKSIZE		; -BKSIZE



	;; word:  IDE.WB
	;; flags: CODE ROM CFT
	;; notes: IDE.wr ( addr -- )
	;;        Copy a block from a1 to the current drive's buffer. BKSIZE cells are copied.

	FORTH(dw_IDE_DRQ_wait)	; IDE_DRQ... (wait for DRQ to be set)
	
	RPOP(I0, SP)		; buffer addr
	STORE I0
	RMOV(I1, _iderb_count)
	
_idewb_loop:

	LOAD I I0
	OUT I IDEDATA
	ISZ I1
	JMP _idewb_loop
	NEXT



	;; word:  IDE.SEEKB
	;; flags: CODE ROM CFT
	;; notes: IDE.SEEKB ( d -- )
	;;        Set the block number for subsequent operations.
	;;        Blocks are hardwired to 4 disk sectors, and block numbers
	;;        are IDE LBA blocks << 2. Perform this conversion here.

	POP(SP)			; Pop high block number (sector bits 18-33)
	STORE TMP1
	RNR			; >>4
	RBR			; >>1
	RBR			; >>1 --> total 6 bits
	AND PLUS15		; AND 15
	OR IDEDHRB		; Base DHR value
	OUT I IDEDHR		; Set drive/head (aka LBA3) reg
	
	LOAD TMP1		; Load sector bits 18-33
	AND BYTELO		; Get bits 16-23
	OUT I IDELBA2		; Output to LBA 16-23 reg

	POP(SP)			; Pop low block number (sector bits 2-17)
	STORE TMP1

	RNR			; >>4
	RBR			; >>1
	RBR			; >>1 --> total 6 bits
	AND BYTELO		; Get low 8 bits
	OUT I IDELBA1		; Out to LBA 8-15 reg

	LOAD TMP1		; Load bits 2-17
	AND BYTELO		; Bits 16-23
	OUT I IDELBA0		; Output to LBA 0-8 reg

	NEXT



	;; word:  IDE.SEEK
	;; flags: CODE ROM CFT
	;; notes: IDE.SEEK ( d -- )
	;;        Set the sector number for subsequent operations.

	POP(SP)			; Pop high LBA (bits 16-31)
	STORE TMP1
	RNR			; >>4
	RNR			; >>4
	AND PLUS15		; AND 15
	OR IDEDHRB		; Base DHR value
	OUT I IDEDHR		; Set drive/head (aka LBA3) reg
	
	LOAD TMP1		; Load bits 16-31
	AND BYTELO		; Get bits 16-23
	OUT I IDELBA2		; Output to LBA 16-23 reg

	POP(SP)			; Pop low LBA (bits 0-15)
	STORE TMP1

	RNR			; >>4
	RNR			; >>4
	AND BYTELO		; Get low 8 bits
	OUT I IDELBA1		; Out to LBA 8-15 reg

	LOAD TMP1		; Load bits 16-31
	AND BYTELO		; Get bits 16-23
	OUT I IDELBA0		; Output to LBA 0-8 reg

	NEXT



	;; word:  HD>
	;; alias: HD_from
	;; flags: DOCOL ROM CFT
	;; notes: HD> ( d addr -- )
	;;        Read the specified BKSIZE-cell block number (a double integer)
        ;;        from the current disk unit and store it in memory starting at
        ;;        address addr.
	;;        Note: disk block addresses are sectors times 4.

	.word dw_IDE_BSY_wait	; IDE.BSY... ( lo hi addr ) \ Wait for disk to be ready.

	;; Seek to the sector
	.word dw_not_ROT	; SWAP ( addr lo hi )
	.word dw_IDE_SEEK	; IDE.SEEK ( addr )

	;; Request one sector
	doLIT(1)
	.word dw_idescr

	;; Read it
	;doLIT(IDE_READR)	; ( addr cmd )
	doLIT(IDE_READMULT)	; ( addr cmd )
	.word dw_idecmd		; ( addr )

	;; Copy it to memory.
	.word dw_IDE_RB		; IDE.RB ( )
	.word dw_EXIT



	;; word:  >HD
	;; alias: to_HD
	;; flags: DOCOL ROM CFT
	;; notes: >HD ( d addr -- )
	;;        Write 256 words starting at address addr to the disk sector
        ;;        specified in d (a double integer).

	.word dw_IDE_BSY_wait	; IDE.BSY... ( lo hi addr ) \ Wait for disk to be ready.

	;; Seek to the sector
	.word dw_not_ROT	; SWAP ( addr lo hi )
	.word dw_IDE_SEEK	; IDE.SEEK ( addr )

	;; Request one sector
	doLIT(1)
	.word dw_idescr

	;; Write it
	doLIT(IDE_WRITER)	; ( addr cmd )
	.word dw_idecmd		; ( addr )

	;; Copy the buffer from memory to the drive.
	.word dw_IDE_WB		; IDE.WB ( )

	;; At this point, the drive writes the sector. Wait for it to finish.
	.word dw_IDE_BSY_wait	; IDE.BSY... ( )

	.word dw_EXIT



	;; word:  pstate
	;; flags: DOCOL ROM CFT

	doLIT(_pstate1)
	.word dw_typep0
	.word dw_HEX
	.word dw_BLK
	.word dw_fetch_dot
	
	doLIT(_pstate2)
	.word dw_typep0
	.word dw_ofsIN
	.word dw_fetch_dot
	
	doLIT(_pstate3)
	.word dw_typep0
	.word dw_TIB
	.word dw_fetch_dot
	
	doLIT(_pstate4)
	.word dw_typep0
	.word dw_cTIB
	.word dw_fetch_dot
	
	doLIT(_pstate5)
	.word dw_typep0
	.word dw_BLKBUF
	.word dw_fetch_dot
	
	doLIT(_pstate6)
	.word dw_typep0
	.word dw_pBLK
	.word dw_fetch_dot
	
	doLIT(_pstate7)
	.word dw_typep0
	.word dw_cBLK
	.word dw_fetch_dot
	
	doLIT(_pstate9)
	.word dw_typep0
	.word dw_EOBq
	.word dw_dot

	doLIT(_pstatea)
	.word dw_typep0
	.word dw_pLINE
	.word dw_fetch_dot

	doLIT(_pstateb)
	.word dw_typep0
	.word dw_cLINE
	.word dw_fetch_dot

	doLIT(_pstate8)
	.word dw_typep0
	.word dw_EOLq
	.word dw_dot
	
	.word dw_CR
	
	.word dw_EXIT


_pstate1:	.strp 10 "Parse state: BLK" 0
_pstate2:	.strp ", >IN" 0
_pstate3:	.strp ", TIB" 0
_pstate4:	.strp ", #TIB" 0
_pstate5:	.strp ", BLKBUF" 0
_pstate6:	.strp ", >BLK" 0
_pstate7:	.strp ", #BLK" 0
_pstate9:	.strp ", EOB?" 0
_pstate8:	.strp ", EOL?" 0
_pstatea:	.strp ", >LINE" 0
_pstateb:	.strp ", #LINE" 0



	;; word:  test
	;; flags: DOCOL ROM CFT

	;; Choose disk #0.
	doLIT(0)		; 0
	.word dw_HDSET		; HDSET ( )

	;; Read the first sector
	doLIT(0)		; 0 ( 0 )
	doLIT(0)		; 0 ( 0 0 )
	doLIT(&8000)		; &1000 ( 0 0 &1000)
	.word dw_HD_from	; HD> ( 0 )

	;; Dump some of the sector
	;; doLIT(&8000)
	;; doLIT(&70) 
	;; .word dw_DUMP
	;; .word dw_DROP

	;; Set block parser
	doLIT(1)
	.word dw_BLK
	.word dw_store

	;; Reset >BLK
	doLIT(0)
	.word dw_pBLK
	.word dw_store

	;; Set BLKBUF
	doLIT(&8000)
	.word dw_BLKBUF
	.word dw_store

	.word dw_BLKBUF
	.word dw_fetch
	.word dw_BLKBS
	.word dw_dash_TRAILING
	.word dw_cBLK		; #BLK ( a n va )
	.word dw_store		; ! ( a )
	.word dw_DROP		; DROP ( )

	;; Save parse state.
	.word dw_cTIB
	.word dw_fetch
	.word dw_to_R

	.word dw_TIB
	.word dw_fetch
	.word dw_to_R

	.word dw_ofsIN
	.word dw_fetch
	.word dw_to_R

_test_loop:
	.word dw_EOBq		; EOB? ( f )
	.word dw_NOT		; NOT ( f )
	.word dw_if_branch	;   (if false...)
	.word _test_end		;   ... then read a line

	.word dw_getline
	.word dw_INTERPRET

	.word dw_branch
	.word _test_loop

_test_end:
	.word dw_R_from
	.word dw_ofsIN
	.word dw_store

	.word dw_R_from
	.word dw_TIB
	.word dw_store

	.word dw_R_from
	.word dw_cTIB
	.word dw_store

	doLIT(0)
	.word dw_BLK
	.word dw_store
	
	.word dw_EXIT

 

// End of file.
