#/usr/bin/make

VERILOG = verilog
SUBDIRS = microcode $(VERILOG) testing

.PHONY: all all-subdirs clean clean-subdirs subdirs $(SUBDIRS) \
	test

all:	$(SUBDIRS)
	for a in $(SUBDIRS); do $(MAKE) -C $$a $@; done

clean:
	for a in $(SUBDIRS); do $(MAKE) -C $$a $@; done

test:	$(SUBDIRS)
	cp asm/build/test2-00.list verilog/img/a-00.list
	cp asm/build/test2-01.list verilog/img/a-01.list
	cd $(VERILOG); ./cft_tb.o

$(SUBDIRS):
	$(MAKE) -C $@

# End of file.
