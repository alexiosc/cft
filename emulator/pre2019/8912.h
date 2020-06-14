/*
**  Oricutron
**  Copyright (C) 2009-2012 Peter Gordon
**
**  This program is free software; you can redistribute it and/or
**  modify it under the terms of the GNU General Public License
**  as published by the Free Software Foundation, version 2
**  of the License.
**
**  This program is distributed in the hope that it will be useful,
**  but WITHOUT ANY WARRANTY; without even the implied warranty of
**  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
**  GNU General Public License for more details.
**
**  You should have received a copy of the GNU General Public License
**  along with this program; if not, write to the Free Software
**  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
**
**  General Instruments AY-8912 emulation (including oric keyboard emulation)
*/

#ifndef _8912_H_
#define _8912_H 1

// Integer fraction bits to use when mapping
// clock cycles to audio samples
#define FPBITS 10

// Audio buffer size
#define AUDIO_BUFLEN 4096
#define AUDIO_FREQ 44100

#define WRITELOG_SIZE (AUDIO_BUFLEN*12)
#define TAPELOG_SIZE (AUDIO_BUFLEN)

#define CYCLESPERSECOND (312*64*50)
#define CYCLESPERSAMPLE ((CYCLESPERSECOND<<FPBITS)/AUDIO_FREQ)

// GI addressing
#define AYBMB_BC1  0
#define AYBMF_BC1  (1<<AYBMB_BC1)
#define AYBMB_BDIR 1
#define AYBMF_BDIR (1<<AYBMB_BDIR)

// 8912 registers
enum
{
	AY_CHA_PER_L = 0,
	AY_CHA_PER_H,
	AY_CHB_PER_L,
	AY_CHB_PER_H,
	AY_CHC_PER_L,
	AY_CHC_PER_H,
	AY_NOISE_PER,
	AY_STATUS,
	AY_CHA_AMP,
	AY_CHB_AMP,
	AY_CHC_AMP,
	AY_ENV_PER_L,
	AY_ENV_PER_H,
	AY_ENV_CYCLE,
	AY_PORT_A,
	NUM_AY_REGS
};

struct aywrite
{
	uint32_t cycle;
	uint8_t  reg;
	uint8_t  val;
};

struct tnchange
{
	uint32_t cycle;
	uint8_t  val;
};

struct ay8912
{
	uint8_t           bmode, creg;
	uint8_t           regs[NUM_AY_REGS], eregs[NUM_AY_REGS];
	SDL_bool          keystates[8], newnoise;
	SDL_bool          soundon;
	SDL_bool          tapenoiseon;
	uint32_t          toneper[3], noiseper, envper;
	uint16_t          tonebit[3], noisebit[3], vol[3], newout;
	int32_t           ct[3], ctn, cte;
	uint32_t          tonepos[3], tonestep[3];
	int32_t           sign[3], out[3], envpos;
	unsigned char     *envtab;
	uint32_t          currnoise, rndrack;
	int16_t           output;
	int16_t           tapeout;
	uint32_t          ccycle, lastcyc, ccyc;

	SDL_bool          audiolocked;
	SDL_bool          do_logcycle_reset;
	int32_t           logged, tlogged;
	uint32_t          logcycle, newlogcycle;
	struct aywrite    writelog[WRITELOG_SIZE];
	struct tnchange   tapelog[TAPELOG_SIZE];
	
        // Interface with the CFT bus via the PSG board.
	uint8_t           cft_dbus;
};

SDL_bool ay_init( struct ay8912 *ay);
void ay_callback( void *dummy, Sint8 *stream, int length );
void ay_ticktock( struct ay8912 *ay, int cycles );

void ay_set_bc1( struct ay8912 *ay, unsigned char state );
void ay_set_bdir( struct ay8912 *ay, unsigned char state );
void ay_set_bcmode( struct ay8912 *ay, unsigned char bc1, unsigned char bdir );
void ay_modeset( struct ay8912 *ay );

void ay_lockaudio( struct ay8912 *ay );
void ay_unlockaudio( struct ay8912 *ay );

#endif // _8912_H

// End of file.
