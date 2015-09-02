FONT_FOLDER := ~/.fonts/

install-font:
	@if [ ! -f $(FONT_FOLDER)Hack-Regular.ttf ] ; \
	then \
		mkdir -p $(FONT_FOLDER); \
		wget https://github.com/chrissimpkins/Hack/releases/download/v2.010/Hack-v2_010-ttf.zip -O $(FONT_FOLDER)temp.zip; \
		unzip $(FONT_FOLDER)temp.zip -d $(FONT_FOLDER); \
		rm $(FONT_FOLDER)temp.zip; \
	else \
		echo "Font already installed"; \
	fi;

install-cask:
	curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python

cask:
	../.cask/bin/cask

install:
	install-font
	install-cask
	cask

.PHONY:	install-font \
	install-cask \
	cask \
	install
