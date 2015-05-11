#
# Makefile:
#	The gpio command:
#	  A swiss-army knige of GPIO shenanigans.
#	https://projects.drogon.net/wiring-pi
#
#	Copyright (c) 2012-2015 Gordon Henderson
#################################################################################
# This file is part of wiringPi:
#	Wiring Compatable library for the Raspberry Pi
#
#    wiringPi is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Lesser General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    wiringPi is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Lesser General Public License for more details.
#
#    You should have received a copy of the GNU Lesser General Public License
#    along with wiringPi.  If not, see <http://www.gnu.org/licenses/>.
#################################################################################

include ../config.mk

INCLUDE	= -I$(DESTDIR)$(PREFIX)/include -I../wiringPi/ -I../devLib/
CFLAGS	= $(DEBUG) -Wall $(INCLUDE) -Winline -pipe

LDFLAGS	= -L$(DESTDIR)$(PREFIX)/lib -L$(DESTDIR)/lib
LIBS    = -lwiringPi -lwiringPiDev -lpthread -lm

# May not need to  alter anything below this line
###############################################################################

SRC	=	gpio.c readall.c pins.c

OBJ	=	$(SRC:.c=.o)

all:		gpio

version.h:	../VERSION
	./newVersion

gpio:	$(OBJ)
	@echo [Link]
	echo "$(CC) -o $@ $(OBJ) $(LDFLAGS) $(LIBS)"
	@$(CC) -o $@ $(OBJ) $(LDFLAGS) $(LIBS)
	
.c.o:
	@echo [Compile] $<
	@$(CC) -c $(CFLAGS) $< -o $@

.PHONY:	clean
clean:
	@echo "[Clean]"
	@rm -f $(OBJ) gpio *~ core tags *.bak

.PHONY:	tags
tags:	$(SRC)
	@echo [ctags]
	@ctags $(SRC)

.PHONY:	install
install: gpio
	@echo "[Install]"
	@mkdir -p		$(DESTDIR)$(PREFIX)/bin
	@cp gpio		$(DESTDIR)$(PREFIX)/bin
	@chmod 4755		$(DESTDIR)$(PREFIX)/bin/gpio
	@mkdir -p		$(DESTDIR)$(PREFIX)/man/man1
	@cp gpio.1		$(DESTDIR)$(PREFIX)/man/man1

.PHONY:	install-deb
install-deb:	gpio
	@echo "[Install: deb]"
	@install -m 0755 -d							~/wiringPi/debian/wiringPi/usr/bin
	@install -m 0755 gpio							~/wiringPi/debian/wiringPi/usr/bin

.PHONY:	uninstall
uninstall:
	@echo "[UnInstall]"
	@rm -f $(DESTDIR)$(PREFIX)/bin/gpio
	@rm -f $(DESTDIR)$(PREFIX)/man/man1/gpio.1

.PHONY:	depend
depend:
	makedepend -Y $(SRC)

# DO NOT DELETE
