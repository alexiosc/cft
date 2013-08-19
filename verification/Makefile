#!/usr/bin/make -f

BASEDIR = $(shell cd ../; pwd)
SRC =		PB0.v \
		PB0-UPC.v \
		PB0-ROM.v \
		PB0-UPC.v \
		PB0-UCB.v \
		PB0-decoders.v \
		PB1.v \
		PB1-clock.v \
		PB1-reset.v \
		PB1-SBL.v \
		PB1-AGL.v \
		PB1-IR.v \
		PB1-ISM.v \
		PB1-DBD.v \
		PB2.v \
		PB2-AR.v \
		PB2-AIL.v \
		PB2-IOD.v \
		PB2-PC.v \
		PB2-DR.v \
		PB2-AC.v \
		PB3.v \
		PB3-L.v \
		PB3-A.v \
		PB3-B.v \
		PB3-decoder.v \
		PB3-Y.v \
		PB3-binary.v \
		PB3-unary.v \
		PB3-MBU.v \
		processor.v \
		memory.v \
		mem64k.v \
		debugging-board.v \
		front-panel.v \

OBJ =		$(SRC:.v=.o)

DEFS = 		-DBASEDIR='"$(BASEDIR)"'

VERILOG =	iverilog -Wall -Ilib
GTKWAVE =	gtkwave -g
SAVDIR	= 	sav
VCDDIR	=	vcd

SUBDIRS = 	img tests filters

.PHONY: 	all all-subdirs subdirs $(SUBDIRS) test test1 clean veryclean mrproper

all:	 	$(SUBDIRS) $(OBJ)

clean:
		rm -f $(OBJ) *.o a.out out.vcd test_rom.bin
		for dir in $(SUBDIRS); do $(MAKE) -C $$dir $@; done

veryclean:	clean
		rm -f vcd/*vcd
		for dir in $(SUBDIRS); do $(MAKE) -C $$dir $@; done

mrproper:	veryclean
		rm -f *~ lib/*~
		for dir in $(SUBDIRS); do $(MAKE) -C $$dir $@; done

$(SUBDIRS):
		$(MAKE) -C $@

%.o:		%.v lib/*.v
		$(VERILOG) $(DEFS) -o $@ $<

test:		$(OBJ)
		$(MAKE) -C tests test

test1:		$(OBJ)
		@if [ ! -r tests/$(UNIT).v -a ! -r tests/$(UNIT).py ]; then \
			echo "Test $(UNIT) does not exist in tests/"; \
			exit 1; \
		fi
		$(MAKE) -C tests test1

list:
		@echo "Waveform files:"
		@echo "---------------"
		@for a in $(patsubst vcd/%.vcd,%,$(wildcard vcd/*.vcd)); do echo $$a; done

view:	
		@if [ ! -r tests/$(UNIT).v ]; then \
			echo "Test $(UNIT) does not exist in tests/"; \
			exit 1; \
		fi
		rm -f tests/$(UNIT).o
		$(MAKE) -C tests test DEFS=-DWRITE_VCD UNITS=$(UNIT)
		$(GTKWAVE) -g vcd/$(UNIT).vcd sav/$(UNIT).sav

# End of file.
