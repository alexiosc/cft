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

start:
.scope
		;; Initialise the early vector table. Assumption, we have at
		;; least 1 kW of RAM and it's acccessible at &0000-&03FF,
		;; probably a safe assumption. ;)

.scope
		LIA vectable
		STORE I10
		LIA R ramvectable
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

		;; Set up the data and return stacks. These will later by used
		;; by Forth too.
.scope
		RMOV(SP, LOAD d0)
		RMOV(RP, LOAD @d0+1)
		JMP post_d0
d0:		.data config.sp_start
		.data config.rp_start
post_d0:
.endscope
		;; Initialise the memory allocation bitmap
		JSR init_membitmap

		;; Disable halt-on-bus error, otherwise probing for missing
		;; devices will cause halts.
		LI dfp.FTR_HOB		; No halt on bus errors (for emulator)
		DISEF

		;; Start off assuming we're running on physical hardware
		LMOV (p0.HWENV, p0.HWE_HW)
		
		;; Override the startup mode (sets p0.HWDIS)
		JSR mode_override

		;; Detect hardware
		JSR detect_mbu_and_mem
		JSR detect_dfp
		JSR detect_irc
		JSR detect_vdu

		;; Choose the console device
		JSR choose_console

		JSR hwinfo

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

		LOAD welcome
		JSR I PUTSP



///////////////////////////////////////////////////////////////////////////////
		
		;; Scan for ROMs
		HALT

.scope
		DEBUGON
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
		PRINTD
		PRINTNL

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



		

		LI 0			; Clear the AC
		HALT			; Halt and wait for user
		
		LSR			; Read the SR
		SOR			; Set the OR to that value
		STORE R 3		; Jump to the address in AC
		JMP I R 3

welcome:	.word _welcome
vectable:

.include "vector-table.asm"
		
detect_dfp:	
.scope
		QEF			; Do we have a DFP?
		STORE R10
		AND detect_dfp1
		STORE R11
		SNZ
		RET			; Not found, bail.
		LOR1(p0.HWCONFIG, p0.HWC_DFP)

		LI dfp.QEF_TTY		; Do we have a console?
		AND R10
		SNZ
		RET			; Nope.
		LOR1(p0.HWTTYS, p0.HWT_DFP)

		LOAD R11		; What are we running on?
		XOR detect_dfp2		; Running under C emulation?
		SNZ
		JMP on_c_emu

		LOAD R11		; What are we running on?
		XOR @detect_dfp2+1	; Running under JS emulation?
		SNZ
		JMP on_js_emu
		
		RET
detect_dfp1:	.word dfp.QEF_DET
detect_dfp2:	.word dfp.QEF_EMU
		.word dfp.QEF_JS

on_c_emu:       LMOV(p0.HWENV, p0.HWE_C)
		RET
		
on_js_emu:      LMOV(p0.HWENV, p0.HWE_JS)
		RET
		
.endscope

		
		
detect_irc:	IN irc.ISR		; Read the ISR
		AND detect_irc1
		XOR detect_irc1
		SZA
		RET
		LOR1(p0.HWCONFIG, p0.HWC_IRC)
		RET
detect_irc1:	.word irc.ISR_DETECT



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


;;; Initialise the memory allocation bitmap. The bitmap uses 16 consecutive
;;; locations to denote the 256 8 kW memory banks available. Each bit represents
;;; the allocation state of a bank, with 0 denoting a free bank an allocated
;;; bank.
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

;;; Set up a memory allocation/free operation by setting requisite registers.
;;;
;;; Arguments
;;;   TMP15:	 Bank number (&00-&FF)
;;;
;;; Returns:
;;;   TMP15:	 Address to modify inside memory bitmap
;;;   TMP14:	 Address containing bit mask to modify

_mem_op:
		RAND(TMP14, TMP15, NYBBLE0) ; AC & f (bit number)
		LOAD TMP15
		RNR			; Roll 4 bits right
		AND NYBBLE0
		STORE TMP13		; TMP13: (AC >> 4) & f (word offset)

		LIA p0.MLC_BITMAP0	; Index the correct word
		ADD TMP13
		STORE TMP13		; TMP15: the address to modify

		LIA BIT0
		ADD TMP14
		STORE TMP14
		LOAD I TMP14		; The bit to modify

		RET

mem_mark:
.scope
		enter_sub_ac()

		JSR _mem_op
		OR I TMP15		; OR it with the current word
		STORE I TMP15		; Write it back.

		return()
