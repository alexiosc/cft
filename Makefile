#GHDL = ghdl -a --ieee=synopsys $<
GHDL = ghdl -a $<

MODS = \
	utils.o \
	utils_body.o \
	\
	register_74x175.o register_74x175_tb.o \
	\
	counter.o counter_tb.o \
	counter_74x561.o counter_74x561_tb.o \
	\
	bv_arithmetic.o \
	bv_arithmetic_body.o \
	bv_arithmetic_tb.o \
	\
	utils.o \
	\
	ssm.o ssm_tb.o \

all:	$(MODS)


clean:
	rm -f *.o $(MODS) *~ *.cf $(MODS:.o=) *.vcd

test:	 	ssm.o
		ghdl -e ssm_tb
		ghdl -r ssm_tb --vcd=ssm.vcd
		gtkwave ssm.vcd


test_counter:	counter.o counter_tb.o
		ghdl -e counter_tb
		ghdl -r counter_tb --vcd=counter.vcd
		gtkwave counter.vcd

test_counter_74x561:	counter_74x561.o counter_74x561_tb.o
		ghdl -e counter_74x561_tb
		ghdl -r counter_74x561_tb --vcd=counter_74x561.vcd
		gtkwave counter_74x561.vcd

test_register:	register.o register_tb.o
		ghdl -e register_tb
		ghdl -r register_tb --vcd=register.vcd
		gtkwave register.vcd

%_tb.o: %_tb.vhdl %.vhdl
	$(GHDL) $<

%.o: %.vhdl
	$(GHDL) $<

# End of file.
