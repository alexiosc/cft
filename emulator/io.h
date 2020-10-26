// -*- c -*-
// 
// io.h — I/O definitions
// 
// Copyright © 2012–2020 Alexios Chouchoulas
// 
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.

#ifndef IO_H
#define IO_H 1

#include "cftemu.h"
#include "ringbuf.h"


///////////////////////////////////////////////////////////////////////////////
//
// TTY-LIKE DEVICES
//
///////////////////////////////////////////////////////////////////////////////

#define MAGIC_TTY_T 0x54545954  // "TTYT"
#define DEFAULT_BUFBITS 8       // 256-byte buffers

typedef enum {
        TTM_UNASSIGNED = 0,
        TTM_NONE,
        TTM_FD,
        TTM_FILE
} tty_mode_t;


typedef struct {
        uint32_t    magic;

	char *      name;		      // Explanatory name of this device
	char *      dev;		      // 4-letter code of the I/O device

	int         hits;		      // For UI activity indicators

        tty_mode_t  mode;                     // TTY mode
        int         in_fd;                    // Unix file descriptor, input
        int         out_fd;                   // Unix file descriptor, output
        FILE *      fp;                       // C library file (may be NULL)
        char *      fname;                    // Filename (may be NULL)

        uint8_t     bufbits;                  // log₂ of ringbuf buffer size
        ringbuf_t * input;                    // Data from the outside world
        ringbuf_t * output;                   // Data to the outside world

	// void   (*init)();	              // Initialiser callback
	// void   (*reset)();		      // Reset callback
	// void   (*done)();                  // Teardown callback
} tty_t;


///////////////////////////////////////////////////////////////////////////////
//
// I/O DEVICES
//
///////////////////////////////////////////////////////////////////////////////

#define MAGIC_DEV_T 0x44455654  // "DEVT"

typedef struct iodev_t {
        uint32_t    magic;

	char *      name;		      // Name of the I/O device
	char *      code;		      // 3-letter code of the I/O device
	uint32_t    enabled;		      // Device enabled?

	int         hits;		      // For UI activity indicators

        int         nttys;                    // Number of tty_t devices below
        tty_t       ttys[8];                  // Up to 8 TTYs per device

	void   (*init)(struct iodev_t *);     // Initialiser callback
	void   (*reset)();		      // Reset callback
	void   (*done)();                     // Teardown callback
	void   (*tick)(int);                  // Timer tick callback
	int    (*read)(longaddr_t, word *);   // Read from device
	int    (*write)(longaddr_t, word);    // Read to device
} iodev_t;

extern iodev_t iodevs[];


// Enable or device the specified device. ‘dev’ is the three-letter device
// code. The function returns 0 if the device was not found.
int io_set_enable(char *dev, int enabled);

#define io_enable(dev) io_set_enable(dev, 1)
#define io_disable(dev) io_set_enable(dev, 0)

void io_init();

void io_reset();

void io_tick();

void io_done();

int io_read(longaddr_t addr, word * data);

int io_write(longaddr_t addr, word data);

// Print out table of devices and exit.
void io_list_devs();

// Print out table of TTY-like devices and exit.
void io_list_ttys();

// Find a TTY by name (naively, but there aren't many)
tty_t * io_find_tty(char *);

void io_tty_init(tty_t *);

void io_tty_set_term(tty_t *);

void io_tty_set_fname(tty_t *, char *);



#if 0
#warning "These are from the pre-2019 CFT, re-evaluate!"

// Flags: r = readable register, w = writable register, h = hardware emulation,
// e = emulator only, f = address fully decoded (register mapped to a
// single address)

// The Microcode Banking Extension: occupies the first 32 ports. An
// OUT to the first 16 ports (&00-&0F) selects one of the 16 microcode
// banks to be ‘permanent’ (until changed or the computer resets). The
// upper 16 ports (&10-&1F) change the microcode bank for the next
// instruction only.
#define IO_UCB_BASE_PERM   0x0000 //   00-0F: -whef UCBP (set permanent microcode bank)
#define IO_UCB_BASE_TEMP   0x0010 //   10-1F: -whef UCBT (set temporary microcode bank)

