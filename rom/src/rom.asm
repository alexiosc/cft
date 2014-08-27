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
ramvectable:
.include "generated/vector-table.asm"	; Page 0 definitions (&03xx)

.include "asm/ucb.asm"			; Debugging Front Panel (DFP)
.include "asm/mbu.asm"			; Memory Banking Unit (MBU)
.include "asm/dfp.asm"			; Debugging Front Panel (DFP)
.include "asm/irc.asm"			; Interrupt Board (IRC)
.include "asm/vdu.asm"			; Video Board & Keyboard (VDU)
.include "asm/post.asm"			; POST patterns

.include "asm/macro-generic.asm"	; General use macros
.include "asm/macro-stack.asm"		; Stack macros
.include "asm/macro-entry.asm"		; Stack macros

.include "asm/errno.asm"		; Error codes
.include "asm/config.asm"		; OS configuration

.include "00-post.asm"
/.include "01-xxxx.asm"
/.include "02-forth.asm"
.include "03-os.asm"

;;; End of file.
