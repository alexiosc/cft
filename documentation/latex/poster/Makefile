#!/usr/bin/makefile

BASE =		poster$(SUFFIX)
LATEX = 	xelatex -shell-escape
GS = 		gs
VIEWER =	okular
GEN = 		../generated
EAGLE = 	../eagle
DEPS = 		*.tex figs/schematics.pdf $(GEN)/forth-words.tex $(GEN)/forth-doc.tex \
		$(GEN)/mode-table.tex \
		$(GEN)/vdu-test-image2-small-dithered-160x100MC.png \

FIGDIR =	../figs
SCRIPTS =	../scripts
BOM2TEX = 	$(SCRIPTS)/bom2tex.py
FORTHWORDS = 	$(SCRIPTS)/forth-words.py
FORTHDOC = 	$(SCRIPTS)/forth-doc.py
MODETABLE =     $(SCRIPTS)/mkmodes.py
MKSAMPLEIMG =   $(SCRIPTS)/mksampleimages.sh

BASEDIR = 	../../..
FORTHDIR =	$(BASEDIR)/forth

.PHONY:		all clean veryclean view upload raster optimise
all: 		$(BASE).pdf $(DEPS)

clean:
		rm -f $(BASE).aux $(BASE).log $(BASE)*.png $(BASE)*.pnm \
			$(BASE).out $(BASE).pdf $(BASE)-fig[0-9]*.* $(BASE).gl?

veryclean:	clean
		rm -f $(BASE).pdf $(BASE).dvi

view:		$(BASE).pdf
		$(VIEWER) $< 2>/dev/null &

optimise:	$(BASE).pdf
		$(GS) -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 \
			-dNOPAUSE -dQUIET -dBATCH -sOutputFile=$(BASE)-compressed.pdf $(BASE).pdf
		mv $(BASE)-compressed.pdf $(BASE).pdf

upload: 	$(BASE).pdf
		rsync -z --progress --partial $(BASE).pdf \
			alexios@graviera:bedroomlan/files/hardware/cft/documentation/

raster: 	$(BASE).pdf
		pdftoppm -r 75 $(BASE).pdf $(BASE)
		for a in $(BASE)*ppm; do \
			convert -verbose $$a `echo $$a | sed 's/ppm/png/'`; \
			rm $$a; \
		done
		montage -verbose -background 'grey18' -tile 8x -geometry x1600+20+20 \
			$(BASE)-*[0-9].png $(BASE).png
		# montage -verbose -background transparent -tile 1x -geometry x600+20+20 \
		# 	$(BASE)-*[0-9].png $(BASE)-onecolumn.png

$(BASE).pdf: 	$(BASE).tex $(DEPS)
		$(LATEX) $<
		while grep -q "Warning:.*Rerun" $(BASE).log; do $(LATEX) $<; done

glo \
$(BASE).gls:	$(BASE).glo
		makeglossaries $(BASE)

ind \
$(BASE).ind:	$(BASE).idx
		makeindex $(BASE)
		sed -i $(BASE).ind -e 's/---/—/g' -e 's/--/–/g'

once: 		$(BASE).tex $(DEPS)
		$(LATEX) $<

# Convert schematics into series of JPEGs.

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

$(GEN)/vdu-test-image2-small-dithered-160x100MC.png: $(FIGDIR)/vdu-test-image2-small-dithered.png
	cp $^ $(GEN)
	( cd $(GEN); $(MKSAMPLEIMG) $(notdir $^) )

# End of file.
