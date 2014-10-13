;;; -*- cftasm -*-
		
;;; TTY driver for the Dual Dual UART Board (TTY).
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
.pushns tty

;;; Note, drivers don't include detection and initialisation routines, these are
;;; done in the boot/POST page to save memory.

///////////////////////////////////////////////////////////////////////////////
//
// JUMP TABLE
//
///////////////////////////////////////////////////////////////////////////////

;;; Boilerplate and jump table for TTY drivers

.equ base0 @
.pushns tty0
table:		.data @tty.TTY0&&3ff    ; UART base address
cts:		.word prv.cts		; Clear to send? (always yes for the DFP)
send:		.word prv.send
dsr:		.word prv.dsr
read:		.word prv.read		; Blocking read
status:		.word prv.status	; Return status
ctl:		.word prv.ctl		; Control device
name:		.strp "tty0" 0 0        ; Name of the device, four chars max.
.popns

.equ base1 @
.pushns tty1
table:		.data @tty.TTY1&&3ff    ; UART base address
cts:		.word prv.cts		; Clear to send? (always yes for the DFP)
send:		.word prv.send
dsr:		.word prv.dsr
read:		.word prv.read		; Blocking read
status:		.word prv.status	; Return status
ctl:		.word prv.ctl		; Control device
name:		.strp "tty1" 0 0	; Name of the device, four chars max.
.popns

.equ base2 @
.pushns tty2
table:		.data @tty.TTY2&&3ff    ; UART base address
cts:		.word prv.cts		; Clear to send? (always yes for the DFP)
send:		.word prv.send
dsr:		.word prv.dsr
read:		.word prv.read		; Blocking read
status:		.word prv.status	; Return status
ctl:		.word prv.ctl		; Control device
name:		.strp "tty2" 0 0        ; Name of the device, four chars max.
.popns

.equ base3 @
.pushns tty3
table:		.data @tty.TTY3&&3ff    ; UART base address
cts:		.word prv.cts		; Clear to send? (always yes for the DFP)
send:		.word prv.send
dsr:		.word prv.dsr
read:		.word prv.read		; Blocking read
status:		.word prv.status	; Return status
ctl:		.word prv.ctl		; Control device
name:		.strp "tty3" 0 0        ; Name of the device, four chars max.
.popns

		
///////////////////////////////////////////////////////////////////////////////
//
// INTERRUPT SERVICE ROUTINE
//
///////////////////////////////////////////////////////////////////////////////

;;; Algorithm:
;;;
;;; 1 foreach p in TTY_PORTS:
;;; 2     read port ISR
;;; 3     if ISR[0] is set:
;;; 4         Next port
;;; 5     else:
;;; 6         Act based on value of ISR[1:3]
;;; 7     go to 2

isr:
.scope
		enter_sub()
		
next_int:	IN tty.TTY0 tty.ISR
		AND NYBBLE0
		CLL RBR			; Roll. If L=1, there are no interrupts
		AND seven
		SCL
		JMP next_port
		STORE ISRR1

		JMPTAB(int_table, ISRR2, ISRR1)
int_table:	.word intsrc_msr	; 000: MSR change
		/.word intsrc_txr	; 001: Ready to transmit
		.word intsrc_ignore
		.word intsrc_rxr	; 010: Data available
		.word intsrc_lsr	; 011: LSR change
		.word intsrc_ignore	; 100: not possible, ignore
		.word intsrc_ignore	; 101: not possible, ignore
		.word intsrc_rxto	; 110: Receive timeout
		.word intsrc_ignore	; 111: not possible, ignore

; intsrc_txr:				; We may transmit data.
; 		DEBUGON
; 		JSR I dequeue		; Any characters to send?
; 		DEBUGOFF
; 		SZA
; 		JMP next_int		; Nope.
; 		LOAD RET1
; 		OUT tty.TTY0 tty.THR	; Send it out.
; 		JMP intsrc_txr

intsrc_rxr:				; There is queued data to receive.
                IN tty.TTY0 tty.RHR	; Read a character
		JSR I enqueue		; Enqueue it for the user process.

		IN tty.TTY0 tty.LSR	; More characters?
		AND BIT0
                SZA
                JMP intsrc_rxr		; If so, read again.
		
		JMP next_int

intsrc_rxto:				; Timed out reading FIFO (ignored).
intsrc_msr:				; The MSR has changed. We ignore this.
intsrc_lsr:				; The LSR has changed. We ignore this.
intsrc_msr:				; MSR change (ignored)
intsrc_ignore:	JMP next_int
next_port:	return()		; TODO: Implement multiple port handling
seven:		.data 7
enqueue:	.word erb0w		; Write to event queue
dequeue:	.word erb1r		; Read from event queue 1
.endscope

