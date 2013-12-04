#ifndef __OUTPUT_H__
#define __OUTPUT_H__


#include <stdint.h>


void report(const char *msg);

void report_n(const char *msg, uint16_t n);

#define report_c serial_write

//#ifdef AVR
char * report_pstr(const char *msg);

void report_npstr(const char *msg, uint16_t n);
//#else

// No need for these variants on the host. Alias report() and report_n()
// instead.

//#define report_pstr report
//#define report_npstr report_n

//#endif // HOST

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


#endif // __OUTPUT_H__

// End of file.
