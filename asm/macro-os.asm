;;; -*- cftasm -*-

;;; Operating System macros.
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


;;; Macro: errno(literal)
;;;
;;; Set the error code.

.macro errno(name)
		LI err.%name		; errno(%literal)
		STORE p0.ERRNO
.end


;;; Macro: clear_errno()
;;;
;;; Clear the error code.

.macro clear_errno()
		errno(NOERROR)		; clear_errno()
.end


;;; Macro: rtt_errno(%error)
;;;
;;; Set the error code and return -1.

.macro rtt_errno(name)
		errno(%name)		; rtt_errno(%name)
		JMP os.rtterr
.end


;;; Macro: call(name)
;;;
;;; Calls the specified page 0 subroutine vector.

.macro call(name)
		JSR I %name		; call(%addr)
.end


;;; Macro: lcall(name, literal)
;;;
;;; Calls the specified page 0 subroutine vector with a literal argument (ARG0)

.macro lcall(name, lit)
		LI %lit			; call(%name, %lit)
		STORE ARG0
		JSR I %name
.end


;;; Macro: rcall(name, addr)
;;;
;;; Calls the specified page 0 subroutine vector with a register argument (ARG0)

.macro rcall(name, addr)
		LOAD %addr		; call(%name, %addr)
		STORE ARG0
		JSR I %name
.end


;;; Macro: syscall(name)
;;;
;;; Calls the specified system call. Any arguments must have previously been set
;;; up.

.macro syscall(name)
		TRAP I %name		; syscall(%name)
.end


;;; Macro: lsyscall(name, lit)
;;;
;;; Calls the specified system call with a literal argument (ARG0).

.macro lsyscall(name, lit)
		LI %lit			; lsyscall(%name, %lit)
		STORE ARG0
		TRAP I %name
.end


;;; Macro: rsyscall(name, addr)
;;;
;;; Calls the specified system call with a register argument (ARG0).

.macro rsyscall(name, addr)
		LOAD %addr		; rsyscall(%name, %addr)
		STORE ARG0
		TRAP I %name
.end


;;; Macro: asyscall(name)
;;;
;;; Calls the specified system call with a single argument in the Accumulator.

.macro asyscall(name)
		STORE ARG0		; asyscall(%name)
		TRAP I %name
.end


;;; Macro: callcdrv(handle, call)
;;;
;;; Calls a cached driver with its handle at location %handle. Uses driver call
;;; with address %call.

.macro callcdrv(handle, call)
		STORE ARG1		; calldrv(%handle, %call)
		LOAD %handle
		STORE ARG0		; ARG0 = driver handle (unit number)
		TRAP I %call
.end

;;; Macro: rcalldrv(handle, call, reg)
;;;
;;; Calls a cached driver with its handle at location %handle. Uses driver call
;;; with address %call, and passes %reg as argument.

.macro rcallcdrv(handle, call, reg)
		LOAD %handle		; rcalldrv(%handle, %ofs, %reg)
		STORE ARG0		; ARG0 = driver handle (unit number)
		LOAD %reg
		STORE ARG1
		TRAP I %call
.end

;;; Macro: lcalldrv(handle, ofs, lit)
;;;
;;; Calls a cached driver with its handle at location %handle. Uses driver call
;;; with address %call, and passes the literal %lit as argument.

.macro lcallcdrv(handle, call, lit)
		LOAD %handle		; lcalldrv(%handle, %ofs, %lit)
		STORE ARG0		; ARG0 = driver handle (unit number)
		LI %lit
		STORE ARG1		; ARG1 = literal argument
		TRAP I %call
.end

;;; End of file.
