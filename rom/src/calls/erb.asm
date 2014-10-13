;;; -*- cftasm -*-
		
;;; Event Ring Buffer calls.
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

;;; We use ring buffers for interrupt-based I/O.
;;;
;;; These calls are organised in two asymmetrical groups:
;;;

;;; erb0: This FIFO is written to by the ISR and read by the user, so its write
;;;       call is a subroutine, not an OS call.
;;;
;;; erb1: This FIFO is written to by the user and read by the OS, so its read
;;;       call is a subroutine.
;;;
;;; Other calls are public calls.


///////////////////////////////////////////////////////////////////////////////
//
// EVENT FIFO 0
//
///////////////////////////////////////////////////////////////////////////////

;;; Subroutine:	 erb0w(value)
;;;
;;; Attempt to write a value to a ring buffer.
;;;
;;; Arguments:
;;;   AC:	value to add.
;;;
;;; Return value:
;;;   AC:	0 = Added successfully, 1 = FIFO full, value not added.

erb0w:
.scope
		//CLI
		STORE I ERB0_WPTR	; Store the value, autoincrement

		LOAD ERB0_WPTR		; Wrap the write pointer around
		AND p0.ERB0_PTR_MAX
		STORE ERB0_WPTR

		LOAD ERB0_WPTR
		XOR ERB0_RPTR		; Compare pointers
		SNZ
		JMP overrun

		STORE p0.ERB0_STATE	; Mark as non-empty (*)
		//SEI
		LI 0
		RET

overrun:	RADD1(ERB0_WPTR, MINUS1) ; Decrement the write pointer
		LOAD MINUS1
		STORE p0.ERB0_STATE	; Save FIFO state
		//SEI
		RET
.endscope

;;; (*) Verification: the result of the XOR is non-zero, and it's also non-FFFF
;;; as the event FIFOs are in bank 0, so the top three bits would be zero
;;; anyway. If they're not, something is deeply wrong with the runtime and this
;;; is the least of our worries (we probably also have corrupted stacks, return
;;; values, and are about to crash).
		
		
;;; erb0r()
;;;
;;; Attempt to read a value to a ring buffer.
;;;
;;; Arguments:
;;;   None.
;;;
;;; Return value:
;;;   RET0:	0: everything okay.
;;;             -1: underrun (FIFO empty)
;;;   RET1:	Value from FIFO.

erb0r:
.scope
		CLI			; Critical section!
		LOAD ERB0_RPTR		; Check for underrun
		STORE TMP15		; Keep the read pointer for later
		XOR ERB0_WPTR
		SNZ
		JMP underrun

		LOAD I TMP15
		STORE RET1		; Value for FIFO

		LI 1			; ptr = (ptr + 1) % fifo_size
		ADD ERB0_RPTR
		AND p0.ERB0_PTR_MAX
		STORE ERB0_RPTR

		SEI			; End of critical section.
                JMP os.rtt0		; Done.

underrun:	STORE p0.ERB0_STATE     ; Save FIFO state (AC is always 0 here)
		STORE RET1		; RET1 = 0
		SEI			; End of critical section.
		JMP os.rttminus1
.endscope
		
		
;;; erb0q(value)
;;;
;;; Query the state of the Event Queue.
;;;
;;; Arguments:
;;;   None.
;;;
;;; Return value:
;;;   RET0:	0 if the FIFO is empty, 1 if non-empty, -1 if full.
;;;
;;; Errors:	
;;;   None, and errno not modified.

erb0q:
.scope
		CLI			; Critical section

		LOAD ERB0_RPTR		; Check for empty FIFO
		XOR ERB0_WPTR
		SNZ
		JMP empty

		LI 1			; Check for full FIFO
		ADD ERB0_RPTR
		AND p0.ERB0_PTR_MAX
		XOR ERB0_WPTR
		SNZ
		JMP full

non-empty:	LI 1
		STORE p0.ERB0_STATE	; Save non-empty FIFO state
		SEI
		JMP os.rttval		; Non-empty, non-full FIFO.

