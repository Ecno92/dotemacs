FONT_FOLDER := ~/.fonts/
HACK_FONT_URL := https://github.com/chrissimpkins/Hack/releases/download/v2.010/Hack-v2_010-otf.zip

custom.el:
	touch custom.el

install-font:
	@if [ ! -f $(FONT_FOLDER)Hack-Regular.otf ] ; \
	then \
		mkdir -p $(FONT_FOLDER); \
		wget $(HACK_FONT_URL) -O $(FONT_FOLDER)temp.zip; \
		unzip $(FONT_FOLDER)temp.zip -d $(FONT_FOLDER); \
		rm $(FONT_FOLDER)temp.zip; \
	else \
		echo "Font already installed"; \
	fi;

install-cask:
	@if [ ! -d ../.cask ] ; \
	then \
		curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python; \
	else \
		echo "Cask already installed. Remove cask manually if you want to do a reinstall."; \
	fi;

cask:
	../.cask/bin/cask

install: custom.el
	make install-font
	make install-cask
	make cask

.PHONY:	install-font \
	install-cask \
	cask \
	install
