;;; -*- cftasm -*-
;;; 
;;; Definitions for the TMR (Real Time Clock) device, part of the TIC board.

;;; The TMR has one or two 82C54 timer ICs. The datasheet is here:
;;;
;;; http://www.scs.stanford.edu/10wi-cs140/pintos/specs/8254.pdf
;;;
;;; The devices are timed using a 32,768 Hz oscillator. With their 16-bit
;;; timers, they can count periods of 30 microseconds to 2 seconds with a
;;; resolution of 30 microseconds which should be fine for the CFT's intended
;;; use.

.pushns tmr

;;; Useful macros.

.macro read(addr)
		LI %addr		; macro: TMR.read(addr)
		OUT irc.ADDR		; Set the read address
		IN  irc.DATA		; Read data
.endmacro

.macro write(addr, data)
		TAD			; macro: TMR.write(addr, data)
		LI %addr		; 
		OUT irc.ADDR		; Set the read address
		TDA
		OUT irc.DATA		; Read data
.endmacro


;;; Definitions

.equ TMR0 &14				; Base address of Timer 0
.equ TMR0 &18				; Base address of Timer 1

.equ T0 0				; Timer 0 address offset
.equ T1 1				; Timer 1 address offset
.equ T2 2				; Timer 2 address offset
.equ CW 3				; Control Word


;;; Control Word format

.pushns cw
.equ CTR0  #00------			; Select counter 0
.equ CTR1  #01------			; Select counter 1
.equ CTR2  #10------			; Select counter 2

.equ CLC   #--00----			; Counter Latch Command
.equ LSB   #--01----			; Read/Write LSB only
.equ MSB   #--10----			; Read/Write MSB only
.equ RWB   #--11----			; Read/Write LSB followed by MSB

.equ MODE0 #----000-			; Mode 0: Interrupt on Terminal Count
.equ MODE1 #----001-			; Mode 1: HW-Retriggerable One-Shot
.equ MODE2 #----010-			; Mode 2: Rate Generator
.equ MODE3 #----011-			; Mode 3: Square Wave Mode
.equ MODE4 #----100-			; Mode 4: Software Triggered Strobe
.equ MODE5 #----101-			; Mode 5: Hardware Triggered Strobe

.equ BCD  #-------1			; Count in BCD (4 decades only)
		
.popns cw

;;; To detect the TMR, read TMR.DATA. The top eight bits should be as
;;; follows:

.equ DET_MASK   #11111111'00000000
.equ TMR_DETECT #11110000'--------

;;; The TMR stores data in BCD format.

.equ YEAR  &FF
.equ MONTH &FE
.equ DATE  &FD
.equ DOW   &FC				; Also FT bit
.equ HOUR  &FB
.equ MIN   &FA
.equ SEC   &F9				; Zero in the high bit stops the clock
.equ CLBR  &F8				; Clock calibration

.equ STOP  &8000

.popns tmr

;;; End of file.
