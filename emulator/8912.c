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

#define TONETIME     8
#define NOISETIME    8
#define ENVTIME     16

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <SDL.h>
#include "8912.h"

#if 0
#include "system.h"
#include "6502.h"
#include "via.h"
#include "gui.h"
#include "disk.h"
#include "monitor.h"
#include "6551.h"
#include "machine.h"

#ifdef __amigaos4__
#include <proto/exec.h>
#endif

extern struct Task *maintask;
extern uint32 timersig;
#endif

// Volume levels
Sint32 voltab[] = { 0, 513/4, 828/4, 1239/4, 1923/4, 3238/4, 4926/4, 9110/4, 10344/4, 17876/4, 24682/4, 30442/4, 38844/4, 47270/4, 56402/4, 65535/4};

// Envelope shape descriptions
// Bit 7 set = go to step defined in bits 0-6
//                           0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15
unsigned char eshape0[] = { 15,14,13,12,11,10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0, 128+15 };
unsigned char eshape4[] = {  0, 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13,14,15, 0, 128+16 };
unsigned char eshape8[] = { 15,14,13,12,11,10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0, 128+0 };
unsigned char eshapeA[] = { 15,14,13,12,11,10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13,14,15, 128+0 };
unsigned char eshapeB[] = { 15,14,13,12,11,10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0, 15, 128+16 };
unsigned char eshapeC[] = {  0, 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13,14,15, 128+0 };
unsigned char eshapeD[] = {  0, 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13,14,15, 128+15 };
unsigned char eshapeE[] = {  0, 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13,14,15,15,14,13,12,11,10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0, 128+0 };

unsigned char *eshapes[] = { eshape0, // 0000
                             eshape0, // 0001
                             eshape0, // 0010
                             eshape0, // 0011
                             eshape4, // 0100
                             eshape4, // 0101
                             eshape4, // 0110
                             eshape4, // 0111
                             eshape8, // 1000
                             eshape0, // 1001
                             eshapeA, // 1010
                             eshapeB, // 1011
                             eshapeC, // 1100
                             eshapeD, // 1101
                             eshapeE, // 1110
                             eshape4 };//1111



/*
** RNG for the AY noise generator
*/
static Uint32 ayrand( struct ay8912 *ay )
{
	Uint32 rbit = (ay->rndrack&1) ^ ((ay->rndrack>>2)&1);
	ay->rndrack = (ay->rndrack>>1)|(rbit<<16);
	return rbit&1;
}

static uint32_t t = 0;
void ay_audioticktock( struct ay8912 *ay, Uint32 cycles )
{
	Sint32 i;
	Sint32 output;
  
	t++;

	// For each clock cycle...
	while( cycles > 0 )
	{
		// Count for the noise cycle counter
		if( (++ay->ctn) >= ay->noiseper )
		{
			// Noise counter expired, calculate the next noise output level
			ay->currnoise ^= ayrand( ay );

			// Reset the noise counter
			ay->ctn = 0;

			// Remember that the noise output changed
			ay->newnoise = SDL_TRUE;
		}

		// For each audio channel...
		for( i=0; i<3; i++ )
		{
			if( !ay->toneper[i] )
			{
				if( !ay->sign[i] )
				{
					ay->sign[i] = 1;
					ay->newout |= (1<<i);
					continue;
				}
			}

			// Count for the square wave counter
			if( (++ay->ct[i]) >= ay->toneper[i] )
			{
				// Square wave counter expired, reset it...
				ay->ct[i] = 0;

				// ...and invert the square wave output
				ay->sign[i] ^= 1;

				// Remember that this channels output has changed
				ay->newout |= (1<<i);
			}

			// If this channel is mixed with noise, and the noise changed,
			// then so did this channel.
			if( ( ay->newnoise ) && ( !ay->noisebit[i] ) )
				ay->newout |= (1<<i);
		}

		// Count down the envelope cycle counter
		if( (++ay->cte) >= ay->envper )
		{
			// Counter expired, so reset it
			ay->cte = 0;

			// Move to the next envelope position
			ay->envpos++;

			// Reached the end of the envelope?
			if( ay->envtab[ay->envpos]&0x80 )
				ay->envpos = ay->envtab[ay->envpos]&0x7f;

			// For each channel...
			for( i=0; i<3; i++ )
			{
				// If the channel is using the envelope generator...
				if( ay->regs[AY_CHA_AMP+i]&0x10 )
				{
					// Recalculate its output volume
					ay->vol[i] = voltab[ay->envtab[ay->envpos]];

					// and remember that the channel has changed
					ay->newout |= (1<<i);
				}
			}
		}

		// Done one cycle!
		cycles--;
	}

	if( !ay->newout ) return;

	// "Output" accumulates the audio data from all sources
	output = -32768;

	// Loop through the channels
	for( i=0; i<3; i++ )
	{
		// Yep, calculate the squarewave signal...
		if( ay->newout & (1<<i) )
			ay->out[i] = ((ay->tonebit[i]|ay->sign[i])&(ay->noisebit[i]|ay->currnoise)) * ay->vol[i];

		// Mix in the output of this channel
		output += ay->out[i];
	}

	ay->newout = 0;

	// Clamp the output
	if( output > 32767 ) output = 32767;
//  if( output < -32768 ) output = -32768;
	ay->output = output;
	//printf("%d\n", output);
}

