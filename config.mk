# cdc version
VERSION = 2024-08-30

#compiler
CC ?= gcc

# prefixes
PREFIX = /usr/local
MANPREFIX = $(PREFIX)/share/man

PKG_CONFIG = pkg-config

# headers/libs
INCS = -Iinclude/
LIBS = 
DEPS =

# flags
CFLAGS += -Wall -Wextra -Wno-unused -O3 -g -std=c11

CFLAGS += $(foreach dep, $(DEPS), $(shell pkg-config --cflags $(dep)))
LDFLAGS += $(foreach dep, $(DEPS), $(shell pkg-config --libs $(dep)))

W2_CPPFLAGS = -DVERSION=\"$(VERSION)\"
W2_CFLAGS = $(INCS) $(W2_CPPFLAGS) $(CPPFLAGS) $(CFLAGS)
W2_LDFLAGS = $(LIBS) $(LDFLAGS)
