// -*- c -*-

///////////////////////////////////////////////////////////////////////////////
//
// HUMAN-ORIENTED OUTPUT FUNCTIONALITY
//
///////////////////////////////////////////////////////////////////////////////

#ifndef __OUTPUT_H__
#define __OUTPUT_H__


#include <stdint.h>

#include "dfp.h"

// Terminal 'bells and whistles' functionality

void style_normal();

void style_hibit();

void style_input();

void style_info();

void style_on();

void style_off();

void style_async();

void style_success();

void style_warn();

void style_error();



void report(const char *msg);

void report_n(const char *msg, uint16_t n);

#define report_c serial_write

char * report_pstr_in_console(const char *msg);

char * report_pstr(const char *msg);

void report_npstr(const char *msg, uint16_t n);

#define report_char(c) serial_write(c)

void report_nl();

void report_hex(uint32_t val, uint8_t pad);

void report_uint(uint16_t val);

void report_int(int16_t val);

#define report_bin(v) report_bin_pad((v), 16)

void report_bin_pad(uint16_t val, uint8_t bits);

void report_ok(char *msg);

#define report_error(msg) { style_error(); report_pstr(msg); }

void report_bin_value(const char *msg, uint16_t val, uint8_t bits);

void report_int16_value(const char *msg, int16_t val);

void report_uint16_value(const char *msg, uint16_t val);

void report_hex_value(const char *msg, uint32_t val, uint8_t pad);

void report_bool_value(const char *msg, char val);

void report_errno(errno_t err);

void report_mismatch(const char *msg, uint16_t should_be, uint16_t was, uint8_t pad);


#endif // __OUTPUT_H__

// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 8
// indent-tabs-mode: nil
// fill-column: 79
// End:
