#!/usr/bin/make -f

SUBDIRS = firmware
DISTFILE = $(PACKAGE)-$(VERSION).tar.gz

.PHONY: all tar subdirs $(SUBDIRS)

subdirs: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@

all: subdirs

clean: subdirs

# End of file.
