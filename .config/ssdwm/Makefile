include config.mk

SRC=drw.c ssdwm.c util.c
OBJ=${SRC:.c=.o}

all: ${OBJ}
	${CC} -o ssdwm ${OBJ} ${LDFLAGS}

.c.o:
	${CC} -c ${CFLAGS} $<

${OBJ}: config.h config.mk

config.h:
	cp config.def.h $@

clean:
	rm -f ssdwm ${OBJ} ssdwm-${VERSION}.tar.gz

dist: clean
	mkdir -p ssdwm-${VERSION}
	cp -R LICENSE Makefile README config.def.h config.mk\
		ssdwm.1 drw.h util.h ${SRC} ssdwm-${VERSION}
	tar -cf ssdwm-${VERSION}.tar ssdwm-${VERSION}
	gzip ssdwm-${VERSION}.tar
	rm -rf ssdwm-${VERSION}

install: all
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp -f ssdwm ${DESTDIR}${PREFIX}/bin
	chmod 755 ${DESTDIR}${PREFIX}/bin/ssdwm
	mkdir -p ${DESTDIR}${MANPREFIX}/man1
	sed "s/VERSION/${VERSION}/g" < ssdwm.1 > ${DESTDIR}${MANPREFIX}/man1/ssdwm.1
	chmod 644 ${DESTDIR}${MANPREFIX}/man1/ssdwm.1

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/ssdwm\
		${DESTDIR}${MANPREFIX}/man1/ssdwm.1

.PHONY: all clean dist install uninstall
