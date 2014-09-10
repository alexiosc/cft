;;; -*- cftasm -*-
		
;;; NULL driver (a sentinel driver).
;;; 
;;; This driver can be used in lieu of other
;;; drivers, or as a NULL driver. Any call to it will result in an ENODEV error
;;; and a -1 result code.
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
.pushns null

///////////////////////////////////////////////////////////////////////////////
//
// JUMP TABLE
//
///////////////////////////////////////////////////////////////////////////////

;;; Boilerplate and jump table for TTY drivers
table:
.equ handle @			         
		.data @		        ; Magic TBD
		.fill 15 JMP prv.err	; 15x ENODEV errors

///////////////////////////////////////////////////////////////////////////////
//
// PRIVATE CODE BELOW
//
///////////////////////////////////////////////////////////////////////////////

.pushns prv

;;; Return an ENODEV error.

err:		errno(ENODEV)
		RMOV(RET0, MINUS1)
		RTT

.popns
;;; End of private code
		
.popns

;;; End of file.
