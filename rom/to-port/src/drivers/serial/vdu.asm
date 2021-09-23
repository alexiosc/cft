;;; -*- cftasm -*-
                
;;; TTY driver for the VDU.
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
.pushns vdu

;;; Note, drivers don't include detection and initialisation routines, these are
;;; done in the boot/POST page to save memory.

///////////////////////////////////////////////////////////////////////////////
//
// JUMP TABLE
//
///////////////////////////////////////////////////////////////////////////////

;;; Jump table for DFP serial driver

.equ base @			         

table:          .data &0000	        ; Alows easy detection
cts:            .word prv.cts           ; Clear to send? (always yes for the DFP)
send:           .word prv.send
dsr:            .word prv.dsr
read:           .word prv.read          ; Blocking read
status:         .word os.rttnop         ; *** NOT AVAILABLE
ctl:            .word os.rttnop         ; *** NOT AVAILABLE
name:		.strp "vdu" 0 0 0	; Name of the device, 6 chars max.

///////////////////////////////////////////////////////////////////////////////
//
// INTERRUPT SERVICE ROUTINE
//
///////////////////////////////////////////////////////////////////////////////
		
;;; Interrupt Service Routine.
;;;
;;; IRQ served:	6
;;; 
;;; This code checks if there's a character waiting, and queues it.

isr:
.scope
		enter_sub()

check_source:	IN vdu.SR		; Read the status register
		AND kbis
		SNZ
		JMP done

check_kbd:	IN vdu.KBD
		SNA			; bit 15 set if received a char
		JMP done

got_packet:	AND BYTELO		; Get least significant 8 bits
		STORE ISRR1		; Store for processing
		LI &e0			; Extended scan code?
		IFEQJMP(ISRR1, got_e0)
		LI &e1			; No break code?
		IFEQJMP(ISRR1, got_e1)
		LI &f0			; Break code?
		IFEQJMP(ISRR1, got_f0)
		LOAD ISRR1		; Save the keysym
		OR p0.KBD_ST
		STORE p0.KBD_KEYSYM
		LI 0			; Reset the state machine
		STORE p0.KBD_ST
		ISZ p0.KBD_SEQ		; Increment the sequence number
		JMP @+1

		JSR I p0.KBD_HNDVEC	; Jump to the keyboard interpreter 
		
done:		return()