.endscope

		
;;; Free a previously allocated bank of memory.
;;;
;;; Arguments
;;;   AC:	 Bank number (&00-&FF)
;;;
;;; Returns:

memfree:
.scope
		enter_sub_ac()

		JSR _mem_op
		NOT			; Complement the bit mask
		AND I TMP13		; AND it with the current word
		STORE I TMP13		; Write it back.

		return()
.endscope


;;; Find and allocate a bank of memory.
;;;
;;; Arguments
;;;   AC:	 Bank number (&00-&FF)
;;;
;;; Returns:
;;;   AC == &FFFF: no free banks found
;;;   AC <= &00FF: number of free bank found.

memalloc:
.scope
		enter_sub_ac()

		RMOV(TMP11, p0)		; Counter for memory bitmap
		LMOV(TMP14, 0)		; Bank number
		LIA p0.MLC_BITMAP0	; Start of the memory bitmap
		STORE TMP12		; TMP12 = bitmap word

loopword:	LMOV(TMP13, 1)		; Bit number
loopbit:	
		
		LOAD TMP13
		PRINTB
		PRINTSP
		LOAD TMP12
		PRINTH
		PRINTSP
		LOAD TMP11
		PRINTD
		PRINTSP
		
		LOAD I TMP12
		AND TMP13		; Check a bank
		PRINTH
		PRINTNL
		SNZ
		JMP found		; Found a free bank

		ISZ TMP14		; Next bank (never skips)
		LOAD TMP13
		SBL			; Next bit
		SCL			; Out of bits in this word?
		JMP nextword		; If so, try the next word
		STORE TMP13

		JMP loopbit		; Try again

nextword:	ISZ TMP12		; Next bitmap word (never skips)
		ISZ TMP11		; Are there more words in the bitmap?
		JMP loopword

		LOAD MINUS1		; No free banks found.
return:		return_ac()

found:		
		ROR(I TMP12, I TMP12, TMP13) ; Set the bit in the bitmap
		LOAD TMP14		; Return the bank number found
		JMP return

p0:		.word -16
.endscope
		

		
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
		ISZ R11		; Guaranteed to never skip
		JMP loop
		
ramfound:	RMOV(I bank1, R13)	; Be nice, restore original value
		LOAD R10
		ING
		SZA			; Don't mark bank 0 as free
		JSR I MEMFREE
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


mode_override:
.scope
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
		RET

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
		RMOV(R 99, RETV)	; Store return address

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

		;; Print out detected hardware subsystems
		LIA detheader
		JSR I PUTSP
		LOAD p0.HWCONFIG
		STORE R12
		LIA data
		STORE R &12

loop:		RSBR(R12, R12)	; Shift R12 right one place
		SCL			; Former bit 0 clear?
		JMP bitset		; No, it's set.
next:		SNZ			; Are there more bits set?
		JMP done		; No. We're done.
		ISZ R &12		; Increment by two (4 characters)
		ISZ R &12
		JMP loop		; Next iteration

bitset:		LOAD R &12		; Print out hw code, increment index ptr
		JSR I PUTSP
		OUTL(dfp.TX, 32)	; Print out a space
		LOAD R12
		JMP next
		
done:		OUTL(dfp.TX, 10)	; Print out a newline
		LOAD p0.HWENV
		SNZ
		JMP I R 99
		LIA emu
		JSR I PUTSP
		JMP I R 99		; Return to saved address

rommask:	.word p0.MEMCFG_NROMMSK
rammask:	.word p0.MEMCFG_NRAMMSK
modeheader:	.strp "\nRetro Mode:  " 0
memheader:	.strp "\nMemory:      " 0
mem1:		.strp "KW RAM, " 0
mem2:		.strp "KW ROM\n" 0
detheader:	.strp "Detected:    " 0
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
		.strp "???" 0
emu:		.strp "Environment: emulator\n" 0
.endscope


///////////////////////////////////////////////////////////////////////////////
//
// Early console-related code
//
///////////////////////////////////////////////////////////////////////////////		

;;; Strategy: we choose the highest technology console detected. If a card has
;;; multiple ports (e.g. TTY), the first one is always used. The console is also
;;; initialised here and any vectors are changed to support it.

choose_console:
.scope

		;; Last resort: the DFP console
dfp_console:    LI p0.HWT_DFP
		AND p0.HWTTYS
		SZA
		JMP setup_dfp		; Success, set up the DFP
;		JMP no_console		; No console found

no_console:	LI post.ERR_NCONS	; There's no console!
		JMP I R POSTFAIL

