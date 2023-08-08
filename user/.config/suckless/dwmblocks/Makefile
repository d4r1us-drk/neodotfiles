PREFIX ?= /usr/local
CC ?= cc

output: dwmblocks.c blocks.h
	${CC} -c dwmblocks.c -o dwmblocks.o
	${CC} -o dwmblocks dwmblocks.o `pkg-config --cflags x11 --libs x11`
clean:
	rm -fv *.o *.gch dwmblocks
install: output
	mkdir -pv $(DESTDIR)$(PREFIX)/bin
	install -m 0755 dwmblocks $(DESTDIR)$(PREFIX)/bin/dwmblocks
uninstall:
	rm -fv $(DESTDIR)$(PREFIX)/bin/dwmblocks
