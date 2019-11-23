#ifndef __OUTPUT_H__
#define __OUTPUT_H__


#include <stdint.h>

// Terminal 'bells and whistles' functionality

void style_normal();

void style_hibit();

void style_input();

void style_info();

void style_on();

void style_off();

void style_async();

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

void report_error(char *msg);

void report_hex_value(const char *msg, uint32_t val, uint8_t pad);

void report_bool_value(const char *msg, char val);

void report_mismatch(const char *msg, uint16_t should_be, uint16_t was);


#endif // __OUTPUT_H__

// End of file.
