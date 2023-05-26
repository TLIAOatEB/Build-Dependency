prefix = /usr/local

build: out/libbd.a

out/bd.o: src/bd.c
	mkdir -p out
	cc -c src/bd.c -o out/bd.o

out/libbd.a: out/bd.o
	ar rcs out/libbd.a out/bd.o

test: test/test.c src/bd.h out/libbd.a
	cc test/test.c -Isrc -Lout -lbd -o out/test
	out/test

clean:
	-rm -fr out

install: src/bd.h out/libbd.a
	install -D src/bd.h \
		$(DESTDIR)$(prefix)/include/bd.h
	install -D out/libbd.a \
		$(DESTDIR)$(prefix)/lib/libbd.a

uninstall:
	-rm -f $(DESTDIR)$(prefix)/include/bd.h
	-rm -f $(DESTDIR)$(prefix)/lib/libbd.a