got_e1:					; Treat E1 as E0 (so Pause = Ctrl+KPMult
got_e0:		ROR1(p0.KBD_ST, ext)	; Flag it as extended
		JMP done

got_f0:		ROR1(p0.KBD_ST, brk)	; Flat it s break
		JMP done
		
kbis:		.word vdu.SR_KBIS	; This bit is set on keyboard interrupts
enqueue:	.word erb0w		; Write to event queue
ext:		.data p0.KBF_EXTEND	; Extended keysym
brk:		.data p0.KBF_BREAK	; Break code
.endscope

///////////////////////////////////////////////////////////////////////////////
//
// PRIVATE CODE BELOW
//
///////////////////////////////////////////////////////////////////////////////

.pushns prv

;;; Check if a character is available, return boolean value.

cts:            clear_errno()
                JMP os.rtt1             ; The DFP is always ready to receive

;;; Send out a character.

send:
.scope
		enter_sub()
		clear_errno()

		;; In raw mode, all codepoints are printed uninterpreted.
		LI p0.VDF_RAW		; Are we in raw mode?
		AND p0.VDU_FLAGS
		SZA
		JMP char		; Yes. Interpret nothing.

		;; Codepoints >= 32 are printable, so do that directly.
		LI #11100000		; Use bit operators: faster
		AND ARG1
		SZA
		JMP char
		
		;; Interpret basic terminal control characters
		LI 10			; End of line? (unix style)
		IFEQJMP(ARG1, _nl)
		LI 12			; Form feed?
		IFEQJMP(ARG1, _ff)
		LI 13			; Carriage return?
		IFEQJMP(ARG1, _cr)
		LI 7			; Bell?
		IFEQJMP(ARG1, _bel)
		LI 1			; Test
		IFEQJMP(ARG1, _tst1)
		LI 2			; Test
		IFEQJMP(ARG1, _tst2)

char:		JSR I @+2		; print out a character
		JMP done
		.word putc

_ff:            JSR I @+3		; Form feed (clear screen)
		JSR I @_cr+2
		JMP done
		.word clrscr

_nl:            JSR I @+2		; New line
		JMP done
		.word nlcr

_cr:		JSR I @+2		; Carriage return
		JMP done
		.word cr

_tst1:
		LI 1
		ADD p0.VDU_ATTR
		STORE p0.VDU_ATTR
		LI &3f
		AND p0.VDU_ATTR
		STORE p0.VDU_ATTR
		OUT vdu.CPORT
		JMP done
_tst2:
		LOAD MINUS1
		ADD p0.VDU_ATTR
		STORE p0.VDU_ATTR
		LI &3f
		AND p0.VDU_ATTR
		STORE p0.VDU_ATTR
		OUT vdu.CPORT
		JMP done

_bel:           JSR I p0.VDU_BELVEC
		/JMP done		; Last one, no need to jump

done:		pop_retv()
		RTT
.endscope

;;; Check if a character is available, return 0 (no), 1 (yes). The DFP TTY
;;; doesn't have a separate query operation, and returns either a character or
;;; &8000 (no characters available). Since this consumes a character from the
;;; DFP output buffer, we store this character in RAM. The read call will then
;;; check to see if one is available and return it immediately.

dsr:            clear_errno()
		// ...
                // JMP os.rtt1             ; 1 = yes, there are characters
                JMP os.rtt0             ; 0 = no, no characters

;;; Read a character. Block and wait for one if none is available.

read:           clear_errno()
		// ...
                JMP os.rttval           ; Return them




///////////////////////////////////////////////////////////////////////////////
//
// KEYBOARD INTERPRETER ROUTINE
//
///////////////////////////////////////////////////////////////////////////////

;;; Subroutine: kbd_handler.
;;; 
;;; This routine converts keys and key combinations
;;; coming from the keyboard (as CFT keysyms, which are really just modified
;;; scancodes), interpreting them into character codepoints.
;;;
;;; This routine is vectored. Its address is stored at p0.KBD_HNDVEC, and can be
;;; changed to provide more advanced input methods.
;;;
;;; Arguments
;;;     None. (check state using p0.KBD_ registers)
;;; 
;;; Return Value:
;;;     None.
;;;
;;; Side effects:
;;;     p0.KBD_MODS: Updated with the current state of the modifier keys.
;;;
;;;     The character codepoint (or keysym) is inserted into the event queue of
;;;     the current process.

kbd_handler:
.scope

		;; Step 1: handle modifier keys.
.scope
		LMOV(ISRR1, 1)		; ISRR1: Bit value
		SIA(ISRI0, mod_table)	; ISRI0: Modifier table

loop:		RMOV(ISRR2, I ISRI0)	; ISRR2: scancode to test
		SNZ
		JMP done		; Zero? Done.

		XOR p0.KBD_KEYSYM	; Check for a make code
		SNZ
		JMP make		 

		LOAD ISRR2		; Check for a break code
		OR BIT15
		XOR p0.KBD_KEYSYM
		SNZ
		JMP break

next:		RSBL(ISRR1, ISRR1)	; Shift bit value left one place
		JMP loop

make:		ROR1(p0.KBD_MODS, ISRR1) ; Set the modifier flag.
		JMP next

break:		LOAD ISRR1
		XOR MINUS1
		AND p0.KBD_MODS
		STORE p0.KBD_MODS	; Clear the modifier flag.
		JMP next
done:

		;; Go no further if this is a key release.
		LOAD p0.KBD_KEYSYM
		SNN
		RET
		
.endscope

		;; Step 2: select the appropriate keymap.
.scope
		LMOV(ISRR1, 0)		; Table 0 by default
		LMOV(ISRR2, 1)		; Bit value
		SIA(ISRI0, mod_maps)

loop:		LOAD I ISRI0		; Load a modifier mask
		SNZ			; 0 = done
		JMP done

		AND p0.KBD_MODS		; Any bits set?
		SNZ
		JMP again		; Nope.

		ROR1(ISRR1, ISRR2)	; Set bit
again:		RSBL(ISRR2, ISRR2)	; Next bit
		JMP loop

done:		LIA p0.KBD_MAP0VEC	; ISRR1: address of the keymap
		ADD ISRR1
		STORE ISRR1
		SNZ			; Blank keymap?
		RET			; Done!
.endscope

		
		;; Step 3: look up the key in the key map. Use the key index
		;; first (it converts scan codes to indices in the key maps,
		;; which we then look up).

.scope

		RMOV(ISRI0, p0.KBD_MAPIDX)
		LMOV(ISRR2, 0)

loop:		RMOV(ISRR3, I ISRI0)	; Load a value from the table
		SNZ
		JMP done		; 0 = done

		GETLOCHAR()		; Check the LSB
		XOR p0.KBD_KEYSYM	; Break and Extended flags never match
		SNZ
		JMP found_lsb

		LOAD ISRR3		; Check the MSB
		GETHICHAR()
		XOR p0.KBD_KEYSYM
		SNZ
		JMP found_msb

again:		ISZ ISRR2		; Never skips
		JMP loop

found_lsb:      LOAD I ISRR1		; Index the keymap
		ADD ISRR2
		STORE ISRR1
		LOAD I ISRR1		; Load the value
		GETLOCHAR()		; Get the LSB
		JMP found

found_msb:	LOAD I ISRR1		; Index the keymap
		ADD ISRR2
		STORE ISRR1
		LOAD I ISRR1		; Load the value
		GETHICHAR()		; Get the LSB

found:		JMP I enqueue		; It RETurns for us.

done:		RET			; No character found, do nothing.

.endscope

mod_table:	.data &12 &59		; left/right Shift
		.data &14 &114		; left/right Ctrl
		.data &11 &111		; left/right Alt
		.data &11f &127		; Left/right Meta
		.data 0			; End of modifier table

mod_maps:	.data p0.KBM_SHIFT
		.data p0.KBM_CTRL
		.data p0.KBM_RALT
		.data 0

enqueue:	.word erb0w		; Write to event queue

.endscope

///////////////////////////////////////////////////////////////////////////////
//
// DEFAULT KEYMAP
//
///////////////////////////////////////////////////////////////////////////////

.include "generated/keymap.asm"

.popns

///////////////////////////////////////////////////////////////////////////////
//
// VDU TERMINAL FUNCTIONALITY
//
///////////////////////////////////////////////////////////////////////////////

;;; Macro: rbl7()
;;;
;;; Roll the AC left seven bits (128). The result will need to be masked to get
;;; a y ordinate of a VDU address.
;;;
;;; The shift is done in three instructions: two nybble rolls left and one bit
;;; roll right.
;;;
;;; Side effects:
;;;   L, AC.

.macro rbl7()
		RNL			; rbl7()
		RNL
		RBR
.end
		
;;; Macro: rbr7()
;;;
;;; Roll the AC right seven bits (128). The result will need to be masked to
;;; get a y ordinate of a VDU address.
;;;
;;; The shift is done in three instructions: two nybble rolls right and one bit
;;; roll left.
;;;
;;; Side effects:
;;;   L, AC.

.macro rbr7()
		RNR			; rbr7()
		RNR
		RBL
.end
		
;;; Macro: getx(reg)
;;;
;;; Get the X ordinate of a register holding a VDU address.
;;;
;;; Side effects:
;;;   AC.

.macro getx(reg)
		LOAD %reg		; getx(%reg)
		AND COLMASK
.end

		
;;; Macro: gety(reg)
;;;
;;; Get the Y ordinate of a register holding a VDU address.
;;;
;;; Side effects:
;;;   AC.

.macro gety(reg)
		LOAD %reg		; gety(%reg)
		AND ROWMASK
.end

		
;;; Macro: mkrow(reg)
;;;
;;; Turn %reg into a row ordinate by multiplying by 128.
;;;
;;; Side effects:
;;;   AC.

.macro mkrow(reg)
		LOAD %reg		; mkrow(%reg)
		rnl7()			; roll left 7 bits
		AND ROWMASK
.end

		
;;; Macro: mkaddr(col, row, tmp)
;;;
;;; Turn %row and %col into a VDU address. Uses a temporary register tmp.
;;;
;;; Side effects:
;;;   AC.
;;;   %tmp

.macro mkaddr(x, y)
		LOAD %x			; mkaddr(%x, %y)
		AND COLMASK
		STORE %tmp
		mkrow(%y)
		OR %tmp
.end

		
;;; Subroutine:	Set current attribute.
;;;
;;; Sets the foreground, background and attributes for subsequent VDU
;;; operations.
;;;
;;; Arguments
;;;     AC:	 The new colour attribute.
;;; 
;;; Return Value:
;;;     None.
;;;
;;; Side effects:
;;;     p0.VDU_ATTR stores the new colour attribute.

set_attr:
		OUT vdu.CPORT
		STORE p0.VDU_ATTR
		RET
		
;;; Subroutine:	cr (Carriage Return)
;;;
;;; Moves to the beginning of the line.
;;;
;;; Side effects:
;;;     DRVR0

cr:
		getx(p0.VDU_WIN0)	; Get left X ordinate of window
		STORE DRVR0
		
		gety(p0.VDU_CRSADDR)	; Get cursor row
		OR DRVR0		; Combine into a new location
		
		OUT vdu.HAR		; Move the VDU address
		OUT vdu.CAR		; Set the cursor location
		STORE p0.VDU_CRSADDR	; Store it for our own use
		RET


;;; Subroutine:	putc (print out a character)
;;;
;;; Prints out a character, wrapping and scrolling as necessary.
;;;
;;; Arguments:
;;;     ARG1:	the character to print.
;;; 
;;; Side effects:
;;;     DRVR0

putc:
.scope
		enter_sub()

		;; Print out as plain character
		LI vdu.CMD_PUTC		; XINC, WBC
		OR ARG1			; Add operand
                OUT vdu.CMD		; Execute command (31.5–62.5ns cycle)
		
		IN vdu.HAR		; This runs 750ns later. no need to WAIT.
		OUT vdu.CAR
		STORE p0.VDU_CRSADDR

		XOR p0.VDU_WIN1		; Right edge of screen/window?
		AND COLMASK
		SZA
		JMP done
		JSR nlcr		; New line. Scroll if needed.

		;; Done.
done:		return()
.endscope
		
		
;;; Subroutine:	nlcr (New Line, Carriage Return)
;;;
;;; Move to the next line, scrolling if necessary.
;;; 
;;; Side effects:
;;;     DRVR1
;;;     DRVR0

nlcr:
		;; Step 1: move to next line. Use the window settings.
		getx(p0.VDU_WIN0)	; Get the left ordinate of the window
		STORE DRVR0
		
		LI &80			; Line pitch
		ADD p0.VDU_CRSADDR
		AND ROWMASK		; Get row of next line
		STORE DRVR1		; Store for bounds check
		OR DRVR0		; Combine into a new location
		
		OUT vdu.HAR		; Set VDU address
		OUT vdu.CAR		; Set cursor address
		STORE p0.VDU_CRSADDR	; Store it for later.

		;; Step 2. Have we gone past the bottom of the window?
		LOAD p0.VDU_WIN1
		XOR p0.VDU_CRSADDR
		AND ROWMASK
		SZA
		RET

		enter_sub()
		JSR scroll_up
		JSR clreol
		return()
		
;;; Subroutine:	Scroll upwards (free line at bottom of screen)

scroll_up:
		LINC(p0.VDU_WIN0, &80)
		LINC(p0.VDU_WIN1, &80)
		LINC(p0.VDU_STADDR, &80)
		OUT vdu.SAR0
		RET
		
;;; Subroutine:	Scroll downwards

scroll_down:
.scope
		RADD1(p0.VDU_WIN0, data)
		RADD1(p0.VDU_WIN1, data)
		RADD1(p0.VDU_STADDR, data)
		OUT vdu.SAR0
		RET
data:           .word &ff80		; Minus one row
.endscope


;;; Subroutine:	Clear to end of line on current window.

clreol:
		vdu.WAIT()		; Wait for VDU to be idle
		getx(p0.VDU_CRSADDR)	; Set repetition count (width - curs pos)
		NEG
		STORE DRVR0
		getx(p0.VDU_WINSZ)
		ADD DRVR0
		ADD MINUS1		; Repetitions are always -1!
		OUT vdu.CRR
		
		LOAD p0.VDU_ATTR	; Set colours/attributes
		OUT vdu.CPORT
		LOUT(vdu.CMD, vdu.CMD_CLR) ; WBC, XINC, space
		vdu.WAIT()		; Wait for completion

		;; Restore VDU address
		ROUT(vdu.HAR, p0.VDU_CRSADDR)
		RET
		
;;; Subroutine:	Clear current window. 

clrscr:
.scope
		;; Get number of rows for this window.
		RMOV(DRVR0, p0.VDU_WIN0) ; Start address
		LOAD p0.VDU_WINSZ
		rbr7()			; roll 7 bits right
		STORE DRVR1
		LI &1ff
		AND DRVR1
		NEG
		STORE DRVR1		; DRVR1: -(number of rows)

		;; Get number of columns for this window.
		getx(p0.VDU_WINSZ)
		ADD MINUS1
		STORE DRVR2		; DRVR2: number of columns

		;; Set colours/attributes
		ROUT(vdu.CPORT, p0.VDU_ATTR)


loop:           ;; Set line address, repetitions and write. Each line-clearing
		;; cycle can take up to 60µs, so we'll have to WAIT() for the
		;; VDU.
		vdu.WAIT()		; Wait for VDU to be idle
		ROUT(vdu.HAR, DRVR0)
		ROUT(vdu.CRR, DRVR2)
		LOUT(vdu.CMD, vdu.CMD_CLR)
		LINC(DRVR0, &80)
		ISZ DRVR1
		JMP loop

		vdu.WAIT()		; Wait for final completion
		ROUT(vdu.HAR, p0.VDU_CRSADDR)
		RET

.endscope
		
;;; End of private code
                
.popns

;;; End of file.
