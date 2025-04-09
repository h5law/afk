CARGO=cargo
TARGET=--bin afk
FEATUTES=--all-features
PROFILE=-r
INSTALL_PATH=/usr/local/bin

.PHONY: build install uninstall clean test all

build:
	$(CARGO) build $(TARGET) $(FEATUTES) $(PROFILE)

install: build
	cp $(CURDIR)/target/release/afk $(INSTALL_PATH)
	cp $(CURDIR)/afk.sh $(INSTALL_PATH)/afk-pomodoro

clean:
	$(CARGO) clean

uninstall: clean
	rm -f $(INSTALL_PATH)/{afk,afk-pomodoro}

test:
	$(CARGO) test

all: clean install
