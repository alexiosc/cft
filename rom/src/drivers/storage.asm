;;; -*- cftasm -*-
		
;;; Storage class drivers for the FDC, IDE and more.
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

.pushns storage

///////////////////////////////////////////////////////////////////////////////
//
// CALL OFFSETS
//
///////////////////////////////////////////////////////////////////////////////

;;; These offsets represent the location of the various driver calls relative
;;; to the base address of the driver struct in memory. The driver struct
;;; starts with its opaque handle, and is stored in Page 0 as something like
;;; TTYA_HANDLE.

.equ size    1
.equ read    2
.equ write   3
.equ status  4
.equ ctl     5
.equ name    6
;;; entries 6-8 are the six chars of the name

.equ namesz  6				; Max name size.

.popns

;;; End of file.
