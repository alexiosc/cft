;;; -*- cftasm -*-
		
;;; Error codes for the CFT OS.
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

.pushns err

.equ NOERROR   0			; Everything is OK

.equ EINVAL     5			; Invalid value
.equ EARG       6			; Argument error
.equ ENODEV    10			; Bad device
.equ ENOMEM    20			; Out of memory
.equ EFULL     30			; Full (ran out of slots, etc.)
.equ ETMOUT   100			; Timeout
.equ ENOP     900			; Call not available (nothing done)

.popns

;;; End offile.