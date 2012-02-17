#!/usr/bin/makefile

BASE =		cft-panel-guide
LATEX = 	xelatex -shell-escape
GS = 		gs
VIEWER =	okular
GEN = 		../generated
EAGLE = 	../eagle
DEPS = 		figs/front-panel-1.jpg figs/front-panel-controller-1.jpg \
			../../panel/front-panel-v2-small.jpg \
			figs/front-panel-v2-terse-small.jpg \
			figs/debouncing.pdf \
			$(GEN)/front-panel-bom-parts.tex \
			$(GEN)/front-panel-bom-values.tex \
			$(GEN)/front-panel-controller-bom-parts.tex \
			$(GEN)/front-panel-controller-bom-values.tex
SCRIPTS = 		../scripts
BOM2TEX = 	$(SCRIPTS)/bom2tex.py

.PHONY:		all clean veryclean view upload raster optimise
all: 		$(BASE).pdf $(DEPS)

clean:
		rm -f $(BASE).aux $(BASE).log $(BASE)*.png $(BASE)*.pnm \
			$(BASE).out $(BASE).pdf $(BASE)-fig[0-9]*.*

veryclean:	clean
		rm -f $(BASE).pdf $(BASE).dvi

view:		$(BASE).pdf
		$(VIEWER) $< 2>/dev/null &

optimise:	$(BASE).pdf
		$(GS) -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 \
			-dNOPAUSE -dQUIET -dBATCH -sOutputFile=$(BASE)-compressed.pdf $(BASE).pdf
		mv $(BASE)-compressed.pdf $(BASE).pdf

upload: 	optimise $(BASE).pdf
		rsync -z --progress --partial $(BASE).pdf \
			alexios@graviera:bedroomlan/files/hardware/cft/documentation/

raster: 	$(BASE).pdf
		pdftoppm -r 300 $(BASE).pdf $(BASE)
		for a in $(BASE)*ppm; do \
			convert -verbose $$a `echo $$a | sed 's/ppm/png/'`; \
			rm $$a; \
		done
		montage -verbose -background 'grey18' -tile 2x -geometry x1600+100+100 \
			$(BASE)-*[0-9].png $(BASE).png
		montage -verbose -background transparent -tile 1x -geometry x600+20+20 \
			$(BASE)-*[0-9].png $(BASE)-onecolumn.png

once \
$(BASE).pdf: 	$(BASE).tex $(DEPS)
		$(LATEX) $<
		while grep -q "Warning:.*Rerun" $(BASE).log; do $(LATEX) $<; done

# Convert schematics into series of JPEGs.

figs/%-1.jpg: eagle/%.pdf
	pdftoppm -r 300 $^ figs/$(notdir $(basename $^))
	for a in figs/$(notdir $(basename $^))-*.ppm; do \
		convert -quality 95 -verbose $$a `echo $$a | sed 's/ppm/jpg/'`; \
		rm $$a; \
	done

$(GEN)/%-bom-parts.tex $(GEN)/%-bom-values.tex: $(EAGLE)/%.bomp $(EAGLE)/%.bomv $(BOM2TEX)
	( cd $(GEN); $(BOM2TEX) $^ )

# End of file.
