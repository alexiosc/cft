#!/usr/bin/make -f

PACKAGE = flashprog
VERSION = 0.4
SUBDIRS = firmware
DISTFILE = $(PACKAGE)-$(VERSION).tar.gz

.PHONY: all tar subdirs $(SUBDIRS)

subdirs: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@

all: subdirs

tar: subdirs
	( \
		cd ..; \
		tar -czvf $(DISTFILE) $(PACKAGE) \
			--exclude=tool --exclude=eagle --exclude=datasheets \
			--exclude= --exclude=*~ --exclude=tmp \
	)

upload: tar
	rsync -va --progress ../$(DISTFILE) graviera:bedroomlan/files/hardware/flashprog/

# End of file.