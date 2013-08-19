// -*- indent-c -*-

#ifndef __TKC_SERIAL_H__
#define __TKC_SERIAL_H__


extern unsigned char my_table_id; // The table ID.


#define report_c serial_send

void serial_init();

void serial_send(unsigned char c);

void report(char *msg);

void report_pstr(const char *msg);

void report_npstr(const char *msg, const uint16_t n);

void report_nl();

void report_hex(uint32_t val, unsigned char pad);

void report_int(int16_t val);

void report_uint(uint16_t val);

void report_bin(uint16_t val);

void report_ok(char *msg);

void report_error(char *msg);



#ifndef SERIAL_BPS
//#define SERIAL_BPS 300UL
//#define SERIAL_BPS 600UL
//#define SERIAL_BPS 1200UL
//#define SERIAL_BPS 2400UL
//#define SERIAL_BPS 4800UL
#define SERIAL_BPS 9600UL
//#define SERIAL_BPS 19200UL
//#define SERIAL_BPS 38400UL
#endif // SERIAL_BPS


#endif // _TKC_SERIAL_H__

// End of file.
