# Copyright (c) 2015-2019, Ulf Magnusson
# SPDX-License-Identifier: ISC

ifeq ($(origin CC), default)
  CC = gcc
endif

CFLAGS ?= -g
override CFLAGS += -I/usr/local/opt/readline/include \
                   $(shell pkg-config --cflags ncursesw) \
                   -std=gnu11 \
                   -Wall \
                   -Wextra \
                   -Wmissing-declarations \
                   -Wno-sign-compare \
                   -Wno-unused-parameter \
                   -Wredundant-decls \
                   -Wstrict-prototypes

override LDLIBS += -lreadline \
                   $(shell pkg-config --libs-only-l ncursesw)

override LDFLAGS += -L/usr/local/opt/readline/lib \
                    $(shell pkg-config --libs-only-L --libs-only-other ncursesw)

rlncurses: rlncurses.c

.PHONY: clean
clean:
	$(RM) rlncurses
