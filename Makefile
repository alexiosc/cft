#/usr/bin/make

VERILOG 	= verilog
SUBDIRS 	= microcode $(VERILOG) testing
PUBDIR		= pub
TOOLDIR		= tools
DOCDIR		= documentation

# Generate the Changelog
CHANGELOG	= Changelog
CHANGELOG_CSV	= $(PUBDIR)/$(CHANGELOG).csv
CHANGELOG2CSV	= $(TOOLDIR)/changelog2csv.py

# Generate the documentation
CFTBOOKDIR	= $(DOCDIR)/latex/cft_book
CFTBOOKFILE	= $(CFTBOOKDIR)/cft-book-html.html
CFTBOOK_CSV	= $(PUBDIR)/cft-book.csv
BOOK2CSV	= $(TOOLDIR)/book2csv.py

.PHONY: 	all all-subdirs clean clean-subdirs subdirs $(SUBDIRS) \
		test pub publish

all:		$(SUBDIRS)
		for a in $(SUBDIRS); do $(MAKE) -C $$a $@; done

clean:	
		for a in $(SUBDIRS); do $(MAKE) -C $$a $@; done

test:		$(SUBDIRS)
		cp asm/build/test2-00.list verilog/img/a-00.list
		cp asm/build/test2-01.list verilog/img/a-01.list
		cd $(VERILOG); ./cft_tb.o

pub:		$(CHANGELOG_CSV) $(CFTBOOK_CSV)

publish:	pub
		svn commit $(PUBDIR) -m "Published documentation."

$(CHANGELOG_CSV): $(CHANGELOG)
		$(CHANGELOG2CSV) <$(CHANGELOG) >$@

$(CFTBOOK_CSV):	$(CHANGELOG)
		$(BOOK2CSV) $(CFTBOOKFILE) >$@

$(SUBDIRS):
		$(MAKE) -C $@

# End of file.
