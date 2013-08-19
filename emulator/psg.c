/* 
   
psg.c - Emulates the AY-3-8910 Programmable Sound Generator (PSG)

Copyright (C) 2012 Alexios Chouchoulas

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2, or (at your option)
any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software Foundation,
Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  

*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h> 
#include <unistd.h>
#include <assert.h>
#include <fcntl.h>
#include <termios.h>
#include <errno.h>
#include <time.h>
#include <sys/select.h>
#include <sys/types.h>
#include <sys/time.h>
#include <sys/stat.h>

#include <SDL.h>

#include "cftemu.h"
#include "io.h"
#include "psg.h"
//#include "8912.h"
#include "ay8910.h"


int have_psg;

int debug_psg = 0;

//struct ay8912 ay;


// Arbitrarily sized, but should be enough. SDL seems to ask for 2k
// samples at a time. We need at least 3x that number in this buffer,
// and we allocate one second worth of samples per channel.
int16_t ay_chana[AUDIO_FREQ], ay_chanb[AUDIO_FREQ], ay_chanc[AUDIO_FREQ];

void
_sound_callback(void *dummy, uint8_t *stream, int length)
{
	int16_t *buf = (int16_t *)stream;
	/*
	static int state = 0;
	int i;

	for(i = 0; i < (length / 2); i+=1) {
		buf[i++] = ((state % 100) < 50) ? 0 : 0;
		buf[i] = ((state % 100) < 50) ? 32768 : 0;
		state++;
	}
	*/

	// SDL requests length bytes, but we're dealing in 16-bit stereo
	// frames, so there are 4 bytes per frame, and length/4 frames to
	// construct.
	int frames = length / 4;
	
	// Make the 8910 sound stream.
	int16_t * channels[3] = {ay_chana, ay_chanb, ay_chanc};
	AY8910Update(PSG_AY8910_0, (int16_t**)channels, frames);

	// Now mix the samples from the three channels of the 8910.  We follow
	// the schematics and produce an ABC mix, i.e. channel A left, channel
	// B middle (both left and right), channel C right.

	int i;
	for (i = 0; i < frames; i++) {
		int l, r;

		l = ay_chana[i] * 2 / 3;  /* Channel A at 66% volume */
		l += ay_chanb[i] / 3;	    /* Channel B at 33% volume */
		
		r = ay_chanb[i] / 3;      /* Channel B at 33% volume */
		r += ay_chanc[i] * 2 / 3; /* Channel C at 66% volume */

		//printf("%5d. %6d %6d (%d)\n", i, l, r, buf - (int16_t*)stream);
		
		*buf++ = (int16_t)(max(-32768, min(32767, l)));
		*buf++ = (int16_t)(max(-32768, min(32767, r)));
	}
}


void
psg_init()
{
	SDL_AudioSpec spec;

	AY8910_InitAll(PSG_CLOCK, AUDIO_FREQ);
	
	info("GI AY-3-8910 Sound Chip emulation initialised.\n");
	psg_reset();
	
	spec.freq     = AUDIO_FREQ;
	spec.format   = AUDIO_S16SYS; 
	spec.channels = 2;
	spec.samples  = AUDIO_BUFLEN;
  
	spec.callback = _sound_callback;
	spec.userdata = NULL;

	//soundavailable = SDL_FALSE;
	//soundon = SDL_FALSE;
	if( SDL_OpenAudio( &spec, NULL ) >= 0 )
	{
		psgdebug("Audio device opened.\n");
		//soundon = SDL_TRUE;
		//soundavailable = SDL_TRUE;
	}
	SDL_PauseAudio(0);
}


void
psg_reset() {
	AY8910_reset(PSG_AY8910_0);
}


void
psg_done() 
{
	AY8910_reset(PSG_AY8910_0);
	SDL_CloseAudio();
}


void
psg_tick(int tick) 
{
	//ay_ticktock(&ay, 1);
}


int 
psg_write(uint16_t addr, uint16_t dbus)
{
	static int reg = 0;

	if (addr == IO_SND_PSG) {
		if (dbus & 0x100) {
			// Select register using dbus[3:0];
			//ay.cft_dbus = dbus;
			//ay_set_bcmode(&ay, 1, 1);
			reg = dbus & 0xf;
		} else {
			// Write data to previously selected register
			//ay.cft_dbus = dbus;
			//ay_set_bcmode(&ay, 0, 1);
			//psgdebug("REG(%d) = %02x\n", ay.creg, dbus);
			_AYWriteReg(PSG_AY8910_0, reg, dbus & 0xff);
			psgdebug("REG(%d) = %02x\n", reg, dbus);
		}
		return 1;
	}
	return 0;
}


int
psg_read(uint16_t addr, uint16_t *dbus)
{
#if 0

	if ((addr & 0xfff0) == IO_PSG_ISR) {
		*dbus = isr ^ 0xff; /* Inverted */
		return 1;
	}
#endif
	return 0;
}


/* End of file. */
