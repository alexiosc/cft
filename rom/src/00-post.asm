;;; -*- cftasm -*-
		
;;; A test program for the Javascript CFT Emulator.
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

.bank &80

;;; Fill the memory with SENTINEL instructions, then overwrite with assembled
;;; code. This is so we can catch addresses which don't contain valid code.
&8000:		.fill &2000 SENTINEL
&8000:		

.pushns post

.equ ITTY_DET R &0ff			; Index register for detecting TTYs
.equ IMSD_DET R &0fe			; Index register for detecting MSDs


///////////////////////////////////////////////////////////////////////////////
//
// Local macros
//
///////////////////////////////////////////////////////////////////////////////

;;; Macro: SKIP_IF_HWDIS(hwc_bit)
;;;
;;; Execute the next instruction if and only if the device corresponding to the
;;; specified HWC_xxx flag is disabled. The ‘next’ instruction is the
;;; instruction after the macro. If the device isn't disabled, the next
;;; instruction is skipped.
;;;
;;; Side effects:
;;;   AC: clobbered
;;;   PC: modified for jump
		
.macro IF_HWDIS(bitvalue)
		LOAD p0.HWDIS
		LOAD @+5		; IF_HWDIS(%bitvalue)
		AND p0.HWDIS
		SZA
		JMP @+3			; Skip to first instruction after macro
		JMP @+3			; Skip to 2nd instruction after macro
		.word %bitvalue
.end

///////////////////////////////////////////////////////////////////////////////
//
// 8000: Early boot, diagnostics, hardware discovery and boot loader.
//
///////////////////////////////////////////////////////////////////////////////

vectable:
.include "base-vectable.asm"

start:
.scope
		;; Initialise the early vector table. Assumption, we have at
		;; least 1 kW of RAM and it's acccessible at &0000-&03FF,
		;; probably a safe assumption. ;)

.scope
		LIA vectable
		STORE I10
		LIA R base_vector_table
		STORE I11
loop:		LOAD I I10
		SNZ
		JMP done
		STORE I I11
		JMP loop
done:		
.endscope

		;; Delay a bit, let some hardware stabilise after reset.
		JSR I DELAY

		;; Set up the data and return stacks and Event FIFOs. These will
		;; later by used by Forth too.
.scope
		RMOV(SP, d0)
		RMOV(RP, @d0+1)
		RMOV(ERB0_WPTR, @d0+2)
		STORE ERB0_RPTR
		RMOV(p0.ERB0_PTR_MAX, @d0+3)
		RMOV(ERB1_WPTR, @d0+4)
		STORE ERB1_RPTR
		RMOV(p0.ERB1_PTR_MAX, @d0+5)
		JMP post_d0
d0:		.data config.sp_start
		.data config.rp_start
		.data config.fifo0_start
		.data @config.fifo0_start|config.fifo_szmask
		.data config.fifo1_start
		.data @config.fifo1_start|config.fifo_szmask
post_d0:
.endscope
		;; Initialise the memory allocation bitmap
		JSR init_membitmap

		;; Disable halt-on-bus error, otherwise probing for missing
		;; devices will cause halts.
		dfp.disef(dfp.FTR_HOB)	; No halt on bus errors (for emulator)

		;; Start off assuming we're running on physical hardware
		LMOV (p0.HWENV, p0.HWE_HW)
		
		;; Override the startup mode (sets p0.HWDIS)
		JSR mode_override

		;; Prepare the counters for TTYs and MSDs.
		LPUSH(SP, p0.TTY0_PTR)	  ; Page 0, so using L macros
		RPUSH(SP, NULLDRV)	  ; Fill with NULL drivers
		LI @p0._ttyNp-p0._tty0p   ; Magic to get count
		JSR I MEMSET

		LPUSH(SP, p0.MSD0_PTR)	  ; Page 0, so using L macros
		RPUSH(SP, NULLDRV)	  ; Fill with NULL drivers
		LI @p0._msdNp-p0._msd0p	  ; Magic to get count
		JSR I MEMSET

		;; Initialise the interrupt table
		JSR init_inttable

		;; Detect hardware
		JSR detect_mbu_and_mem
		JSR detect_dfp
		JSR detect_irc
		JSR detect_tty
		JSR detect_vdu
		JSR detect_rtc

		; SIA(ARG0, p0.TTYA)
		; RMOV(ARG1, p0.TTY1_PTR)
                ; syscall(T_TTYSEL)	; Also select this device for I/O.

		;; Choose the console device
		// JSR choose_console
		SIA(ARG0, p0.TTYA)
		RMOV(ARG1, p0.TTY5_PTR)
                syscall(T_TTYSEL)	; Also select this device for I/O.


		;; Enable a useful feature set, useful mostly on emulators
		LI dfp.FTR_HOB dfp.FTR_HOS ; Halt on bus errors and SENTINEL
		ENEF

		LI 0			; Clear AC
		NOT			; Invert (&ffff)
		SOR			; Set OR

		;; Delay a while for the benefit of the JS emulator, if we're
		;; running under it.
.scope
		LOAD p0.HWENV
		LI p0.HWE_JS
		XOR p0.HWENV
		SZA
		JMP done
		LI 25
		NEG
		STORE R15
again:		SOR
		LIA 0
		JSR I DELAY
		ISZ R15
		JMP again
done:		
.endscope

///////////////////////////////////////////////////////////////////////////////
//
// HARDWARE INITIALISATION DONE, INTERRUPTS ENABLED BEYOND THIS POINT
//
///////////////////////////////////////////////////////////////////////////////

		;; I lied. Enable interrupts now.
		SEI

		; ;; Set the console
		; ;; TODO: Remove this.
		; SIA(ARG0, p0.TTYA)
		; RMOV(ARG1, p0.TTY1_PTR)
                ; syscall(T_TTYSEL)	; Also select this device for I/O.

		;; Print out the banner
		RMOV(R11, RETV)
		LOAD @+3
		JSR I PUTSP
		JMP @+2
		.word dfp_banner

		
		RMOV(RETV, R11)
; banner:		.word dfp_banner
		
		JSR hwinfo

		;; TODO: Remove this.
.scope


		; SIA(ARG0, p0.TTYA)
		; RMOV(ARG1, p0.TTY1_PTR)
                ; syscall(T_TTYSEL)	; Also select this device for I/O.

;;; Simple test of drivers (echo characters)
; again:
;
; 		TRAP I T_ERB0R		; Read from FIFO
; 		LOAD RET0
; 		SZA
; 		JMP again
;
; 		; LOAD RET1
; 		; callcdrv(p0.TTYA, p0.TTYA_SEND)
; 		; LOAD RET1
; 		; OUT tty.TTY0 tty.THR	; Echo the character
;
; 		LOAD RET1
; 		callcdrv(p0.TTYB, p0.TTYB_SEND)
;		
; 		; LOAD RET1
; 		; OR BIT8
; 		; OUT vdu.CMD		; Echo to the VDU
; 		; IN vdu.HAR
; 		; OUT vdu.CAR
; 		JMP again
.endscope



///////////////////////////////////////////////////////////////////////////////
		


		;; TODO: Remove this.
		FARJMP(romforth.romforth)
		HALT

		;; Scan for ROMs
		;; TODO: Reinstate ROM entry point scanning code.


		

.scope
		LI p0.HWC_MBU
		AND p0.HWENV		; Do we have an MBU?
		SZA
		/JMP have_mbu

no_mbu:
.scope
		RMOV(TMP14, d0)		; Start at &2000
		STORE I15
loop:           LOAD I I15
		XOR magic		; Check for magic #1
		SZA
		JMP next
		LOAD I I15
		XOR @magic+1
		SZA
		JMP next

found_one:	LOAD TMP15
		LOAD I I15		; Skip the origin
		LOAD I I15		; Load the number of programs

		NEG
		STORE TMP14
		LOAD I I15		; Skip the reserved word

parse_program:	
		;; TODO: decode the boot descriptor here.

		LOAD I15
		PRINTH
		PRINTSP
		LINC(I15, 15)		; Skip the name for now
		LOAD I I15		; Entry point
		PRINTH
		PRINTNL
		ISZ TMP14
		JMP parse_program
		
		
