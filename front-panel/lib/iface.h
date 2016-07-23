#ifndef __IFACE_H__
#define __IFACE_H__

#include <stdint.h>
#include <pthread.h>

// These are microcode control vector signals that are inverted by the CFT for
// display on the front panel. This has the counter-intuitive side-effect that
// these signals are read by the DFP inverted, and this has to be emulated.

//#define UVEC_INVERT 0b111111111111100000000000
#define UVEC_INVERT 0xfff800

typedef struct {

	void            (*putc)(uint8_t c);
	uint16_t        (*unit_mem)(int r, int w);
	uint16_t        (*unit_io)(int r, int w);

	int             request_testmode;
	int             request_unpause;
	int             request_reset;
	int             request_halt;
	int             request_run;
	int             changed_sr;

	uint16_t  * ir;
	uint16_t  * pc;
	uint16_t  * ac;

	uint8_t   * l;		// A single uint8_t for the L register
	uint8_t   * i;		// A single uint8_t for the I register
	
	uint8_t   * v;		// V flag
	uint8_t   * n;		// N flag
	uint8_t   * z;		// Z flag

	uint16_t  * ab;
	uint16_t  * db;
	uint16_t  * swright;
	uint16_t  * swleft;
	uint16_t  * sr;

	uint32_t  * uvec;	// Microcode control vector

	pthread_mutex_t lock;
	pthread_mutex_t rx_lock;
	pthread_mutex_t tx_lock;

} dfp_cb_t;



extern dfp_cb_t dfp_cb;

void dfp_fw_init();

void dfp_fw_run();

void dfp_fw_rx(unsigned char c);

void dfp_fw_sr(uint16_t sr);

void dfp_fw_iocmd(uint8_t is_write);


#endif // __IFACE_H__

// End of file.
