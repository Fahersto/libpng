# makefile for libpng
# Copyright (C) 1995 Guy Eric Schalnat, Group 42, Inc.
# For conditions of distribution and use, see copyright notice in png.h

# Where the zlib library and include files are located
#ZLIBLIB=/usr/local/lib
#ZLIBINC=/usr/local/include
ZLIBLIB=../zlib
ZLIBINC=../zlib

CC=cc
CFLAGS=-I$(ZLIBINC) -O # -g -DPNG_DEBUG=1
LDFLAGS=-L. -L$(ZLIBLIB) -lpng -lz -lm

#RANLIB=echo
RANLIB=ranlib

# where make install puts libpng.a and png.h
prefix=/usr/local

OBJS = png.o pngset.o pngget.o pngrutil.o pngtrans.o pngwutil.o \
	pngread.o pngrio.o pngwio.o pngwrite.o pngrtran.o \
	pngwtran.o pngmem.o pngerror.o pngpread.o

all: libpng.a pngtest

libpng.a: $(OBJS)
	ar rc $@  $(OBJS)
	$(RANLIB) $@

pngtest: pngtest.o libpng.a
	$(CC) -o pngtest $(CCFLAGS) pngtest.o $(LDFLAGS)

test: pngtest
	./pngtest

install: libpng.a
	-@mkdir $(prefix)/include
	-@mkdir $(prefix)/lib
	cp png.h $(prefix)/include
	cp pngconf.h $(prefix)/include
	chmod 644 $(prefix)/include/png.h
	chmod 644 $(prefix)/include/pngconf.h
	cp libpng.a $(prefix)/lib
	chmod 644 $(prefix)/lib/libpng.a

clean:
	rm -f *.o libpng.a pngtest pngout.png

# DO NOT DELETE THIS LINE -- make depend depends on it.

png.o: png.h pngconf.h
pngerror.o: png.h pngconf.h
pngrio.o: png.h pngconf.h
pngwio.o: png.h pngconf.h
pngmem.o: png.h pngconf.h
pngset.o: png.h pngconf.h
pngget.o: png.h pngconf.h
pngread.o: png.h pngconf.h
pngrtran.o: png.h pngconf.h
pngrutil.o: png.h pngconf.h
pngtest.o: png.h pngconf.h
pngtrans.o: png.h pngconf.h
pngwrite.o: png.h pngconf.h
pngwtran.o: png.h pngconf.h
pngwutil.o: png.h pngconf.h
pngpread.o: png.h pngconf.h