next:           RADD1(TMP15, d0)	; Step by &1000
		SNZ			; Wrapped around? If so we're done.
		JMP done
		STORE I15
		JMP loop

done:
		HALT
		
.endscope

have_mbu:
.scope
		HALT
.endscope

d0:		.data &1000
magic:		.word &0cf7		; Magic (CFT)
		.word &1234
		
.endscope
		
///////////////////////////////////////////////////////////////////////////////



;;; TODO:	 Reinstate this, as the collection of ‘test’ programs.

; 		LI 0			; Clear the AC
; 		HALT			; Halt and wait for user
		
; 		LSR			; Read the SR
; 		SOR			; Set the OR to that value
; 		STORE R 3		; Jump to the address in AC
; 		JMP I R 3

; welcome:	.word _welcome
		
///////////////////////////////////////////////////////////////////////////////
//
// DFP:	detect and initialise
//
///////////////////////////////////////////////////////////////////////////////

detect_dfp:	
.scope
		enter_sub()
		QEF			; Do we have a DFP?
		STORE R10
		AND detect_mask
		STORE R11
		SNZ
		JMP ret			; Not found, bail.
		LOR1(p0.HWCONFIG, p0.HWC_DFP)

		LI dfp.QEF_TTY		; Do we have a console?
		AND R10
		SNZ
		JMP ret			; Nope.
		LOR1(p0.HWTTYS, p0.HWT_DFP)
		LOAD drv_handle
		JSR register_tty	; Register the console as a TTY

		RMOV(p0.ISR6VEC, dfp_isr) ; Install DFP ISR

		LOAD R11		; What are we running on?
		IFEQJMP(detect_c, c)	; Running under C emulation?

		LOAD R11		; What are we running on?
		IFEQJMP(detect_v, v)	; Running under Verilog emulation?
		
		LOAD R11		; What are we running on?
		IFEQJMP(detect_j, js)	; Running under JavaScript emulation?

hw:		LMOV(p0.HWENV, p0.HWE_HW) ; Must be running on hardware
		JMP ret
		
c:		LMOV(p0.HWENV, p0.HWE_C)
		JMP ret
		
js:		LMOV(p0.HWENV, p0.HWE_JS)
		JMP ret

v:		LMOV(p0.HWENV, p0.HWE_V)

ret:		return()
		
detect_mask:	.word dfp.QEF_DET
detect_c:	.word dfp.QEF_VCE
detect_v:	.word dfp.QEF_VLE
detect_j:	.word dfp.QEF_VJE
drv_handle:	.data drv.ser.dfp.base
dfp_isr:	.word drv.ser.dfp.isr

.endscope

///////////////////////////////////////////////////////////////////////////////
//
// IRC:	detect and initialise
//
///////////////////////////////////////////////////////////////////////////////

;;; Note: the IRC ignores year modes and is always enabled.

;;; Initialise the interrupt handler table
init_inttable:
.scope
		RMOV(p0.ISRVEC, _isr)	; The default ISR (with or without IRC)
		LIA NULL_JSR		; ISRn vectors are simple subroutines.
		STORE p0.ISR0VEC	; Unrolled loop is smaller AND faster.
		STORE p0.ISR1VEC
		STORE p0.ISR2VEC
		STORE p0.ISR3VEC
		STORE p0.ISR4VEC
		STORE p0.ISR5VEC
		STORE p0.ISR6VEC
		STORE p0.ISR7VEC
		RET
_isr:		.word isr
.endscope

;;; Detect and initialise the IRC
detect_irc:
.scope
		enter_sub()
		IN irc.ISR		; Read the ISR
		AND detect_irc
		XOR detect_irc
		SZA
		RET
		LOR1(p0.HWCONFIG, p0.HWC_IRC)
		return()

detect_irc:	.word irc.ISR_DETECT	; IRC detection pattern
.endscope

///////////////////////////////////////////////////////////////////////////////
//
// TTY:	detect and initialise
//
///////////////////////////////////////////////////////////////////////////////

;;; Detection strategy: check for the existence of the 16550 scratchpad
;;; registers. These are spare read/write registers on these devices that the
;;; user can do anything with. They have no special meaning to the UART, so
;;; they're ideal for detection purposes (since the addresses of the UARTs are
;;; fixed and we're just checking for presence).

detect_tty:
.scope
		IF_HWDIS(p0.HWC_TTY)
		RET
		enter_sub()

		RMOV(TMP11, num)	; Number of ports.
		SIA(ITMP0, addrtable)	; I/O address table
		SIA(ITMP1, flagtable)	; Flag table
		SIA(ITMP2, handletable)	; Handle table

nextport:	RMOV(TMP14, I ITMP0)	; I/O address of the SPR
		RMOV(TMP13, I ITMP1)	; The TTY flag
		RMOV(TMP10, I ITMP2)	; The driver handle
		
		LOR(TMP12, TMP14, tty.SPR) ; Get this unit's SPR
		SIA(ITMP3, patterns)
nextpat:	RMOV(TMP15, I ITMP3)	; Get a pattern
		IOT I TMP12		; Write to the SPR, read value back.
		IFNEQJMP(TMP15, notfound)
		LOAD TMP15		; More patterns?
		IFNZ
		JMP nextpat

		ROR1(p0.HWTTYS, TMP13)	; Flag the particular port
		LOR1(p0.HWCONFIG, p0.HWC_TTY) ; Also flag the whole TTY board

		;; Initialise the UART to sane defaults now.
init:	        RMOV(RET0, I ctl)		; Look up the driver call addr
		RMOV(ARG0, I TMP10)		; ARG0: handle
		RMOV(ARG1, speed)		; ARG1: bps rate
		LMOV(ARG2, tty.LCR_INIT)	; ARG2: N,8,1
		LI devctl.CFGTTY		; CFGTTY opcode
		TRAP I RET0			; Execute the driver's ctl call.

register:	LOAD TMP10
		JSR register_tty	; Register the console as a TTY

		RMOV(p0.ISR3VEC, tty_isr) ; Install TTY ISR

enable_ints:	LOR(TMP9, I TMP10, tty.IER)
		LI tty.IER_INIT		; Enable Rx/Tx interrupts
		OUT I TMP9
		irc.enable(3)

notfound:	ISZ TMP11
		JMP nextport		; Try the next port

		return()

num:		.word -4		; Number of ports, negated

addrtable:	.word @tty.TTY0&&3ff	; TTY0 SPR
		.word @tty.TTY1&&3ff	; TTY1 SPR
		.word @tty.TTY2&&3ff	; TTY2 SPR
		.word @tty.TTY3&&3ff	; TTY3 SPR

flagtable:	.word p0.HWT_TTY0
		.word p0.HWT_TTY1
		.word p0.HWT_TTY2
		.word p0.HWT_TTY3

handletable:	.word drv.ser.tty.base0
		.word drv.ser.tty.base1
		.word drv.ser.tty.base2
		.word drv.ser.tty.base3

patterns:	.data &55 &aa &00	; Patterns to write to the SPR
speed:		.data config.default_tty_speed
ctl:		.word drv.ser.tty.tty0.ctl ; Any of the four ttys will do here.
tty_isr:	.word drv.ser.tty.isr

.endscope

		
///////////////////////////////////////////////////////////////////////////////
//
// VDU:	detect and initialise
//
///////////////////////////////////////////////////////////////////////////////

detect_vdu:     
.scope

		IF_HWDIS(p0.HWC_VDU)	; Is the VDU disabled?
		RET			; Then return.
		IN vdu.SR
		AND data
		XOR @data+1
		SZA
		RET			; Not found. Return.

		;; We have a VDU. Initialise it.
		ROR1(p0.HWCONFIG, @data+2)
		FARJMP(vdu_init)

data:		.data vdu.SR_VER_MSK	; VDU version mask
		.data vdu.SR_VER5	; VDU expected value
		.data p0.HWC_VDU	; The VDU flag

.endscope


///////////////////////////////////////////////////////////////////////////////
//
// RTC: detect and initialise
//
///////////////////////////////////////////////////////////////////////////////

