#ifndef __BUS_H__
#define __BUS_H__


#include <stdint.h>


typedef struct {
	uint32_t r:1;
	uint32_t wen:1;
	uint32_t _reserved1:1;
	uint32_t fl:1;
	uint32_t fi:1;
	uint32_t fv:1;
	uint32_t fz:1;
	uint32_t fn:1;

	uint32_t end:1;
	uint32_t _reserved2:1;
	uint32_t _reserved3:1;
	uint32_t mem:1;
	uint32_t io:1;
	uint32_t dec:1;
	uint32_t stpac:1;
	uint32_t stpdr:1;

	uint32_t incpc:1;
	uint32_t cli:1;
	uint32_t sti:1;
	uint32_t cll:1;
	uint32_t cpl:1;
	uint32_t opif:4;
	uint32_t wunit:3;
	uint32_t runit:4;

	uint16_t ir;
	uint16_t pc;
	uint16_t ac;
} vpin_bits_t;

typedef union {
	uint16_t     w[5];
	vpin_bits_t  b;
} vpin_t;

typedef struct {
	vpin_t   vp;		// Virtual Panel inputs
	uint16_t hi;		// PRINTHI target
} bus_state_t;


extern bus_state_t bus_state;


uint8_t _buschatter();

uint8_t assert_halted();

#define SPACE_MEM 0
#define SPACE_IO 1

uint16_t _perform_read(uint8_t space, uint16_t addr);

uint8_t _perform_write(uint8_t space, uint16_t addr, uint16_t word);

uint16_t _perform_block_read(uint16_t base, int16_t n, uint16_t * buf);

#define REG_IR 0
#define REG_AC 1
#define REG_PC 2

uint8_t set_reg(uint8_t reg, uint16_t value);


#define IOBASE 0x100
#define _IO(x) (IOBASE|(x))
#define IO_SOR      _IO(0x00)
#define IO_LSR      IO_SOR
#define IO_LDSR     _IO(0x01)
#define IO_ENEF     _IO(0x08)
#define IO_DISEF    _IO(0x09)
#define IO_QEF1     IO_ENEF
#define IO_QEF2     IO_DISEF
#define IO_ICR      _IO(0x0A)
#define IO_ISR      IO_ICR

#define IO_SENTINEL _IO(0x0f)
#define IO_PRINTA   _IO(0x10)
#define IO_PRINTC   _IO(0x11)
#define IO_READC    IO_PRINTC
#define IO_PRINTD   _IO(0x12)
#define IO_PRINTU   _IO(0x13)
#define IO_PRINTH   _IO(0x14)
#define IO_PRINTB   _IO(0x15)
#define IO_PRINTSP  _IO(0x16)
#define IO_PRINTNL  _IO(0x17)
#define IO_DEBUGON  _IO(0x18)
#define IO_DEBUGOFF _IO(0x19)
#define IO_DUMP     _IO(0x1a)
#define IO_PRINTHI  _IO(0x1b)
#define IO_PRINTLO  _IO(0x1c)
#define IO_HALT     _IO(0x1d)
#define IO_SUCCESS  _IO(0x1e)
#define IO_FAIL     _IO(0x1f)

// 0100 0000 0111 1111
#define QEF_BASE_RESULT 0x407f
#define QEF_HOF         0x0080
#define QEF_HOS         0x0100
#define QEF_LOCKED      0x0200

// Bus instructions

/*

  I/O address space usage:

  REG OUT        IN
  ------------------------------
  100 SOR        LSR
  101 -          LDSR
  102 -          -
  103 -          -
  104 -          -
  105 -          -
  106 -          -
  107 -          -
  108 ENEF       QEF (*)
  109 DISEF      QEF
  10A ICR        ISR
  10B -          -
  10C -          -
  10D -          -
  10E -          -
  10F SENTINEL   SENTINEL
  110 PRINTA     -    
  111 PRINTC     READC
  112 PRINTD     -
  113 PRINTU     -
  114 PRINTH     -
  115 PRINTB     -
  116 PRINTSP    -
  117 PRINTNL    -
  118 DEBUGON    DEBUGON
  119 DEBUGOFF   DEBUGOFF
  11A DUMP       DUMP
  11B PRINTHI    -
  11C PRINTLO    -
  11D HALT       HALT
  11E SUCCESS    SUCCESS
  11F FAIL       FAIL


ENEF/DISEF

 Enable/disable features. Flags to enable.

 Bit 0:     Sanity checking (emulator only).
 Bit 1:     Enable/disable SENTINEL
 Bit 2:     Show assembly tracing when DEBUGON is active.
 Bit 3:     Show microcode tracing when DEBUGON is active.
 Bit 4:     Reserved (emulator only).
 Bit 5:     Enable DEB TTY interrupt on char receive.
 Bits 5-15: Reserved.


QEF

  Query Features. Bitmap.

  Bit  0:     PFP present.
  Bit  1:     DEB present.
  Bit  2:     Debug TTY present.
  Bit  3:     PRINTx (other than PRINTC) present.
  Bit  4:     Trace (DEBUGON/OFF) available.
  Bit  5:     DUMP available.
  Bit  6:     SENTINEL available.
  Bit  7:     Halt on fail.
  Bit  8:     Halt on sentinel.
  Bit  9:     Panel is locked.
  Bits 10-15: Always 010000.

  Starting value (before ORring with hof/hos/lock): 0100 0000 0111 1111

SENTINEL

 Execution halts with an appropriate message logged in the debugging
 console.

PRINTA

 Prints value of AC in hex (address format).

PRINTC

  Print out a single character to the debugging TTY.

READC

  Read a character from the debugging TTY. If no character is
  available, bit 15 is set (AC < 0). IRQ6 is signalled if the IRQ
  feature is enabled.

PRINTD

  Print a signed base 10 integer.

PRINTU

  Print an unsigned base 10 integer.

PRINTH

  Print AC as an unsigned hex integer.

PRINTB

  Print AC as 16-digit bitmap.

PRINTSP

  Print a single space.

PRINTNL

  Print a newline.

DEBUGON

  Start tracing (slows down processor).

DEBUGOFF

  Stop tracing.

DUMP

  Dump current CPU state.

PRINTHI

  Store AC into the HI registed.

PRINTLO

  Print HI:AC as a 32-bit hex value.

HALT

  Halt the computer.

SUCCESS

  Print out [ok].

FAIL

  Print out [fail]. Halt if halt-on-fail enabled.

 */

void buscmd_enef(uint16_t val);

void buscmd_disef(uint16_t val);

void buscmd_qef();

void buscmd_print(char op, uint16_t val);

void buscmd_printhi(uint16_t val);

void buscmd_debugon();

void buscmd_debugoff();

void buscmd_dump();

void buscmd_sentinel();

void buscmd_halt();

void buscmd_success();

void buscmd_fail();


#endif // __BUS_H__

// End of file.
