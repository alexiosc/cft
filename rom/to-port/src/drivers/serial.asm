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

.pushns serial

///////////////////////////////////////////////////////////////////////////////
//
// CALL OFFSETS
//
///////////////////////////////////////////////////////////////////////////////

;;; These offsets represent the location of the various driver calls relative
;;; to the base address of the driver struct in memory. The driver struct
;;; starts with its opaque handle, and is stored in Page 0 as something like
;;; TTYA_HANDLE.

.equ cts     1
.equ send    2
.equ dsr     3
.equ read    4
.equ status  5
.equ ctl     6
.equ name    7
;;; entries 7-9 are the six chars of the name

.equ namesz  6				; Max name size.

;;; Bitmap of the return values of the status call. These are nearly identical
;;; to the maps for the 8250/16450/16550 LSR and MSR registers.

.equ STATUS_RET0_RDR  #-------1			; Data ready for reception
.equ STATUS_RET0_OERR #------1-			; Overrun error
.equ STATUS_RET0_PERR #-----1--			; Parity error
.equ STATUS_RET0_FERR #----1---			; Framing error
.equ STATUS_RET0_BRK  #---1----			; Break being received
.equ STATUS_RET0_THR  #--1-----			; Host can send data

.equ STATUS_RET1_DCTS #-------1			; CTS has changed state
.equ STATUS_RET1_DDSR #------1-			; DSR has changed state
.equ STATUS_RET1_DRI  #-----1--			; RI has changed state
.equ STATUS_RET1_DCD  #----1---			; CD has changed state
.equ STATUS_RET1_CTS  #---1----			; CTS# asserted
.equ STATUS_RET1_DSR  #--1-----			; DSR# asserted
.equ STATUS_RET1_RI   #-1------			; RI# asserted
.equ STATUS_RET1_CD   #1-------			; CD# asserted

.popns

;;; End of file.
