install-cask:
	curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python

cask:
	../.cask/bin/cask

install:
	install-cask
	cask

.PHONY: install-cask \
	cask \
	install
