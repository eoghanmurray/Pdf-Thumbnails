INFILES = $(shell find . -name '*.pdf')
OUTFILES = $(addsuffix .jpg, $(basename $(INFILES)))

default: $(OUTFILES)

%.jpg : %.pdf
	convert -thumbnail 200x $< $@

clean:
	rm -f $(OUTFILES)
