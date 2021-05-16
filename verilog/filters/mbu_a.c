#include <stdio.h>
#include <string.h>
#include <stdint.h>

int main(int argc, char **argv)
{
	while(!feof(stdin))
	{
		char buf[1025];
		buf[0] = 0;
		if (fscanf(stdin, "%s", buf) != 1) continue;
		if (buf[0]) {
			unsigned int addr = 0;
			sscanf(buf, "%x", &addr);
			printf("%02x:%x\n", addr >> 3, addr & 7);
			fflush(stdout);
		}
	}
	return(0);
}
