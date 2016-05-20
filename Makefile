cflags = $(CPPFLAGS) $(CFLAGS) -std=c99 -fPIC $(shell pkg-config --cflags gtk+-3.0)
ldflags = $(LDFLAGS) $(shell pkg-config --libs gtk+-3.0)

all: gitest Dummy-1.0.typelib

clean:
	$(RM) *.o *.so gitest Dummy-1.0.gir Dummy-1.0.typelib

gitest: main.o libdummy.so
	$(CC) $(cflags) -o $@ main.o $(ldflags) -L. -ldummy

main.o: main.c
	$(CC) -c $(cflags) -o $@ main.c

libdummy.so: dummyobject.o
	$(CC) -shared $(cflags) -o $@ dummyobject.o $(ldflags)

dummyobject.o: dummyobject.c
	$(CC) -c $(cflags) -o $@ dummyobject.c

Dummy-1.0.gir: dummyobject.c dummyobject.h
	g-ir-scanner --warn-all --namespace=Dummy --nsversion=1.0 \
		--library-path=. --library=dummy \
		--cflags-begin $(shell pkg-config --cflags gtk+-3.0) --cflags-end \
		-o $@ dummyobject.c dummyobject.h

Dummy-1.0.typelib: Dummy-1.0.gir
	g-ir-compiler -o $@ Dummy-1.0.gir

.PHONY: all clean
