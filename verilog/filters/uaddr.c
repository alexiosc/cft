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

			//  0 0001: upc
			//  1 0002: upc
			//  2 0004: upc
			//  3 0008: upc
			//  4 0010: idx
			//  5 0020: idx
			//  6 0040: !cond
			//  7 0080: in_rsvd
			//  8 0100: ir7
			//  9 0200: ir8
			// 10 0400: ir9
			// 11 0800: ir10
			// 12 1000: ir11
			// 13 2000: ir12
			// 14 4000: ir13
			// 15 8000: ir14
			// 16 10000: ir15
			// 17 20000: irq
			// 18 40000: reset

			if ((hx & 0x40000) == 0) {
				strcpy(col, "?red4?");
				add(buf2, "reset");
			}
			
			if ((hx & 0x20000) == 0) {
				strcpy(col, "?orange4?");
				add(buf2, "irq");
			}

			snprintf(buf3, sizeof(buf3), "IR=%03x-", (hx & 0x1ff00) >> 5);
			add(buf2, buf3);

			if ((hx & 0x80) != 0) add(buf2, "(in_rsvd)");
			if ((hx & 0x40) == 0) add(buf2, "cond=true");

			if ((hx & 0x30) == 3) add(buf2, "idx-stack");
			if ((hx & 0x30) == 2) add(buf2, "idx-adec");
			if ((hx & 0x30) == 1) add(buf2, "idx-ainc");

			if (!buf2[0]) add(buf2, "?red4?huh");
			printf("%s%s\n", col, buf2);
			fflush(stdout);
		}
	}
	return(0);
}
