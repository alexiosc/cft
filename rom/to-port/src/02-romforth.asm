;;; -*- cftasm -*-
		
;;; The ROM Forth interpreter.
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

.pushns romforth

///////////////////////////////////////////////////////////////////////////////
//
// ROM ENTRY POINT
//
///////////////////////////////////////////////////////////////////////////////

		
&c000:
		ROM_HEADER(1)

		.strp "ROM Forth 0.3                " 0
		.word romforth

		;; End of ROM HEADER.

///////////////////////////////////////////////////////////////////////////////
//
// ROM FORTH INTERPRETER/COMPILER
//
///////////////////////////////////////////////////////////////////////////////

romforth:	


;;; Initialise the Forth vector table.
.scope

		LI forth_vector_table	; This is in Page 0, hence LI
		PUSH SP
		LIA vectable
		PUSH SP
		LI @done-vectable
		JSR I MEMCPY
		JMP done

vectable:
.include "forth-vectable.asm"
done:
.endscope

;;; Inner Interpreter

		LIA foo
		JSR I PUTSP
		HALT
		JMP @

foo:		.strp "\n" 2 2 2 "ROM Forth booting..." 0
		
.popns

;;; End of file.