setup_dfp:
		;; Print out the banner
		RMOV(R11, RETV)
		LIA dfp_banner
		JSR I PUTSP
		RMOV(RETV, R11)
				
		;; Register the ISR and enable console interrupts
		LIA dfp_isr
		STORE ISRV

		LI dfp.ICR_TTYQ
		OUT dfp.ICR		; Set the DFP Interrupt Control Registerx

		LI p0.HWC_IRC		; Do we have an IRC?
		AND p0.HWCONFIG
		SNZ
		JMP dfp_skip
		irc.enable(6)		; Enable IRQ 6

dfp_skip:	SEI			; Enable interrupts
		RET
		
.endscope

///////////////////////////////////////////////////////////////////////////////
//
// Interrupt Service Routine
//
///////////////////////////////////////////////////////////////////////////////

dfp_isr:
.scope
check_char:	IN R dfp.ISR
		STORE R 20
		LI dfp.ISR_TTYQ
		AND R 20
		SNZ
		JMP no_char

		IN dfp.RX
		OUT dfp.TX
		JMP check_char

no_char:	irc.ack(6)
		
		SEI
		RTI
.endscope				; ISR


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

.endscope				; early boot



///////////////////////////////////////////////////////////////////////////////
//
// VDU CODE
//
///////////////////////////////////////////////////////////////////////////////

.page

vdu_init:	
.scope


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

		;; Initialise the CG RAM (first, clear it)
		LOAD data
		STORE R10
loop1:		LI &7f			; 128 repetitions (one line)
		OUT vdu.CRR
		LOAD @data+2		; WCG command with XINC
		OUT vdu.CMD
		vdu.WAIT()		; Wait for completion
		ISZ R10
		JMP loop1

		RMOV(I10, romfont)	; Pointer to the ROM font
		RMOV(R10, I I10)	; Store the negated word count
		OUTL(vdu.HAR, 0)	; Reset VDU address
loop3:          RMOV(R11, I I10)	; Load ROM font data, store for later
		GETHICHAR()		; Get the upper 8 bits (rep count)
		OUT vdu.CRR		; Set repetitions
		LI &ff
		AND R11			; Get low 8 bits (bitmap data)
		OR @data+2		; WCG command with XINC
		OUT vdu.CMD		; Send command
		vdu.WAIT()
		ISZ R10			; More data?
		JMP loop3

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


///////////////////////////////////////////////////////////////////////////////
//
// ROM ENTRY POINT
//
///////////////////////////////////////////////////////////////////////////////

		
&c000:
		ROM_HEADER(8)

		.strp "Test program intro & help    " 0
		.word ep_test_intro

		.strp "Test program: counter        " 0
		.word ep_counter

		.strp "Test program: adder          " 0
		.word ep_adder

		.strp "Test program: echo           " 0
		.word ep_echo

		.strp "Test program: rolling lights " 0
		.word ep_rolling

		.strp "Test program: Fibonacci      " 0
		.word ep_fibonacci

		.strp "Test program: Eratosthenes   " 0
		.word ep_primes

		.strp "Test program: Hello World    " 0
		.word ep_hello

		;; End of ROM HEADER.


ep_test_intro:
		HALT
		;; TODO
		
		
;;; C100: Counter. Counts up from zero to the value of the Switch Register
;;;       (which can be changed while the program is running). The Output
;;;       Register displays the count.

&c100:
ep_counter:

		LIA acinstr
		JSR I PUTSP

count_again:
		;; Counter
		LI 0
		STORE R10
acloop:		LOAD R10
		INC
		STORE R10
		SOR
		
		LOAD acdelay0
		JSR I DELAY
		
		LSR
		NEG
		CLL
		ADD R10
		SSL
		JMP acloop
		//SUCCESS
		//HALT
		
		LOAD acdelay1
		JSR I DELAY
		LOAD acdelay1
		JSR I DELAY
		
		JMP count_again

acdelay0:	.word 1000
acdelay1:	.word 65534
acinstr:
		.longstring
		.strp "You control the upper limit of the count with the SR.\n"
		.strp "Once the count is reached, it restarts after a brief "
		.strp "pause.\n"
		.strp "Note: counting is delayed to make it more visible.\n"
		.endstring

;;; C200: Adding machine with printout. Toggle in value to add, then actuate
;;;       the Run switch. The running total is shown on the Output Register
;;;       and printed out to the debugging terminal.

&c200:
ep_adder:
		;; Adding machine
		LI 0
		STORE R10
