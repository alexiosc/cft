#!/usr/bin/make -f

UNITS = 	PB0 PB1 PB2 PB3 \
		processor \
		memory \
		debugging-board \
		front-panel \
		cft \

VTESTS =	$(foreach unit,$(UNITS),$(patsubst %.v,%,$(wildcard $(unit)*.v)))
PYTESTS =	$(foreach unit,$(UNITS),$(patsubst %.v,%,$(wildcard $(unit)*.py)))

SRC = 		$(foreach unit,$(UNITS),$(wildcard $(unit)*.v))
OBJ =		$(SRC:.v=.o)
DEFS +=		-DREPS=1500 -DDELTA=21553

BASEDIR = 	../..

VERILOG =	iverilog -Wall -I../lib -I..
GTKWAVE =	gtkwave -g
SAVDIR	= 	../sav
VCDDIR	=	../vcd

SUBDIRS = 	../img

STDBUF = 	/usr/bin/stdbuf
TESTCOL = 	../tools/testcol

.PHONY: 	all all-subdirs subdirs $(SUBDIRS) test test1 clean veryclean mrproper

all:		$(OBJ)

test:		$(OBJ) $(VTESTS) $(PYTESTS)

test1:		$(OBJ) $(UNIT)

%:		%.o
		@echo "Testing $@"
		@(cd .. ; $(STDBUF) -oL tests/$^ | $(STDBUF) -oL grep -v VCD | $(TESTCOL) ) || true

clean:
		rm -f $(OBJ) *.o a.out out.vcd test_rom.bin

mrproper: 	clean
		rm -f *~

%.o:		%.v ../*.v ../lib/*.v
		$(VERILOG) $(DEFS) -DTESTNAME='"$(patsubst %.v,%,$<)"' -o $@ $<

# End of file.
