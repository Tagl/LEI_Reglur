VERSION := $(shell git describe --tags --always --dirty)
VERSION := v1.0.1

pdf: _metadata
	pandoc --defaults defaults/latex.yaml \
	       --metadata version="$(VERSION)" \
	       -o build/document_$(VERSION).pdf

tex: _metadata
	pandoc --defaults defaults/latex.yaml \
	       --metadata version="$(VERSION)" \
	       -o build/document_$(VERSION).tex

readme: _metadata
	pandoc --defaults defaults/readme.yaml \
	       --metadata version="$(VERSION)"

clean:
	rm build/metadata.yaml
	rm build/*.pdf
	rm build/*.tex
	rmdir build

_metadata:
	mkdir -p build
	pandoc --defaults defaults/metadata.yaml \
	       --metadata version="$(VERSION)"
