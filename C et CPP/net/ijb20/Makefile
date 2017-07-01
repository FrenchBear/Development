# Internet Junkbuster makefile

# comment out the next line if you do NOT want to use regular expressions
REGEX = -DREGEX

DEFAULT_CFLAGS = -I. $(REGEX) -DSTDC_HEADERS -DHAVE_STRING

PROG   = junkbuster
O      = o
RM     = rm -f
MORE_CFLAGS = -g

# use this for Solaris 2.x
#LDFLAGS = -lnsl -lsocket 

# use these for SunOS 4.x
#LDFLAGS = -nsl
#MORE_CFLAGS = -g -DNOSTRERROR

# use this for HPUX 10.01
# you may get pointer assignment warnings
#MORE_CFLAGS = -Ae -g $(MORE_CFLAGS)

# use these with OS/2 EMX (tested with EMX 0.9c)
#CC        = gcc
#MOREFLAGS = -DOS2
#LDFLAGS   = -lsocket -Zexe -s
#RM        = del
#PROG      = junkbstr         # uncomment if you don't use HPFS

# use this for BSD/OS 3.0
#CC=shlicc2

# use these for mingw32
#PROG        = junkbstr.exe
#MORE_CFLAGS = -DWin32_Winsock -O3
#LDFLAGS     = -lwsock32

# use these for Win32
#PROG     = junkbstr.exe
#MORE_CFLAGS = /nologo -MT -Og
#LDFLAGS = wsock32.lib
#O       = obj
#RM      = del

# use these for BeOS
#MORE_CFLAGS = -relax_pointers
#LDFLAGS = -map junkbuster.xMAP

CFLAGS  = $(DEFAULT_CFLAGS) $(MORE_CFLAGS)

OBJS =	jcc.$(O) parsers.$(O) filters.$(O) loaders.$(O) bind.$(O) conn.$(O) \
	encode.$(O) ssplit.$(O) socks4.$(O) acl.$(O) gnu_regex.$(O) win32.$(O)

$(PROG): $(OBJS)
	$(CC) $(CFLAGS) -o $(PROG) $(OBJS) $(LDFLAGS)

clean:
	$(RM) a.out core *.o *.obj

clobber: clean
	$(RM) junkbuster junkbuster.xMAP junkbstr.exe *.pdb *.lib *.exp

# $Id: Makefile,v 3.21 1998/10/31 01:31:23 ACJC Exp $
# Written and copyright 1997-8 Anonymous Coders and Junkbusters Corporation.
# Distributed under the GNU General Public License; see the README file.
# This code comes with NO WARRANTY. http://www.junkbusters.com/ht/en/gpl.html
