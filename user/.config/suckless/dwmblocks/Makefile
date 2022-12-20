PREFIX ?= /usr/local
CC ?= cc

output: dwmblocks.c blocks.def.h blocks.h
	${CC} `pkg-config --cflags x11 --libs x11` dwmblocks.c -o dwmblocks
blocks.h:
	cp -v blocks.def.h $@
clean:
	rm -fv *.o *.gch dwmblocks
install: output
	mkdir -pv $(DESTDIR)$(PREFIX)/bin
	install -m 0755 dwmblocks $(DESTDIR)$(PREFIX)/bin/dwmblocks
uninstall:
	rm -fv $(DESTDIR)$(PREFIX)/bin/dwmblocks
