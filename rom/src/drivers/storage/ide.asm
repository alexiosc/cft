;;; -*- cftasm -*-
                
;;; MSD driver for the IDE board, supporting four drives.
;;;
;;; Copyright © 2014 Alexios Chouchoulas.
;;;
;;; This program is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by the Free
;;; Software Foundation; either version 2, or (at your option) any later
;;; version.
;;; 
;;; This program is distributed in the hope that it will be useful, but WITHOUT
;;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
;;; FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
;;; more details.
;;; 
;;; You should have received a copy of the GNU General Public License along with
;;; this program; if not, write to the Free Software Foundation, Inc., 59 Temple
;;; Place - Suite 330, Boston, MA 02111-1307, USA.

;;; We're already called from a 'drivers' namespace, just add our own name.
.pushns ide

;;; Note, drivers don't include detection and initialisation routines, these are
;;; done in the boot/POST page to save memory.

///////////////////////////////////////////////////////////////////////////////
//
// JUMP TABLES
//
///////////////////////////////////////////////////////////////////////////////

;;; Storage driver jump table for IDE Unit 0 (channel 0, drive 0).

.pushns u0
.equ base @

table:          .word prv.handle_ide0	; The drive handle (table of reg addrs)
size:           .word prv.size          ; Size of device in 1KW blocks.
read:           .word prv.read          ; Read a block
write:          .word prv.write         ; Write a block
status:         .word prv.status        ; Return unit status
ctl:            .word prv.ctl           ; Control unit (misc ops, ioctl-like)
name:		.strp "ide0" 0 0	; Name of the device, 6 chars max.
.popns

;;; Storage driver jump table for IDE Unit 1 (channel 0, drive 1).

.pushns u1
.equ base @

table:          .word prv.handle_ide1	; The drive handle (table of reg addrs)
size:           .word prv.size          ; Size of device in 1KW blocks.
read:           .word prv.read          ; Read a block
write:          .word prv.write         ; Write a block
status:         .word prv.status        ; Return unit status
ctl:            .word prv.ctl           ; Control unit (misc ops, ioctl-like)
name:		.strp "ide1" 0 0	; Name of the device, 6 chars max.
.popns

;;; Storage driver jump table for IDE Unit 2 (channel 1, drive 0).

.pushns u2
.equ base @

table:          .word prv.handle_ide2	; The drive handle (table of reg addrs)
size:           .word prv.size          ; Size of device in 1KW blocks.
read:           .word prv.read          ; Read a block
write:          .word prv.write         ; Write a block
status:         .word prv.status        ; Return unit status
ctl:            .word prv.ctl           ; Control unit (misc ops, ioctl-like)
name:		.strp "ide2" 0 0	; Name of the device, 6 chars max.
.popns

;;; Storage driver jump table for IDE Unit 3 (channel 1, drive 1).

.pushns u3
.equ base @

table:          .word prv.handle_ide3	; The drive handle (table of reg addrs)
size:           .word prv.size          ; Size of device in 1KW blocks.
read:           .word prv.read          ; Read a block
write:          .word prv.write         ; Write a block
status:         .word prv.status        ; Return unit status
ctl:            .word prv.ctl           ; Control unit (misc ops, ioctl-like)
name:		.strp "ide3" 0 0	; Name of the device, 6 chars max.
.popns
		

///////////////////////////////////////////////////////////////////////////////
//
// INTERRUPT SERVICE ROUTINE
//
///////////////////////////////////////////////////////////////////////////////
		
;;; Interrupt Service Routine.
;;;
;;; IRQ served:	5
;;; 
;;; This code handles interrupts from a drive. There's nothing here yet.

isr:
.scope
		RET			; Nothing here yet.
.endscope

///////////////////////////////////////////////////////////////////////////////
//
// PRIVATE CODE BELOW
//
///////////////////////////////////////////////////////////////////////////////

.pushns prv


;;; The table of registers per drive

.macro drvtable(d, c, u)
handle_ide%d:	
		.word p0.IDE%{c}SZH	; Size offset (high)
		.word ide.DHR_SEL%u	; Unit number
                .word ide.IDE%c		; Base I/O address
		;; The following may be unnecessary, check & remove as required.
		.word ide.IDE%c ide.DCR	; Device Control Register
		.word ide.IDE%c ide.DAT	; Data register
		.word ide.IDE%c ide.ERR	; Error register
		.word ide.IDE%c ide.SCR	; Sector/Count register
		.word ide.IDE%c ide.CMD	; Command/Status register
.end

		drvtable(0, 0, 0)
		drvtable(1, 0, 1)
		drvtable(2, 1, 0)
		drvtable(3, 1, 1)

;;; Subroutine:	report the size of this device.
;;;
;;; Arguments:
;;;
;;;   ARG0:	Device handle.
;;;
;;; Return value:
;;;
;;;   AC:	   Always 0
;;;   <RET0,RET1>: Size of the device in 1KW blocks.
;;;
;;; Side effects:
;;;
;;;   DRVI0:	 Used to index the table.

size:
.scope
		clear_errno()
		RMOV(DRVI0, ARG0)
		RMOV(RET0, I DRVI0)
		RMOV(RET1, I DRVI1)
		JMP os.rtt0
.endscope

;;; Read a block.

read:           HALT

;;; Write a block.

write:          HALT

;;; Report the status of the device.

status:          HALT

;;; Control the device.

ctl:             HALT

;;; Subroutine:	prepare to read/write a device block.
;;;
;;; IDE devices have 512-byte (256-word) sectors. The CFT addresses MSDs using
;;; 1KW blocks, so the routine multiplies by 4 (shifting left by two). Only
;;; 28-bit LBA is used, which gives an upper limit of 128GB or 64GW. This should
;;; be more than enough. The routine ensures the block number is no larger than
;;; this.
;;;
;;; Arguments:
;;; 
;;;   <DRVR0,DRVR1>: Block number, 32 bits.
;;;   DRVR2:	     Drive select value (ide.DHR_SEL0 or ide.DHR_SEL1).
;;;   DRVR3:	     Register base.
;;; 
;;; Return:
;;;     AC:	Zero on success, non-zero if the block is out of range.
;;;     DRVI0:	The address of the command/status register for the drive.

seek:
.scope
		LOAD DRVR0		; Sanity check.
		AND upper6bits
		SZA
		JMP fail

		DSBL1(DRVR0, DRVR1)	; Multiply <DRVR0,DRVR1> *2
		DSBL1(DRVR0, DRVR1)	; Multiply <DRVR0,DRVR1> *2

		LOR(DRVI0, DRVR3, ide.SCR) ; Address the SCR register.
		LOUT(I DRVI0, 4)	   ; SCR: 4 sector blocks (1KW).

		LOAD DRVR0		; LBA0-7
		GETLOCHAR()		; Just for good measure.
		OUT I DRVI0		; Write LBA0 reg

		LOAD DRVR0		; LBA8-15
		GETHICHAR()
		OUT I DRVI0		; Write LBA1 reg

		LOAD DRVR1		; LBA16-23
		GETLOCHAR()
		OUT I DRVI0		; Write LBA2 reg
		
		LOAD DRVR1		; LBA24-27
		RNR
		RNR
		AND NYBBLE0		; Use only lowest four bits.
		OR DRVR2		; OR the DHR value.
		OUT I DRVI0		; Write DHR/LBA3 reg

		LRET(0)			; Done!

fail:		LRET(1)			; block offset too large
		
upper6bits:	.word &fc00	; upper 6 bits set (32-28-2)
.endscope

.popns
		
;;; End of private code
                
.popns

;;; End of file.
