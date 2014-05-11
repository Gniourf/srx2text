INSTALL_DIR:=/usr/local/bin
FILES_TO_INSTALL:=query-sparql srx2text

help:
	@-echo "make install to install to $(INSTALL_DIR)"

install:
	mkdir -pv $(INSTALL_DIR)
	cp -v $(FILES_TO_INSTALL) $(INSTALL_DIR)