void ay_dowrite( struct ay8912 *ay, struct aywrite *aw )
{
	Sint32 i;

	fprintf(stderr, "%u %u %03u\n", t++, aw->reg, aw->val);

	switch( aw->reg )
	{
	case AY_CHA_PER_L:   // Channel A period
	case AY_CHA_PER_H:
		ay->regs[aw->reg] = aw->val;
		ay->toneper[0] = (((ay->regs[AY_CHA_PER_H]&0xf)<<8)|ay->regs[AY_CHA_PER_L]) * TONETIME;
		break;

	case AY_CHB_PER_L:   // Channel B period
	case AY_CHB_PER_H:
		ay->regs[aw->reg] = aw->val;
		ay->toneper[1] = (((ay->regs[AY_CHB_PER_H]&0xf)<<8)|ay->regs[AY_CHB_PER_L]) * TONETIME;
		break;

	case AY_CHC_PER_L:   // Channel C period
	case AY_CHC_PER_H:
		ay->regs[aw->reg] = aw->val;
		ay->toneper[2] = (((ay->regs[AY_CHC_PER_H]&0xf)<<8)|ay->regs[AY_CHC_PER_L]) * TONETIME;
		break;
    
	case AY_STATUS:      // Status
		ay->regs[aw->reg] = aw->val;
		ay->tonebit[0]  = (aw->val&0x01)?1:0;
		ay->tonebit[1]  = (aw->val&0x02)?1:0;
		ay->tonebit[2]  = (aw->val&0x04)?1:0;
		ay->noisebit[0] = (aw->val&0x08)?1:0;
		ay->noisebit[1] = (aw->val&0x10)?1:0;
		ay->noisebit[2] = (aw->val&0x20)?1:0;
		ay->newout = 7;
		break;

	case AY_NOISE_PER:   // Noise period
		ay->regs[aw->reg] = aw->val;
		ay->noiseper = (ay->regs[AY_NOISE_PER]&0x1f) * NOISETIME;
		break;

	case AY_CHA_AMP:
	case AY_CHB_AMP:
	case AY_CHC_AMP:
		ay->regs[aw->reg] = aw->val;
		i = aw->reg-AY_CHA_AMP;
		if(aw->val&0x10)
			ay->vol[i] = voltab[ay->envtab[ay->envpos]];
		else
			ay->vol[i] = voltab[aw->val&0xf];
		ay->newout |= (1<<i);
		break;
    
	case AY_ENV_PER_L:
	case AY_ENV_PER_H:
		ay->regs[aw->reg] = aw->val;
		ay->envper = ((ay->regs[AY_ENV_PER_H]<<8)|ay->regs[AY_ENV_PER_L])*ENVTIME;
		break;

	case AY_ENV_CYCLE:
		if( aw->val != 0xff )
		{
			ay->regs[aw->reg] = aw->val;
			ay->envtab = eshapes[aw->val&0xf];
			ay->envpos = 0;
			for( i=0; i<3; i++ )
			{
				if( ay->regs[AY_CHA_AMP+i]&0x10 )
				{
					ay->vol[i] = voltab[ay->envtab[ay->envpos]];
					ay->newout |= (1<<i);
				}
			}
		}
		break;
	}
}

