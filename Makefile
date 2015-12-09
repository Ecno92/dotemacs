FONT_FOLDER := ~/.fonts/
HACK_FONT_URL := https://github.com/chrissimpkins/Hack/releases/download/v2.010/Hack-v2_010-otf.zip

# Install EMACS from source.
# Ubuntu 14.04 does not come with the newest Emacs version.
# This causes issues with some of my Cask dependencies.
# This command allows you to install a newer version of EMACS from source.
EMACS_VERSION := emacs-24.5
EMACS_COMPRESSION_EXTENSION := .tar.gz
EMACS_DOWNLOAD_URL_BASE := https://ftp.gnu.org/gnu/emacs/
EMACS_BUILD_DIR := /tmp/EMACS
install-emacs-from-source:
	echo "Starting to install "$(EMACS_VERSION)" from source"
	echo "First uninstall your old version if applicable."
	sudo apt-get remove emacs
	echo "Now we need to install some dependencies for building"
	sudo apt-get install build-essential checkinstall
	sudo apt-get build-dep emacs24
	echo "Creating a temporary building directory"
	mkdir -p $(EMACS_BUILD_DIR)
	echo "Downloading source files and extracting them"
	curl $(EMACS_DOWNLOAD_URL_BASE)$(EMACS_VERSION)$(EMACS_COMPRESSION_EXTENSION) | tar xvz -C $(EMACS_BUILD_DIR)
	echo "Moving into the exracted directory and start with compiling and installing EMACS!"
	cd $(EMACS_BUILD_DIR)/$(EMACS_VERSION) && \
	./configure && \
	make && \
	sudo checkinstall && \
	echo "Finished installing "$(EMACS_VERSION)" from source."

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
	sudo apt-get install gettext-el -y
	make install-font
	make install-cask
	make cask

.PHONY:	install-emacs-from-source \
	install-font \
	install-cask \
	cask \
	install
