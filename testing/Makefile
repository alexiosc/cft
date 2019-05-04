#/usr/bin/make

TESTS ?=	$(shell $(RUNTESTS) -L)
TESTFLAGS += 	

REPORTDIR =	reports
VERILOGDIR =	../verilog
MICROCODEDIR =	../microcode
SANDBOXDIR = 	sandbox
SAVDIR =	sav

RUNTESTS = 	./runtests
GTKWAVE =	gtkwave -g
TEE =		tee
RM =		rm -f

DEPS = 		$(MICROCODEDIR)/*.mc $(MICROCODEDIR)/*.list

REPORTS_V =	$(patsubst %,$(REPORTDIR)/v%.txt,$(TESTS))
REPORTS_E =	$(patsubst %,$(REPORTDIR)/e%.txt,$(TESTS))
TESTS_V = 	$(patsubst %,v%,$(TESTS))
TESTS_E = 	$(patsubst %,e%,$(TESTS))
TESTS_D = 	$(patsubst %,d%,$(TESTS))
TESTS_H = 	$(patsubst %,h%,$(TESTS))

VTESTDEPS =	$(DEPS) $(VERILOGDIR)/*.o
ETESTDEPS =	$(DEPS)
DTESTDEPS =	$(ETESTDEPS)
HTESTDEPS =	$(ETESTDEPS)

VTESTFLAGS =	-v
ETESTFLAGS =	
DTESTFLAGS =	$(ETESTFLAGS)
HTESTFLAGS =	$(ETESTFLAGS)

SHELL =		/bin/bash	# We use a few bash-isms.

#$(TESTS_V) $(TESTS_E) \
#clean veryclean errclean test l list $(TESTS_V) \
#gtkwave rt retest rk retest-keep rw retest-wave lw list-waves \
#v view clean-sandbox vtest

.PHONY:		all dep \
		h help targets \
		s summary \
		ls lists \
		l list lv listv le liste \
		tv vt vtest testv \
		te et etest teste \
		rv reportv \
		rw retest-wave \
		$(TESTS_V) $(TESTS_E)

h help targets:
		@echo "Targets:"
		@echo
		@echo "  h help targets           This page"
		@echo
		@echo "  s summary                Summarise results"
		@echo "  l list                   List all tests"
		@echo "  ls lists                 List all available sandboxes"
		@echo "  lv listv                 List all Verilog tests"
		@echo "  le liste                 List all Emulator tests"
		@echo "  ld listd                 List all Emulator (via DFP) tests"
		@echo "  lh listh                 List all Hardware tests"
		@echo "  rt retest T=pat          Retest tests matching pat (glob)"
		@echo "  rk retest-keep T=pat     Retest and keep sandboxes"
		@echo "  rw retest-wave T=pat     Test and generate gtkwave waveforms"
		@echo "  lw list-waves            List available waveforms"
		@echo "  v view W=test T=subtest  View waveform for test/subtest"
		@echo
		@echo "  clean                    Basic clean"
		@echo "  veryclean                Makes clean and removes editor backup files"
		@echo "  clean-failed             Clean failed tests"
		@echo "  clean-sandbox            Clean sandboxes"
		@echo "  mrproper                 Cleans everything"
		@echo

s summary:
		@$(RUNTESTS) -s

l list:		lv le

ls lists:	
		@echo
		@echo "Available test sandboxes"
		@echo "-------------------------------------------------------------------------------"
		@( cd $(SANDBOXDIR); for t in *; do \
			a=$$t; \
			for w in $$t/*; do \
				printf "%-30s T=%s W=%s\n" "$$a" `basename $$t` `basename $$w`; \
				a=""; \
			done; \
		done )

lv:
		@echo
		@echo "Available Verilog tests"
		@$(RUNTESTS) -l -f verilog

le:
		@echo
		@echo -e "Available Emulator tests"
		@$(RUNTESTS) -l -f emulator

lw list-waves:
		@echo 'Waves found: (cut and paste command to run gtkwave)'
		@find -name '*vcd' | sed \
			-e 's/\.\/sandbox\//make vw T=/' \
			-e 's/\// W=/' \
			-e 's/\/.*$$//'

rw retest-wave:
		set -e; for t in $(TESTS); do \
			if [[ $$t =~ $(T) ]]; then \
				n=verilog-`echo $$t | sed 's/\.py$$//'`; \
				echo $$n ; \
				$(TESTER) -kw -n $$n $(TESTFLAGS) -f verilog $$t 2<&1 | \
				tee reports/$$n $@; \
			fi; \
		done

vw view-wave:
		$(GTKWAVE) $(SANDBOXDIR)/$(T)/$(W)/simulation.vcd $(SAVDIR)/$(T)-$(W).sav

vls view-ls:
		ls -la $(SANDBOXDIR)/$(T)/$(W)/

va view-asm:
		cat $(SANDBOXDIR)/$(T)/$(W)/test.asm

vpa view-pasm:
		cat $(SANDBOXDIR)/$(T)/$(W)/a.pasm

vo view-out:
		cat $(SANDBOXDIR)/$(T)/$(W)/simulation.out



rv reportv:	$(REPORTDIR)/v$(T).txt
		cat $^

clean:		
		$(RM) *.pyc output[0-9]

clean-sandbox:
		[[ $(SANDBOXDIR) =~ sandbox ]] && $(RM) -r $(SANDBOXDIR)/[vet]*[0-9][0-9][0-9][0-9]*

clean-reports:
		[[ $(REPORTDIR) =~ report ]] && $(RM) $(REPORTDIR)/[vet]*[0-9][0-9][0-9][0-9]*

clean-failed:
		$(RM) `egrep -l 'FAILED.*(failure|error)s*=' $(REPORTDIR)/*.txt`

veryclean:	clean clean-sandbox
		$(RM) *~

mrproper:	veryclean clean-reports
		$(RM) reports/[vet]*[0-9][0-9][0-9][0-9]* .deps

test:		vtest etest

tv vt \
vtest testv:	$(TESTS_V)

te et \
etest teste:	$(TESTS_E)

td dt \
dtest testd:	$(TESTS_D)

th ht \
htest testh:	$(TESTS_H)

$(TESTS):	reports/%.txt
#v%:		reports/v%.txt

reports/%.txt: %.py
		@$(TESTER) -n $(basename $<) $(TESTFLAGS) -f verilog $< 2<&1 | \
			tee reports/v$(basename $<).txt


dep .deps:	$(RUNTESTS) *.py
		$(RUNTESTS) -M >.deps

include .deps



###############################################################################


#test:		test-verilog # emulator-tests
#
#test-verilog:	$(REPORTDIR) $(REPORTS_V)
#
#test-emulator:	$(REPORTDIR) $(REPORTS_E)
#
#rt retest:
#		@set -e; for t in $(TESTS); do \
#			if [[ $$t =~ \.*$(T).*\.py$$ ]]; then \
#				n=verilog-`echo $$t | sed 's/\.py$$//'`; \
#				echo $$n ; \
#				$(TESTER) -n $$n $(TESTFLAGS) -f verilog $$t 2<&1 | \
#				tee reports/$$n $@; \
#			fi; \
#		done
#
#rk retest-keep:
#		@set -e; for t in $(TESTS); do \
#			if [[ $$t =~ \.*$(T).*\.py$$ ]]; then \
#				n=verilog-`echo $$t | sed 's/\.py$$//'`; \
#				echo $$n ; \
#				$(TESTER) -k -n $$n $(TESTFLAGS) -f verilog $$t 2<&1 | \
#				tee reports/$$n $@; \
#			fi; \
#		done
#
#rw retest-wave:
#		@set -e; for t in $(TESTS); do \
#			if [[ $$t =~ \.*$(T).*\.py$$ ]]; then \
#				n=verilog-`echo $$t | sed 's/\.py$$//'`; \
#				echo $$n ; \
#				$(TESTER) -kw -n $$n $(TESTFLAGS) -f verilog $$t 2<&1 | \
#				tee reports/$$n $@; \
#			fi; \
#		done
#
## Cleaning
#
#clean-failed:
#		grep -l ^FAILED $(REPORTDIR)/* | xargs -r rm -v
#
#clean-sandbox:
#		rm -rf ./$(SANDBOXDIR)/*
#
#clean:		
#		rm -f $(CLEANFILES) *.pyc
#		rm -rf .test-[A-Fa-f0-9]* last-test
#
#veryclean:	clean
#		rm -f *~
#
#mrproper:	veryclean clean-failed clean-sandbox
#		rm -f *.o reports/*
#
#
#
#
#
#
##		@echo "Available tests (you can cut & paste them):"
##		@echo
##		@echo "Verilog tests:"
##		@echo $(REPORTS_V:.py=) | \
##			tr ' ' '\012' | sed -e 's/^/  make /'
##		@echo
##		@echo "Binary-level emulator tests:"
##		@echo $(REPORTS_E:.py=) | \
##			tr ' ' '\012' | sed -e 's/^/  make /'
#
#summary:
#		@echo "Summary of Verilog tests:"
#		@for a in $(REPORTS_V:.py=); do \
#			printf "  %-40.40s " $$a; \
#			if [ -r $$a ]; then \
#				if grep -q ^FAILED $$a; then \
#					echo 'Tested, FAILED.'; \
#				else \
#					echo 'Passed.'; \
#				fi \
#			else \
#				echo 'Missing.'; \
#			fi; \
#		done
#		@echo
#		@echo "Summary of binary-level emulator tests:"
#		@for a in $(REPORTS_E:.py=); do \
#			printf "  %-40.40s " $$a; \
#			if [ -r $$a ]; then \
#				if grep -q ^FAILED $$a; then \
#					echo 'Tested, FAILED.'; \
#				else \
#					echo 'Passed.'; \
#				fi \
#			else \
#				echo 'Missing.'; \
#			fi; \
#		done
#
#clean-verilog:
#		rm -f $(REPORTS_V)
#
#clean-emulator:
#		rm -f $(REPORTS_E)
#
#veryclean:	clean clean-verilog clean-emulator
#
#errclean:
#		for a in $(REPORTDIR)/*; do \
#			tail -1 $$a | grep -q "^OK" || rm -v $$a; \
#		done
#
#$(REPORTDIR):
#		mkdir $(REPORTDIR)
#
#$(REPORTDIR)/verilog-%:		%.py $(DEPS)
#		$(TESTER) -n $(notdir $@) $(TESTFLAGS) -f verilog $< 2<&1 | tee $@
#
#$(REPORTDIR)/emulator-%:	%.py $(DEPS)
#		$(TESTER) -n $(notdir $@) $(TESTFLAGS) -f emulator $< 2<&1 | tee $@
#
##%:		$(REPORTDIR)/%
#
#gtkwave:
#		gtkwave last-test/vcd/cft_tb.vcd sav/skeleton.sav 
#
#
## End of file.
#