/*
** This is the SDL audio callback. It is called by SDL
** when it needs a sound buffer to be filled.
*/
void ay_callback( void *dummy, Sint8 *stream, int length )
{
	Uint16 *out;
	int16_t fout;
	Sint32 i, j, logc, tlogc;
	struct ay8912 *ay = (struct ay8912 *)dummy;
	Sint32 dcadjustave, dcadjustmax;

	logc    = 0;
	tlogc   = 0;
	dcadjustave = 0;
	dcadjustmax = -32768;

	out = (Uint16 *)stream;
	for( i=0,j=0; i<AUDIO_BUFLEN && i<length/(2*sizeof(Uint16)); i++ )
	{
		ay->ccyc = ay->ccycle>>FPBITS;

		while( ( logc < ay->logged ) && ( ay->ccyc >= ay->writelog[logc].cycle ) )
			ay_dowrite( ay, &ay->writelog[logc++] );

		if( ay->ccyc > ay->lastcyc )
		{
			ay_audioticktock( ay, ay->ccyc-ay->lastcyc );
			ay->lastcyc = ay->ccyc;
		}

		fout = ay->output + ay->tapeout;
		out[j++] = fout;
		out[j++] = fout;

		if( fout > dcadjustmax ) dcadjustmax = fout;
		dcadjustave += fout;

		ay->ccycle += CYCLESPERSAMPLE;
	}

	dcadjustave /= AUDIO_BUFLEN;

	if( (dcadjustmax-dcadjustave) > 32767 )
		dcadjustave = -(32767-dcadjustmax);

	if( dcadjustave )
	{
		for( i=0, j=0; i<AUDIO_BUFLEN && i<length/(2*sizeof(Uint16)); i++ )
		{
			out[j++] -= dcadjustave;
			out[j++] -= dcadjustave;
		}
	}

	while( logc < ay->logged )
		ay_dowrite( ay, &ay->writelog[logc++] );

	ay->ccycle -= (ay->lastcyc<<FPBITS);
	ay->lastcyc = 0;
	ay->newlogcycle = ay->ccycle>>FPBITS;
	ay->do_logcycle_reset = SDL_TRUE;
	ay->logged   = 0;
	ay->tlogged  = 0;
}

/*
** Emulate the AY for some clock cycles
** Output is cycle-exact.
*/
void ay_ticktock( struct ay8912 *ay, int cycles )
{
	if( ay->do_logcycle_reset )
	{
		ay->logcycle = ay->newlogcycle;
		ay->do_logcycle_reset = SDL_FALSE;
	}
	ay->logcycle += cycles;
}

void ay_lockaudio( struct ay8912 *ay )
{
	if( ay->audiolocked ) return;
	SDL_LockAudio();
	ay->audiolocked = SDL_TRUE;
}

void ay_unlockaudio( struct ay8912 *ay )
{
	if( !ay->audiolocked ) return;
	SDL_UnlockAudio();
	ay->audiolocked = SDL_FALSE;
}

/*
** Initialise the AY emulation
*/
SDL_bool ay_init(struct ay8912 *ay)
{
	int i;

	// Reset the three audio channels
	for( i=0; i<3; i++ )
	{
		ay->ct[i]       = 0;     // Cycle counter to zero
		ay->out[i]      = 0;     // 0v output for each channel
		ay->sign[i]     = 0;     // Initial sign bit
		ay->tonebit[i]  = 1;     // Output disabled
		ay->noisebit[i] = 1;     // Noise disabled
		ay->vol[i]      = 0;     // Zero volume
	}
	ay->newout = 7;
	ay->newnoise = SDL_TRUE;
	ay->ctn = 0; // Reset the noise counter
	ay->cte = 0; // Reset the envelope counter

	ay->envtab  = eshape0;    // Default to envelope 0
	ay->envpos  = 0;

	ay->bmode   = 0;          // GI silly addressing mode
	ay->creg    = 0;          // Current register to 0
	ay->soundon = 1;
	ay->currnoise = 0;
	ay->rndrack = 1;
	ay->logged  = 0;
	ay->logcycle = 0;
	ay->do_logcycle_reset = SDL_FALSE;
	ay->output  = -32768;
	ay->lastcyc = 0;
	ay->ccyc    = 0;
	ay->ccycle  = 0;
	ay->tapeout = 0;
	ay->tlogged = 0;
	ay->tapeout = 0;
	ay->audiolocked = SDL_FALSE;

	return SDL_TRUE;
}

