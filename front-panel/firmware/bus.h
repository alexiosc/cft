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


#endif // __BUS_H__

// End of file.
