VERSION := $(shell git describe --tags --always --dirty)

readme: _pre
	pandoc --defaults defaults/readme.yaml \
	       --metadata version="$(VERSION)"

latex: tex
pdf tex: _pre
	pandoc --defaults defaults/latex.yaml \
	       --metadata version="$(VERSION)" \
	       --output build/document_"$(VERSION).$@"

_pre:
	mkdir -p build

clean:
	rm --force --dir build/{*.{pdf,tex},}
