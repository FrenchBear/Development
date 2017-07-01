# Makefile for GNU tar on MS-DOS.
# Copyright (C) 1991 Free Software Foundation, Inc.

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2, or (at your option)
# any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

CC = cl -nologo
RM = del

DEFS = -D__STDC__=1 -DNONAMES -DNO_REMOTE -DSTDC_HEADERS=1 -D__MSDOS__ -DNO_REMOTE -DHAVE_VPRINTF -DHAVE_STRSTR -DHAVE_MKDIR -DHAVE_RENAME -DHAVE_GETCWD
LIBS =

CFLAGS = $(DEFS)
LDFLAGS = 

OBJ1 =	tar.obj create.obj extract.obj buffer.obj getoldopt.obj update.obj gnu.obj mangle.obj
OBJ2 =	version.obj list.obj names.obj diffarch.obj port.obj fnmatch.obj getopt.obj
OBJ3 =  getopt1.obj regex.obj getdate.obj alloca.obj msd_dir.obj
OBJS =	$(OBJ1) $(OBJ2) $(OBJ3)

all:	tar

tar:	testpad.h getdate.c $(OBJS)
	$(RM) testpad.obj
        $(CC) $(LDFLAGS) $(OBJS) $(LIBS) -o tar

#diffarch.obj: diffarch.c
#        $(CC) -c $(CFLAGS) -E diffarch.c >f1

.c.obj:
	$(CC) -c $(CFLAGS) $<

testpad.h: testpad.exe
	testpad

testpad.exe: testpad.c
        $(CC) $(LDFLAGS) -o testpad testpad.c $(LIBS)

clean:
	$(RM) errs *.obj tar testpad testpad.h

mostlyclean: clean

distclean: clean

realclean: clean