SOR

addloop:
		LIA addinstr
		JSR I PUTSP
		LOAD R10
		PRINTU
		LIA 32			; Print a new line the ‘proper’ way
		OUT dfp.TX		; Send to the DFP console
		HALT
		
		LSR
		ADD R10
		STORE R10
		SOR
		JMP addloop

addinstr:
		.strp "Enter a number, press RUN. Running total: " 0
		
		
;;; C300: Echo. The Accumulator and Output Register follow the value set on the
;;;       switches.

&c300:
ep_echo:
		LIA echoinstr
		JSR I PUTSP
echoloop:	LSR
		SOR
		JMP echoloop

echoinstr:

		.longstring
		.strp "Echo! The Output Register should reflect the value of "
		.strp "the switches.\n"
		.strp "Push RESET when done.\n"
		.endstring
		

;;; C400: Rolling lights. The program halts. Set a starting light pattern using
;;;       the Switch Register and actuate the Run switch. The Accumulator and
;;;       Output Register display a rolling lights display using that pattern.
;;;       The added 17th bit (seen as a gap) is because the L register also
;;;       participates in the rolls, but isn't set from the initial pattern.

&c400:
ep_rolling:
		CLL
		LI 0
		SOR
		
		LIA rollinstr1
		JSR I PUTSP
		HALT
		
		LSR
		STORE R10
		
		LIA rollinstr2
		JSR I PUTSP

roll:		LOAD R10
		RBL
		SOR
		STORE R10
		
		LSR			; User-controlled delay
		JSR I DELAY
		JMP roll

rollinstr1:	.strp "Set SR to starting pattern and push RUN.\n" 0
rollinstr2:	.longstring
		.strp "While the pattern is rolling, use the SR to adjust\n"
		.strp "the roll rate. Lower values are faster.\n"
		.strp "Note: the emulated lights may not be able to keep up.\n"
		.strp "Push RESET when done.\n\n"
		.endstring


;;; C500: Fibonacci sequence. The Output Register shows the Fibonacci sequence.
;;;       The sequence is also printed out on the debug terminal.

		.equ n1 R &10		; First number
		.equ n2 R &11		; Second number
		.equ tmp0 R &12		; Temporary

&c500:
ep_fibonacci:
fib:		LIA fibinstr
		JSR I PUTSP
		
		CLL			; Clear L
		LI 0			; Seed the generator with 0, 1.
		STORE n1
		LI 1
		STORE n2

fib_loop:	LOAD n2
		STORE tmp0
		ADD n1
		SCL			; L set? If so, we're out of bits. Stop.
		JMP fib_done
		
		SOR
		PRINTU
		PRINTSP
		STORE n2
		LOAD tmp0
		STORE n1
		JMP fib_loop

fib_done:	PRINTNL
		HALT
		JMP fib

fibinstr:	.strp "16-bit Fibonacci sequence: 1 " 0
		


;;; C600: Eratosthenes' Sieve. Prime number generator. Shows primes < 30.
;;;       The maximum number (30) by default is first printed out on the debug
;;;       terminal, on a line of its own. The primes are then printed out as
;;;       they are found, separated by spaces. They are also shown on the
;;;       Output Register. On the Javascript emulator, the calculation is slow
;;;       enough that the numbers can be read out from the OR.
;;;
;;;       To calculate a different range of primes, write the maximum integer
;;;       needed to location &0017 and start the program from location &C602.


		.equ ONE R &0F		; Constant 1
		.equ x R &010		; Count register
		.equ pos R &011		; Current position
		.equ posptr R &012	; Pointer to value at current position
		.equ prime R &013	; Last prime found
		.equ neglimit R &014	; The last number (negated)
		.equ tmp R &015		; Temporary register
		.equ tmp2 R &016	; Temporary register
		.equ count R &017	; 

&c600:
ep_primes:
eratosthenes:	;; Prepare the pad

	        LOAD sieve_instr1
		JSR I PUTSP
		HALT

		LSR
		AND sieve_and		; Size of working memory
		STORE count
		
		LIA sieve_instr2
		JSR I PUTSP
		LOAD count
		PRINTD
		LIA 10			; Print a new line the ‘proper’ way
		OUT dfp.TX		; Send to the DFP console
		PRINTNL
		
		LOAD count
		NEG
		STORE x			; Prepare for clearing the working mem
		LOAD sieve_start	; Autoindex pointer
		STORE I10
		
		LOAD count		; Used for limit checking
		NEG
		STORE neglimit

		LI 1
		STORE ONE

		;; The first prime we report, 2, is found at initialisation
		;; time.  Since it's the prime that takes the most to mark
		;; (half of the pad has to be marked!), we join this step and
		;; the pad init step and start looking for primes at 3.
		LI 2			; Report 2
		SOR
		PRINTD
		PRINTSP
