;;; A test program for the Javascript CFT Emulator.
;;;
;;; Copyright © 2013 Alexios Chouchoulas.
;;;
;;; This program is free software; you can redistribute it and/or modify
;;; it under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 2, or (at your option)
;;; any later version.
;;; 
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;; 
;;; You should have received a copy of the GNU General Public License
;;; along with this program; if not, write to the Free Software Foundation,
;;; Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  


.include "../../asm/testing.asm" ; Debugging board definitions
.include "../../asm/io.asm"	 ; Panel register definitions


;;; Fill both RAM and ROM parts of the image with SENTINEL instructions, which
;;; cause the emulator to terminate. This is so we can catch addresses which
;;; don't contain valid code. On the real CFT, there's no such safety net.
	
&0000:
	.fill 65535 SENTINEL


;;; C000: Entry point. Halts, then jumps to the address toggled in the Switch
;;;       Register.

&c000:
start:	
	LI 0
	NOT
	SOR
	LI 0
	HALT
	LSR
	STORE R 1
	JMP I R 1


;;; C100: Counter. Counts up from zero to the value of the Switch Register
;;;       (which can be changed while the program is running). The Output
;;;       Register displays the count.

&c100:
count_again:	
	;; Counter
	LI 0
	STORE R 10
acloop:	LOAD R 10
	INC
	STORE R 10
	SOR
	LSR
	XOR R 10
	SZA
	JMP acloop
	SUCCESS
	HALT
	JMP count_again


;;; C200: Adding machine with printout. Toggle in value to add, then actuate
;;;       the Run switch. The running total is shown on the Output Register
;;;       and printed out to the debugging terminal.

&c200:
	;; Adding machine
	LI 0
	STORE R 10
	SOR
	HALT
addloop:	
	LSR
	ADD R 10
	STORE R 10
	SOR
	PRINTD
	PRINTNL
	HALT
	JMP addloop
	

;;; C300: Echo. The Accumulator and Output Register follow the value set on the
;;;       switches.

&c300:
echoloop:	
	LSR
	SOR
	JMP echoloop
	

;;; C400: Rolling lights. The program halts. Set a starting light pattern using
;;;       the Switch Register and actuate the Run switch. The Accumulator and
;;;       Output Register display a rolling lights display using that pattern.
;;;       The added 17th bit (seen as a gap) is because the L register also
;;;       participates in the rolls, but isn't set from the initial pattern.

&c400:
	CLL
	LI 0
	SOR
	HALT
	LSR
roll:	
	RBL
	SOR
	JMP roll


;;; C500: Fibonacci sequence. The Output Register shows the Fibonacci sequence.
;;;       The sequence is also printed out on the debug terminal.

	.equ n1 R &10		; First number
	.equ n2 R &11		; Second number
	.equ tmp0 R &12		; Temporary

&c500:
fib:	
	CLL			; Clear L
	LI 0			; Seed the generator with 0, 1.
	STORE n1
	LI 1
	STORE n2

fib_loop:	
	LOAD n2
	STORE tmp0
	ADD n1
	SCL			; L set? If so, we ran out of bits. Stop.
	JMP fib_done
	
	SOR
	PRINTD
	PRINTSP
	STORE n2
	LOAD tmp0
	STORE n1
	JMP fib_loop

fib_done:	
	SUCCESS
	HALT
	JMP fib
	


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
	.equ neglimit R &014	; The last number (negated, for subtracting)
	.equ tmp R &015		; Temporary register
	.equ tmp2 R &016	; Temporary register
	.equ count R &017	; 
	
&c600:
eratosthenes:	
	;; Prepare the pad

	LOAD sieve_cnt		; Size of working memory
	STORE count

	LOAD count
	PRINTD
	PRINTNL
	
	NEG
	STORE x			; Prepare for clearing the working memory
	LOAD sieve_start	; Autoindex pointer
	STORE I0

	LOAD count		; Used for limit checking
	NEG
	STORE neglimit

	LI 1
	STORE ONE

	;; The first prime we report, 2, is found at initialisation time.
	;; Since it's the prime that takes the most to mark (half of the
	;; pad has to be marked!), we join this step and the pad init
	;; step and start looking for primes at 3.

	LI 2			; Report 2
	SOR
	PRINTD
	PRINTSP

sieve_clear:
	LOAD x
	AND ONE			; Heh. EBM reference.
	XOR ONE			; Thus we initialise the entire table for prime=2
	STORE I I0
	ISZ x
	JMP sieve_clear

sieve_init:
	LI 2			; pos = 2 (to be incremented soon)
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
	JMP sieve_next_prime	; No. Done with the pad, find next prime.

	;; Within limits. Mark as non-prime and loop.
	LI 1			; pad[x] = 1
	STORE I tmp2
	LOAD tmp
	JMP sieve_mark_mult

sieve_done:
	SUCCESS
	HALT
	JMP eratosthenes	;; If the user continues here, restart.
	
sieve_start:
	.word &1000
sieve_cnt:
	.word 30



;;; C700: Hello world program. Prints out The Standard Message on the debug
;;;       terminal.

&c700:
hello_world:	
	LIA hello
	STORE R &80

hello_loop:	
	LOAD I R &80
	SOR
	SNZ
	JMP hello_done
	PRINTC
	JMP hello_loop

hello_done:
	SUCCESS
	HALT
	JMP hello_world

hello:	.str "Hello, world!\n"
	.str "This is a microcode-level CFT emulator written in Javascript!\n"
	.str "It's approximately 15,000 times slower than the real thing,\n"
	.str "but it works!\n" 0


;;; System vectors

&fff0:
	JMP I boot
boot:	.word start

;;; Just in case interrupts are enabled by mistake (and an interrupt somehow
;;; triggered), the ISR simply disables interrupts again.

&fff8:	RTI			; Interrupts do nothing but disable interrupts

;;; End of file.
