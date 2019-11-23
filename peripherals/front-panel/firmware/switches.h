// -*- indent-c -*-

#ifndef __SWITCHES_H__
#define __SWITCHES_H__

// flags for _swleft

#define SWL_NLOCK  0x0001
#define SWL_RESET  0x0002
#define SWL_STOP   0x0004
#define SWL_RUN    0x0008
#define SWL_STEP   0x0010
#define SWL_USTEP  0x0020
#define SWL_SLOW   0x0040
#define SWL_FAST   0x0080
#define SWL_SPD_SHIFT      6

#define SWL_DS0    0x0100
#define SWL_DS1    0x0200
#define SWL_DS2    0x0400
#define SWL_DS3    0x0800
#define SWL_DS4    0x1000
#define SWL_DS5    0x2000
#define SWL_DS6    0x4000
#define SWL_DS7    0x8000

#define SWL_AUTOREPEAT (SWL_STEP|SWL_USTEP)

// flags for _swright

#define SWR_LDADDR 0x0001
#define SWR_LDIR   0x0002
#define SWR_LDAC   0x0004
#define SWR_SPARE  0x0008
#define SWR_MEMW   0x0010
#define SWR_INC    0x0020
#define SWR_MEMR   0x0040
#define SWR_IOW    0x0080

#define SWR_IOR    0x0100
#define SWR_ROM    0x0200
#define SWR_IFR6   0x0400
#define SWR_IFR1   0x0800

#define SWR_DS8    0x1000
#define SWR_DS9    0x2000
#define SWR_DS10   0x4000
#define SWR_DS11   0x8000

#define SWR_AUTOREPEAT (SWR_MEMW|SWR_MEMR|SWR_IOW|SWR_IOR|SWR_IFR6|SWR_IFR1)

#endif // _SWITCHES_H__

// End of file.
