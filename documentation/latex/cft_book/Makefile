#!/usr/bin/makefile

BASE =		cft-book$(SUFFIX)
LATEX = 	PATH="$(TOOLDIR):$$PATH" xelatex -shell-escape
HTLATEX = 	PATH="$(TOOLDIR):$$PATH" $(SCRIPTS)/htlatex
PDFTOPNG =	../scripts/pdftopng
GS = 		gs
VIEWER =	okular
GEN = 		../generated
EAGLE = 	../eagle
DEPS = 		*.tex figs/schematics.pdf $(GEN)/forth-words.tex $(GEN)/forth-doc.tex \
		$(GEN)/mode-table.tex \
		$(GEN)/vdu-test-image3-small-dithered-160x120MC.png \
		$(GEN)/fontmap-00a.pdf \
		$(GEN)/fontmap-00b.pdf \
		$(GEN)/fontmap-00c.pdf \
		$(GEN)/fontmap-00d.pdf \
		$(FIGDIR)/video-max5-1.png \
		$(FIGDIR)/schematics-01.png \
		stamp-ioports \
		stamp-safigs \
		stamp-safigs-svg \
		stamp-safigs-png \
		stamp-pdf-figs

SAFIGS =	$(patsubst %.tex,%.pdf, \
		$(shell grep -l documentclass.*standalone figure-*.tex | \
			grep -Fv figure-template.tex))
SAFIGS_SVG =    $(patsubst %.pdf,%.svg,$(SAFIGS))
SAFIGS_PNG =    $(patsubst %.pdf,%.png,$(SAFIGS))
PDF_FIGS =	$(FIGDIR)/din41612.pdf \
		$(FIGDIR)/debouncing.pdf \
		$(FIGDIR)/DE15_Connector_Pinout.pdf \
		$(FIGDIR)/bus-termination.pdf \
		$(FIGDIR)/deb-bus-interface.pdf \

PDF_FIGS_SVG =	$(patsubst %.pdf,%.svg,$(PDF_FIGS))
PDF_FIGS_PNG =	$(patsubst %.pdf,%.png,$(PDF_FIGS))

TOPDIR =	../../..
FIGDIR =	figs
SCRIPTS =	../scripts
BOM2TEX = 	$(SCRIPTS)/bom2tex.py
FORTHWORDS = 	$(SCRIPTS)/forth-words.py
FORTHDOC = 	$(SCRIPTS)/forth-doc.py
MODETABLE =     $(SCRIPTS)/mkmodes.py
MKSAMPLEIMG =   $(SCRIPTS)/mksampleimages.sh
EMUDIR =	$(TOPDIR)/emulator
TOOLDIR =	$(TOPDIR)/tools

BASEDIR = 	../../..
FORTHDIR =	$(BASEDIR)/forth

.PHONY:		all clean veryclean view upload raster optimise ioports pdffigs-svg \
		safigs safigs-png safigs-svg html html-once once-html

all: 		$(BASE).pdf $(DEPS)

clean:
		-rm -f $(BASE).aux $(BASE).log $(BASE)*.pnm
		-rm -f $(BASE).out $(BASE).pdf $(BASE)-fig[0-9]*.* $(BASE).gl? $(BASE)-view.pdf
		-rm figure-*.acn figure-*.aux figure-*.log figure-*.glo figure-*.out figure-*.idx *.pyg


