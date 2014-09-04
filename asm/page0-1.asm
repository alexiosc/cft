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
		.reg HWDIS    R @	; Disabled devices
		.reg HWMODE   R @	; Hardware mode ('year')
		.reg HWTTYS   R @	; TTYs available
		.reg MEMCFG   R @	; RAM and ROM pages found
		.reg ROMSTART R @	; Start of ROM (address or bank number)
		.reg HWENV    R @	; Hardware Environment

;;; Flags for HWCONFIG

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
.equ HWC_LPT  #----1-----------		; LPT present
.equ HWC_VDU  #---1------------		; VDU present
.equ HWC_ETH  #--1-------------		; ETH present
.equ HWC_GIO  #-1--------------		; GIO present

;;; Flags for HWTTYS

.equ HWT_DFP  #---------------1		; DFP TTY present
.equ HWT_TTY0 #--------------1-		; TTY 0 present
.equ HWT_TTY1 #-------------1--		; TTY 1 present
.equ HWT_TTY2 #------------1---		; TTY 2 present
.equ HWT_TTY3 #-----------1----		; TTY 3 present
.equ HWT_VDU  #------1---------		; VDU present

;;; Bit field definitions for MEMCFG

.equ MEMCFG_NRAMMSK &00ff		; Number of RAM banks (0 = 256)
.equ MEMCFG_NROMMSK &ff00		; Number of ROM banks

;;; Flags for HWENV

.equ HWE_HW   0				; Running on hardware
.equ HWE_V    1				; Verilog emulation (very slow)
.equ HWE_JS   2				; Javascript emulation (slow)
.equ HWE_C    3				; C emulation
		

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


;;; MBU registers

.reg MBU_BANK0 R @		; Bank 0 physical address (top 8 bits)
.reg MBU_BANK1 R @		; Bank 1 physical address (top 8 bits)
.reg MBU_BANK2 R @		; Bank 2 physical address (top 8 bits)
.reg MBU_BANK3 R @		; Bank 3 physical address (top 8 bits)
.reg MBU_BANK4 R @		; Bank 4 physical address (top 8 bits)
.reg MBU_BANK5 R @		; Bank 5 physical address (top 8 bits)
.reg MBU_BANK6 R @		; Bank 6 physical address (top 8 bits)
.reg MBU_BANK7 R @		; Bank 7 physical address (top 8 bits)

;;; Memory allocation

.reg MLC_BITMAP0 R @		; Bank allocation bitmap, banks 00-0f
.reg MLC_BITMAP1 R @		; Bank allocation bitmap, banks 10-1f
.reg MLC_BITMAP2 R @		; Bank allocation bitmap, banks 20-2f
.reg MLC_BITMAP3 R @		; Bank allocation bitmap, banks 30-3f
.reg MLC_BITMAP4 R @		; Bank allocation bitmap, banks 40-4f
.reg MLC_BITMAP5 R @		; Bank allocation bitmap, banks 50-5f
.reg MLC_BITMAP6 R @		; Bank allocation bitmap, banks 60-6f
.reg MLC_BITMAP7 R @		; Bank allocation bitmap, banks 70-7f
.reg MLC_BITMAP8 R @		; Bank allocation bitmap, banks 80-8f
.reg MLC_BITMAP9 R @		; Bank allocation bitmap, banks 90-9f
.reg MLC_BITMAPA R @		; Bank allocation bitmap, banks a0-af
.reg MLC_BITMAPB R @		; Bank allocation bitmap, banks b0-bf
.reg MLC_BITMAPC R @		; Bank allocation bitmap, banks c0-cf
.reg MLC_BITMAPD R @		; Bank allocation bitmap, banks d0-df
.reg MLC_BITMAPE R @		; Bank allocation bitmap, banks e0-ef
.reg MLC_BITMAPF R @		; Bank allocation bitmap, banks f0-ff

;;; Interrupt handling.
;;;
;;; These locations are initialised with the addresses of the ROM interrupt
;;; handlers. User programs can install their own interrupt handlers by
;;; replacing the addresses with their own, and jumping to the original address
;;; at the end of their code, thus daisy-chaining interrupt handlers.

.reg ISRVEC R @				; The main Interrupt Service Routine
.reg ISR0VEC R @			; ISR for IRQ0
.reg ISR1VEC R @			; ISR for IRQ1
.reg ISR2VEC R @			; ISR for IRQ2
.reg ISR3VEC R @			; ISR for IRQ3
.reg ISR4VEC R @			; ISR for IRQ4
.reg ISR5VEC R @			; ISR for IRQ5
.reg ISR6VEC R @			; ISR for IRQ6
.reg ISR7VEC R @			; ISR for IRQ7

;;; ;;; Operating System variables

.reg ERRNO R @				; OS Result code

;;; Terminal driver pointers.

.equ _tty0p @
.reg TTY0_PTR R @			; TTY0: pointer to TTY struct
.reg TTY1_PTR R @			; TTY1: pointer to TTY struct
.reg TTY2_PTR R @			; TTY2: pointer to TTY struct
.reg TTY3_PTR R @			; TTY3: pointer to TTY struct
.reg TTY4_PTR R @			; TTY4: pointer to TTY struct
.reg TTY5_PTR R @			; TTY5: pointer to TTY struct
.reg TTY6_PTR R @			; TTY6: pointer to TTY struct
.reg TTY7_PTR R @			; TTY7: pointer to TTY struct
.equ _ttyNp @
		
;;; We have two sets of TTY handles in page 0. These should cover most use
;;; cases without needing excessive calls to to setup subroutines.