///////////////////////////////////////////////////////////////////////////////
//
// PRIVATE CODE BELOW
//
///////////////////////////////////////////////////////////////////////////////

.pushns prv

;;; Check if a character is available, return boolean value.

cts:		clear_errno()
		LI tty.LSR
		OR ARG0			; Get the LSR address for this UART
		STORE RET0
		IN I RET0		; Query the UART
		STORE RET0		; Store for comparison
		LI tty.LSR_THR		; THR ready for data transmission?
		AND RET0
		SNZ
		JMP os.rtt0		; Not ready.
		JMP os.rtt1		; Ready.

;;; Send out a character.

send:		clear_errno()
		LOAD ARG1
		OUT I ARG0		; Send character to THR (UART base addr)
		LOAD ARG0
		RTT

		
;;; Check if a character is available, return 0 (no), 1 (yes).

dsr:		clear_errno()
		LI tty.LSR
		OR ARG0
		STORE RET0
		IN I RET0
		STORE RET0
		LI tty.LSR_RDR
		AND RET0
		SNZ
		JMP os.rtt0
		JMP os.rtt1

;;; Read a character. Block and wait for one if none is available.

read:		
.scope
		clear_errno()
		LI tty.LSR
		OR ARG0
		STORE RET0

wait_for_char:	IN I RET0		; Wait for a character
		STORE RET1
		LI tty.LSR_RDR
		AND RET1
		SNZ
		JMP wait_for_char

		IN I ARG0		; Receive the character
		AND BYTELO		; Keep the low 8 bits
		JMP os.rttval		; Return the character

.endscope

;;; Read status of UART. Always returns the LSR in RET0 and MSR in RET1.

status:		
		clear_errno()
		LI tty.LSR
		OR ARG0
		STORE RET1

		IN I RET1
		STORE RET0		; Yield the LSR in RET0

		ISZ RET1		; Increment RET1 (never skips)
		IN I RET1		; The MSR comes right after the LSR
		STORE RET1		; Yield the MSR in RET1

		RTT			; Done.

;;; Control the UART.
;;;
;;; Depending on the opcode, additional arguments may be necessary.
;;;
;;; Arguments
;;;   AC:	Device Control (devctl) opcode.
;;;   ARG0:	Device handle.
;;; 
;;; Return Value:
;;;
;;;     -1 if the call was unknown. Otherwise, it depends on the code.
;;;
;;; Errors:
;;;
;;;     ENOP if the call was unknown. Otherwise, it depends on the code.

ctl:		
.scope
		STORE RET0		; Keep the AC
		clear_errno()
		SIA(OSI0, jmptab)

loop:		LOAD I OSI0
		SNZ			; Is it zero?
		JMP invalid		; The call wasn't found.
		XOR RET0		; Compare against RET0
		SNZ
		JMPII OSI0		; Jump to the call, never return.
		LOAD I OSI0		; Step past the address entry.
		JMP loop		; Loop again.

invalid:	FARJMP(os.rttnop)

jmptab:		.data devctl.CFGTTY @setbps+0
		.data 0
		
.endscope


;;; Dev Ctl: CFGTTY. Configure TTY speed, parity, etc.
;;;
;;; Arguments
;;;   ARG0:	Device handle.
;;;   ARG1:	Speed divider value. Use one of the tty.Bxxxx values.
;;;   ARG2:	Line options. Or together tty.LCR_xxx values (except DLEN).
;;; 
;;; return Value:
;;;     0       Success.
;;;
;;; Errors:
;;;     None.

setbps:
                LOR(ARG3, ARG0, tty.LCR) ; Convert dev handle to LCR I/O address
		LAND(ARG2, ARG2, &3f)	; Mask out break and DLEN

		LI tty.LCR_DLEN		; Get access to the baud rate divisors
		OR ARG2
		OUT I ARG3

		LOAD ARG1		; Divisor, low byte
		GETLOCHAR()		; Get low byte
		OUT I ARG0		; Handle == LSB of baud rate divisor

		ISZ ARG0		; Increment ARG0, never skips
		LOAD ARG1
		GETHICHAR()		; Get high byte
		OUT I ARG0		; Handle+1 == MSB of baud rate divisor

		LOAD ARG2
		OUT I ARG3		; Disable the rate divisor regs and
		                        ; configure TTY.

		ISZ ARG0		; Increment ARG0, never skips
		LI tty.FCR_INIT		; FIFOs on, 1-byte
		OUT I ARG0

		FARJMP(os.rtt0)		; Return success.


.popns
;;; End of private code
		
.popns

;;; End of file.