;;; Strategy: same as for memory: write a value to two memory locations in
;;; different NVRAM windows, check for retention. Make sure to restore the value
;;; when done.

detect_rtc:	
.scope

		;; Store values for later
		LOUT(rtc.OFS, 0)	; Set NVRAM window 0
		RIN(TMP15, rtc.NVR 0)	; Load NVRAM addr &000
		LOUT(rtc.OFS, 1)	; Set window 1 (addr &010-&00F)
		RIN(TMP14, rtc.NVR 0)	; Load NVRAM addr &010

		;; Write two values
		LOUT(rtc.OFS, 0)
		LOUT(rtc.NVR, &aa)
		LOUT(rtc.OFS, 1)
		LOUT(rtc.NVR, &55)

		;; Check them back (tests window setting and retention)
		LOUT(rtc.OFS, 0)
		RIN(TMP13, rtc.NVR 0)
		LI &aa
		IFNEQJMP(TMP13, notfound)

		LOUT(rtc.OFS, 1)
		RIN(TMP13, rtc.NVR 0)
		LI &55
		IFNEQJMP(TMP13, notfound)

found:		;; Found it. Restore values
		LOUT(rtc.OFS, 0)	; Set NVRAM window 0
		ROUT(rtc.NVR 0, TMP15)	; Load NVRAM addr &000
		LOUT(rtc.OFS, 1)	; Set NVRAM window 0
		ROUT(rtc.NVR 0, TMP14)	; Load NVRAM addr &000

		;; Initialise the clock.
		LOUT(rtc.OFS, 8)
		LOUT(rtc.NVR 8, &40)	; Enable RTC read mode
		RIN(TMP15, rtc.NVR 9)	; Get seconds, store for later
		LOUT(rtc.NVR 8, &80)	; Enable RTC write mode
		LI &7f			; Clear the STOP bit, write it back.
		AND TMP15
		OUT rtc.NVR 9
		LOUT(rtc.NVR 8, &40)	; Set up for reading again

		;; Set the RTC bit.
		ROR1(p0.HWCONFIG, data)
notfound:	RET

data:		.data p0.HWC_RTC	; The RTC flag
		
.endscope

///////////////////////////////////////////////////////////////////////////////
//
// Memory allocation: initialise
//
///////////////////////////////////////////////////////////////////////////////

;;; Initialise the memory allocation bitmap. The bitmap uses 16 consecutive
;;; locations to denote the 256 8 kW memory banks available. Each bit
;;; represents the allocation state of a bank, with 0 denoting a free bank and
;;; 1 denoting an allocated bank.
;;;
;;; The bitmap is initialised to with all banks allocated. Any RAM banks found
;;; (except bank 00, the zero page) are then marked free by the memory detection
;;; routines.

init_membitmap:
.scope
		enter_sub()

		LPUSH(SP, p0.MLC_BITMAP0) ; Page 0, so using L macros
		RPUSH(SP, MINUS1)	  ; Fill with &FFFF
		LI 16
		JSR I MEMSET

		return()
.endscope

		
///////////////////////////////////////////////////////////////////////////////
//
// MBU AND MEMORY DETECTION
//
///////////////////////////////////////////////////////////////////////////////

;;; Detect memory. First, detect if we have an MBU.
;;;
;;; Strategy:
;;;  * Enable the MBU and map first ROM page to &2000.
;;;  * See if value of &2000 changes.
;;;  * See if &2000 is now writeable.
;;;  * If non-writeable, we have an MBU.
;;;  * Otherwise, we don't.

