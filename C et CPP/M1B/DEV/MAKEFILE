
#
# m1b - ‚mulation de m1binal
# PV. 22.VII.89
#

.c.obj:
	cl -J -W3 -Ox -c $*.c

m1b.exe:  m1b.obj proto.obj comm.obj clavier.obj ecran.obj
	  link $**;

m1b.obj: m1b.c

proto.obj: proto.c

comm.obj: comm.c

clavier.obj: clavier.c

ecran.obj: ecran.c
