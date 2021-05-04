#include <stdio.h>
#include <string.h>
#include <stdint.h>

#include "../../microcode/build/microcode.h"

#define add(t,s) { \
		if(t[0] && s[0]) {		\
			strcat(t," ");		\
		}				\
		strcat(t,s);			\
	}

int main(int argc, char **argv)
{
	while(!feof(stdin))
	{
		char buf[1025], buf2[1025], buf3[32], col[1024];
		buf[0] = 0;
		col[0] = 0;
		if (fscanf(stdin, "%s", buf) != 1) continue;
		if(buf[0]) {
			unsigned int hx;
			sscanf(buf, "%x", &hx);
			buf2[0] = '\0';

			//  0 00001: upc
			//  1 00002: upc
			//  2 00004: upc
			//  3 00008: upc
			//  4 00010: idx
			//  5 00020: idx
			//  6 00040: !cond
			//  7 00080: ir7
			//  8 00100: ir8
			//  9 00200: ir9
			// 10 00400: ir10
			// 11 00800: ir11
			// 12 01000: ir12
			// 13 02000: ir13
			// 14 04000: ir14
			// 15 80000: ir15
			// 16 10000: irq
			// 17 20000: reset

			if ((hx & 0x20000) == 0) {
				strcpy(col, "?magenta4?");
				add(buf2, "reset");
			} else {
				if ((hx & 0x10000) == 0) {
					strcpy(col, "?orange4?");
					add(buf2, "irq");
				} else {
					snprintf(buf3, sizeof(buf3), "IR=%03x-", (hx & 0xff80) >> 4);
					add(buf2, buf3);
					
					if (hx & 0x80) add(buf2, "(in_rsvd)");
					if (hx & 0x40) add(buf2, "cond=true");
					
					if ((hx & 0x30) == 0x30) add(buf2, "idx-stack");
					if ((hx & 0x30) == 0x20) add(buf2, "idx-adec");
					if ((hx & 0x30) == 0x10) add(buf2, "idx-ainc");
				}
			}

			if (!buf2[0]) add(buf2, "?red4?huh");
			printf("%s%s\n", col, buf2);
			fflush(stdout);
		}
	}
	return(0);
}
