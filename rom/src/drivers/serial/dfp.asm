;;; -*- cftasm -*-
		
;;; TTY driver for the DFP TTY.
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
.pushns dfp

;;; Note, drivers don't include detection and initialisation routines, these are
;;; done in the boot/POST page to save memory.

///////////////////////////////////////////////////////////////////////////////
//
// JUMP TABLE
//
///////////////////////////////////////////////////////////////////////////////

;;; Boilerplate and jump table for TTY drivers
table:
.equ handle @			         
		.data @		        ; Magic TBD
cts:		.word prv.cts		; Clear to send? (always yes for the DFP)
send:		.word prv.send
dsr:		.word prv.dsr
read:		.word prv.read		; Blocking read
status:		.word os.rttnop		; *** NOT AVAILABLE
ctl:		.word os.rttnop		; *** NOT AVAILABLE

///////////////////////////////////////////////////////////////////////////////
//
// PRIVATE CODE BELOW
//
///////////////////////////////////////////////////////////////////////////////

.pushns prv

;;; Check if a character is available, return boolean value.

cts:		clear_errno()
		JMP os.rtt1		; The DFP is always ready to receive

;;; Send out a character.

send:		clear_errno()
		LOAD ARG0
		OUT dfp.TX		; Blocks via wait states until done
		RTT

;;; Check if a character is available, return 0 (no), 1 (yes). The DFP TTY
;;; doesn't have a separate query operation, and returns either a character or
;;; &8000 (no characters available). Since this consumes a character from the
;;; DFP output buffer, we store this character in RAM. The read call will then
;;; check to see if one is available and return it immediately.

dsr:		clear_errno()
		IN dfp.RX
		STORE p0.DFP_LASTC
		SNA
		JMP os.rtt1		; 1 = yes, there are characters
		JMP os.rtt0		; 0 = no, no characters

;;; Read a character. Block and wait for one if none is available.

read:		clear_errno()
		LOAD p0.DFP_LASTC
		SNN			; Already have a character
		JMP _wait_for_char	; We don't, block.
		RMOV(p0.DFP_LASTC, BIT15) ; Set LASTC to &8000 (no chars left)
		AND BYTELO		; Keep the low 8 bits
		JMP os.rttval		; Return them
_wait_for_char:	RMOV(p0.DFP_LASTC, BIT15) ; Set LASTC to &8000 (no chars left)
		IN dfp.RX		; Block, waiting for a character
		SNN
		JMP _wait_for_char	; Try again.
		AND BYTELO		; Keep the low 8 bits
		JMP os.rttval		; Return them

.popns
;;; End of private code
		
.popns

;;; End of file.
