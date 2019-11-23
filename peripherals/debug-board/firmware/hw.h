// -*- indent-c -*-

#ifndef __HW_H__
#define __HW_H__


/* Ports */

//#define NUM_GPIOS 3
#define NUM_GPIOS 2
#define GPIO_BASE_ADDR 0x20
#define GPIO_ADDR_LSB GPIO_BASE_ADDR
#define GPIO_ADDR_MSB (GPIO_BASE_ADDR | 1)
#define GPIO_ADDR_USER (GPIO_BASE_ADDR | 3)

#define GPIO_REG_GP0      0
#define GPIO_REG_GP1      1
#define GPIO_REG_OLAT0    2
#define GPIO_REG_OLAT1    3
#define GPIO_REG_IPOL0    4
#define GPIO_REG_IODIR0   6
#define GPIO_REG_IODIR1   7
#define GPIO_REG_INTCAP0  8
#define GPIO_REG_IOCON0  10

#define GPIO_REG_DB       0
#define GPIO_REG_AB       1


#define PCR PC0
#define PCW PC1
#define PCMEM PC2
#define PCIO PC3

#define PDCONT PD3
#define PDRST  PD4
#define PDHALT PD5

#define PBLED0 PB0
#define PBLED1 PB1
#define PBLED2 PB2
#define PBLED3 PB3


void hw_init();

void gpio_init();

void setleds(uint8_t pattern);

void sethalt(uint8_t on);

void setreset(uint8_t on);


void gpio_config(uint8_t addr, uint8_t p0, uint8_t p1);

#define gpio_hiz gpio_input

void gpio_input();

void gpio_output();

void gpio_busread();


void setab(uint16_t ab);

void setdb(uint16_t db);

uint16_t getdb();

#endif // _HW_H__

// End of file.
