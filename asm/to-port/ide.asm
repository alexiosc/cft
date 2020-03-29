;;; -*- cftasm -*-
;;; Definitions for the dual channel IDE board.
;;;
;;; IDE devices are among the most complex the CFT needs to deal with. Some help
;;; can be found here: http://wiki.osdev.org/ATA_PIO_Mode

.pushns ide

.equ IDE0 &a0				; IDE controller 0
.equ IDE1 &c0				; IDE controller 1

;;; IDE register offsets

.equ DCR            &06		        ; (r-) Device Control Register
.equ ASR            &06			; (-w) The Alternate Status Register
.equ DAR            &07                 ; (r-) Drive Address Register

.equ DAT            &10			; (rw) The data register
.equ ERR            &11			; (r-) Error register
.equ FTR            &11			; (-w) Feature register
.equ SCR            &12			; (rw) Sector count register
.equ LBA0           &13			; (rw) LBA bits 0-7
.equ LBA1           &14			; (rw) LBA bits 8-15
.equ LBA2           &15			; (rw) LBA bits 16-23
.equ LBA3           &16			; (rw) LBA bits 24-27, plus...
.equ DHR	    &16			; (rw) ...drive/Head Register, LBA enable
.equ STR            &17			; (r-) Status register
.equ CMD            &17			; (-w) Command register

;;; IDE commands

.equ CMD_RECAL      &10			; Recalibrate
.equ CMD_READR      &20			; Read with retry
.equ CMD_READMULT   &c4			; Read multiple
.equ CMD_WRITER     &30			; Write with retry
.equ CMD_WRITEMULT  &c5			; Write multiple
.equ CMD_SETMULT    &c6			; Set multiple mod
.equ CMD_IDENTIFY   &ec			; Identify

;;; Values for the Drive/Head register.

.equ DHR_BASE   #1-1-----		; Base value
.equ DHR_LBA    #-1------		; Enable LBA
.equ DHR_DRV0   #---0----		; Select drive 0
.equ DHR_DRV1   #---1----		; Select drive 1

.equ DHR_SEL0 DHR_BASE DHR_LBA DHR_DRV0	; Select Drive 0 (with LBA)
.equ DHR_SEL1 DHR_BASE DHR_LBA DHR_DRV1	; Select Drive 1 (with LBA)

;;; Values for the STR (Status Register)

.equ STR_ERR    #-------1		; Error detected
.equ STR_DRQ    #----1---		; DRQ: Ready to send/receive data
.equ STR_SRV    #---1----		; SRV: Overlapped Mode Service Request
.equ STR_DF     #--1-----		; DF: Data Fault
.equ STR_RDY    #-1------		; RDY: 1: ready. 0: errors/sleeping.
.equ STR_BSY    #1-------		; BSY: Drive is busy.

;;; Note: when STR_BSY is set, others bits are meaningless.
;;;
;;; Operation strategy: issue command, wait for BSY to clear with timeout. On
;;; timeout, soft-reset drives and try again or raise error.

;;; Values for the DCR

.equ DCR_BASE   #----1--0		; Base value for DCR.
.equ DCR_IEN    #----1-00	        ; IEN: Interrupts enabled.
.equ DCR_nIEN   #----1-10      		; nIEN: Interrupts disabled.
.equ DCR_SRST   #----11-0		; SRST: Soft reset both devices on bus.

.equ DCR_INIT DCR_IEN			; Initialisation value for DCR.
.equ DCR_RESET DCR_nIEN DCR_SRST	; Enable Reset (disable interrupts)
		
;;; IDENTIFY flags
               
.equ IDF_HS   #--------------1-		; Hard sectored
.equ IDF_SS   #-------------1--		; Soft sectored
.equ IDF_NMFM #------------1---		; Non-MFM drive
.equ IDF_SHSW #-----------1----		; Slow head switch (>15µs)
.equ IDF_SMCI #----------1-----		; Spindle Motor Control Implemented
.equ IDF_FXED #---------1------		; Fixed drive
.equ IDF_CART #--------1-------		; Removable cartridge drive
.equ IDF_SLOW #-------1--------		; Data transfer ≤ 5 Mb/s
.equ IDF_MED  #------1---------		; 5 MB/s < Data transfer ≤ 10 Mb/s
.equ IDF_FAST #-----1----------		; 10 MB/s < Data transfer
.equ IDF_RSTL #----1-----------		; Rotational speed tolerance > 0.5%
.equ IDF_DSOO #---1------------		; Data strobe offset option available
.equ IDF_TOO  #--1-------------		; Track offset option available
.equ IDF_FSTG #-1--------------		; Format speed tolerance gap required

;;; OS parameters for IDE drives

.equ BKSIZE         1024		; block size in machine words (cells)
.equ BKSIZE_SECTORS 4			; block size in sectors (256 cells)

;;; Notes:
;;;
;;; 

.popns

;;; End of file.
