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
handle_ide%d:	.word ide.DHR_SEL%u	; Unit number
		.word ide.IDE%c ide.DCR	; Device Control Register
		.word ide.IDE%c ide.DAT	; Data register
		.word ide.IDE%c ide.ERR	; Data register
		.word ide.IDE%c ide.SCR	; Sector/Count register
		.word ide.IDE%c ide.CMD	; Command/Status register
.end

		drvtable(0, 0, 0)
		drvtable(1, 0, 1)
		drvtable(2, 1, 0)
		drvtable(3, 1, 1)

;;; Report the size of this device.

size:           HALT

;;; Read a block.

read:           HALT

;;; Write a block.

write:          HALT

;;; Report the status of the device.

status:          HALT

;;; Control the device.

ctl:             HALT

.popns
		
;;; End of private code
                
.popns

;;; End of file.
