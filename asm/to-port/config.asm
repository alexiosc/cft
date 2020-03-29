;;; -*- cftasm -*-
		
;;; Configuration options for the CFT OS.
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

.pushns config

;;; The two event FIFOs are used for async communications between processes and
;;; the ‘operating system’. The FIFO size (n) must be a power of 2 (i.e. the
;;; ptrmask must be (2**n)-1), and the start pointers must be aligned at a
;;; multiple of n.

;;; Here, n = 64 (0x40)

.equ fifo0_start &0480			; 64 words for the input event FIFO
.equ fifo1_start &04C0			; 64 words for the output event FIFO
.equ fifo_szmask 63			; FIFO size - 1

;;; Stacks

.equ rp_start &0500			; Start of return stack
.equ sp_start &0600			; Start of data stack
.equ buf_start &1000			; User buffer start

;;; Other settings

.equ default_tty_speed tty.B115K	; Default TTY speed

.popns config

;;; End offile.
