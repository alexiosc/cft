;;; Definitions for Page Zero, addresses 00xx.
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

.bank &00
                
&0000:          .reg RETV R @           ; Subroutine Return Vector
                .reg RTTV R @           ; Trap Return Vector
                .reg RTIV R @           ; Interrupt Return Vector

&0003:          .reg R0 R @
                .reg R1 R @
                .reg R2 R @
                .reg R3 R @
                .reg R4 R @
                .reg R5 R @
                .reg R6 R @
                .reg R7 R @
                .reg R8 R @
                .reg R9 R @
                .reg R10 R @
                .reg R11 R @
                .reg R12 R @
                .reg R13 R @
                .reg R14 R @
                .reg R15 R @

                .reg OSR0 R @		; Used inside system calls
                .reg OSR1 R @
                .reg OSR2 R @
                .reg OSR3 R @
                .reg OSR4 R @
                .reg OSR5 R @
                .reg OSR6 R @
                .reg OSR7 R @
                .reg OSR8 R @
                .reg OSR9 R @
                .reg OSR10 R @
                .reg OSR11 R @
                .reg OSR12 R @
                .reg OSR13 R @
                .reg OSR14 R @
                .reg OSR15 R @

                .reg TMP0 R @           ; Clobbered by most stack routines
                .reg TMP1 R @
                .reg TMP2 R @
                .reg TMP3 R @
                .reg TMP4 R @
                .reg TMP5 R @
                .reg TMP6 R @
                .reg TMP7 R @
                .reg TMP8 R @
                .reg TMP9 R @
                .reg TMP10 R @
                .reg TMP11 R @
                .reg TMP12 R @
                .reg TMP13 R @
                .reg TMP14 R @		; Clobbered by routine entry/exit code
                .reg TMP15 R @		; Clobbered by routine entry/exit code

		.reg ARG0 R @		; Argument passing into OS routines
		.reg ARG1 R @
		.reg ARG2 R @
		.reg ARG3 R @
		.reg ARG4 R @
		.reg ARG5 R @
		.reg ARG6 R @
		.reg ARG7 R @

		.reg RET0 R @		; Return values
		.reg RET1 R @
		.reg RET2 R @
		.reg RET3 R @
		.reg RET4 R @
		.reg RET5 R @
		.reg RET6 R @
		.reg RET7 R @

		.reg DRVR0 R @		; Used in drivers
		.reg DRVR1 R @
		.reg DRVR2 R @
		.reg DRVR3 R @

		.reg ISRR0 R @		; USE IN MAIN ISR ONLY!
		.reg ISRR1 R @		; ISR subroutine registers
		.reg ISRR2 R @
		.reg ISRR3 R @

		.reg MTMP0 R @		; Macros may clobber these
		.reg MTMP1 R @
		.reg MTMP2 R @
		.reg MTMP3 R @

;;; ISR state

		.reg ISRA R @		; Copy of AC for ISR
		.reg ISRL R @		; Copy of L for ISR
		.reg ISRR R @		; Copy of RETV for ISR

		
;;; Autoincrement Registers

&0080:          .reg I0 R @		; Index registers available for user code
                .reg I1 R @
                .reg I2 R @
                .reg I3 R @
                .reg I4 R @
                .reg I5 R @
                .reg I6 R @
                .reg I7 R @
		.reg I8 R @
                .reg I9 R @
                .reg I10 R @
                .reg I11 R @
                .reg I12 R @
                .reg I13 R @
                .reg I14 R @
                .reg I15 R @

		.reg OSI0 R @		; Index registers for system calls
                .reg OSI1 R @
                .reg OSI2 R @
                .reg OSI3 R @
                .reg OSI4 R @
                .reg OSI5 R @
                .reg OSI6 R @
                .reg OSI7 R @
		.reg OSI8 R @
                .reg OSI9 R @
                .reg OSI10 R @
                .reg OSI11 R @
                .reg OSI12 R @
                .reg OSI13 R @
                .reg OSI14 R @
                .reg OSI15 R @

		.reg ITMP0 R @
		.reg ITMP1 R @
		.reg ITMP2 R @
		.reg ITMP3 R @

		.reg ERB0_WPTR R @	; Event Ring Input Buffer read pointer
		.reg ERB0_RPTR R @	; Event Ring Input Buffer write pointer
		.reg ERB1_WPTR R @	; Event Ring Output Buffer read pointer
		.reg ERB1_RPTR R @	; Event Ring Output Buffer write pointer

		.reg DRVI0 R @		; Used in drivers
		.reg DRVI1 R @
		.reg DRVI2 R @
		.reg DRVI3 R @

		.reg ISRI0 R @		; ISR-local index registers
		.reg ISRI1 R @
		.reg ISRI2 R @
		.reg ISRI3 R @

		.reg MI0 R @		; Macros may clobber these
		.reg MI1 R @
		.reg MI2 R @
		.reg MI3 R @

		.reg SP R @		; Data stack pointer
                .reg RP R @		; Return stack pointer
                .reg SP2 R @
                .reg SP3 R @
                .reg SP4 R @
                .reg SP5 R @

;;; End of file.
