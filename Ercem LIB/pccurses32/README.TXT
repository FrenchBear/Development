               PCCURSES v.1.3 Release Notes - 881005
	===================================================

  This is the release note for the fourth version of PCcurses, v.1.3.
Below this note, the release notes for v.1.0, v.1.1 and v.1.2 are in-
cluded. Read those first.

  The file 'border.c' is now included. It allows you to explicitely speci-
fy what characters should be used as box borders when the box() functions
are called. If the new border characters are non-0, they override the bor-
der characters specified in the box() call. In my understanding, this func-
tionality is required for AT&T UNNIX sV.3 compatibility. Thanks for this
goes to Tony L. Hansen (hansen@pegasus.UUCP) for posting an article about
it on UseNet (newsgrou comp.unix.questions; the posting was not related at
all to PCcurses).

  The only other difference between v.1.2 and v.1.3 is that the latter has
been changed to avoid warning diagnostics if the source files are compiled
with warning switches on (for MicroSoft this means '-W3', for Turbo'C' it
means '-w -w-pro'). Of these, the Turbo'C' warning check is clearly to be
used rather than MicroSoft, even if neither of them comes even close to a
real UNIX 'lint'. Some of the warnings in fact indicated real bugs, mostly
functions that did not return correct return values or types.

  The makefiles for both MSC and TRC have been modified to produce warning
messages as part of normal compilation.




               PCCURSES v.1.2 Release Notes - 881002
	===================================================

  This is the release note for the third version of PCcurses, v.1.2.
Below this note, the release notes for v.1.0 and v.1.1 are included. Read
those first.

  The changes from v.1.1 to v.1.2 are minor. The biggest change is that there
was a bug related to limiting the cursor movement if the application tried to
move it outside the screen (something that should not be done anyway). Such
erronous application behaviour is now handled correctly.

  All modules have been changed to have a revison string in them, which makes
it easier to determine what version is linked into a program (or what library
version you have).

  There is now a 'cursesio.c' file. That file does the same as 'cursesio.asm'
(i.e. it provides the interface to the lower-level system I/O routines). It
is written in 'C' and thus it is (possibly) more portable than the assembler
version (but still not so portable since it uses 8086 INT XX calls directly).
When one creates new curses libraries, one chooses whether to use the assem-
bler or the 'C' version of cursesio. The choice is made by commenting out the
appropriate dependencies for cursesio.obj, near the end of the makefiles.

  There is now a 'setmode.c' file. That file contains functions that save and
restore terminal modes. They do it into other variables than do savetty() and
resetty(), so one should probably use either savetty()/resetty() or the new
functions only - and not mix the both ways unless one really knows what one
does.

  Diff lists vs v.1.0 are no longer included in the distribution. The make
utility still is. PCcurses v.1.2 still compiles with MicroSoft 'C' v.4.0,
and with Borland Turbo 'C' v.1.0. There is as far as I know no reason to be-
lieve that it does not compile under MicroSoft 'C' v.3.0 and 5.x, or Turbo-
'C' v.1.5, but this has not been tested.

  There are two makefile's included, one for MicroSoft 'C', one for Turbo-'C'.
They are both copies of my personal makefile's, and as such they reflect the
directory structure on my own computer. This will have to be changed before
you run make. Check $(INCDIR) and $(LIBDIR) in particular, and make the choice
of ASM or 'C' cursesio version as mentioned above (the distribution version
uses the 'C version of cursesio).

  The manual file (curses.man) has been changed at appropriate places.

  I would like to thank the following persons for their help:

  	Brandon S. Allbery (alberry@ncoast.UUCP)
		for running comp.binaries.ibm.pc (at that time)
		and comp.source.misc.

	Steve Balogh (Steve@cit5.cit.oz.AU)
  		for writing a set of manual pages and posting
		them to the net.

	Torbjorn Lindh
		for finding bugs and suggesting raw
		character output routines.

	Nathan Glasser (nathan@eddie.mit.edu)
  		for finding and reporting bugs.

	Ingvar Olafsson (...enea!hafro!ingvar)
  		for finding and reporting bugs.

	Eric Rosco (...enea!ipmoea!ericr)
  		for finding and reporting bugs.

	Steve Creps (creps@silver.bacs.indiana.edu)
  		for doing a lot of work - among others
		posting bug fixes to the net, and writing
		the new cursesio.c module.

	N. Dean Pentcheff (dean@violet.berkeley.edu)
  		for finding bugs and rewriting cursesio.asm
		for Turbo 'C' 1.5.

  Finally, Jeff Dean (parcvax,hplabs}!cdp!jeff)
  		     (jeff@ads.arpa)
	has had a shareware version of curses deliverable since
	about half a year before I released PCcurses 1.0 on Use-
	Net. He is very concerned about confusion between the two
	packages, and therefore any references on the network
	should make clear whether they reference Dean's PCcurses
	or Larsson's PCcurses.

               PCCURSES v.1.1 Release Notes - 880306
	===================================================

  This is the release note for the second version of PCcurses, v.1.1.
Below this note, the release note for v.1.0 is included. Read that first.
The changes from v.1.0 to v.1.1 are minor. There are a few bug fixes, and
new (non-portable) functions for verbatim IBM character font display have
been added (in charadd.c and charins.c). The manual file (curses.man) has
been changed at appropriate places.

  In the file v10tov11.dif there are listings of the differencies between
version 1.0 and 1.1. The diff listings are in UNIX diff(1) format.

  Version 1.1 compiles with Turbo 'C' v.1.0, as well as MicroSoft 'C' v.3.0
