/* comm.c
** 26/12/90     Version COM1 et COM2
** 20/05/92     MSC 7.0
*/

#include <stdio.h>
#include <string.h>

static FILE *ft;

#define SCRIPT
/*
#define FTRACE
*/

#include <conio.h>      /* inp, outp */
#include <dos.h>        /* _enable, _disable, _dos_setvect */

#include "m1b.h"

#include "proto.ref"
#include "comm.ref"



static struct
{ int com_adrbase;
  int com_interrupt;
  int com_masque8259;
} port_serie[2] =
{ { 0x3F8, 0x0c, 0x10 },
  { 0x2F8, 0x0b, 0x08 }
};

#define COM1 0
#define COM2 1

#define PIC8259  0x20
#define PIC_EOI  0x20

#define RBR 0           /* Receive Buffer Register */
#define THR 0           /* Transmit Holding Register */
#define IER 1           /* Interrupt Enable Register */
#define IIR 2           /* Interrupt Identification register */
#define LCR 3           /* Line Control Register */
#define MCR 4           /* Modem Control Register */
#define LSR 5           /* Line Status Register */
#define MSR 6           /* Modem Status Register */
#define DLL 0           /* Divisor Latch Low */
#define DLH 1           /* Divisor Latch High */

static int  port = COM2;
static int  com_adrbase;

#define TAILLEBUFFER  1024
static byte buffer[TAILLEBUFFER];
static int  zbuffer = 0;               /* pointeur de remplissage */
static int  ybuffer = 0;               /* pointeur d'extraction */

static void (interrupt far *old_it)();

static byte inpb(unsigned adr)
{
  return (byte)inp(adr);
}

static void outpb(unsigned adr, byte val)
{
  outp(adr, (int)val);
}

static void com_initvar(char *arg)
{
  if (stricmp(arg,"com1")==0) port = COM1;
  else if (stricmp(arg,"com2")==0) port = COM2;
  com_adrbase = port_serie[port].com_adrbase;
}

void far interrupt intcom()
{
  byte b;
  int newzbuffer;

  _disable();
  inpb(com_adrbase+IIR);        /* acquittement */
  b = inpb(com_adrbase+RBR);    /* lecture & acquittement 8250 */
  b &= 0x7f;                    /* minitel... */

  newzbuffer = (zbuffer+1)%TAILLEBUFFER;
  if (newzbuffer!=ybuffer)
  { buffer[zbuffer] = b;
    zbuffer = newzbuffer;
  }
  outpb(PIC8259+0, PIC_EOI);    /* acquittement 8259 */
  _enable();

}

void comE_init(char *arg)
{
#ifdef FTRACE
ft = fopen("trace","wb");
#endif
  com_initvar(arg);

  outpb(com_adrbase+LCR, 0x80); /* DLAB=1 */
  outpb(com_adrbase+DLL, 96);   /* 9600 bauds=12, 1200 bauds=96 */
  outpb(com_adrbase+DLH, 0);
/*outpb(com_adrbase+LCR, 3); */ /* 8 bits  1 stop  sans parit‚  DLAB=0 */
  outpb(com_adrbase+LCR, 0x1a); /* 7 bits  1 stop  parit‚ paire DLAB=0 */
  outpb(com_adrbase+MCR, 0x03); /* DTR RTS OUT2*/

  inpb(com_adrbase+LSR);        /* Effacer les conditions d'erreur */
  inpb(com_adrbase+IIR);        /* id */
  inpb(com_adrbase+MSR);

  old_it = _dos_getvect(port_serie[port].com_interrupt);
  _dos_setvect(port_serie[port].com_interrupt, intcom);

  outpb(com_adrbase+MCR, 0x0b); /* DTR RTS OUT2*/
  outpb(com_adrbase+IER, 1);    /* Enable Received Data Available Interrupt */
  outpb(PIC8259+1, (byte)(inpb(PIC8259+1)&~port_serie[port].com_masque8259));
  outpb(PIC8259+0, PIC_EOI);    /* acquittement 8259 de s‚curit‚ */
}

void comE_close()
{
#ifdef FTRACE
fclose(ft);
#endif
  outpb(com_adrbase+IER, 0);    /* Plus d'IT du 8250 */
  outpb(com_adrbase+MCR, 0);    /* DTR=0  RTS=0 */
  outpb(PIC8259+1, (byte)(inpb(PIC8259+1)&port_serie[port].com_masque8259));
  _dos_setvect(port_serie[port].com_interrupt, old_it);
}

static int comE_cardispo()
{
  return ybuffer!=zbuffer;
}

static byte com_litcar()
{
  byte b;

  do
  {
  } while (ybuffer==zbuffer);

  b = buffer[ybuffer];
  ybuffer = (ybuffer+1)%TAILLEBUFFER;

#ifdef FTRACE
fputc(b,ft);
#endif
  return b;
}

void comE_ecritcar(byte car)
{
  do { /* nop */ }
  while ((inpb(com_adrbase+LSR)&0x20)==0);

  outpb (com_adrbase+THR, car);
}

void comE_ecritchaine(byte *ch)
{
  while (*ch)
    comE_ecritcar(*ch++);
}

void com_job()
{
#ifdef SCRIPT
  static FILE *f;
  static int state = 0;
  byte b;

  if (state==0)
  { f = fopen("12","rb");
    if (f==NULL)
      state = 2;
    else
      state = 1;
  }

  if (state==1)
  { if (feof(f))
    { fclose(f);
      state = 2;
    }
    pro_from_com(b=(byte)fgetc(f));
    /* comE_ecritcar(b); */
  }
#endif

  if (!comE_cardispo()) return;
  pro_from_com(com_litcar());
}