/*
** GI addressing
*/
void ay_modeset( struct ay8912 *ay )
{
	unsigned char v, lasts6=0;

	switch( ay->bmode )
	{
	case AYBMF_BC1: // Read AY register
		// The 8910 is write-only on the CFT (for now)
		/*
		ay->oric->porta_ay = (ay->creg>=NUM_AY_REGS) ? 0 : ay->eregs[ay->creg];
		ay->oric->via.write_port_a( &ay->oric->via, 0xff, ay->oric->porta_ay );
		ay->oric->porta_is_ay = SDL_TRUE;
		*/
		break;
    
	case AYBMF_BDIR: // Write AY register
		if( ay->creg >= NUM_AY_REGS ) break;
		v = ay->cft_dbus; // ay->oric->via.read_port_a( &ay->oric->via );

		if( ay->creg == AY_STATUS )
			lasts6 = ay->eregs[AY_STATUS] & 0x40;

		if( ( ay->creg != AY_ENV_CYCLE ) || ( v != 0xff ) )
			ay->eregs[ay->creg] = v;

		switch( ay->creg )
		{
		case AY_STATUS:
			if( (ay->eregs[AY_STATUS]&0x40) != lasts6 )
			{
				//ay->keybitdelay = 3;
			}
		case AY_CHA_PER_L:   // Channel A period
		case AY_CHA_PER_H:
		case AY_CHB_PER_L:   // Channel B period
		case AY_CHB_PER_H:
		case AY_CHC_PER_L:   // Channel C period
		case AY_CHC_PER_H:
		case AY_NOISE_PER:   // Noise period
		case AY_CHA_AMP:
		case AY_CHB_AMP:
		case AY_CHC_AMP:
		case AY_ENV_PER_L:
		case AY_ENV_PER_H:
		case AY_ENV_CYCLE:
			//if( ( !soundon ) || ( warpspeed ) )
			{
				int i;
				for( i=0; i<ay->logged; i++ )
					ay_dowrite( ay, &ay->writelog[i] );
				ay->logged = 0;
				if( ( ay->creg != AY_ENV_CYCLE ) || ( v != 0xff ) )
					ay->regs[ay->creg] = v;
				break;
			}

			if( ay->logged >= WRITELOG_SIZE )
			{
				SDL_WM_SetCaption( "AUDIO BASTARD", "AUDIO BASTARD" ); // Debug
				break;
			}
			ay_lockaudio( ay );  // Gets unlocked at the end of each frame
			if( ay->do_logcycle_reset )
			{
				ay->logcycle = ay->newlogcycle;
				ay->do_logcycle_reset = SDL_FALSE;
			}

			ay->writelog[ay->logged  ].cycle = ay->logcycle;
			ay->writelog[ay->logged  ].reg   = ay->creg;
			ay->writelog[ay->logged++].val   = v;
			break;

		case AY_PORT_A:
			//ay->keybitdelay = 3;
			break;
		}
		break;
    
	case AYBMF_BDIR|AYBMF_BC1: // Set register
		ay->creg = ay->cft_dbus; // ay->oric->via.read_port_a( &ay->oric->via );
		break;
	}
}

void ay_set_bcmode( struct ay8912 *ay, unsigned char bc1, unsigned char bdir )
{
	ay->bmode = (bc1?AYBMF_BC1:0)|(bdir?AYBMF_BDIR:0);
	ay_modeset( ay );
}

void ay_set_bc1( struct ay8912 *ay, unsigned char state )
{
	if( state )
		ay->bmode |= AYBMF_BC1;
	else
		ay->bmode &= ~AYBMF_BC1;
	ay_modeset( ay );
}

void ay_set_bdir( struct ay8912 *ay, unsigned char state )
{
	if( state )
		ay->bmode |= AYBMF_BDIR;
	else
		ay->bmode &= ~AYBMF_BDIR;
	ay_modeset( ay );
}