detect_mbu_and_mem:
.scope
		enter_sub()
		
		;; Is the MBU disabled?
		IF_HWDIS(p0.HWC_MBU)	; Is the MBU disabled?
		JMP detect_mem_no_mbu	; Scan for memory without an MBU
		
		;; Control group
                LOAD I bank7
		STORE R10		; For sanity checking
		NOT
		STORE I bank1
		STORE R11		; For sanity checking

		;; Enable and configure the MBU.
		mbu.LSMB(7, &83)	; Map 32kW of ROM pages
		mbu.LSMB(6, &82)
		mbu.LSMB(5, &81)
		mbu.LSMB(4, &80)
		mbu.LSMB(3, &80)	; Same page mapped three times
		mbu.LSMB(2, &80)	; 
		mbu.LSMB(1, &80)	; 
		mbu.LSMB(0, 0 mbu.MBU_ENABLE) ; also enables MBU

		;; Sanity check: mem[&8000] shouldn't have changed since
		;; enabling the MBU.
		CMPEQ(I bank7, R10)	; ROM still mapped properly?
		SZA
		JMP b0rken		; No, the MBU is broken.

		;; 1. Test for MBU (&2000 and &8000 should both map to ROM page
		;; 0 (i.e. page &80).
		CMPEQ(I bank7, I bank1)
		SZA		        ; Matching values?
		JMP detect_mem_no_mbu	; No. Detect memory in 64kW address space

		;; 2. Is the mapped bank a ROM bank?
		LOAD I bank1
		NOT			; if mem[&2000] == R10, then this is RAM
		STORE I bank7
		CMPEQ(I bank7, R10)
		SZA
		JMP detect_mem_no_mbu

		;; Both tests pass. Found an MBU!
		LOR1(p0.HWCONFIG, p0.HWC_MBU)
		JMP detect_mem_with_mbu

b0rken:		LI post.ERR_MBU		; Output error code and crash
		JMP I R POSTFAIL

bank7:		.data &8000
bank1:		.word &2000
		
detect_mem_with_mbu:

		RMOV(R10, data)	; Start with page 0
		LI 0
		STORE R11		; RAM banks found
		STORE R12 		; ROM banks found
		STORE R p0.ROMSTART	; First ROM bank found

		;; Loop body
loop:		ISZ R10
		JMP body
		JMP done
body:		LOAD R10
		ING
		SMB 1			; Bank 1 = page number in AC

		RMOV(R13, I bank1)	; R13 = original value (=ROM)
		NOT
		STORE I bank1
		STORE R14		; R14 = negated value (=RAM)

		CMPEQ(I bank1, R14)	; Is it RAM?
		SNZ
		JMP ramfound

		CMPEQ(I bank1, R13)	; Is it ROM?
		SZA
		JMP loop		; It's most likely unmapped.

		LOR(I10, bank1, 1)	; Examine the next word in this bank
		CMPEQ(I I10, R13)	; Is the next word in the ROM identical?
		SNZ
		JMP loop		; Same value

		; CMPEQ(I I10, R13)	; Is the next word in the ROM identical?
		; SNZ
		; JMP loop		; Same value yet again. 

romfound:	LOAD R10
		ING
		STORE R p0.ROMSTART	; Update page# of lowest ROM page
		ISZ R11			; Guaranteed to never skip
		JMP loop
		
ramfound:	RMOV(I bank1, R13)	; Be nice, restore original value
		LOAD R10
		ING
		SZA			; Don't mark bank 0 as free
		TRAP I T_MEMFREE	; Mark the bank as available
		LOAD R10
		ISZ R12			; Guaranteed to never skip
		JMP loop

done:		LI &ff			; We COULD have 256 pages of RAM, so mask
		AND R12
		STORE p0.MEMCFG		; Store this value into p0.MEMCFG

		LOAD R11		; Number of ROM banks
		RNL
		RNL			; Roll 8 bits left
		AND rommask		; Mask it
		OR p0.MEMCFG
		STORE p0.MEMCFG		; Done

		return()

data:		.data -256
rommask:	.word &ff00
.endscope
		
		
;;; Detect memory without an MBU (check for default RAM/ROM mapping). We'll be
;;; mangling some memory locations *temporarily*. This is okay since nothing has
;;; been properly initialised yet.
;;;
;;; Strategy:
;;;  * Load a value from memory
;;;  * Flip its bits and write it back
;;;  * Load the value back
;;;  * If the bits are flipped, it's RAM.
;;;  * If the bits aren't flipped, it's ROM.
;;;  * If the value read is the value of the CFT instruction used to load that
;;;    value from memory, there's no memory there. (*)
;;; 
;;; (*) Rationale: the data bus is terminated with bus hold circuitry, which
;;;     retains the last valid value the bus had driven onto it. If memory is
;;;     present, this would be the output of a memory IC. Otherwise, the data of
;;;     the previous memory access would be read. That access would be the fetch
;;;     part of the previous executed instruction, a LOAD instruction.

detect_mem_no_mbu:
.scope
		LI 3
		STORE R11		; Bank counter
		LI 0
		STORE R14		; RAM banks found
		STORE R15		; ROM banks found
		STORE R p0.ROMSTART	; First ROM bank found

		;; Loop body
loop:	        LOAD I R11		; Load this memory value
		STORE R12		; Store for comparison
		NOT			; Invert all the bits
		STORE R13		; Store the new value for comparison
		STORE I R11		; Store it back.

		CMPEQ(I R11, R12)	; Is it the original value?
		SNZ
		JMP romfound		; Yes. It's ROM.

		CMPEQ(I R11, R13)	; Is it the updated value?
		SNZ
		JMP ramfound		; Yes. It's RAM.

		;; Increment and loop exit
next:	        LOAD R11		; Next memory bank
		CLL
		ADD _l_d
		SCL			; address > 65535?
		JMP done		; Yes. We're done.
		STORE R11
		JMP loop		; Loop.

		;; ROM bank found
romfound:	RINC(R15)		; Increment the number of ROM banks
		LOAD R p0.ROMSTART	; Is this the first ROM bank?
		SZA
		JMP next		; No. Loop
		RAND(p0.ROMSTART, _l_m, R11) ; Store the *base* address
		JMP next		; And loop.

		;; RAM bank found
ramfound:       RMOV(I R11, R12)	; Be nice, restore the original value
		RINC(R14)		; Increment the number of RAM banks
		JMP next		; And loop.

		;; We're done.
done:		LI &ff			; We COULD have 256 pages of RAM, so mask
		AND R14
		STORE p0.MEMCFG		; Store this value into p0.MEMCFG

		LOAD R15		; Number of ROM banks
		RNL
		RNL			; Roll 8 bits left
		AND _l_m2		; Mask it
		OR p0.MEMCFG
		STORE p0.MEMCFG		; Done
		RET

_l_d:	.word 8192		; Bank size
_l_m:	.word &e000		; Memory address mask
_l_m2:	.word p0.MEMCFG_NROMMSK	; ROM field mask in p0.MEMCFG
.endscope


///////////////////////////////////////////////////////////////////////////////
//
// BOOT MODE OVERRIDES ('YEAR' MODES)
//
///////////////////////////////////////////////////////////////////////////////

;;; What are year modes?
;;; 
;;; When the front panel switches are set to certain 20th century years, the
;;; computer boots in 'year' mode, in which it uses hardware typical of that
;;; period. For example, setting SR to 1965, you'd get nothing more modern than
;;; the front panel (and its debugging terminal). Not even TTYs. 1980 mode
;;; would boot with MBU, TTY, LPT and PSG (sound), but no VDU.
;;;
;;; The switches must be set in BCD, so 1974 is #0001'0101'0111'0100.
;;;
;;; The table of years and devices is represented as 16 values, each
;;; representing the minimum year (in BCD) that device is available. Some
;;; convenience devices (e.g. IRC, TMR, GIO) are always available so their
;;; minimum year is 0000.
;;;
;;; The routine updates p0.HWDIS which represents the disabled devices.
;;; Detection routines check their particular bits in this value and exit
;;; without performing any detection or initialisation tasks, giving a more
;;; complete impression of the lack of hardware. The value p0.HWMODE will be
;;; set the the selected year mode, or 0 if none was found. Valid year modes
;;; are 1900 to 1999. The validity of the last two BCD digits isn't checked, so
;;; 19FF could be specified to enable all devices.

mode_override:
.scope
		enter_sub()
		LMOV(0, p0.HWMODE)	; Initialise the hardware mode
		LSR
		AND d0			; Ensure the SR's top 8 bits are &19.
		XOR @d0+1
		SZA
		RET

		LSR
		STORE p0.HWMODE
		NEG			; Negate the SR
		STORE TMP14		; Store it for comparison

		SIA(I15, d1)		; Start address of table
		LMOV(TMP15, 1)		; Start with a mask of 1.

loop:		LOAD I I15		; Load a value from the table
		ADD TMP14		; value - SR
		SNA			; 
		JMP disable		; Value > SR: disable this device

again:		LOAD TMP15
		RSBL(TMP15, TMP15)	; Shift the mask left
		SSL			
		JMP loop		; Not done yet.
		return()		; Done.

disable:	ROR1(p0.HWDIS, TMP15)	; Disable this device.
		JMP again
		
d0:		.data &ff00 &1900	; Switch mask and value
d1:		.word &1974		; MBU: 1975+
		.word 0			; DFP: always
		.word 0			; IRC: always
		.word &1970		; TTY: 1970+
		.word &1990		; IDE: 1990+
		.word 0			; RTC: always
		.word 0			; TMR: always
		.word 0			; NVR: always
		.word &1985		; FDC: 1985+
		.word &1984		; SPJ: 1984+
		.word &1980		; PSG: 1980+
		.word &1980		; LPT: 1980+
		.word &1984		; VDU: 1985+
		.word &1992		; ETH: 1992+
		.word 0			; GIO: always
		.word 0			; ???: always
.endscope

		
hwinfo:
.scope
		enter_sub()

		;; If a year mode has been selected, print it out.
		LOAD p0.HWMODE
		SNZ
		JMP nomode
		LIA modeheader
		JSR I PUTSP
		LOAD p0.HWMODE
		JSR I PUTH
nomode:
		;; Print amount of memory.
		LIA memheader
		JSR I PUTSP
		LOAD rammask
		AND p0.MEMCFG
		SNZ			; 0 RAM pages = 256 RAM pages
		LIA &100
		RNL
		RBR			; << 3 (*8192, to get KW from pages)
		JSR I PUTUD
		LIA mem1
		JSR I PUTSP
		LOAD rommask
		AND p0.MEMCFG
		RNR
		RNR
		STORE R10
		LI &ff
		AND R10
		SNZ
		LIA &100
		RNL
		RBR			; Get KW from pages)
		JSR I PUTUD
		LIA mem2
		JSR I PUTSP

;;; Print out detected hardware subsystems
.scope
		LIA detheader
		JSR I PUTSP
		LOAD p0.HWCONFIG
		STORE R12
		LIA data
		STORE R &12

loop:		RSBR(R12, R12)		; Shift R12 right one place
		SCL			; Former bit 0 clear?
		JMP bitset		; No, it's set.
next:		SNZ			; Are there more bits set?
		JMP done		; No. We're done.
		ISZ R &12		; Increment by two (4 characters)
		ISZ R &12
		JMP loop		; Next iteration

bitset:		LOAD R &12		; Print out hw code, increment index ptr
		JSR I PUTSP
		lcallcdrv(p0.TTYA, p0.TTYA_SEND, 32) ; Print out a space
		LOAD R12
		JMP next
		
done:		lcallcdrv(p0.TTYA, p0.TTYA_SEND, 10) ; Print out a newline
.endscope

;;; Print out detected terminals.

.scope
		LIA ttyheader
		JSR I PUTSP

		SIA(TMP10, p0.TTY0_PTR)
		LI p0._nttys
		NEG
		STORE TMP9

loop:		LOAD I TMP10
		IFEQJMP(NULLDRV, next)
		LMOV(ARG1, drv.ser.serial.namesz)
		LI drv.ser.serial.name
		ADD I TMP10
		JSR I PUTNSP
		lcallcdrv(p0.TTYA, p0.TTYA_SEND, 32) ; Print out a space

next:		ISZ TMP10		; Guaranteed not to skip
		ISZ TMP9
		JMP loop

done:		lcallcdrv(p0.TTYA, p0.TTYA_SEND, 10) ; Print out a newline
.endscope
		
