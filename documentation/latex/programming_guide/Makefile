BASE = cft-programming-guide
LATEX = xelatex -shell-escape
VIEWER = okular
DEPS = instrtable.tex

.PHONY:		all clean veryclean view upload raster
all: $(BASE).pdf

clean:
	rm -f $(BASE).aux $(BASE).log $(BASE)*.png $(BASE)*.pnm $(BASE).out $(BASE).pdf $(BASE)-fig[0-9]*.*

veryclean: clean
	rm -f $(BASE).pdf $(BASE).dvi

view: $(BASE).pdf
	$(VIEWER) $< &

upload: $(BASE).pdf
	scp -C $(BASE).pdf alexios@graviera:bedroomlan/files/hardware/cft/documentation/

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

# End of file.