.reg TTYA R @				; Opaque handle of the current TTY
.reg TTYA_CTS R @			; Current TTY: clear to send data
.reg TTYA_SEND R @			; Current TTY: send character
.reg TTYA_DSR R @			; Current TTY: data set ready to receive
.reg TTYA_READ R @			; Current TTY: read character
.reg TTYA_STATUS R @			; Current TTY: read status
.reg TTYA_CTL R @			; Current TTY: control device

.reg TTYB R @				; Opaque handle of the current TTY
.reg TTYB_CTS R @			; Current TTY: clear to send data
.reg TTYB_SEND R @			; Current TTY: send character
.reg TTYB_DSR R @			; Current TTY: data set ready to receive
.reg TTYB_READ R @			; Current TTY: read character
.reg TTYB_STATUS R @			; Current TTY: read status
.reg TTYB_CTL R @			; Current TTY: control device

.reg TTYC R @				; Opaque handle of the current TTY
.reg TTYC_CTS R @			; Current TTY: clear to send data
.reg TTYC_SEND R @			; Current TTY: send character
.reg TTYC_DSR R @			; Current TTY: data set ready to receive
.reg TTYC_READ R @			; Current TTY: read character
.reg TTYC_STATUS R @			; Current TTY: read status
.reg TTYC_CTL R @			; Current TTY: control device

;;; Mass storage device pointers. There's space for up to 12 units: four
;;; floppies, four HDDs, and four other devices (e.g. RAM disks, networked
;;; devices etc.)

.equ _msd0p @
.reg MSD0_PTR R @			; MSD0: pointer to MSD struct
.reg MSD1_PTR R @			; MSD1: pointer to MSD struct
.reg MSD2_PTR R @			; MSD2: pointer to MSD struct
.reg MSD3_PTR R @			; MSD3: pointer to MSD struct
.reg MSD4_PTR R @			; MSD4: pointer to MSD struct
.reg MSD5_PTR R @			; MSD5: pointer to MSD struct
.reg MSD6_PTR R @			; MSD6: pointer to MSD struct
.reg MSD7_PTR R @			; MSD7: pointer to MSD struct
.reg MSD8_PTR R @			; MSD8: pointer to MSD struct
.reg MSD9_PTR R @			; MSD9: pointer to MSD struct
.reg MSD10_PTR R @			; MSD10: pointer to MSD struct
.reg MSD11_PTR R @			; MSD11: pointer to MSD struct
.equ _msdNp @

;;; We have two sets of MSD handles in page 0. These should cover most use
;;; cases without needing excessive calls to to setup subroutines.

.reg MSDA_HANDLE R @			; Opaque handle for the current MSD
.reg MSDA_SIZE R @			; Current MSD: Get size of MSD unit
.reg MSDA_READ R @			; Current MSD: Read a block
.reg MSDA_WRITE R @			; Current MSD: Write a block
.reg MSDA_STATUS R @			; Current MSD: Read status of device
.reg MSDA_CTL R @			; Current MSD: Device control

.reg MSDB_HANDLE R @			; Opaque handle for the current MSD
.reg MSDB_SIZE R @			; Current MSD: Get size of MSD unit
.reg MSDB_READ R @			; Current MSD: Read a block
.reg MSDB_WRITE R @			; Current MSD: Write a block
.reg MSDB_STATUS R @			; Current MSD: Read status of device
.reg MSDB_CTL R @			; Current MSD: Device control

.reg MSDC_HANDLE R @			; Opaque handle for the current MSD
.reg MSDC_SIZE R @			; Current MSD: Get size of MSD unit
.reg MSDC_READ R @			; Current MSD: Read a block
.reg MSDC_WRITE R @			; Current MSD: Write a block
.reg MSDC_STATUS R @			; Current MSD: Read status of device
.reg MSDC_CTL R @			; Current MSD: Device control

;;; Storage (filesystem) driver entry points. There will be calls to open a
;;; filesystem based on a scanned list of volumes per MSD. This list is dynamic
;;; and can be long, so it's not stored here. (it'll probably be a Forth
;;; dictionary)

.reg FS_HANDLE R @			; Current filesystem handle
.reg FS_SIZE R @			; Current FS: Get size of MSD unit
.reg FS_READ R @			; Current FS: Read a block
.reg FS_WRITE R @			; Current FS: Write a block
.reg FS_STATUS R @			; Current FS: Read status of device
.reg FS_CTL R @				; Current FS: Device control

;;; DFP variables

.reg DFP_LASTC				; Result of last read (IN dfp.RX)
		
;;; 
;;; 
;;; 
;;; 
;;; 
;;; 
;;; ;;; VDU variables
;;;
;;; Note:	 these should really be user variables

.reg VDU_ATTR     R @		; VDU current attribute
.reg VDU_ROWS     R @		; VDU screen number of rows
.reg VDU_COLS     R @		; VDU screen number of columns
.reg VDU_STADDR   R @		; VDU copy of VDU SAR (start address)
.reg VDU_CRSADDR  R @ 		; Cursor address

.reg VDU_SCRSZ    R @		; VDU screen size (in cells)
.reg VDU_SCR      R @		; VDU copy of VDU SCR (top of screen)
.reg VDU_CA       R @		; VDU copy of the CA register
.reg VDU_CPX      R @		; VDU cursor position, X ordinate (0..VDUCNC)
.reg VDU_CPY      R @		; VDU cursor position, Y ordinate (0..VDUCNR)

.popns
	
;;; End of file.
