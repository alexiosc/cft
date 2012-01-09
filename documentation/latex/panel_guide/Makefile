#!/usr/bin/makefile

BASE = cft-panel-guide
LATEX = xelatex -shell-escape
VIEWER = okular
GEN = ../generated
EAGLE = ../eagle
DEPS = figs/front-panel-1.jpg \
	../../panel/front-panel-v2-small.jpg \
	figs/front-panel-v2-terse-small.jpg \
	$(GEN)/front-panel-bom-parts.tex \
	$(GEN)/front-panel-bom-values.tex
SCRIPTS = ../scripts
BOM2TEX = $(SCRIPTS)/bom2tex.py

.PHONY:		all clean veryclean view upload raster
all: $(BASE).pdf $(DEPS)

clean:
	rm -f $(BASE).aux $(BASE).log $(BASE)*.png $(BASE)*.pnm $(BASE).out $(BASE).pdf $(BASE)-fig[0-9]*.*

veryclean: clean
	rm -f $(BASE).pdf $(BASE).dvi

view: $(BASE).pdf
	$(VIEWER) $< &

upload: $(BASE).pdf
	rsync -z --progress --partial $(BASE).pdf alexios@graviera:bedroomlan/files/hardware/cft/documentation/

raster: $(BASE).pdf
	pdftoppm -r 300 $(BASE).pdf $(BASE)
	for a in $(BASE)*ppm; do \
		convert -verbose $$a `echo $$a | sed 's/ppm/png/'`; \
		rm $$a; \
	done
	montage -verbose -background 'grey18' -tile 2x -geometry x1600+100+100 $(BASE)-*[0-9].png $(BASE).png
	montage -verbose -background transparent -tile 1x -geometry x600+20+20 $(BASE)-*[0-9].png $(BASE)-onecolumn.png

once \
$(BASE).pdf: $(BASE).tex $(DEPS)
	$(LATEX) $<

figs/front-panel-1.jpg: eagle/front-panel.pdf
	pdftoppm -r 300 $^ figs/front-panel
	for a in figs/front-panel-*.ppm; do \
		convert -quality 95 -verbose $$a `echo $$a | sed 's/ppm/jpg/'`; \
		rm $$a; \
	done

$(GEN)/%-bom-parts.tex $(GEN)/%-bom-values.tex: $(EAGLE)/%.bomp $(EAGLE)/%.bomv $(BOM2TEX)
	( cd $(GEN); $(BOM2TEX) $^ )

# End of file.