veryclean:	clean
		-rm -f $(BASE).pdf $(BASE).dvi figure-*.pdf figure-*.png figure-*.svg tikz/*

view:		$(BASE).pdf
		cp $(BASE).pdf $(BASE)-view.pdf
		$(VIEWER) $(BASE)-view.pdf 2>/dev/null &

optimise:	$(BASE).pdf
		$(GS) -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 \
			-dNOPAUSE -dQUIET -dBATCH -sOutputFile=$(BASE)-compressed.pdf $(BASE).pdf
		mv $(BASE)-compressed.pdf $(BASE).pdf

upload: 	$(BASE).pdf
		rsync -z --progress --partial $(BASE).pdf \
			alexios@graviera:bedroomlan/files/hardware/cft/documentation/

raster: 	$(BASE).pdf
		pdftoppm -r 75 $(BASE).pdf $(BASE)
		for a in $(BASE)*ppm; do echo $${a%%.ppm}; done | \
			xargs -P4 -n1 -i% convert -verbose %.ppm %.png
		rm -f $(BASE)*ppm
#		montage -verbose -background 'grey18' -tile 8x -geometry x1600+20+20 \
#			$(BASE)-*[0-9].png $(BASE).png
#		# montage -verbose -background transparent -tile 1x -geometry x600+20+20 \
#		# 	$(BASE)-*[0-9].png $(BASE)-onecolumn.png

$(BASE).pdf: 	$(BASE).tex $(DEPS)
		$(LATEX) $<
		cp $(BASE).pdf $(BASE)-view.pdf
		while grep -q "Warning:.*Rerun" $(BASE).log; do $(LATEX) $<; done

ioports \
stamp-ioports:	$(BASE).loioport
		( grep 'nobreakspace' $<; grep -v 'nobreakspace' $< | sort ) >temp-$<
		mv temp-$< $<
		touch stamp-ioports

glo \
$(BASE).gls:	$(BASE).glo
		makeglossaries $(BASE)

ind \
$(BASE).ind:	$(BASE).idx
		makeindex $(BASE)
		sed -i $(BASE).ind -e 's/---/—/g' -e 's/--/–/g'

once: 		$(BASE).tex $(DEPS)
		$(LATEX) $<
		cp $(BASE).pdf $(BASE)-view.pdf

# PDF figures in the figs/ directory can't be used in PDF form by
# TeX4ht (the cropping is wrong). Convert manually to SVGs.

stamp-pdf-figs \
pdf-figs-svg:	$(PDF_FIGS_SVG)
		touch stamp-pdf-figs

# Standalone figures

stamp-safigs \
safigs:		$(SAFIGS)
		touch stamp-safigs

figure-%.pdf:	figure-%.tex preamble.tex preamble-new.tex
#		$(LATEX) -interaction=batchmode $<
		$(LATEX) $<
		pdfcrop $@ $@~
		mv $@~ $@
		rm -f $(patsubst %.tex,%,$<).{aux,glo,idx,ist,log,out}

stamp-safigs-svg \
safigs-svg:	$(SAFIGS_SVG)
		touch stamp-safigs-svg

stamp-safigs-png \
safigs-png:	$(SAFIGS_PNG)
		touch stamp-safigs-png

%.png:   	%.pdf
		$(PDFTOPNG) -singlefile -r 300 $< $(<:.pdf=)
		mogrify -bordercolor white -border 10 $@

%.svg:   	%.pdf
		pdf2svg $< $@
		(echo '\HCode{'; cat $@; echo '}') >$@.4ht

$(FIGDIR)/debouncing.png: $(FIGDIR)/debouncing.pdf
		$(PDFTOPNG) -r 100 -singlefile $< $(<:.pdf=)
		mogrify -bordercolor white -border 10 $@

$(FIGDIR)/video-max5-1.png: $(FIGDIR)/video-max5.pdf
		$(PDFTOPNG) -r 150 $< $(<:.pdf=)
		mogrify -bordercolor white -border 10 $(<:.pdf=)-[0-9]*png

$(FIGDIR)/schematics-1.png: $(FIGDIR)/schematics.pdf
		$(PDFTOPNG) -r 150 $< $(<:.pdf=)
		mogrify -bordercolor white -border 10 $(<:.pdf=)-[0-9]*png

$(FIGDIR)/schematics-01.png: $(FIGDIR)/schematics.pdf
		$(PDFTOPNG) -r 150 $< $(<:.pdf=)
		mogrify -bordercolor white -border 10 $(<:.pdf=)-[0-9]*png

$(FIGDIR)/%.png: $(FIGDIR)/%.pdf
		$(PDFTOPNG) -r 300 -singlefile $< $(<:.pdf=)
		mogrify -bordercolor white -border 10 $@

# Convert schematics into series of bitmaps

figs/%-1.jpg: eagle/%.pdf
	pdftoppm -r 300 $^ figs/$(notdir $(basename $^))
	for a in figs/$(notdir $(basename $^))-*.ppm; do \
		convert -quality 95 -verbose $$a `echo $$a | sed 's/ppm/jpg/'`; \
		rm $$a; \
	done

$(GEN)/%-bom-parts.tex $(GEN)/%-bom-values.tex: $(EAGLE)/%.bomp $(EAGLE)/%.bomv $(BOM2TEX)
	( cd $(GEN); $(BOM2TEX) $^ )

$(GEN)/forth-words.tex: $(FORTHWORDS) $(FORTHDIR)/primitives/*.asm
	( cd $(GEN); $(FORTHWORDS) > $@ )

$(GEN)/forth-doc.tex: $(FORTHDOC) $(FORTHDIR)/primitives/*.asm
	( cd $(GEN); $(FORTHDOC) > $@ )

$(GEN)/mode-table.tex: $(MODETABLE)
	( cd $(GEN); $(MODETABLE) > $@ )

$(GEN)/vdu-test-image3-small-dithered-160x120MC.png: $(FIGDIR)/vdu-test-image3-small-dithered.png
	cp $^ $(GEN)
	( cd $(GEN); $(MKSAMPLEIMG) $(notdir $^) )

$(GEN)/fontmap-%.ps: $(EMUDIR)/romfont.fnt $(SCRIPTS)/font2ps.py
	$(SCRIPTS)/font2ps.py $(EMUDIR)/romfont.fnt $(GEN)/fontmap

$(GEN)/fontmap-%.eps: $(GEN)/fontmap-%.ps
	-rm -f $@
	ps2eps -f $<

$(GEN)/fontmap-%.pdf: $(GEN)/fontmap-%.eps
	epstopdf $<

html:	$(BASE).tex $(DEPS)
	rm -f $(BASE)-html.aux $(BASE)-html.xref
	$(HTLATEX) $(BASE)-html.tex $(BASE)-html.cfg " -cunihtf -utf8" "" " -shell-escape"

html-once once-html: $(BASE).tex $(DEPS)
	rm -f $(BASE)-html.aux $(BASE)-html.xref
	LATEX_RUNS=1 $(HTLATEX) $(BASE)-html.tex $(BASE)-html.cfg " -cunihtf -utf8" "" " -shell-escape"

# End of file.
