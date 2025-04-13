# w2

include config.mk

BIN = build/w2

SRC = $(wildcard src/*.c)
OBJ = $(patsubst src/%.c, build/%.c.o, $(SRC))

all: build/w2

setup:
	@mkdir -p build/

build/%.c.o: src/%.c setup
	$(CC) $(W2_CFLAGS) -c $< -o $@

build/w2: $(OBJ)
	$(CC) -o $@ $(OBJ) $(W2_LDFLAGS)

clean:
	rm -rf build/

install: w2
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f build/w2 $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/w2
	mkdir -p $(DESTDIR)$(MANPREFIX)/man1
	sed "s/VERSION/$(VERSION)/g" < w2.1 > $(DESTDIR)$(MANPREFIX)/man1/w2.1
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/w2.1

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/w2
	rm -f $(DESTDIR)$(MANPREFIX)/man1/w2.1

.PHONY: all clean install uninstall
