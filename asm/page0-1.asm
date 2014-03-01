;;; Definitions for Page Zero, addresses 01xx.
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


.pushns p0

&0100:
		.reg HWCONFIG R @	; Hardware configuration
		.reg HWTTYS   R @	; TTYs available
		.reg MEMCFG   R @	; RAM and ROM pages found
		.reg ROMSTART R @	; Start of ROM (address or bank number)

.equ MEMCFG_NRAMMSK &00ff		; Number of RAM banks
.equ MEMCFG_NROMMSK &ff00		; Number of ROM banks

.equ HWC_MBU  #---------------1		; MBU present
.equ HWC_DFP  #--------------1-		; DFP present
.equ HWC_IRC  #-------------1--		; IRC present
.equ HWC_TTY  #------------1---		; TTY present
.equ HWC_IDE  #-----------1----		; IDE present
.equ HWC_RTC  #----------1-----		; Real Time Clock (CTN)
.equ HWC_TMR  #---------1------		; Timers present (CTN)
.equ HWC_NVR  #--------1-------		; NVRAM present (CTN)
.equ HWC_FDC  #-------1--------		; FDC present
.equ HWC_SPJ  #------1---------		; SPJ present
.equ HWC_PSG  #-----1----------		; PSG present
.equ HWC_LPT  #----1-----------		; ETH present
.equ HWC_VDU  #---1------------		; VDU present
.equ HWC_ETH  #--1-------------		; ETH present
.equ HWC_GIO  #-1--------------		; GIO present

.equ HWT_DFP  #---------------1		; DFP TTY present
.equ HWT_TTY0 #--------------1-		; TTY 0 present
.equ HWT_TTY1 #-------------1--		; TTY 1 present
.equ HWT_TTY2 #------------1---		; TTY 2 present
.equ HWT_TTY3 #-----------1----		; TTY 3 present

//.equ HWM_1960 HWC_DFP HWC_IRC HWC_TTY HWC_RTC HWC_TMR HWC_NVR ; 
//.equ HWM_1970 HWM_1960 HWM_FDC
//.equ HWM_1980 HWM_1970 
//.equ HWM_1985 HWM_1980 HWC_VDU HWC_SPJ HWC_PSG
//.equ HWC_1990 HWM_1985 HWC_IDE
//.equ HWC_1995 HWM_1990 HWC_

;;; CFT Devices (some of this shares cards, some is on multiple cards)
;;; 
;;; PFP -- Programmer's Front Panel (obsolete)
;;; DEB -- Debugging Board (obsolete)
;;; 
;;; DFP -- Debugging Front Panel
;;; CFT -- Processor
;;; UCB -- Part of processor, always installed
;;; MBU -- Part of processor, always installed
;;; MEM -- 512-1024 kW static RAM, 512 kW ROM board
;;; 
;;; IRC -- 8 Interrupt Controller
;;; TTY -- 4 serial port card
;;; IDE -- Adapter board for up to 4 hard drives
;;; 
;;; FDC -- Floppy Drive Controller (Shugart/IBM)
;;; SPJ -- SpeakJet speech synthesiser
;;; LPT -- Line Printer card (probably sharing with SPJ)
;;; PSG -- AY-3-8910 sound card
;;; 
;;; VDU -- Video Display Unit (VGA output, keyboard, mouse)
;;; ETH -- Ethernet card
;;; 
;;; CTN -- Clock, Timer, NVRAM board (under revision)
;;; GIO -- General I/O board (under revision)

.popns
	
;;; End of file.
