;;; Definitions for Page Zero.
;;;
;;; Copyright © 2014–2020 Alexios Chouchoulas.
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

;;; Zero page addresses between &300 and &3ff have special meaning: accessing
;;; them using page zero indirect addressing modes looks up memory relative to
;;; one of the eight memory bank registers:
;;;
;;; MBP --     the memory bank for instruction fetches and page-local data
;;; MBD --     the memory bank for data loaded via indirection.
;;; MBS --     the memory bank used by the hardware stack
;;; MBZ --     the memory bank where Page Zero is.
;;; MB4-MB7 -- general purpose banks.
;;;
;;; There are four groups of special registers:
;;;
;;; R0-R7 --   memory-bank relative indirection.
;;; I0-I7 -- auto-increment indexing registers.
;;; D0-D7 -- auto-decrement indexing registers.
;;; S0-S7 -- stack pointers (increment after writes, decrement before reads)
;;;
;;; This makes for bank-relative 64 registers.

;;; Note: these are the same symbols and values defined in mbu.asm, except
;;; they're defined within the mbu namespace there. There's no conflict because
;;; the values are purposefully the same in the hardware.

.equ MB0  0
.equ MB1  1
.equ MB2  2
.equ MB3  3
.equ MB4  4
.equ MB5  5
.equ MB6  6
.equ MB7  7
		
.equ MBP  MB0
.equ MBD  MB1
.equ MBS  MB2
.equ MBZ  MB3

;;; Memory-Bank Relative Index registers

.equ R0 R &300 &00
.equ R1 R &300 &08
.equ R2 R &300 &10
.equ R3 R &300 &18
.equ R4 R &300 &20
.equ R5 R &300 &28
.equ R6 R &300 &30
.equ R7 R &300 &38

;;; Auto-increment Index registers: incremented after every reference

.equ I0 R &340 &00
.equ I1 R &340 &08
.equ I2 R &340 &10
.equ I3 R &340 &18
.equ I4 R &340 &20
.equ I5 R &340 &28
.equ I6 R &340 &30
.equ I7 R &340 &38

;;; Auto-decrement Index registers: decremented after every reference

.equ D0 R &380 &00
.equ D1 R &380 &08
.equ D2 R &380 &10
.equ D3 R &380 &18
.equ D4 R &380 &20
.equ D5 R &380 &28
.equ D6 R &380 &30
.equ D7 R &380 &38

;;; Stack registers: incremented after writes; decremented before reads.

.equ I0 R &3c0 &00
.equ I1 R &3c0 &08
.equ I2 R &3c0 &10
.equ I3 R &3c0 &18
.equ I4 R &3c0 &20
.equ I5 R &3c0 &28
.equ I6 R &3c0 &30
.equ I7 R &3c0 &38

;;; End of file.
