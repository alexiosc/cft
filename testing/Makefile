#/usr/bin/make

TESTS =		$(shell echo t[0-9]*.py)
TESTER = 	./test.py

REPORTDIR =	reports
VERILOGDIR =	../verilog
MICROCODEDIR =	../microcode

DEPS = 		$(shell echo $(VERILOGDIR)/*o \
			$(MICROCODEDIR)/*.mc \
			$(MICROCODEDIR)/*.list)

REPORTS_V =	$(patsubst %.py,$(REPORTDIR)/verilog-%,$(TESTS))
REPORTS_E =	$(patsubst %.py,$(REPORTDIR)/emulator-%,$(TESTS))
TESTTARGETS = 	$(patsubst %.py,%,$(TESTS))

.PHONY:		all clean veryclean errclean test list $(TESTTARGETS) gtkwave

all:		test

test:		verilog-tests emulator-tests

test-verilog:	$(REPORTDIR) $(REPORTS_V)

test-emulator:	$(REPORTDIR) $(REPORTS_E)

clean-failed:
		grep -l ^FAILED $(REPORTDIR)/* | xargs -r rm -v

list:
		@echo "Available tests (you can cut & paste them):"
		@echo
		@echo "Verilog tests:"
		@echo $(REPORTS_V:.py=) | \
			tr ' ' '\012' | sed -e 's/^/  make /'
		@echo
		@echo "Binary-level emulator tests:"
		@echo $(REPORTS_E:.py=) | \
			tr ' ' '\012' | sed -e 's/^/  make /'

summary:
		@echo "Summary of Verilog tests:"
		@for a in $(REPORTS_V:.py=); do \
			printf "  %-40.40s " $$a; \
			if [ -r $$a ]; then \
				if grep -q ^FAILED $$a; then \
					echo 'Passed.'; \
				else \
					echo 'Tested, FAILED.'; \
				fi \
			else \
				echo 'Missing.'; \
			fi; \
		done
		@echo
		@echo "Summary of binary-level emulator tests:"
		@for a in $(REPORTS_E:.py=); do \
			printf "  %-40.40s " $$a; \
			if [ -r $$a ]; then \
				if grep -q ^FAILED $$a; then \
					echo 'Tested, FAILED.'; \
				else \
					echo 'Passed.'; \
				fi \
			else \
				echo 'Missing.'; \
			fi; \
		done

clean:		
		rm -f $(CLEANFILES) *.pyc
		rm -rf .test-[A-Fa-f0-9]* last-test

clean-verilog:
		rm -f $(REPORTS_V)

clean-emulator:
		rm -f $(REPORTS_E)

veryclean:	clean clean-verilog clean-emulator

errclean:
		for a in $(REPORTDIR)/*; do \
			tail -1 $$a | grep -q "^OK" || rm -v $$a; \
		done

$(REPORTDIR):
		mkdir $(REPORTDIR)

$(REPORTDIR)/verilog-%:		%.py $(DEPS)
		$(TESTER) -f verilog $< 2<&1 | tee $@

$(REPORTDIR)/emulator-%:	%.py $(DEPS)
		$(TESTER) -f emulator $< 2<&1 | tee $@

#%:		$(REPORTDIR)/%

gtkwave:
		gtkwave last-test/vcd/cft_tb.vcd sav/skeleton.sav 


# End of file.
