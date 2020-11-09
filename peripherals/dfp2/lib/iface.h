// -*- c -*-
// 
// iface.h — Interface between the C emulator and DFP firmware
// 
// Copyright © 2011–2020 Alexios Chouchoulas
// 
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.

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

        // Callbacks to simulate Buses
        uint8_t         (*ibus_r)(uint8_t raddr);
        void            (*ibus_w)(uint8_t waddr, uint16_t ibus);

        uint8_t         (*mem_r)(uint32_t ab);
        void            (*mem_w)(uint32_t ab, uint16_t db);

        uint8_t         (*io_r)(uint32_t ab);
        void            (*io_w)(uint32_t ab, uint16_t db);

        // Simulate Front Panel Bus
        uint8_t         (*fpd_r)(uint8_t fpaddr);

        // The Front Panel Lights (set the DFP, displayed by the emulator)
        uint8_t         lights[20];

        // The Front Panel Switches (set the emulator, used by the DFP)
        uint8_t         switches[8];

	// uint16_t        (*unit_mem)(int r, int w);
	// uint16_t        (*unit_io)(int r, int w);

	// int             request_testmode;
	// int             request_unpause;
	// int             request_reset;
	// int             request_halt;
	// int             request_run;
	// int             changed_sr;

	// uint16_t  * ir;
	// uint16_t  * pc;
	// uint16_t  * ac;

	// uint8_t   * l;		// A single uint8_t for the L register
	// uint8_t   * i;		// A single uint8_t for the I register
	
	// uint8_t   * v;		// V flag
	// uint8_t   * n;		// N flag
	// uint8_t   * z;		// Z flag

	// uint16_t  * ab;
	// uint16_t  * db;
	// uint16_t  * swright;
	// uint16_t  * swleft;
	// uint16_t  * sr;

	// uint32_t  * uvec;	// Microcode control vector

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
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 8
// indent-tabs-mode: nil
// fill-column: 79
// End:
