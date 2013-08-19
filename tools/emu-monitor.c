/* 
   
emu-monitor.c - Basic 640x400 monitor emulation.

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
#include <argp.h>
#include <SDL.h>
#include <SDL_ttf.h>

#define PACKAGE "emu-monitor"
#define VERSION "0.1"

SDL_Surface * screen;
SDL_TimerID   refresh_timer;
int dirty;
int verbose = 0;
int frame = 0;
char *video_in, *outfile = "vdu";
int interframe_pause = 1;
FILE *fp = NULL; 
char * fontname = "Arial.ttf";
int fontsize = 16;
char * textlabel = "Frame %d";
int hs_active = 1, vs_active = 1;

TTF_Font *font;

#define XSTR(x) STR(x)
#define STR(x) #x

#define WIDTH 800
#define HEIGHT 512
#define OFS 30
#define FRAMERATE 50


int width=WIDTH, height=HEIGHT;


// These timings are from http://tinyvga.com/vga-timing/640x400@70Hz.
// The VDU's intended VESA-compatible timings are different!

int hr = 80 * 8;
int hfp = 2 * 8;
int hbp = 6 * 8;
int hsw = 12 * 8;

int vr = 400;
int vfp = 12;
int vbp = 35;
int vsw = 2;

#define fail(...) {				\
		printf("F: " __VA_ARGS__);	\
		exit(1);			\
	}

#define vdebug(...)				\
	{					\
		printf("D: " __VA_ARGS__);	\
	}

#define error(...)				\
	{					\
		printf("E: " __VA_ARGS__);	\
	}

/* #define BUFSIZE (width * height * 2) */

/* static struct { */
/* 	char r:2; */
/* 	char g:2; */
/* 	char b:2; */
/* 	char hs:1; */
/* 	char vs:1; */
/* } vbuf [BUFSIZE]; */

void
sdl_listmodes()
{
	const SDL_VideoInfo *info;
	int i;
	SDL_Rect **modes;
	
	if ( SDL_Init(SDL_INIT_VIDEO|SDL_INIT_TIMER) < 0 ) {
		fail("Couldn't initialize SDL: %s\n", SDL_GetError());
	}
	info = SDL_GetVideoInfo();
	
	modes = SDL_ListModes(NULL, SDL_FULLSCREEN);
	if ( modes == (SDL_Rect **)0 ) {
		vdebug("No available fullscreen video modes\n");
	} else
		if ( modes == (SDL_Rect **)-1 ) {
			vdebug("No special fullscreen video modes\n");
		} else {
			vdebug("Fullscreen video modes:\n");
			for ( i=0; modes[i]; ++i ) {
				vdebug("\t%dx%dx%d\n", modes[i]->w, modes[i]->h, info->vfmt->BitsPerPixel);
			}
		}
	if ( info->wm_available ) {
		vdebug("A window manager is available\n");
	}
	if ( info->hw_available ) {
		vdebug("Hardware surfaces are available (%dK video memory)\n",
		       info->video_mem);
	}
	if ( info->blit_hw ) {
		vdebug(
			"Copy blits between hardware surfaces are accelerated\n");
	}
	if ( info->blit_hw_CC ) {
		vdebug(
			"Colorkey blits between hardware surfaces are accelerated\n");
	}
	if ( info->blit_hw_A ) {
		vdebug(
			"Alpha blits between hardware surfaces are accelerated\n");
	}
	if ( info->blit_sw ) {
		vdebug(
			"Copy blits from software surfaces to hardware surfaces are accelerated\n");
	}
	if ( info->blit_sw_CC ) {
		vdebug(
			"Colorkey blits from software surfaces to hardware surfaces are accelerated\n");
	}
	if ( info->blit_sw_A ) {
		vdebug(
			"Alpha blits from software surfaces to hardware surfaces are accelerated\n");
	}
	if ( info->blit_fill ) {
		vdebug(
			"Color fills on hardware surfaces are accelerated\n");
	}
	SDL_Quit();
}


static void
update()
{
}


static uint32_t
refresh(uint32_t interval, void *param)
{
	//register uint32_t t = SDL_GetTicks();
	if (dirty) {
		assert (SDL_LockSurface (screen) == 0);

		if (dirty) {
			//r.x = 0;
			//r.y = 0;
			//SDL_FillRect (screen, &r, 0);
			update();

			SDL_UnlockSurface(screen);
			SDL_Flip(screen);
			
			dirty = 0;
		}

		//vdebug("update\n");
	}
	return 1000 / FRAMERATE;
}


static uint32_t refresh(uint32_t, void *);

void
sdl_init()
{
	int w = width;
	int h = height;
	int desired_bpp=8, video_flags=0;
	
	//video_listmodes();
	
	if ( SDL_Init(SDL_INIT_VIDEO|SDL_INIT_TIMER) < 0 ) {
		fail("Couldn't initialize SDL: %s\n", SDL_GetError());
	}
	
	vdebug("dbl=%x, hw=%x, fs=%x\n", SDL_DOUBLEBUF, SDL_HWSURFACE, SDL_FULLSCREEN);
	video_flags = SDL_DOUBLEBUF;
	//video_flags |= arg_hw? SDL_HWSURFACE: SDL_SWSURFACE;
	video_flags |= SDL_SWSURFACE;

	//if (arg_bpp < 0) {
		for (desired_bpp = 32; desired_bpp <= 32; desired_bpp <<= 1) {
			vdebug("Trying %dx%dx%d", w, h, desired_bpp);
			if (SDL_VideoModeOK (w, h, desired_bpp, video_flags)) break;
		}
        //}

	//if (arg_warp && (desired_bpp == 8)) video_flags |= SDL_HWPALETTE;

	screen = SDL_SetVideoMode (w, h, desired_bpp, video_flags);
	if (screen->format->BytesPerPixel != 4 || SDL_BYTEORDER == SDL_BIG_ENDIAN) {
		fail("Video: only 32bpp and little endian architectures supported currently. Sorry."); 
	}

	if (screen == NULL ) {
		fail("Couldn't set %dx%dx%d video mode: %s\n",
			w, h, desired_bpp, SDL_GetError());
	}
	
	vdebug("Set%s %dx%dx%d mode\n",
	       screen->flags & SDL_FULLSCREEN ? " fullscreen" : "",
	       screen->w, screen->h, screen->format->BitsPerPixel);
	vdebug("(video surface located in %s memory)\n",
	       (screen->flags&SDL_HWSURFACE) ? "video" : "system");
	if (screen->flags & SDL_DOUBLEBUF ) {
		vdebug("Double-buffering enabled\n");
	}
	
	/* Set the window manager title bar */
	SDL_WM_SetCaption("CFT video display simulator", "emu-monitor");
	
	/* Set the keyboard state */
	SDL_EnableKeyRepeat(SDL_DEFAULT_REPEAT_DELAY, SDL_DEFAULT_REPEAT_INTERVAL);
	SDL_EnableUNICODE(1);
	SDL_EventState(SDL_MOUSEMOTION, SDL_IGNORE);

	dirty = 1;
	refresh_timer = SDL_AddTimer(1000 / FRAMERATE, refresh, NULL);
}


void
sdl_done()
{
}



static void
show_version (FILE *stream, struct argp_state *state)
{
	(void) state;
	/* Print in small parts whose localizations can hopefully be copied
	   from other programs.  */
	fputs(PACKAGE" "VERSION"\n", stream);
	fprintf(stream, "Written by %s.\n\n", "Alexios Chouchoulas");
	fprintf(stream, "Copyright (C) %s %s\n",
		"2012", "Alexios Chouchoulas");
	fputs("This program is free software; you may redistribute it "
	      "under the terms of\n\the GNU General Public License.  "
	      "This program has absolutely no warranty.\n",
	      stream);
}


/* argp option keys */
enum {DUMMY_KEY=129
      ,KEY_NEGATE_HS
      ,KEY_NEGATE_VS
};

static struct argp_option options[] =
{
	{ "brief-help",        'h',     NULL,             0,
	  "Show brief syntax help", 1 },
	{ "verbose",     'v',           NULL,            0,
	  "Print more information (cumulative)", 0 },
	{ "quiet",     'q',           NULL,            0,
	  "Print less information (cumulative)", 0 },

	{ "quit",     'Q',           NULL,            0,
	  "Quit immediately after rendering.", 0 },

	{ "width", 'W', "WIDTH", 0,
	  "Width of the simulator window in pixels (default:" XSTR(WIDTH) ").", 0 },
	{ "height", 'H', "HEIGHT", 0,
	  "Height of the simulator window in pixels (default:" XSTR(HEIGHT) ").", 0 },

	{ "frame", 'f', "FRAME", 0,
	  "Render specified video frame.", 0 },

	{ "font", 'F', "FILENAME", 0,
	  "Set the font to use for labels.", 0 },
	{ "font-size", 'S', "PIXELS", 0,
	  "Set the font size for labels.", 0 },
	{ "label", 'L', "LABEL", 0,
	  "The label to display for this test. The string %d is replaced "
	  "with the current frame number. (default: \"Frame %d\")", 0 },

	{ "out", 'o', "FILE", 0,
	  "Save the reconstructed frames to FILE-<frame number>.bmp.", 0 },

	{ "negative-hs", KEY_NEGATE_HS, NULL, 0,
	  "Use negative (active low) horizontal sync signals. (default: positive)", 0 },

	{ "negative-vs", KEY_NEGATE_VS, NULL, 0,
	  "Use negative (active low) verticzl sync signals. (default: positive)", 0 },

	{ NULL, 0, NULL, 0, NULL, 0 }
};



const char *argp_program_bug_address =
"Alexios Chouchoulas <alexios@bedroomlan.org>";

void (*argp_program_version_hook) (FILE *, struct argp_state *) = show_version;

static error_t parse_opt();

static struct argp argp =
{
	options, parse_opt,
	"VIDEO-OUT",
	"CFT VDU Monitor tool",
	NULL, NULL, NULL
};


/* Parse a single option.  */
static error_t
parse_opt (int key, char *arg, struct argp_state *state)
{
	switch (key) {
	case ARGP_KEY_INIT:
		/* Set up default values.  */
		verbose = 1;
		break;
		
	case 'h':
		argp_help (&argp, stderr,
			   ARGP_HELP_USAGE|ARGP_HELP_EXIT_OK, PACKAGE);
		exit (0);
		
	case 'v':
		verbose++;
		break;

	case 'q':
		verbose--;
		break;

	case 'Q':
		interframe_pause = 0;
		break;

	case 'f':
		if (!sscanf(arg, "%d", &frame)) {
			argp_error (state, "FRAME should be a non-negative integer.");
		}
		if (frame < 1) {
			argp_error (state, "FRAME should be a non-negative integer.");
		}
		break;

	case 'W':
		if (!sscanf(arg, "%d", &width) || (width < 1)) {
			argp_error (state, "WIDTH should be a positive integer.");
		}
		break;
	case 'H':
		if (!sscanf(arg, "%d", &height) || (height < 1)) {
			argp_error (state, "HEIGHT should be a positive integer.");
		}
		break;

	case 'o':
		outfile = strdup (arg);
		break;

	case 'F':
		fontname = strdup (arg);
		break;
	case 'S':
		if (!sscanf(arg, "%d", &fontsize) || (fontsize < 1)) {
			argp_error (state, "Font size should be a positive integer.");
		}
		break;
	case 'L':
		textlabel = strdup (arg);
		break;

	case KEY_NEGATE_HS:
		hs_active = 0;
		break;

	case KEY_NEGATE_VS:
		vs_active = 0;
		break;

	case ARGP_KEY_ARG: // VIDEO IMAGE
		if (video_in == NULL) {
			if (!strcmp(arg, "-")) {
				fp = stdin;
				video_in = "stdin";
			} else {
				video_in = strdup (arg);
				fp = fopen (video_in, "r");
				if (!fp)
					argp_failure (state, EXIT_FAILURE, errno,
						      "Cannot open %s for reading",
						      video_in);
			}
		} else {
			argp_usage (state);
		}
		
		break;

	default:
		return ARGP_ERR_UNKNOWN;
	}
	
	return 0;
}



/* Show the version number and copyright information.  */


uint8_t dac[4] = { 0x00, 0x55, 0xaa, 0xff };

inline void
box(int x, int y, int w, int h, int c)
{
	SDL_Rect r = { .x=x, .y=y, .w=w, .h=h};
	SDL_FillRect(screen, &r, c);
}


void
label(char *s, int x, int y)
{
	SDL_Surface *text;
	SDL_Rect tr = {.x = x, .y = y - fontsize - OFS/2};
	SDL_Color tc0 = {.r=255, .g=255, .b=0};
	SDL_Color tc1 = {.r=0, .g=0, .b=0};
	char buf[1024];

	snprintf(buf, sizeof(buf) - 1, s, frame);
	text = TTF_RenderText_Solid(font, buf, tc1);
	SDL_BlitSurface(text, NULL, screen, &tr);
	tr.x -= 1;
	tr.y -= 1;
	text = TTF_RenderText_Solid(font, buf, tc1);
	SDL_BlitSurface(text, NULL, screen, &tr);
	tr.x -= 1;
	tr.y -= 1;
	text = TTF_RenderText_Solid(font, buf, tc0);
	SDL_BlitSurface(text, NULL, screen, &tr);
}

int
process()
{
	static int seen_x = 0;
	static int seen_rgb_in_blanking = 0;
	int bpp = screen->format->BytesPerPixel;
	int nf = 0;
	int invs = 0, inhs = 0;
	int x = 0, y = 0;
	uint8_t * pixel = screen->pixels;

	// Clear the screen
	SDL_FillRect(screen, NULL, 0x808080);

	for (x = OFS; x < OFS + hfp + hr + hbp; x += 8) {
		box(x, OFS>>1, 1, height - OFS, (x - OFS - hfp) % 64 ? 0xaaaaaa : 0xcccccc);
	}
	for (y = OFS + vfp - 8; y < OFS + vfp + vr + vbp; y += 8) {
		box(OFS>>1, y, width - OFS, 1, (y - OFS - vfp) % 64 ? 0xaaaaaa : 0xcccccc);
	}
	box (OFS, 0, 1, height, 0xcccc00);
	box (OFS + hfp, 0, 1, height, 0xcc0000);
	box (OFS + hfp + hr, 0, 1, height, 0xcc0000);
	box (OFS + hfp + hr + hbp, 0, 1, height, 0xcccc00);

	box (0, OFS, width, 1, 0xcccc00);
	box (0, OFS + vfp, width, 1, 0xcc0000);
	box (0, OFS + vfp + vr, width, 1, 0xcc0000);
	box (0, OFS + vfp + vr + vbp, width, 1, 0xcccc00);

	// Draw the label
	label(textlabel, OFS + 4, height);

	x = y = 0;
	
	while (!feof(fp)) {
		SDL_Event event;
		int r, g, b, hs, vs, hv, vv;
		char buf[1024];
		if (!fgets(buf, sizeof(buf) - 1, fp)) break;

		if (SDL_PollEvent (&event)) {
			if (event.type == SDL_KEYDOWN &&
			    event.key.keysym.sym == 'c' &&
			    event.key.keysym.mod & KMOD_CTRL) {
				vdebug("**ABORTED**\n\n");
				return 0;
			}
		}

		// Replace early x values.
		if ((x < 40) && (y < 3)) {
			char *cp;
			for (cp = buf; *cp != '\0'; cp++) {
				if (*cp == 'x') {
					*cp = '0';
					if (!seen_x) {
						vdebug("At least one 'x' value seen in "
						       "video input (first at x=%d, y=%d)\n", x, y);
						seen_x = 1;
					}
				}
			}
		}
		
		sscanf(buf, "RGB: %d %d %d %d %d %d %d\n", &r, &g, &b, &hs, &vs, &hv, &vv);

		if (hs == hs_active) {
			inhs++;
			x = 0;
		}
		if (vs == vs_active) {
			invs++;
			y = 0;
		}

		if ((hs != hs_active) && inhs) {
			y++;
			inhs = 0;
			if (verbose > 1) vdebug("FRAME %d, FIELD %d\n", nf, y);
		}
		if ((vs != vs_active) && invs) {
			nf++;
			// End processing.
			if (nf > frame) {
				return 1;
			}
			invs = 0;
			vdebug("STARTING FRAME %d\n", nf);
		}
		
		if (nf != frame) continue;

		int inframe = 0;
		if (hv) {
			if ((x > hfp && x < (hfp + hr)) || (x >= hfp + hr + hbp + hsw)) {
				box (x + OFS, 3 * OFS / 4 - 2, 1, (OFS >> 2) + 2, 0xff0000);
				if (x < (hr >> 1)) {
					box (0, y + OFS, 3, 1, 0xff00ff);
				} else {
					box (width - 3, y + OFS, 3, 1, 0xff00ff);
				}
				inframe++;
			} else {
				box (x + OFS, 3 * OFS / 4, 1, (OFS >> 2), 0x222222);
			}
		}

		if (vv) {
			if ((y > vfp && y < (vfp + vr)) || (y >= vfp + vr + vbp + vsw)) {
				box (3 * OFS / 4 - 2, y + OFS, (OFS >> 2) + 2, 1, 0xff0000);
				if (y < (vr >> 1)) {
					box (x + OFS, 0, 1, 3, 0xff00ff);
				} else {
					box (x + OFS, height - 3, 1, 3, 0xff00ff);
				}
				inframe++;
			} else {
				box (3 * OFS / 4, y + OFS, (OFS >> 2), 1, 0x222222);
			}
		}

		if (!hv && !vv) {
			pixel[((y + OFS) * width + x + OFS ) * bpp] = dac[b&3];
			pixel[((y + OFS) * width + x + OFS ) * bpp + 1] = dac[g&3];
			pixel[((y + OFS) * width + x + OFS ) * bpp + 2] = dac[r&3];
		} else {
			if (inframe) {
				if (verbose) {
					error("Blanking within visible frame (%d,%d).\n", x, y);
				}
				// Draw invalid blanking pixel.
				pixel[((y + OFS) * width + x + OFS ) * bpp] = 255;
				pixel[((y + OFS) * width + x + OFS ) * bpp + 1] = 0;
				pixel[((y + OFS) * width + x + OFS ) * bpp + 2] = 255;
			} else {
				// Draw blanking pattern.
				int f = (x % 4) == (y % 4) ? 4 : 7;
				pixel[((y + OFS) * width + x + OFS ) * bpp] /= f;
				pixel[((y + OFS) * width + x + OFS ) * bpp + 1] /= f;
				pixel[((y + OFS) * width + x + OFS ) * bpp + 2] /= f;
			}


		}
		//vdebug("%d,%d,%d %d %d\n", r, g, b, hs, vs);
		x = ((x + OFS)  < width ) ? x + 1 : x;
		dirty++;
	}

	return 1;
}



/* static int */
/* _video_drawpixel_1x_80(uint8_t * buf, int ofs, uint8_t r, uint8_t g, uint8_t b) */
/* { */
/* 	buf[ofs++] = b; */
/* 	buf[ofs++] = g; */
/* 	buf[ofs++] = r; */
/* 	return ofs + 1; */
/* } */


int
key_pressed()
{
	SDL_Event event;
	if (SDL_PollEvent (&event)) {
		return event.type == SDL_KEYDOWN && event.key.keysym.sym < 0x7f;
	}
	return 0;
}


void
wait_for_key()
{
	//SDL_Event event;

	printf("Press any key to exit.\n");
	while (!key_pressed()) usleep(20000);
}


void
save()
{
	//FILE * fp;
	char *fname;
	
	asprintf(&fname, "%s-%d.bmp", outfile, frame);
	/* if ((fp = fopen(fname, "w")) == NULL) { */
	/* 	fail("Couldn't open %s for writing: %s\n", strerror(errno)); */
	/* } */
	
	SDL_SaveBMP(screen, fname);
	free(fname);
}


int
main(int argc, char **argv)
{
	argp_parse (&argp, argc, argv, 0, NULL, NULL);
	if (video_in == NULL) {
		fprintf (stderr,
			 PACKAGE ": please specify a video.out dump file to load.\n");
		argp_help (&argp, stderr, ARGP_HELP_USAGE, PACKAGE);
		exit (1);
	}
	
	sdl_init();
	TTF_Init();
	font = TTF_OpenFont(fontname, fontsize);
	if (font == NULL) {
		fail("Unable to find font \"%s\": %s\n", fontname, strerror(errno));
	}
	if (process()) {
		save();
		if (interframe_pause) wait_for_key();
	}

	sdl_done();
	return 0;
}
