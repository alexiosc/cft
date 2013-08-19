CC =		gcc
CFLAGS +=	-O2 -g -Wall
CFLAGS +=	$(shell sdl-config --cflags)
LDFLAGS +=	$(shell sdl-config --libs) -lSDL_ttf

all:	emu-monitor

.PHONY:		all

%:	%.c
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $<

# End of file.

