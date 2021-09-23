;;; -*- cftasm -*-
		
;;; The CFT ROM.
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

.include "asm/page0-0.asm"		; Page 0 definitions (&00xx)
.include "asm/page0-1.asm"		; Page 0 definitions (&01xx)
base_vector_table:
.include "generated/base-vectable.asm"	; Base Page 0 definitions (&03xx)
forth_vector_table:	
.include "generated/forth-vectable.asm"	; Forth Page 0 definitions (&03xx)

.include "asm/ucb.asm"			; Debugging Front Panel (DFP)
.include "asm/mbu.asm"			; Memory Banking Unit (MBU)
.include "asm/dfp.asm"			; Debugging Front Panel (DFP)
.include "asm/irc.asm"			; Interrupt Board (IRC)
.include "asm/rtc.asm"			; Real-Time Clock/NVRAM (IRC/NVR)
		
.include "asm/tty.asm"			; TTY board (dual dual 16550 UARTs)
.include "asm/ide.asm"			; IDE board (dual IDE channels)
.include "asm/vdu.asm"			; Video Board & Keyboard (VDU)
.include "asm/psg.asm"			; GI AY-3-8910 Board (PSG)
.include "asm/spj.asm"			; SpeakJet® Board (SPJ)
.include "asm/post.asm"			; POST patterns

.include "asm/macro-generic.asm"	; General use macros
.include "asm/macro-cond.asm"		; Conditional macros
.include "asm/macro-stack.asm"		; Stack macros
.include "asm/macro-entry.asm"		; Function entry/exit conventions
.include "asm/macro-os.asm"		; OS macros

.include "asm/errno.asm"		; Error codes
.include "asm/devctl.asm"		; Device control opcodes
.include "asm/config.asm"		; OS configuration

.include "00-post.asm"
/.include "01-xxxx.asm"
.include "02-romforth.asm"
.include "03-os.asm"

;;; End of file.
