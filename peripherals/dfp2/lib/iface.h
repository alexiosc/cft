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

        // Logging callbacks
        void            (*log)(int level, char *msg);

        // Simulate Front Panel Bus
        uint8_t         fpd[256];

        // The Front Panel Lights (set the DFP, displayed by the emulator)
        uint8_t         lights[20];

        // The Front Panel Switches (set the emulator, used by the DFP)
        uint8_t         switches[8];

        // The DIP switches on the DFP2
        uint8_t         dip_switches;

	// int             request_testmode;
	// int             request_unpause;
	// int             request_reset;
	// int             request_halt;
	// int             request_run;
	// int             changed_sr;

	pthread_mutex_t lock;
	pthread_mutex_t rx_lock;
	pthread_mutex_t tx_lock;

} dfp_cb_t;


// Log levels for the emulator driver. The logging callback on the emulator
// side will translate these to the log levels for the emulator itself.

#define LOG_FATAL   0
#define LOG_ERROR   1
#define LOG_WARN    2
#define LOG_NOTICE  3
#define LOG_INFO    4
#define LOG_DEBUG   5




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
