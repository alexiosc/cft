;;; -*- cftasm -*-
		
;;; TTY class drivers for the DFP, TTY and VDU.
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
.pushns tty

///////////////////////////////////////////////////////////////////////////////
//
// CALL OFFSETS
//
///////////////////////////////////////////////////////////////////////////////

;;; These offsets represent the location of the various driver calls relative
;;; to the base address of the driver struct in memory. The driver struct
;;; starts with its opaque handle, and is stored in Page 0 as something like
;;; TTYA_HANDLE.

.equ cts    0
.equ send   1
.equ dsr    2
.equ read   3
.equ status 4
.equ ctl    5


.pushns drv

.include "driver-null.asm"		; The NULL driver (TTY/MSD sentinel)
.include "driver-tty-dfp.asm"		; The DFP TTY driver
.include "driver-tty-tty.asm"		; The DFP TTY driver

.popns

.popns

;;; End of file.
