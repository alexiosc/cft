#ifndef __BUS_H__
#define __BUS_H__


#include <stdint.h>


// Flags for _cb[x]

#define CB0_NIRQ6     0x01
#define CB0_NIRQ1     0x02
#define CB0_NINCPC    0x04
#define CB0_NWAC      0x08
#define CB0_NRPC      0x10
#define CB0_NWAR      0x20
#define CB0_NWIR      0x40
#define CB0_NWPC      0x80

#define CB1_NSAFE     0x01
#define CB1_NRESET    0x02
#define CB1_NRSTHOLD  0x04
                      //...
#define CB1_NWEN      0x20
#define CB1_NFPRAM    0x40
#define CB1_NFPRESET  0x80

//#define CB2_xxx     0x01
#define CB2_W         0x02
#define CB2_R         0x04
#define CB2_MEM       0x08
#define CB2_IO        0x10
#define CB2_HALT      0x20
#define CB2_FPRUN     0x40
#define CB2_FPSTOP    0x80

#define CB0_OUTPUTS   0xff	// All outputs are active low
#define CB1_OUTPUTS   0xff	// All outputs are active low
#define CB2_OUTPUTS   0xff ^ (CB2_MEM|CB2_IO|CB2_R|CB2_W)  // HALT# asserted, RUN/STOP lights both on.


uint8_t buschatter();

uint8_t assert_halted();

#define SPACE_MEM 0
#define SPACE_IO 1

uint16_t perform_read(uint8_t space, uint16_t addr);

uint8_t perform_write(uint8_t space, uint16_t addr, uint16_t word);

void start_block_write(uint8_t space);

void perform_block_write(uint16_t addr, uint16_t word);

void end_block_write(uint8_t space);

uint16_t perform_block_read(uint16_t base, int16_t n, uint16_t * buf);

#define REG_IR   0
#define REG_AC   1
#define REG_PC   2
#define REG_PCAR 3

uint8_t set_reg(uint8_t reg, uint16_t value);


#endif // __BUS_H__

// End of file.