;;; Detect current operating environment (e.g. emulator). Prints nothing on
;;; a physical environment (the CFT hardware).
.scope
		LOAD p0.HWENV
		JNZ(not_hardware)
		JMP done		; Print nothing on hardware
		
not_hardware:	LIA hweheader
		JSR I PUTSP

maybe_verilog:	LI p0.HWE_V		; Running under Verilog? (ye gods!)
		IFNEQJMP(p0.HWENV, maybe_js)
		LIA hwev
		JMP printit

maybe_js:	LI p0.HWE_JS		; Running under Javascript?
		IFNEQJMP(p0.HWENV, maybe_c)
		LIA hwej
		JMP printit

maybe_c:	LI p0.HWE_C		; Running under C?
		IFNEQJMP(p0.HWENV, nope)
		LIA hwec
		JMP printit

nope:		LIA saywot
printit:	JSR I PUTSP
done:

done:		return()
.endscope

rommask:	.word p0.MEMCFG_NROMMSK
rammask:	.word p0.MEMCFG_NRAMMSK
modeheader:	.strp "\nRetro Mode:  " 0
memheader:	.strp "\nMemory:      " 0
mem1:		.strp "KW RAM, " 0
mem2:		.strp "KW ROM\n" 0
detheader:	.strp "Detected:    " 0
ttyheader:	.strp "Terminals:   " 0
data:		.strp "MBU" 0
		.strp "DFP" 0
		.strp "IRC" 0
		.strp "TTY" 0
		.strp "IDE" 0
		.strp "RTC" 0
		.strp "TMR" 0
		.strp "NVR" 0
		.strp "FDC" 0
		.strp "SPJ" 0
		.strp "PSG" 0
		.strp "LPT" 0
		.strp "VDU" 0
		.strp "ETH" 0
		.strp "GIO" 0
saywot:		.strp "???" 0
hweheader:	.strp "Environment: "
hwev:		.strp "verilog\n" 0
hwej:		.strp "js-emu" 0
hwec:		.strp "emulator\n" 0
.endscope


///////////////////////////////////////////////////////////////////////////////
//
// Early console-related code
//
///////////////////////////////////////////////////////////////////////////////		

;;; Strategy: we choose the highest technology console detected. If a card has
;;; multiple ports (e.g. TTY), the first one is always used. The console is also
;;; initialised here and any vectors are changed to support it.

; choose_console:
; .scope

; 		;; VDU Console
; vdu_console:	LI p0.HWT_VDU
; 		AND p0.HWTTYS
; 		SZA
; 		JMP setup_vdu
; 		JMP tty_console

; 		;; TTY Console
; tty_console:	LI p0.HWT_TTY0
; 		AND p0.HWTTYS
; 		SZA
; 		JMP setup_tty0
; 		JMP dfp_console

; 		;; Last resort: the DFP console
; dfp_console:    LI p0.HWT_DFP
; 		AND p0.HWTTYS
; 		SZA
; 		JMP setup_dfp		; Success, set up the DFP

; no_console:	LI post.ERR_NCONS	; There's no console!
; 		JMP I R POSTFAIL

; setup_vdu:      SUCCESS
; 		HALT

; setup_tty0:
; 		SUCCESS
; 		HALT

; 		;; TODO: Rename this label, rewrite code.
; setup_dfp:

; 		; ;; Register the ISR and enable console interrupts
; 		; LOAD isr
; 		; STORE ISRV

; 		LI dfp.ICR_TTYQ
; 		OUT dfp.ICR		; Set the DFP Interrupt Control Register

; 		LI p0.HWC_IRC		; Do we have an IRC?
; 		AND p0.HWCONFIG
; 		SNZ
; 		JMP dfp_skip
; 		irc.enable(6)		; Enable IRQ 6

; dfp_skip:	RET
; isr:		.word drv.ser.dfp.isr
; .endscope

.endscope				; early boot



///////////////////////////////////////////////////////////////////////////////
//
// CONVENIENCE SUBROUTINES DURING POST/DETECTION
//
///////////////////////////////////////////////////////////////////////////////

;;; Helper routine.
_register_dev_slot:
.scope
		clear_errno()

loop:		LOAD I TMP14		; Try a slot.
		IFEQJMP(NULLDRV, gotit)	; Found an empty slot
		ISZ TMP14		; Never skips
		IFEQJMP(TMP13, ranout)	; Ran out of slots
		JMP loop		; Go again

gotit:          RMOV(I TMP14, TMP15)

		SIA(ARG0, p0.TTYA)
		RMOV(ARG1, I TMP14)
                syscall(T_TTYSEL)	; Also select this device for I/O.
		return()

ranout:         errno(EFULL)		; Raise an error.
		return()
.endscope

		
;;; Register a detected TTY. Ignored if we already have too many. The handle of
;;; the TTY should be in AC.

register_tty:   enter_sub_ac()
		SIA(TMP14, p0.TTY0_PTR)
		SIA(TMP13, p0._ttyNp)
		JMP _register_dev_slot

;;; Register a detected MSD. Ignored if we already have too many. The handle of
;;; the MSD should be in AC.

register_msd:   enter_sub_ac()
		SIA(TMP14, p0.MSD0_PTR)
		SIA(TMP13, p0._msdNp)
		JMP _register_dev_slot
		



///////////////////////////////////////////////////////////////////////////////
//
// BIG STRINGS
//
///////////////////////////////////////////////////////////////////////////////


dfp_banner:	.longstring "\n\n\n\n"
		.strp "    #########.      ,################\n"
		.strp "  #############,   #                #\n"
		.strp " #####'   '#####  #   ,######   #####\n"
		.strp "#####'      #######   ####  #   #\n"      	
		.strp "#####                    #  #   #\n"    
		.strp "#####,      #######   ####  #   #\n"    
		.strp " #####,   ,#####  #   #     #   #\n"    
		.strp "  #############   #   #     #   #\n"    
		.strp "   '#########'    #####     #####\n"
		.strp "\n"
		.strp " 16 BIT SOLID STATE MINI COMPUTER\n"
		.strp 0
		.endstring




























///////////////////////////////////////////////////////////////////////////////
//
// VDU CODE
//
///////////////////////////////////////////////////////////////////////////////

/.page

vdu_init:	
.scope
		enter_sub()

		;; Register the DFP TTY

.scope		; ??????

		LOUT(vdu.MCR0, 0)	; Disable the VDU. Avoids flashes.
		
		LOR1(p0.HWTTYS, p0.HWT_VDU)
		LOAD drv_handle
		JSR I register

		JSR cgclear		; Clear the CG RAM.
		LMOV(ARG0, 0)		; Set font 0
		LOAD romfont		; Load ROM font address
		JSR cgload

		JSR bcclear		; Clear the framebuffer

		LIA mode80x30		; Set the mode
		JSR setmode

		;; TODO: Add a proper keyboard bell routine
		LIA NULL_JSR
		STORE p0.VDU_BELVEC

		LOAD mode80x30		; Load MCR0 from the mode table
		STORE p0.VDU_MCR0	; Store a copy of it.
		LI vdu.MCR0_KBI		; Enable Keyboard Interrupts
		OR p0.VDU_MCR0
		OUT vdu.MCR0

		;; Interrupts (for KBD, really)
		LI 0			; Initialise KBD ISR state
		STORE p0.KBD_ST
		STORE p0.KBD_KEYSYM
		STORE p0.KBD_MODS
		RMOV(p0.ISR2VEC, vdu_isr) ; Install KBD ISR

		;; Install basic keyboard mapping
		RMOV(p0.KBD_HNDVEC, kbd_handler)
		RMOV(p0.KBD_MAPIDX, kbd_maps)
		RMOV(p0.KBD_MAP0VEC, @kbd_maps+1)
		RMOV(p0.KBD_MAP1VEC, @kbd_maps+2)
		RMOV(p0.KBD_MAP2VEC, @kbd_maps+3)
		STORE p0.KBD_MAP3VEC	; Ctrl+Shift same as Ctrl

		;; Finally, enable interrupts
		irc.enable(2)

		return()		; We're done.

