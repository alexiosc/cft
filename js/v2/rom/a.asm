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

.include "asm/page0-0.asm"		; Page 0 definitions (&00xx)
.include "asm/page0-1.asm"		; Page 0 definitions (&01xx)
.include "asm/dfp.asm"			; Debugging board definitions
.include "asm/irc.asm"			; Debugging board definitions
.include "asm/mbu.asm"			; Debugging board definitions
.include "asm/post.asm"			; Debugging board definitions
.include "asm/macro-generic.asm"	; Macros

;;; Fill both RAM and ROM parts of the image with SENTINEL instructions, which
;;; cause the emulator to terminate. This is so we can catch addresses which
;;; don't contain valid code. On the real CFT, there's no such safety net.

.pushns _bootloader

&0000:		.fill 65535 SENTINEL

&0300:
		.reg PUTSP R @
		.reg DELAY R @
		.reg POSTFAIL R @
		.reg BYTELO R @

;;; C000: Entry point. Halts, then jumps to the address toggled in the Switch
;;;       Register.

&c000:
start:
		;; Initialise some essential vectors (we'll assume we have at
		;; least 1kW of RAM, shall we?)
		
		LOAD vectable		; Store vectors
		STORE PUTSP
		LOAD @vectable+1
		STORE DELAY
		LOAD @vectable+2
		STORE POSTFAIL
		LOAD @vectable+3
		STORE BYTELO
		
		;; Disable halt-on-bus error, otherwise probing for missing
		;; devices will cause halts.
		LI dfp.FTR.HOB		; No halt on bus errors (for emulator)
		DISEF
		
		;; Detect hardware
		JSR detect_mbu_and_mem
		JSR detect_dfp
		JSR detect_irc

		JSR hwinfo
		
		;; Enable a useful feature set, useful mostly on emulators
		LI dfp.FTR.HOB dfp.FTR.HOS ; Halt on bus errors and SENTINEL
		ENEF

		LI 0			; Clear AC
		NOT			; Invert (&ffff)
		SOR			; Set OR
		
		LOAD welcome		; Print the banner
		JSR I R PUTSP
		
		LI 0			; Clear the AC
		HALT			; Halt and wait for user
		
		LSR			; Read the SR
		SOR			; Set the OR to that value
		STORE R 3		; Jump to the address in AC
		JMP I R 3

welcome:	.word _welcome
hwdetect:	.strp "Hardware detected: " 0
vectable:	.word putsp
		.word delay
		.word postfail
		.word &00ff		; LOWBYTE

detect_dfp:	QEF			; Do we have a DFP?
		AND detect_dfp1
		SNZ
		RET			; Not found, bail.
		LOR1(p0.HWCONFIG, p0.HWC_DFP)
		RET
detect_dfp1:	.word dfp.QEF.DET
		
detect_irc:	IN irc.ISR		; Read the ISR
		AND irc.ISR_DETECT
		SNZ
		RET
		LOR1(p0.HWCONFIG, p0.HWC_IRC)
		RET
