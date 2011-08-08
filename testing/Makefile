#/usr/bin/make

TESTS =		$(shell echo t[0-9]*.py)
TESTER = 	./test.py

REPORTDIR =	reports
VERILOGDIR =	../verilog
MICROCODEDIR =	../microcode

DEPS = 		$(REPORTDIR) $(shell echo $(VERILOGDIR)/*o \
			$(MICROCODEDIR)/*.mc \
			$(MICROCODEDIR)/*.list)

TESTREPORTS =	$(patsubst %.py,$(REPORTDIR)/%,$(TESTS))
TESTTARGETS = 	$(patsubst %.py,%,$(TESTS))

.PHONY:		all clean veryclean errclean test list $(TESTTARGETS)

all:		test

test:		$(REPORTDIR) $(TESTREPORTS)

list:
		@echo "Available tests (cut & paste):"
		@echo $(TESTTARGETS) | \
			tr ' ' '\012' | \
			sed -e 's/\.py$$//' -e 's/^/    make reports\//'

clean:	
		rm -f $(CLEANFILES) *.pyc
		rm -rf .test-[A-Fa-f0-9]*

veryclean:	clean
		rm -rf $(REPORTDIR)

errclean:
		for a in $(REPORTDIR)/*; do \
			tail -1 $$a | grep -q "^OK" || rm -v $$a; \
		done

$(REPORTDIR):
		mkdir $(REPORTDIR)

$(REPORTDIR)/%:	%.py $(DEPS)
		$(TESTER) $< 2<&1 | tee $@

%:		$(REPORTDIR)/%
		echo foo


# End of file.
