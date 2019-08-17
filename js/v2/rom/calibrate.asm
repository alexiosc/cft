;;; -*- cftasm -*-
		
;;; Extremely short calibration test ROM for the Javascript CFT Emulator.
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


///////////////////////////////////////////////////////////////////////////////
/// 
/// System vectors
///
///////////////////////////////////////////////////////////////////////////////

&ffd0:	
calibrate:
		LOAD 0
		ADD 0
		STORE 0
		JMP @+1
		LOAD I 0
		ADD I 0
		RNL
		NOP
		SKIP
		NOP
		JMP calibrate
		
&fff0:		JMP calibrate		; Boot vector
&fff8:		RTI			; Interrupt Service vector

;;; End of file.