empty:          STORE p0.ERB0_STATE	; Save state (AC always 0 here)
		SEI
		JMP os.rttval		; 0 = empty

full:           LOAD MINUS1		; -1 = full
		STORE p0.ERB0_STATE	; Save state
		SEI
		JMP os.rttval		; Return -1

.endscope


///////////////////////////////////////////////////////////////////////////////
//
// EVENT FIFO 1
//
///////////////////////////////////////////////////////////////////////////////

;;; erb1w(value)
;;;
;;; Attempt to write a value to a ring buffer.
;;;
;;; Arguments:
;;;   AC:	value to add.
;;;
;;; Return value:
;;;   RET0:	0 = Added successfully, 1 = FIFO full, value not added.

erb1w:
.scope
		STORE ARG0

		;; Wait for the buffer to not be full. The ISR does this in the
		;; background.
wait:		LOAD p0.ERB1_STATE
		SNN
		JMP wait

		CLI
		LOAD ARG0
		STORE I ERB1_WPTR	; Store the value, autoincrement

		LOAD ERB1_WPTR		; Wrap the write pointer around
		AND p0.ERB1_PTR_MAX
		STORE ERB1_WPTR

		LOAD ERB1_WPTR		; Check for full FIFO
		XOR ERB1_RPTR
		SNZ
		JMP overrun

		STORE p0.ERB1_STATE	; Save FIFO state (non-empty)
		SEI
		JMP os.rtt0		; All's well.

overrun:	RADD1(ERB0_WPTR, MINUS1) ; Decrement the write pointer
		LOAD MINUS1
		STORE p0.ERB1_STATE	; Save state
		SEI
		JMP os.rttval
.endscope
		
		
;;; Subroutine: erb1r()
;;;
;;; Attempt to read a value to a ring buffer.
;;;
;;; Return value:
;;;   AC:	0: everything okay, -1 on underrun (FIFO empty).
;;;   RET1:	Value from FIFO.

erb1r:
.scope
		CLI
		LOAD ERB1_RPTR		; Check for underrun
		STORE TMP15		; Keep the read pointer for later
		XOR ERB1_WPTR
		SNZ
		JMP empty

		LOAD I TMP15
		STORE RET1

		LI 1			; ptr = (ptr + 1) % fifo_size
		ADD ERB1_RPTR
		AND p0.ERB1_PTR_MAX
		STORE ERB1_RPTR

		SEI

		LI 1
		STORE p0.ERB1_STATE	; If the FIFO was full before, it's not now.
		LI 0
		RET

empty:	        LI 0
		STORE p0.ERB1_STATE	; Save FIFO state (empty)
		LOAD MINUS1
		SEI
		RET
.endscope
		
		
;;; erb1q(value)
;;;
;;; Query the state of the Event Queue.
;;;
;;; Arguments:
;;;   None.
;;;
;;; Return value:
;;;   RET0:	0 if the FIFO is empty, 1 if non-empty, -1 if full.
;;;
;;; Errors:	
;;;   None, and errno not modified.

erb1q:
.scope
		CLI			; Critical section

		LOAD ERB1_RPTR		; Check for empty FIFO
		XOR ERB1_WPTR
		SNZ
		JMP empty

		LI 1			; Check for full FIFO
		ADD ERB1_RPTR
		AND p0.ERB1_PTR_MAX
		XOR ERB1_WPTR
		SNZ
		JMP full

non-empty:	LI 1
		STORE p0.ERB1_STATE	; Save non-empty FIFO state
		SEI
		JMP os.rttval		; Non-empty, non-full FIFO.

empty:          STORE p0.ERB1_STATE	; Save state (AC always 0 here)
		SEI
		JMP os.rttval		; 0 = empty

full:           LOAD MINUS1		; -1 = full
		STORE p0.ERB1_STATE	; Save state
		SEI
		JMP os.rttval		; Return -1

.endscope


;;; End of file.