// The memory banking controller. Note: setting bit 8 of any of
// addresses &20-&23 disables banking.
#define IO_MEMBANK0        0x0020 //      20: -whef MBR0 (Memory Bank Register 0)
#define IO_MEMBANK1        0x0021 //      21: -whef MBR1 (Memory Bank Register 1)
#define IO_MEMBANK2        0x0022 //      22: -whef MBR2 (Memory Bank Register 2)
#define IO_MEMBANK3        0x0023 //      23: -whef MBR3 (Memory Bank Register 3)
#define IO_MEMBANK4        0x0024 //      24: -whef MBR4 (Memory Bank Register 4)
#define IO_MEMBANK5        0x0025 //      25: -whef MBR5 (Memory Bank Register 5)
#define IO_MEMBANK6        0x0026 //      26: -whef MBR6 (Memory Bank Register 6)
#define IO_MEMBANK7        0x0027 //      27: -whef MBR7 (Memory Bank Register 7)

// The Interrupt controller
#define IO_IRC_ICR         0x0030 //      28: -whef ICR (Interrupt Command Register)
#define IO_IRC_ISR         0x0030 //      28: r-hef ISR (Interrupt Status Register)


// The debugging front panel board (see asm/dfp.asm for definitive reference)
#define IO_DFP_MASK        ((0x001f) ^ 0xffff)
#define IO_DFP_BASE        0x0100

#define IO_SOR             0x0100 //     100: -w-ef SOR (set output register)
#define IO_LSR             0x0100 //     100: r--ef LSR (read switch register)
#define IO_LDSR            0x0101 //     101: r--ef LDSR (read DIP switch register)
#define IO_ENEF            0x0108 //     108: -w-ef ENEF (enable features)
#define IO_QEF             0x0108 //     108: r--ef QEF (query features)
#define IO_DISEF           0x0109 //     109: -w-ef DISEF (disable features)
#define IO_DFP_ICR         0x010a //     10a: -w-ef ICR (DFP Interrupt Control register)
#define IO_DFP_ISR         0x010a //     10a: r--ef ISR (DFP Interrupt status register)
#define IO_SENTINEL        0x010f //     10f: -w-ef SENTINEL instruction
#define IO_PRINTA	   0x0110 //     110: -whef Log AC as address
#define IO_PRINTC	   0x0111 //     111: -whef Print AC to DFP TTY
#define IO_READC      	   0x0111 //     111: r-hef Read character from DFP TTY
#define IO_PRINTD	   0x0112 //     112: -whef Log AC as integer
#define IO_PRINTU	   0x0113 //     113: -whef Log AC as unsigned int
#define IO_PRINTH	   0x0114 //     114: -whef Log AC in hex
#define IO_PRINTB	   0x0115 //     116: -whef Log AC in binary
#define IO_PRINTSP	   0x0116 //     116: -whef Log a space
#define IO_PRINTNL	   0x0117 //     117: -whef Log a newline
#define IO_DEBUGON	   0x0118 //     118: -w-ef Emulator enables assembly tracing
#define IO_DEBUGOFF	   0x0119 //     119: -w-ef Emulator disables assembly tracing
#define IO_DUMP  	   0x011a //     11a: -w-ef Emulator dumps state
#define IO_PRINTHI	   0x011b //     11b: -whef HI:=AC
#define IO_PRINTLO	   0x011c //     11c: -whef Log 32-bit int as HI:AC
#define IO_HALT	           0x011d //     11d: -whef Debugging halt
#define IO_SUCCESS         0x011e //     11e: -whef Log test success
#define IO_FAIL 	   0x011f //     11f: -whef Log test failure and HALTh

// NEWEST HARDWARE VERIFIED UP TO HERE




// The front panel board (old, obsolete. See ‘DFP’)
// #define IO_PANEL_SWITCHES  0x0030 //      08: r-hef SR0  (front panel switches)
// #define IO_DIP_SWITCHES    0x0031 //      09: r-hef SR1  (front panel dip-switches)
// #define IO_PANEL_LIGHTS    0x0032 //      0a: -whef OR   (front panel output LEDs)
// #define IO_CLOCK_HALT      0x0037 //      0f: -whef HIR  (front panel HALT)

// The video card (old, obsolete. See ‘VDU’)
// #define IO_VIDEO_VSR	   0x0020 //      20: r-hef VSR  (Video Status Register)
// #define IO_VIDEO_MCR	   0x0020 //      20: -whef MCR  (Mode Control Register)
// #define IO_VIDEO_VWR	   0x0021 //      21: -whef VWR  (Video Window Register)
// #define IO_VIDEO_SSR       0x0022 //      22: -whef SSR  (Video Screen Start Register)
// #define IO_VIDEO_SER       0x0023 //      23: -whef SER  (Video Screen End Register)
// #define IO_VIDEO_SCR       0x0024 //      24: -whef SCR  (Video SCroll Control Register
// #define IO_VIDEO_RSVD5     0x0025 //      25: -whef   reserved *\/
// #define IO_VIDEO_CAR       0x0026 //      26: -whef CAR  (Cursor address register)
// #define IO_VIDEO_CCR       0x0027 //      27: -whef CCR  (Cursor control register)