sieve_clear:	LOAD x
		AND ONE			; Heh. EBM reference.
		XOR ONE			; Thus we initialise the entire table 
					; for prime=2
		STORE I I10
		ISZ x
		JMP sieve_clear
sieve_init:	LI 2			; pos = 2 (to be incremented soon)
		STORE pos
		ADD sieve_start
		STORE posptr		; posptr = &pad[pos]

sieve_next_prime:
		ISZ pos			; Next position
		JMP @+1
		ISZ posptr
		JMP @+1
		
		LOAD pos		; Past the end of the working memory?
		ADD neglimit
		SNA			; pos + neglimit < 0?
		JMP sieve_done		; The algorithm is done!
		
		LOAD I posptr		; Consider pad[pos].
		SNZ			; pad[pos] == 0?
		JMP sieve_got_prime	; Yes. We found a prime.
		JMP sieve_next_prime	; No. Loop again.
sieve_got_prime:
		LOAD pos
		SOR
		PRINTD
		PRINTSP

sieve_mark_mult:
		ADD pos			; Next multiple of pos
		STORE tmp
		
		ADD sieve_start
		STORE tmp2
		
		LOAD tmp
		ADD neglimit
		SNA			; pos + neglimit < 0?
		JMP sieve_next_prime	; No. Done with pad, find next prime

		;; Within limits. Mark as non-prime and loop.
		LI 1			; pad[x] = 1
		STORE I tmp2
		LOAD tmp
		JMP sieve_mark_mult

sieve_done:	SUCCESS
		HALT
		JMP eratosthenes	;; If the user continues here, restart.

sieve_start:	.word &1000
sieve_and:	.word &3ffe		; bits 1-13
sieve_instr1:	.word _sieve_instr1
sieve_instr2:	.strp "Primes up to " 0



;;; C700: Hello world program. Prints out The Standard Message on the debug
;;;       terminal.

&c700:
ep_hello:
hello_world:	LIA hello
		JSR I PUTSP

		//SUCCESS
		HALT
		JMP hello_world

hello:		.longstring
		.strp "Hello, world!\n"
		.strp "This is an instruction-level CFT emulator written in "
		.strp "Javascript!\n"
		.strp "It's about as fast as the real thing.\n"
		.strp "It uses the imaginary Operator's Front Panel which lacks "
		.strp "most of the\n"
		.strp "lights and programming switches, but it has much more "
		.strp "modern hardware."
		.endstring

;;; Library functions


_welcome:
		.longstring  
		.strp "CFT Boot ROM v.0.2.\n"
		.strp "\n"
		.strp "The processor has been halted for your convenience.  "
		.strp "Set the\nSwitch Register (SR) to one of the following "
		.strp "addresses and press\nthe RUN switch to execute from that "
		.strp "address.  Pressing RUN again\nafter program termination "
		.strp "will rerun it.  Results are usually\ndisplayed on the "
		.strp "OR, sometimes also on the Debugging Front\nPanel (DFP) "
		.strp "console.\n"
		.strp "\n"
		.strp "Available programs:\n"
		.strp "\n"
		.strp "C000: What just ran.\n"
		.strp "C100: Counter. OR counts up to value of SR then stops.\n"
		.strp "C200: Adder. Set SR, press RUN. OR = Running total.\n"
		.strp "C300: Echo. AC and OR reflect value of SR.\n"
		.strp "C400: Rolling lights. Set pattern on SR, press Run.\n"
		.strp "C500: Fibonacci sequence printed out to DFP console.\n"
		.strp "C600: Eratosthenes' Sieve. Prints out to DFP console.\n"
		.strp "C700: Hello world. Prints out to DFP console.\n"
		.strp "\n"
		.endstring

_sieve_instr1:	.longstring
		.strp "\nThis is a naive implementation of Eratosthenes' Sieve\n"
		.strp "(a prime number generator, and one of the first numerical"
		.strp "\nalgorithms ever described).\n"
		.strp "\n"
		.strp "Use the SR to enter the upper limit. (only bits 0-13 "
		.strp "used)\nThen, press RUN.\n"
		.endstring

.popns

;;; End of file.