drv_handle:	.data drv.ser.vdu.base
vdu_isr:	.word @drv.ser.vdu.isr+0
register:	.word register_tty
romfont:	.word _romfont0
kbd_handler:	.data @drv.ser.vdu.prv.kbd_handler+0
kbd_maps:	.data @drv.ser.vdu.prv.keytable+0
		.data @drv.ser.vdu.prv.kbd_map_plain+0
		.data @drv.ser.vdu.prv.kbd_map_shift+0
		.data @drv.ser.vdu.prv.kbd_map_ctrl+0
done:		

.endscope

;;; Subroutine to set a mode given a table of 11 values which get blitzed to the
;;; first 11 registers of the VDU (the 10 display control registers plus the
;;; Host Address reg).
setmode:
.scope
		STORE ITMP0
		RMOV(TMP15, num)
		LMOV(ITMP1, vdu.MCR0)
loop:		ROUT(I ITMP1, I ITMP0)	; Copy data from the table to the VDU
		ISZ TMP15
		JMP loop

		RMOV(p0.VDU_COLS, I ITMP0) ; Set the number of columns
		RMOV(p0.VDU_ROWS, I ITMP0) ; Set the number of rows
		RNL
		RNL
		RBR
		AND ROWMASK
		OR p0.VDU_COLS
		STORE p0.VDU_WIN1	; The bottom right window corner...
		STORE p0.VDU_WINSZ	; ...also happens to be the window size.

		;; Initialise OS VDU variables
		LI vdu.COL_WHITE	; White fg, black bg (== &03f)
		STORE p0.VDU_ATTR	; Store default attributes
		OUT vdu.CPORT		; Send it to the VDU too
		LI 0
		STORE p0.VDU_STADDR	; Set start address to top left
		STORE p0.VDU_CRSADDR	; Cursor address to same
		STORE p0.VDU_WIN0	; Set default window min coord
		STORE p0.VDU_FLAGS	; Initialise flags
		
		RET
num:		.data -11
.endscope

;;; Set 80x30 text mode with sane defaults.
mode80x30:
		.word vdu.MCR0_EN vdu.MCR0_80x30 ; MCR0 (also p0.MCR0)
		.word 0				 ; MCR1
		.word 0				 ; SCR0
		.word 0				 ; SCR1
		.word 0				 ; SAR0
		.word 0				 ; SAR1
		.word &FFFF			 ; MAR0
		.word &FFFF			 ; MAR1
		.word &0b80			 ; CCR
		.word 0				 ; CAR
		.word 0				 ; HAR
		.word 80			 ; p0.VDU_COLS
		.word 30			 ; p0.VDU_ROWS

;;; Subroutine:	cgclear. Clear the CG RAM entirely.

cgclear:
.scope
		LOAD count
		STORE TMP15
		LOUT(vdu.HAR, 0)
loop:		LOUT(vdu.CRR, 127)	; 128 repetitions (one row)
		ROUT(vdu.CMD, _cmd_wcg)	; WRITECG command with zeroes.
		vdu.WAIT()		; Wait for completion
		ISZ TMP15
		JMP loop
		RET
count:		.data -512
.endscope

;;; Local constant: the WRITECG command is used at least twice here.
_cmd_wcg:	.word vdu.CMD_CMD_WCG vdu.CMD_XINC ; Character pattern command
		
;;; Subroutine: loadcg. Load the Character Generator RAM using the
;;; VDU-compressed font provided in the accumultator.
;;;
;;; Arguments:
;;; 
;;;     AC: address of the character data.
;;; 
;;;     ARG0: VDU CG RAM address to start with. There are 16 character sets,
;;;     each 4 KBytes long.

cgload:		
.scope
		STORE ITMP0		; Store the address of the font
		ROUT(vdu.HAR, ARG0)	; Set the starting address
		RMOV(TMP15, I ITMP0)	; Store the negated word count

loop:           RMOV(TMP14, I ITMP0)	; Load ROM font data, store for later
		GETHICHAR()		; Upper 8 bits, shifted: repetition count
		OUT vdu.CRR		; Set repetitions
		LI &ff
		AND TMP14		; Get low 8 bits (bitmap data)
		OR _cmd_wcg		; VDU command: write CG, xinc
		OUT vdu.CMD		; Send command
		vdu.WAIT()		; Wait for completion.
		ISZ TMP15		; More data?
		JMP loop
		RET			; Done
.endscope

;;; Subroutine:	bcclear. Clear the B & C Planes (entire framebuffer) entirely.

bcclear:
.scope
		LOAD count
		STORE TMP15
		LOUT(vdu.HAR, 0)
		LOUT(vdu.CPORT, vdu.COL_WHITE)
loop:		LOUT(vdu.CRR, 127)	; 128 repetitions (one row)
		LOUT(vdu.CMD, &100)	; WRITECG+XINC command with zeroes.
		vdu.WAIT()		; Wait for completion
		ISZ TMP15
		JMP loop
		RET
count:		.data -512
.endscope

///////////////////////////////////////////////////////////////////////////////		

		
		;; TODO: rewrite this code, and reinstate VDU initialisation.
		//RET


.scope
		;; Set mode
		ROUT(vdu.MCR0, d0)	; MCR0
		ROUT(vdu.MCR1, @d0+1)	; MCR1
		ROUT(vdu.MAR0, @d0+2)	; MAR0 = &ffff
		OUT vdu.MAR1		; MAR1 = &ffff
		ROUT(vdu.SAR1, @d0+3)	; SAR1 = &8000
		OUT vdu.CAR		; CAR = &8000
		ROUT(vdu.CCR, @d0+4)	; CCR
		LOUT(vdu.HAR, 0)	; HAR
		OUT vdu.SAR0		; SAR0

		JMP post_d0
d0:		.word vdu.MCR0_EN vdu.MCR0_CS23 vdu.MCR0_C80 vdu.MCR0_CRH1 ; MCR0
		.word &6d80 vdu.MCR1_C80 vdu.MCR1_CRH16	; SCL = 125, SEN = 1, 80x30
		.word &ffff
		.word &e000
		/.word &0b80
		.word 191

post_d0:
.endscope

		;; Clear the video RAM
.scope
		RMOV(R10, d0)
		LOUT(vdu.HAR, 0)
		ROUT(vdu.CPORT, @d0+1)	; Default colours (white fg, black bg)
loop:		LOUT(vdu.CRR, &7f)	; 128 repetitions (one line)
		ROUT(vdu.CMD, @d0+2)	; WBC command with XINC
		vdu.WAIT()		; Wait for completion
		ISZ R10
		JMP loop

		JMP post_d0
d0:		.word -512	        ; Number of rows in video RAM
		.word &073f	        ; Default colours (orange bg, white fg)
		.word vdu.CMD_CMD_WBC vdu.CMD_XINC ; Write space, increment
post_d0:	
.endscope


		;; Initialise character set CS2=11, CS1=00 (so, origin &c000) to
		;; be bitmap patterns for graphics.
		LOAD hgr_csaddr
		OUT vdu.HAR
		LI 0			; Start with bitmap pattern &00
		STORE R10
loop_hgr:	LI 15
		OUT vdu.CRR		; 16 reps (15 + 1)
		LOAD cmd_wcg		; Of the WCG|XINC command...
		OR R10			; ...with the current bitmap pattern
		OUT vdu.CMD
		ISZ R10			; Guaranteed not to skip
		vdu.WAIT()
		LI &100			; Have we done all 256?
		AND R10
		SNZ
		JMP loop_hgr

; 		SIA(I10, foo)
; 		OUTL(vdu.HAR, 0)
; foo0:		LOAD I I10
; 		PRINTD
; 		PRINTSP
; 		SNZ
; 		JMP foo2
; 		OR @data+1
; 		OUT vdu.CMD
; 		JMP foo0
; foo2:		IN vdu.HAR
; 		OUT vdu.CAR
; 		LOAD @data+3
; 		OUT vdu.CCR

		;; Display the CFT logo

		LOAD @logo_data+1
		STORE TMP14
		LOAD logo_data

		;; Image decompress/blit routine
		
		;; Expected data: AC = image data address, TMP14 = origin
