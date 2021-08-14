;;; -*- cftasm -*-
;;; 
;;; Definitions for the RTC (Real Time Clock) board.

;;; The RTC is M48T02-70PC1 TimeKeeper device with 2,048×8 bits of NVRAM, the
;;; top bytes of which have the current time and date, plus control
;;; registers. The datasheet is here:
;;;
;;; https://uk.mouser.com/datasheet/2/389/m48t02-1849963.pdf
;;;
;;; The device is mapped to I/O space. Only the top 256 bytes of it are
;;; accessible. Address lines A8 to A10 are tied high, so the CFT can only
;;; access addresses &700-&7FF.
;;; 
;;; The chip is slow, and to save I/O address loations we use just
;;; two registers: one to set the read/write address, and another to perform
;;; reads and writes.

.pushns rtc

;;; Useful macros.

.macro read(addr)
		LI %addr		; macro: RTC.read(addr)
		OUT irc.ADDR		; Set the read address
		IN  irc.DATA		; Read data
.endmacro

.macro write(addr, data)
		TAD			; macro: RTC.write(addr, data)
		LI %addr		; 
		OUT irc.ADDR		; Set the read address
		TDA
		OUT irc.DATA		; Read data
.endmacro


;;; Definitions

.equ RTC &1C				; Base address
	
.equ ADDR RTC				; RTC ADDR (write-only)
.equ DATA RTC 2				; RTC DATA (read-write)

;;; To detect the RTC, read RTC.DATA. The top eight bits should be as
;;; follows:

.equ DET_MASK   #11111111'00000000
.equ RTC_DETECT #00001111'--------

;;; The RTC stores data in BCD format.

.equ YEAR  &FF
.equ MONTH &FE
.equ DATE  &FD
.equ DOW   &FC				; Also FT bit
.equ HOUR  &FB
.equ MIN   &FA
.equ SEC   &F9				; Zero in the high bit stops the clock
.equ CLBR  &F8				; Clock calibration

.equ STOP  &8000

.popns rtc

;;; End of file.