and v.4.0. On the release disk there is a make.exe utility which is very simi-
lar to UNIX make (If the package was mailed to you, the make utility will be
in uuencoded format - in make.uu - and must be uudecoded first). It is much
more powerful than MicroSoft's different MAKE'S; the latter ones will NOT ge-
nerate libraries properly if used with the PCcurses makefiles.

  There are three makefiles:

	makefile		generic MSC 3.0 makefile
	makefile.ms		MSC 4.0 makefile
	makefile.tc		Turbo 'C' 1.0 makefile

  To make a library with for example Turbo 'C', make directories to hold .H
and .LIB files (these directories are the 'standard places'), edit makefile.tc
for this, and type

	make -f makefile.tc all

and libraries for all memory models will be created in the .LIB directory,
while the include files will end up in the .H directory. Also read what is
said about installation below!




               PCCURSES v.1.0 Release Notes - 870824
	===================================================



  This is the release notes for the PCcurses v.1.0 cursor/window control
package. PCcurses offers the functionality of UNIX curses, plus some
extras. Normally it should be possible to port curses-based programs from
UNIX curses to PCcurses on the IBM PC without changes. PCcurses is a port/
rewrite of Pavel Curtis' public domain 'ncurses' package. All the code has
been re-written - it is not just an edit of ncurses (or UNIX curses). I
mention this to clarify any copyright violation claims. The data struc-
tures and ideas are very similar to ncurses. As for UNIX curses, I have
not even seen any sources for it.

 For an introduction to the use of 'curses' and it's derivatives, you
should read 'Screen Updating and Cursor Movement Optimization: A Library
Package' by Kenneth C. R. C. Arnold, which describes the original Berkely
UNIX version of curses. It is available as part of the UNIX manuals. The
other source of information is 'The Ncurses Reference Manual' by Pavel
Curtis. The latter is part of Curtis' ncurses package.

  The only other documentation provided is a 'man' page which describes
all the included functions in a very terse way. In the sources, each
function is preceded by a rather thourough description of what the
function does. I didn't have time to write a nice manual/tutorial - sorry.

  PCcurses is released as a number of source files, a man page, and a make
file. A uuencoded copy of a 'make' utility, and a manpage for the 'make' is
also provided to make it easier to put together PCcurses libraries. Even if
you are not interested in PCcurses, it may be worthwhile to grab the make.

  The makefile assumes the presence of the MicroSoft 'C' compiler (3.0 or
4.0), MicroSoft MASM and LIB, plus some MS-DOS utilities. The reason for
supplying MAKE.EXE is that the MicroSoft 'MAKE:s' are much inferior to a
real UNIX make. The supplied make is a port of a public domain make, pub-
lished on UseNet. It is almost completely compatible with UNIX make. When
generating the curses libraries, the makefile will direct make to do some
directory creating and file copying, and then re-invoke itself with new
targets. The workings of the makefile are not absolutely crystal clear at
first sight... just start it and see what it does.

  For portability, the curses libraries depend on one assembler file for
access to the BIOS routines. There is no support for the EGA, but both
CGA, MGA, and the HGA can be used. The libraries are originally for Micro-
Soft 'C', but all C modules should be portable right away. In the assembler
file, segment names probably need to be changed, and possibly the parameter
passing scheme. I think Turbo C will work right away - as far as I under-
stand, all it's conventions are compatible with MicroSoft C.

  There are some parts left out between ncurses and PCcurses. One is the
support for multiple terminals - not very interesting on a PC anyway. Be-
cause we KNOW what terminal we have, there is no need for a termcap or
termio library. PCcurses also has some things that neither curses nor
ncurses have. Compared to the original UNIX curses, PCcurses has lots
of extras.

  The BIOS routines are used directly, which gives fast screen updates.
PCcurses does not do direct writes to screen RAM - in my opinion it is
a bit ugly to rely that much on hardware compatibility. Anyone could fix
that, of course...

  One of the more serious problems with PCcurses is the way in which nor-
mal, cbreak, and raw input modes are done. All those details are in the
'charget' module - I do raw I/O via the BIOS, and perform any buffering
myself. If an application program uses PCcurses, it should do ALL it's
I/O via PCcurses calls, otherwise the mix of normal and PCcurses I/O may
mess up the display. I think my code is reasonable... comments are welcome,
provided you express them nicely...

  To install, copy all files to a work directory, edit 'makefile' to define
the standard include and library file directory names of your choice (these
directories must exist already, and their path names must be relative to the
root directory, not to the current one). You must also run uudecode on
make.uu, to generate MAKE.EXE. You can do that on your PC, if you have
uudecode there, otherwise you can do it under UNIX and do a binary transfer
to the PC. When you have MAKE.EXE in your work directory (or in your /bin
directory), type make.

  Make will now create 4 sub-directories (one for each memory model), copy
some assembler include files into them, copy two include files to your
include directory, CHDIR to each sub-directory and re-invoke itself with
other make targets to compile and assemble all the source files into the
appropriate directories. Then the library manager is run to create the
library files in your desired library directory. Presto!

  If you only want to generate a library for one memory model, type 'make
small', 'make large', etc. The name of the memory model must be in lower
case, like in the makefile.

  I think the package is fairly well debugged - but then again, that's
what I always think. It was completed in May-87, and no problems found
yet. Now it's your turn... Comments, suggestions and bug reports and
fixes (no flames please) to

Bjorn Larsson
INFOVOX AB
Box 2503				(...seismo!mcvax!enea!infovax!bl)
S-171 02 Solna
SWEDEN
