#warning "TODO: Review this file for DFP2"
#ifndef __INPUT_H__
#define __INPUT_H__


#include <stdint.h>


void badval();

void badsyntax();

char * get_arg();

int32_t get_addr();

uint32_t parse_hex(char *s);

char parse_bool(char *s);

int8_t optional_bool_val(uint8_t * bool);

int8_t optional_hex_val(uint16_t * word);


#endif // __INPUT_H__

// End of file.