.scope
		STORE I10		; Store data pointer
		LINC(I10, 2)		; Skip the magic number
		RMOV(TMP15, I I10)	; Count rows (negated, for ISZ loops)
		LOAD I I0		; Skip the column count

		LOAD TMP14		; TMP14: origin (incremented)
		OUT vdu.HAR		; Set VDU origin

next_datum:	RMOV(TMP13, I I10)	; Read a data word, store for later
		SBR			; Obtain the operand
		SBR			; Shift left two bits
		STORE TMP12		; TMP12: operand
		LAND(TMP13, TMP13, #11)	; TMP13: is now the opcode

		CASETAB(TMP13)		; Jump table (aka case statement)
		.word op_nextrow	; opcode 0: next row
		.word op_setrep		; opcode 1: set repetitions
		.word op_setc		; opcode 2: set C plane
		.word op_setb		; opcode 3: set B plane (and command)
		;; end of case table

op_nextrow:	LADD(TMP14, TMP14, 128)	; Advance the HAR to the next row
		OUT vdu.HAR		; And set as the HAR
		ISZ TMP15		; Loop.
		JMP next_datum
		JMP post_d0 		; Done
		
op_setrep:	LI &7f
		AND TMP12
		OUT vdu.CRR		; Set repetitions
		JMP next_datum

op_setc:	LOAD TMP12
		OUT vdu.CPORT		; Set C port (colour)
		JMP next_datum

op_setb:        LI &ff			; Set B port, command and XINC
		AND TMP12
		OR d0
		OUT vdu.CMD
		vdu.WAIT()		; Wait for command completion
		JMP next_datum
d0:		.word vdu.CMD_CMD_WBC vdu.CMD_XINC
post_d0:
.endscope



.scope

		ROUT(vdu.HAR, d0)	; Set starting address
		ROUT(vdu.CPORT, @d0+1)	; Set starting address
		LIA @d0+3
		STORE I10
		
loop:		LOAD I I10		; Read a pair of characters
		SNZ			; Done?
		JMP post_d0		; Yes
		STORE R10		; No.
		GETLOCHAR()
		OR @d0+2
		OUT vdu.CMD		; Output character + command

		LOAD R10
		GETHICHAR()
		SNZ			; Are we done now?
		JMP post_d0		; Yes
		OR @d0+2
		OUT vdu.CMD		; Output character + command

		JMP loop
		
d0:		.word &e018
		.word &073f
		.word vdu.CMD_CMD_WBC vdu.CMD_XINC
		.strp "16 BIT SOLID STATE MINI COMPUTER" 0
post_d0:

		IN vdu.HAR
		OUT vdu.CAR

		;; Remove this later
		LMOV(TMP0, 0)
		RMOV(TMP1, @d1+1)
		RMOV(TMP3, @d1+2)
again:		ROUT(vdu.SAR0, TMP0)	;
		LINC(TMP0, &80)

		RMOV(TMP2, TMP3)
delay:		LINC(TMP2, 0)
		ISZ TMP2
		JMP delay

		ISZ TMP1
		JMP again
		RET
d1:		.word &0000
		.word -160
		.word 64500
		.word -10
;;; REMOVE UP TO HERE
		
		RET
.endscope

data:
		.data -512
		.word vdu.CMD_CMD_WBC vdu.CMD_XINC ; 
cmd_wcg:	.word vdu.CMD_CMD_WCG vdu.CMD_XINC ; Character pattern command
hgr_csaddr:	.word &c000
logo_data:	.word logo		; Logo source start address
		//.word &1a15		; Logo origin (top left)
		.word &6815		; Logo origin (top left)
romfont:	.word _romfont0		; ROM font pointer

&a000:
.include "generated/romfont.asm"	; The ROM font (defines _romfont0)

logo:
.include "generated/cft-logo.asm"	; The CFT logo bitmap (in VDU format)
		
.endscope


; ///////////////////////////////////////////////////////////////////////////////
; //
; // ROM ENTRY POINT
; //
; ///////////////////////////////////////////////////////////////////////////////

		
; &c000:
; 		ROM_HEADER(8)

; 		.strp "Test program intro & help    " 0
; 		.word ep_test_intro

; 		.strp "Test program: counter        " 0
; 		.word ep_counter

; 		.strp "Test program: adder          " 0
; 		.word ep_adder

; 		.strp "Test program: echo           " 0
; 		.word ep_echo

; 		.strp "Test program: rolling lights " 0
; 		.word ep_rolling

; 		.strp "Test program: Fibonacci      " 0
; 		.word ep_fibonacci

; 		.strp "Test program: Eratosthenes   " 0
; 		.word ep_primes

; 		.strp "Test program: Hello World    " 0
; 		.word ep_hello

; 		;; End of ROM HEADER.


; ep_test_intro:
; 		HALT
; 		;; TODO
		
		
; ;;; C100: Counter. Counts up from zero to the value of the Switch Register
; ;;;       (which can be changed while the program is running). The Output
; ;;;       Register displays the count.

; &c100:
; ep_counter:

; 		LIA acinstr
; 		JSR I PUTSP

; count_again:
; 		;; Counter
; 		LI 0
; 		STORE R10
; acloop:		LOAD R10
; 		INC
; 		STORE R10
; 		SOR
		
; 		LOAD acdelay0
; 		JSR I DELAY
		
; 		LSR
; 		NEG
; 		CLL
; 		ADD R10
; 		SSL
; 		JMP acloop
; 		//SUCCESS
; 		//HALT
		
; 		LOAD acdelay1
; 		JSR I DELAY
; 		LOAD acdelay1
; 		JSR I DELAY
		
; 		JMP count_again

; acdelay0:	.word 1000
; acdelay1:	.word 65534
; acinstr:
; 		.longstring
; 		.strp "You control the upper limit of the count with the SR.\n"
; 		.strp "Once the count is reached, it restarts after a brief "
; 		.strp "pause.\n"
; 		.strp "Note: counting is delayed to make it more visible.\n"
; 		.endstring

; ;;; C200: Adding machine with printout. Toggle in value to add, then actuate
; ;;;       the Run switch. The running total is shown on the Output Register
; ;;;       and printed out to the debugging terminal.

; &c200:
; ep_adder:
; 		;; Adding machine
; 		LI 0
; 		STORE R10
; SOR

; addloop:
; 		LIA addinstr
; 		JSR I PUTSP
; 		LOAD R10
; 		PRINTU
; 		LIA 32			; Print a new line the ‘proper’ way
; 		OUT dfp.TX		; Send to the DFP console
; 		HALT
		
; 		LSR
; 		ADD R10
; 		STORE R10
; 		SOR
; 		JMP addloop

; addinstr:
; 		.strp "Enter a number, press RUN. Running total: " 0
		
		
; ;;; C300: Echo. The Accumulator and Output Register follow the value set on the
; ;;;       switches.

; &c300:
; ep_echo:
; 		LIA echoinstr
; 		JSR I PUTSP
; echoloop:	LSR
; 		SOR
; 		JMP echoloop

; echoinstr:

; 		.longstring
; 		.strp "Echo! The Output Register should reflect the value of "
; 		.strp "the switches.\n"
; 		.strp "Push RESET when done.\n"
; 		.endstring
		

; ;;; C400: Rolling lights. The program halts. Set a starting light pattern using
; ;;;       the Switch Register and actuate the Run switch. The Accumulator and
; ;;;       Output Register display a rolling lights display using that pattern.
; ;;;       The added 17th bit (seen as a gap) is because the L register also
; ;;;       participates in the rolls, but isn't set from the initial pattern.

; &c400:
; ep_rolling:
; 		CLL
; 		LI 0
; 		SOR
		
; 		LIA rollinstr1
; 		JSR I PUTSP
; 		HALT
		
; 		LSR
; 		STORE R10
		
; 		LIA rollinstr2
; 		JSR I PUTSP

; roll:		LOAD R10
; 		RBL
; 		SOR
; 		STORE R10
		
; 		LSR			; User-controlled delay
; 		JSR I DELAY
; 		JMP roll

; rollinstr1:	.strp "Set SR to starting pattern and push RUN.\n" 0
; rollinstr2:	.longstring
; 		.strp "While the pattern is rolling, use the SR to adjust\n"
; 		.strp "the roll rate. Lower values are faster.\n"
; 		.strp "Note: the emulated lights may not be able to keep up.\n"
; 		.strp "Push RESET when done.\n\n"
; 		.endstring


; ;;; C500: Fibonacci sequence. The Output Register shows the Fibonacci sequence.
; ;;;       The sequence is also printed out on the debug terminal.

; 		.equ n1 R &10		; First number
; 		.equ n2 R &11		; Second number
; 		.equ tmp0 R &12		; Temporary

; &c500:
; ep_fibonacci:
; fib:		LIA fibinstr
; 		JSR I PUTSP
		
; 		CLL			; Clear L
; 		LI 0			; Seed the generator with 0, 1.
; 		STORE n1
; 		LI 1
; 		STORE n2

; fib_loop:	LOAD n2
; 		STORE tmp0
; 		ADD n1
; 		SCL			; L set? If so, we're out of bits. Stop.
; 		JMP fib_done
		
; 		SOR
; 		PRINTU
; 		PRINTSP
; 		STORE n2
; 		LOAD tmp0
; 		STORE n1
; 		JMP fib_loop

; fib_done:	PRINTNL
; 		HALT
; 		JMP fib

; fibinstr:	.strp "16-bit Fibonacci sequence: 1 " 0
		


; ;;; C600: Eratosthenes' Sieve. Prime number generator. Shows primes < 30.
; ;;;       The maximum number (30) by default is first printed out on the debug
; ;;;       terminal, on a line of its own. The primes are then printed out as
; ;;;       they are found, separated by spaces. They are also shown on the
; ;;;       Output Register. On the Javascript emulator, the calculation is slow
; ;;;       enough that the numbers can be read out from the OR.
; ;;;
; ;;;       To calculate a different range of primes, write the maximum integer
; ;;;       needed to location &0017 and start the program from location &C602.


; 		.equ ONE R &0F		; Constant 1
; 		.equ x R &010		; Count register
; 		.equ pos R &011		; Current position
; 		.equ posptr R &012	; Pointer to value at current position
; 		.equ prime R &013	; Last prime found
; 		.equ neglimit R &014	; The last number (negated)
; 		.equ tmp R &015		; Temporary register
; 		.equ tmp2 R &016	; Temporary register
; 		.equ count R &017	; 

; &c600:
; ep_primes:
; eratosthenes:	;; Prepare the pad

; 	        LOAD sieve_instr1
; 		JSR I PUTSP
; 		HALT

; 		LSR
; 		AND sieve_and		; Size of working memory
; 		STORE count
		
; 		LIA sieve_instr2
; 		JSR I PUTSP
; 		LOAD count
; 		PRINTD
; 		LIA 10			; Print a new line the ‘proper’ way
; 		OUT dfp.TX		; Send to the DFP console
; 		PRINTNL
		
; 		LOAD count
; 		NEG
; 		STORE x			; Prepare for clearing the working mem
; 		LOAD sieve_start	; Autoindex pointer
; 		STORE I10
		
; 		LOAD count		; Used for limit checking
; 		NEG
; 		STORE neglimit

; 		LI 1
; 		STORE ONE

; 		;; The first prime we report, 2, is found at initialisation
; 		;; time.  Since it's the prime that takes the most to mark
; 		;; (half of the pad has to be marked!), we join this step and
; 		;; the pad init step and start looking for primes at 3.
; 		LI 2			; Report 2
; 		SOR
; 		PRINTD
; 		PRINTSP
; sieve_clear:	LOAD x
; 		AND ONE			; Heh. EBM reference.
; 		XOR ONE			; Thus we initialise the entire table 
; 					; for prime=2
; 		STORE I I10
; 		ISZ x
; 		JMP sieve_clear
; sieve_init:	LI 2			; pos = 2 (to be incremented soon)
; 		STORE pos
; 		ADD sieve_start
; 		STORE posptr		; posptr = &pad[pos]

; sieve_next_prime:
; 		ISZ pos			; Next position
; 		JMP @+1
; 		ISZ posptr
; 		JMP @+1
		
; 		LOAD pos		; Past the end of the working memory?
; 		ADD neglimit
; 		SNA			; pos + neglimit < 0?
; 		JMP sieve_done		; The algorithm is done!
		
; 		LOAD I posptr		; Consider pad[pos].
; 		SNZ			; pad[pos] == 0?
; 		JMP sieve_got_prime	; Yes. We found a prime.
; 		JMP sieve_next_prime	; No. Loop again.
; sieve_got_prime:
; 		LOAD pos
; 		SOR
; 		PRINTD
; 		PRINTSP

; sieve_mark_mult:
; 		ADD pos			; Next multiple of pos
; 		STORE tmp
		
; 		ADD sieve_start
; 		STORE tmp2
		
; 		LOAD tmp
; 		ADD neglimit
; 		SNA			; pos + neglimit < 0?
; 		JMP sieve_next_prime	; No. Done with pad, find next prime

; 		;; Within limits. Mark as non-prime and loop.
; 		LI 1			; pad[x] = 1
; 		STORE I tmp2
; 		LOAD tmp
; 		JMP sieve_mark_mult

; sieve_done:	SUCCESS
; 		HALT
; 		JMP eratosthenes	;; If the user continues here, restart.

; sieve_start:	.word &1000
; sieve_and:	.word &3ffe		; bits 1-13
; sieve_instr1:	.word _sieve_instr1
; sieve_instr2:	.strp "Primes up to " 0



; ;;; C700: Hello world program. Prints out The Standard Message on the debug
; ;;;       terminal.

; &c700:
; ep_hello:
; hello_world:	LIA hello
; 		JSR I PUTSP

; 		//SUCCESS
; 		HALT
; 		JMP hello_world

; hello:		.longstring
; 		.strp "Hello, world!\n"
; 		.strp "This is an instruction-level CFT emulator written in "
; 		.strp "Javascript!\n"
; 		.strp "It's about as fast as the real thing.\n"
; 		.strp "It uses the imaginary Operator's Front Panel which lacks "
; 		.strp "most of the\n"
; 		.strp "lights and programming switches, but it has much more "
; 		.strp "modern hardware."
; 		.endstring

; ;;; Library functions


; _welcome:
; 		.longstring  
; 		.strp "CFT Boot ROM v.0.2.\n"
; 		.strp "\n"
; 		.strp "The processor has been halted for your convenience.  "
; 		.strp "Set the\nSwitch Register (SR) to one of the following "
; 		.strp "addresses and press\nthe RUN switch to execute from that "
; 		.strp "address.  Pressing RUN again\nafter program termination "
; 		.strp "will rerun it.  Results are usually\ndisplayed on the "
; 		.strp "OR, sometimes also on the Debugging Front\nPanel (DFP) "
; 		.strp "console.\n"
; 		.strp "\n"
; 		.strp "Available programs:\n"
; 		.strp "\n"
; 		.strp "C000: What just ran.\n"
; 		.strp "C100: Counter. OR counts up to value of SR then stops.\n"
; 		.strp "C200: Adder. Set SR, press RUN. OR = Running total.\n"
; 		.strp "C300: Echo. AC and OR reflect value of SR.\n"
; 		.strp "C400: Rolling lights. Set pattern on SR, press Run.\n"
; 		.strp "C500: Fibonacci sequence printed out to DFP console.\n"
; 		.strp "C600: Eratosthenes' Sieve. Prints out to DFP console.\n"
; 		.strp "C700: Hello world. Prints out to DFP console.\n"
; 		.strp "\n"
; 		.endstring

; _sieve_instr1:	.longstring
; 		.strp "\nThis is a naive implementation of Eratosthenes' Sieve\n"
; 		.strp "(a prime number generator, and one of the first numerical"
; 		.strp "\nalgorithms ever described).\n"
; 		.strp "\n"
; 		.strp "Use the SR to enter the upper limit. (only bits 0-13 "
; 		.strp "used)\nThen, press RUN.\n"
; 		.endstring

.popns

;;; End of file.
