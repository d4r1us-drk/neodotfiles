PREFIX ?= /usr/local
CC ?= cc

output: dwmblocks.c
	${CC} `pkg-config --cflags x11 --libs x11` dwmblocks.c -o dwmblocks
clean:
	rm -fv *.o *.gch dwmblocks
install: output
	mkdir -pv $(DESTDIR)$(PREFIX)/bin
	install -m 0755 dwmblocks $(DESTDIR)$(PREFIX)/bin/dwmblocks
uninstall:
	rm -fv $(DESTDIR)$(PREFIX)/bin/dwmblocks