// The 16550 UARTs (up to four)
#define IO_TTY0_RX         0x0060 //      60: r-hef TTY0RX Receive buffer
#define IO_TTY0_TX         0x0060 //      60: -whef TTY0TX Transmit buffer
#define IO_TTY0_IER        0x0061 //      61: rwhef TTY0IER Interrupt enable
#define IO_TTY0_IIR        0x0062 //      62: r-hef TTY0IIR Interrupt identification
#define IO_TTY0_FCR        0x0062 //      62: -whef TTY0FCR FIFO Control
#define IO_TTY0_LCR        0x0063 //      63: rwhef TTY0LCR Line Control
#define IO_TTY0_MCR        0x0064 //      64: rwhef TTY0MCR Modem Control
#define IO_TTY0_LSR        0x0065 //      65: rwhef TTY0MCR Line Status
#define IO_TTY0_MSR        0x0066 //      66: rwhef TTY0MSR Modem Status
#define IO_TTY0_SCR        0x0067 //      67: rwhef TTY0SCR Scratch Register

#define IO_TTY1_RX         0x0068 //      68: r-hef TTY1RX Receive buffer
#define IO_TTY1_TX         0x0068 //      68: -whef TTY1TX Transmit buffer
#define IO_TTY1_IER        0x0069 //      69: rwhef TTY1IER Interrupt enable
#define IO_TTY1_IIR        0x006a //      6a: r-hef TTY1IIR Interrupt identification
#define IO_TTY1_FCR        0x006a //      6a: -whef TTY1FCR FIFO Control
#define IO_TTY1_LCR        0x006b //      6b: rwhef TTY1LCR Line Control
#define IO_TTY1_MCR        0x006c //      6c: rwhef TTY1MCR Modem Control
#define IO_TTY1_LSR        0x006d //      6d: rwhef TTY1MCR Line Status
#define IO_TTY1_MSR        0x006e //      6e: rwhef TTY1MSR Modem Status
#define IO_TTY1_SCR        0x006f //      6f: rwhef TTY1SCR Scratch Register

#define IO_TTY2_RX         0x0070 //      70: r-hef TTY2RX Receive buffer
#define IO_TTY2_TX         0x0070 //      70: -whef TTY2TX Transmit buffer
#define IO_TTY2_IER        0x0071 //      71: rwhef TTY2IER Interrupt enable
#define IO_TTY2_IIR        0x0072 //      72: r-hef TTY2IIR Interrupt identification
#define IO_TTY2_FCR        0x0072 //      72: -whef TTY2FCR FIFO Control
#define IO_TTY2_LCR        0x0073 //      73: rwhef TTY2LCR Line Control
#define IO_TTY2_MCR        0x0074 //      74: rwhef TTY2MCR Modem Control
#define IO_TTY2_LSR        0x0075 //      75: rwhef TTY2MCR Line Status
#define IO_TTY2_MSR        0x0076 //      76: rwhef TTY2MSR Modem Status
#define IO_TTY2_SCR        0x0077 //      77: rwhef TTY2SCR Scratch Register

#define IO_TTY3_RX         0x0078 //      78: r-hef TTY3RX Receive buffer
#define IO_TTY3_TX         0x0078 //      78: -whef TTY3TX Transmit buffer
#define IO_TTY3_IER        0x0079 //      79: rwhef TTY3IER Interrupt enable
#define IO_TTY3_IIR        0x007a //      7a: r-hef TTY3IIR Interrupt identification
#define IO_TTY3_FCR        0x007a //      7a: -whef TTY3FCR FIFO Control
#define IO_TTY3_LCR        0x007b //      7b: rwhef TTY3LCR Line Control
#define IO_TTY3_MCR        0x007c //      7c: rwhef TTY3MCR Modem Control
#define IO_TTY3_LSR        0x007d //      7d: rwhef TTY3MCR Line Status
#define IO_TTY3_MSR        0x007e //      7e: rwhef TTY3MSR Modem Status
#define IO_TTY3_SCR        0x007f //      7f: rwhef TTY3SCR Scratch Register

