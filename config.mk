VERSION=$(shell cat ../VERSION)
# Make sure to use an absolute path for DESTDIR, otherwise the gpio executables 
# will not compile
DESTDIR=/usr/
PREFIX=/local

#DEBUG	= -g -O0
#OPT	= $(DEBUG)
OPT	= -O2
CC	= gcc

