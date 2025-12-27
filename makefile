VERSION := $(shell git describe --tags --always --dirty)
# TODO: dont hardcode
VERSION := v1.0.1

pdf tex: _pre
	pandoc --defaults defaults/latex.yaml \
	       --metadata version="$(VERSION)" \
	       -o build/document_"$(VERSION).$@"

readme: _pre
	pandoc --defaults defaults/readme.yaml \
	       --metadata version="$(VERSION)"

_pre:
	mkdir -p build/

clean:
	rm --dir build/{*.{pdf,tex},} 2> /dev/null || true