detect_irc1:	.word irc.ISR_DETECT

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
		;; Control group
                LOAD I bank7
		STORE R 10		; For sanity checking
		NOT
		STORE I bank1
		STORE R 11		; For sanity checking

		;; Enable and configure the MBU
		mbu.MAPMEML(7, &83)	; Map 32kW of ROM pages
		mbu.MAPMEML(6, &82)
		mbu.MAPMEML(5, &81)
		mbu.MAPMEML(4, &80)
		mbu.MAPMEML(3, &80)	; Same page mapped three times
		mbu.MAPMEML(2, &80)	; 
		mbu.MAPMEML(1, &80)	; 
		mbu.MAPMEML(0, 0 mbu.MBU_ENABLE) ; also enables MBU

		;; Sanity check: mem[&8000] shouldn't have changed since
		;; enabling the MBU.
		CMPEQ(I bank7, R 10)	; ROM still mapped properly?
		SZA
		JMP b0rken		; No, the MBU is broken.

		;; 1. Test for MBU (&2000 and &8000 should both map to ROM page
		;; 0 (i.e. page &80).
		CMPEQ(I bank7, I bank1)
		SZA		        ; Matching values?
		JMP detect_mem_no_mbu	; No. Detect memory in 64kW address space

		;; 2. Is the mapped bank a ROM bank?
		LOAD I bank1
		NOT			; if mem[&2000] == R 10, then this is RAM
		STORE I bank7
		CMPEQ(I bank7, R 10)
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

		LOAD data
		STORE R 10		; Start with page 0
		LI 0
		STORE R 11		; RAM banks found
		STORE R 12 		; ROM banks found
		STORE R p0.ROMSTART	; First ROM bank found

		;; Loop body
loop:		ISZ R 10
		JMP body
		JMP done
body:		LOAD R 10
		ING
		mbu.MAPMEM(1)		; Bank 1 = page number in AC

		LOAD I bank1
		STORE R 13		; R 13 = original value (=ROM)
		NOT
		STORE I bank1
		STORE R 14		; R 14 = negated value (=RAM)

		CMPEQ(I bank1, R 14)	; Is it RAM?
		SNZ
		JMP ramfound

		CMPEQ(I bank1, R 13)	; Is it ROM?
		SZA
		JMP loop		; It's most likely unmapped.

		LI 1
		ADD bank1
		STORE R &80
		CMPEQ(I R &80, R 13)	; Is the next word in the ROM identical?
		SNZ
		JMP loop		; Same value

		; CMPEQ(I R &80, R 13)	; Is the next word in the ROM identical?
		; SNZ
		; JMP loop		; Same value yet again. 

romfound:	LOAD R 10
		ING
		STORE R p0.ROMSTART	; Update page# of lowest ROM page
		ISZ R 11		; Guaranteed to never skip
		JMP loop
		
ramfound:	RMOV(I bank1, R 13)	; Be nice, restore original value
		ISZ R 12		; Guaranteed to never skip
		JMP loop

done:		LI &ff			; We COULD have 256 pages of RAM, so mask
		AND R 12
		STORE p0.MEMCFG		; Store this value into p0.MEMCFG

		LOAD R 11		; Number of ROM banks
		RNL
		RNL			; Roll 8 bits left
		AND rommask		; Mask it
		OR p0.MEMCFG
		STORE p0.MEMCFG		; Done
		RET

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
;;;     retails the last valid value the bus had driven onto it. If memory is
;;;     present, this would be the output of a memory IC. Otherwise, the
;;;     previous memory access would remain. That access would be the fetch part
;;;     of the previous executed instruction, a LOAD instruction.

detect_mem_no_mbu:
.scope
		LI 3
		STORE R 11		; Bank counter
		LI 0
		STORE R 14		; RAM banks found
		STORE R 15		; ROM banks found
		STORE R p0.ROMSTART	; First ROM bank found

		;; Loop body
loop:	        LOAD I R 11		; Load this memory value
		STORE R 12		; Store for comparison
		NOT			; Invert all the bits
		STORE R 13		; Store the new value for comparison
		STORE I R 11		; Store it back.

		CMPEQ(I R 11, R 12)	; Is it the original value?
		SNZ
		JMP romfound		; Yes. It's ROM.

		CMPEQ(I R 11, R 13)	; Is it the updated value?
		SNZ
		JMP ramfound		; Yes. It's RAM.

		;; Increment and loop exit
next:	        LOAD R 11		; Next memory bank
		CLL
		ADD _l_d
		SCL			; address > 65535?
		JMP done		; Yes. We're done.
		STORE R 11
		JMP loop		; Loop.

		;; ROM bank found
romfound:	INCM(R 15)		; Increment the number of ROM banks
		LOAD R p0.ROMSTART	; Is this the first ROM bank?
		SZA
		JMP next		; No. Loop
		RAND(p0.ROMSTART, _l_m, R 11) ; Store the *base* address
		JMP next		; And loop.

		;; RAM bank found
ramfound:       RMOV(I R 11, R 12)	; Be nice, restore the original value
		INCM(R 14)		; Increment the number of RAM banks
		JMP next		; And loop.

		;; We're done.
done:		LI &ff			; We COULD have 256 pages of RAM, so mask
		AND R 14
		STORE p0.MEMCFG		; Store this value into p0.MEMCFG

		LOAD R 15		; Number of ROM banks
		RNL
		RNL			; Roll 8 bits left
		AND _l_m2		; Mask it
		OR p0.MEMCFG
		STORE p0.MEMCFG		; Done
		RET

_l_d:	.word 8192		; Bank size
_l_m:	.word &e000		; Memory address mask
_l_m2:	.word p0.MEMCFG_NROMMSK	; ROM field maks in p0.MEMCFG
.endscope


hwinfo:
.scope
		LOAD RETV		; Store return address
		STORE R 11
		LIA header
		JSR I R PUTSP
		LOAD p0.HWCONFIG
		STORE R 12
		LIA data
		STORE R &12

loop:		RSBR(R 12, R 12)	; Shift R 12 right one place
		SCL			; Former bit 0 clear?
		JMP bitset		; No, it's set.
next:		SNZ			; Are there more bits set?
		JMP done		; No. We're done.
		ISZ R &12		; Increment by two (4 characters)
		ISZ R &12
		JMP loop		; Next iteration

bitset:		LOAD R &12		; Print out hw code, increment index ptr
		JSR I R PUTSP
		OUTL(dfp.TX, 32)	; Print out a space
		LOAD R 12
		JMP next
		
done:		OUTL(dfp.TX, 10)	; Print out a newline
		JMP I R 11		; Return to saved address

header:		.strp "\nDetected: " 0
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
.endscope


		
;;; C100: Counter. Counts up from zero to the value of the Switch Register
;;;       (which can be changed while the program is running). The Output
;;;       Register displays the count.

&c100:

		LIA acinstr
		JSR I R PUTSP

count_again:
		;; Counter
		LI 0
		STORE R 10
acloop:		LOAD R 10
		INC
		STORE R 10
		SOR
		
		LOAD acdelay0
		JSR I R DELAY
		
		LSR
		NEG
		CLL
		ADD R 10
		SSL
		JMP acloop
		//SUCCESS
		//HALT
		
		LOAD acdelay1
		JSR I R DELAY
		LOAD acdelay1
		JSR I R DELAY
		
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
		;; Adding machine
		LI 0
		STORE R 10
SOR

addloop:
		LIA addinstr
		JSR I R PUTSP
		LOAD R 10
		PRINTU
		LIA 32			; Print a new line the ‘proper’ way
		OUT dfp.TX		; Send to the DFP console
		HALT
		
		LSR
		ADD R 10
		STORE R 10
		SOR
		JMP addloop

addinstr:
		.strp "Enter a number, press RUN. Running total: " 0
		
		
;;; C300: Echo. The Accumulator and Output Register follow the value set on the
;;;       switches.

&c300:
		LIA echoinstr
		JSR I R PUTSP
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
		CLL
		LI 0
		SOR
		
		LIA rollinstr1
		JSR I R PUTSP
		HALT
		
		LSR
		STORE R 10
		
		LIA rollinstr2
		JSR I R PUTSP

roll:		LOAD R 10
		RBL
		SOR
		STORE R 10
		
		LSR			; User-controlled delay
		JSR I R DELAY
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
fib:		LIA fibinstr
		JSR I R PUTSP
		
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
		.equ I0 R &080		; Autoincrement register
		.equ x R &010		; Count register
		.equ pos R &011		; Current position
		.equ posptr R &012	; Pointer to value at current position
		.equ prime R &013	; Last prime found
		.equ neglimit R &014	; The last number (negated)
		.equ tmp R &015		; Temporary register
		.equ tmp2 R &016	; Temporary register
		.equ count R &017	; 

&c600:
eratosthenes:	;; Prepare the pad

	        LOAD sieve_instr1
		JSR I R PUTSP
		HALT

		LSR
		AND sieve_and		; Size of working memory
		STORE count
		
		LIA sieve_instr2
		JSR I R PUTSP
		LOAD count
		PRINTD
		LIA 10			; Print a new line the ‘proper’ way
		OUT dfp.TX		; Send to the DFP console
		PRINTNL
		
		LOAD count
		NEG
		STORE x			; Prepare for clearing the working mem
		LOAD sieve_start	; Autoindex pointer
		STORE I0
		
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
		STORE I I0
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
sieve_and:	.word 16383
sieve_instr1:	.word _sieve_instr1
sieve_instr2:	.strp "Primes up to " 0



;;; C700: Hello world program. Prints out The Standard Message on the debug
;;;       terminal.

&c700:
hello_world:	LIA hello
		JSR I R PUTSP

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

&f000:

;;; Print out a packed string.
putsp:
.scope
		STORE R &80
loop:		LOAD I R &80		; Read a pair of characters
		SNZ			; Done?
		RET			; Yes
		STORE R 10		; No.
		GETLOCHAR()
		OUT dfp.TX		; Print the first character

		LOAD R 10
		GETHICHAR()
		SNZ			; Are we done now?
		RET			; Yes
		OUT dfp.TX 		; Print the second character

		JMP loop
.endscope

;;; Delay execution.
delay:
.scope
		NEG			; Negate AC
		STORE R &7f
loop:	        NOP
		NOP
		NOP
		NOP
		ISZ R &7f
		JMP loop
		RET
.endscope

postfail:
.scope:
		NOT
		SEL
		SOR
		CLI
		FAIL
		HALT
		JMP @
.endscope

_welcome:
		.longstring  
		.strp "\n\nCFT Test ROM v.0.2.\n"
		.strp "-------------------\n\n"
		.strp "\n"
		.strp "The processor has been halted for your convenience.\n"
		.strp "Set the Switch Register (SR) for one of the following "
		.strp "addresses\n"
		.strp "and press the RUN switch to execute from that address.\n"
		.strp "Pressing RUN again after program termination will rerun "
		.strp "it.\n"
		.strp "Results are usually displayed on the OR, sometimes also "
		.strp "on the\n"
		.strp "Debugging Front Panel (DFP) console.\n"
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


&8000:          .word 0x1234
&a000:          .word 0x1234
&e000:          .word 0x1234

;;; System vectors

&fff0:		JMP I @+1
		.word start

;;; Just in case interrupts are enabled by mistake (and an interrupt somehow
;;; triggered), the ISR simply disables interrupts again.

&fff8:		RTI	; Interrupts do nothing but disable interrupts

.popns

;;; End of file.