// The NVRAM/RTC/timer board
#define IO_NVRAM_BASE	   0x0080 //   80-8F: rwhef NVRx (NVRAM aperture, 16 bytes)
#define IO_NVRAM_WINDOW	   0x0090 //   90-93: -whe- NVRW (NVRAM window register, 4 copies)
#define IO_TIMER0_REG0     0x0094 //      94: rwhef T0R0 (Timer 0, Reg 0)
#define IO_TIMER0_REG1     0x0095 //      95: rwhef T0R1 (Timer 0, Reg 1)
#define IO_TIMER0_REG2     0x0096 //      96: rwhef T0R2 (Timer 0, Reg 2)
#define IO_TIMER0_REG3     0x0097 //      97: rwhef T0R3 (Timer 0, Reg 3)
#define IO_TIMER1_REG0     0x0098 //      98: rwhef T1R0 (Timer 1, Reg 0)
#define IO_TIMER1_REG1     0x0099 //      99: rwhef T1R1 (Timer 1, Reg 1)
#define IO_TIMER1_REG2     0x009a //      9a: rwhef T1R2 (Timer 1, Reg 2)
#define IO_TIMER1_REG3     0x009b //      9b: rwhef T1R3 (Timer 1, Reg 3)

// The IDE Host Adaptor
#define IO_IDEA_CS3	   0x00a0 //   a0-a7: rwhef HDA3 (IDE A CS3 base)
#define IO_IDEA_CS1	   0x00b0 //   b0-b7: rwhef HDA1 (IDE A CS1 base)
#define IO_IDEB_CS3	   0x00c0 //   c0-c7: rwhef HDA3 (IDE B CS3 base)
#define IO_IDEB_CS1	   0x00d0 //   d0-d7: rwhef HDA1 (IDE B CS1 base)

// The Ethernet board
#define IO_ETH_REG0        0x00e0 //   E0,E4,E8,EC: rwh-- Ethernet register #0 (four copies)
#define IO_ETH_REG1        0x00e1 //   E1,E5,E9,ED: rwh-- Ethernet register #1
#define IO_ETH_REG2        0x00e2 //   E2,E6,EA,EE: rwh-- Ethernet register #3
#define IO_ETH_REG3        0x00e3 //   E3,E7,EB,EF: rwh-- Ethernet register #3

// The Audio board (AY-3-8910 and SpeakJet®)
#define IO_SND_PSG         0x00f0 //      F0: --whef AY-3-8910 PSG comms register
#define IO_SND_SJW         0x00f1 //      F0: --wh-f SpeakJet® write data
#define IO_SND_SJCR        0x00f2 //      F0: -rwh-f SpeakJet® control register

// The new VDU board
#define IO_VIDEO_SR	   0x01f0 //     1F0: r-hef SR (Status Register)
#define IO_VIDEO_MCR0	   0x01f0 //     1F0: -whef MCR0 (Mode Control Register 0)
#define IO_VIDEO_MCR1	   0x01f1 //     1F1: -whef MCR1 (Mode Control Register 1)
#define IO_VIDEO_SCR0	   0x01f2 //     1F2: -whef SCR0 (Scroll Control Register 0)
#define IO_VIDEO_SCR1	   0x01f3 //     1F3: -whef SCR1 (Scroll Control Register 1)
#define IO_VIDEO_SAR0	   0x01f4 //     1F4: -whef SAR0 (Start Address Register 0)
#define IO_VIDEO_SAR1	   0x01f5 //     1F5: -whef SAR1 (Start Address Register 1)
#define IO_VIDEO_MAR0	   0x01f6 //     1F6: -whef MAR0 (Modulo Address Register 0)
#define IO_VIDEO_MAR1	   0x01f7 //     1F7: -whef MAR1 (Modulo Address Register 1)
#define IO_VIDEO_CCR	   0x01f8 //     1F8: -whef CCR (Cursor Control Register)
#define IO_VIDEO_CAR	   0x01f9 //     1F9: -whef CAR (Cursor Address Register)
#define IO_VIDEO_HAR	   0x01fa //     1FA: -whef HAR (Host Address Register)
#define IO_VIDEO_KBD	   0x01fb //     1FB: rwhef KBD (Keyboard Access Register)

#define IO_VIDEO_CRR	   0x01fd //     1FD: rwhef CRR (Command Repetition Register)
#define IO_VIDEO_CPORT	   0x01fe //     1FE: rwhef CPORT (C Plane Port)
#define IO_VIDEO_CMD	   0x01ff //     1FF: rwhef CMD (Command Register)

#endif



#endif // IO_H

// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 8
// indent-tabs-mode: nil
// fill-column: 79
// End:
