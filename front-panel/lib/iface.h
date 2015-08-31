#ifndef __IFACE_H__
#define __IFACE_H__


#include <stdint.h>

typedef struct {

	void    (*putc)(uint8_t c);
	uint8_t (*getc)();

} dfp_cb_t;


extern dfp_cb_t dfp_cb;


#endif // __IFACE_H__

// End of file.
