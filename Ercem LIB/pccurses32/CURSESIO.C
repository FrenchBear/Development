/****************************************************************/
/* Low-level I/O functions of the PCcurses package, 'C' version	*/
/*								*/
/****************************************************************/
/* This version of curses is based on ncurses, a curses version	*/
/* originally written by Pavel Curtis at Cornell University.	*/
/* I have made substantial changes to make it run on IBM PC's,	*/
/* and therefore consider myself free make it public domain.	*/
/*		Bjorn Larsson (...mcvax!enea!infovax!bl)	*/
/****************************************************************/
/* BUT: this particular module was written by					*/
/*	Steve Creps (creps@silver.bacs.indiana.edu)					*/
/* It provides 'C' versions of the low-level I/O functions		*/
/* that are also available in assembler in cursesio.asm.		*/
/* B. Larsson took the liberty of modifying its style slightly	*/
/* when incorporating it into PCcurses v.1.2.					*/
/****************************************************************/
/* 1.0:	Original, S. Creps:								880827	*/
/* 1.2:	Style clean-up, rcsid[] string for maintenance:	881002	*/
/* 1.3:	MSC -W3, Turbo'C' -w -w-pro checkes:			881005	*/
/* 2.0:	Version 32 bits console:						29/01/95*/
/****************************************************************/

#include <windows.h>
#include <conio.h>
#pragma hdrstop

#include "curses.h"
//#include "curspriv.h"

char _curses_curseio_rcsid[] = "@(#)cursesio.c v1.3 - 881005";



/****************************************************************/
/* _Cursescattr() writes char 'chr' with attributes 'attr' to	*/
/* the current cursor location.					*/
/****************************************************************/

static int iRow, iCol;
static int iDeja = 0;
static HANDLE hStdOut;         /* Handle for console window */
static CONSOLE_SCREEN_BUFFER_INFO csbi;    /* Console information structure */

void _cursescattr(chr, attr)
char	chr;
char	attr;
{
  CHAR_INFO	 chiSrcBuffer;
  COORD		 coordSrcBufferSize;
  COORD		 coordSrcBufferCoord;
  SMALL_RECT srctDestRect;

  if (iDeja==0)
  {
    iDeja = 1;

    hStdOut = GetStdHandle( STD_OUTPUT_HANDLE );

    /* Get display screen's text row and column information. */
    GetConsoleScreenBufferInfo( hStdOut, &csbi );
  }

  chiSrcBuffer.Char.AsciiChar = chr;
  chiSrcBuffer.Attributes = attr;

  coordSrcBufferSize.X = 1;
  coordSrcBufferSize.Y = 1;
  coordSrcBufferCoord.X = 0;
  coordSrcBufferCoord.Y = 0;

  srctDestRect.Left = iCol;
  srctDestRect.Top = iRow;
  srctDestRect.Right = iCol;
  srctDestRect.Bottom = iRow;

  WriteConsoleOutput(hStdOut, &chiSrcBuffer, coordSrcBufferSize, coordSrcBufferCoord, &srctDestRect);
  iCol++;
  if (iCol==80)
  {
	iCol = 0;
    iRow++;
	if (iRow==25) iRow = 0;
  }

} /* _cursescattr */

/****************************************************************/
/* _Cursescursor() sets the cursor position in video page 0.	*/
/* 'row' and 'column' are the cursor address. If 'row' is set	*/
/*  to 25, no cursor at	all is displayed.			*/
/****************************************************************/

void _cursescursor(row, column)
  int	row;
  int	column;
  {
    iRow = row;
	iCol = column;
  }/* _cursescursor */

/****************************************************************/
/* _Cursesgcols() returns the current number of columns on the	*/
/* screen.							*/
/****************************************************************/

int _cursesgcols()
{
  return 80;
} /* _cursesgcols */

/****************************************************************/
/* _Cursesputc() outputs character 'chr' to screen in tty	*/
/* fashion. If a colour mode is active, the character is writ-	*/
/* ten with colour 'colour'.					*/
/****************************************************************/

void _cursesputc(chr, color)
char	chr;
char	color;
{
/*
  regs.h.ah = 0x0e;
  regs.h.al = (unsigned char)chr;
  regs.h.bh = 0x00;
  regs.h.bl = (unsigned char)color;
  int86(0x10, &regs, &regs);
*/
  _cursescattr(chr, color);
} /* _cursesputc */

/****************************************************************/
/* _Cursesscroll() scrolls a window in the current page up or	*/
/*  down. Urow, lcol, lrow,rcol are the window coordinates.	*/
/* Lines is the number of lines to scroll. If 0, clears the	*/
/* window, if < 0 scrolls down, > 0 scrolls up. Blanks areas	*/
/* that are left, and sets character attributes to attr. If in	*/
/* a colour graphics mode, fills them with the colour 'attr'	*/
/* instead.							*/
/****************************************************************/

void _cursesscroll(urow, lcol, lrow, rcol, lines, attr)
  int	urow;
  int	lcol;
  int	lrow;
  int	rcol;
  int	lines;
  char attr;
  {
    SMALL_RECT	srctSourceRect;		// screen buffer rect. to move 
    SMALL_RECT	srctClipRect;		// affected screen buffer rect. 
    COORD		coordDestOrigin;	// new location of screen buffer rect. 
    CHAR_INFO	chiFill;			// fill character and color

	chiFill.Char.AsciiChar = ' ';
    chiFill.Attributes = attr;

	srctSourceRect.Top = urow;
	srctSourceRect.Bottom = lrow;
	srctSourceRect.Left = lcol;
	srctSourceRect.Right = rcol;

    ScrollConsoleScreenBuffer(hStdOut, &srctSourceRect,	&srctClipRect, coordDestOrigin,	&chiFill);

#ifdef TOTO
  if (lines >= 0)
    {
    regs.h.ah = 0x06;
    regs.h.al = (unsigned char)lines;
    } /* if */
  else
    {
    regs.h.ah = 0x07;
    regs.h.al = (unsigned char)(-lines);
    } /* else */
  regs.h.bh = (unsigned char)attr;
  regs.h.ch = (unsigned char)urow;
  regs.h.cl = (unsigned char)lcol;
  regs.h.dh = (unsigned char)lrow;
  regs.h.dl = (unsigned char)rcol;
  int86(0x10, &regs, &regs);
#endif
  } /* _cursesscroll */

/****************************************************************/
/* _Cursesgcmode() returns the current cursor type. Bits 8-15	*/
/* of the return value is the start scan row, and bits 0-7 is	*/
/* the end scan row.						*/
/****************************************************************/

int _cursesgcmode()
{
/*
  regs.h.ah = 0x03;
  regs.h.bh = 0x00;
  int86(0x10, &regs, &regs);
  return (int)regs.x.cx;
*/
  return 0;
} /* _cursesgcmode */

/****************************************************************/
/* _Cursescmode() sets the cursor type to begin in scan line	*/
/* startrow and end in scan line endrow. Both values should be	*/
/* 0-31.							*/
/****************************************************************/

void _cursescmode(startrow, endrow)
int	startrow;
int	endrow;
{
/*
  regs.h.ah = 0x01;
  regs.h.ch = (unsigned char)startrow;
  regs.h.cl = (unsigned char)endrow;
  int86(0x10, &regs, &regs);
*/
} /* _cursescmode */

/****************************************************************/
/* _Curseskey() returns the next key code struck at the key-	*/
/* board. If the low 8 bits are 0, the upper bits contain the	*/
/* extended character code. If bit 0-7 are non-zero, the upper	*/
/* bits = 0.							*/
/****************************************************************/

int _curseskey()
{
  int c = _getch();
  if (c=='#') c=0x1b;
  if (c==0 || c==0xe0)
    c = _getch()<<8;
  return c;
/*
  regs.h.ah = 0x00;
  int86(0x16, &regs, &regs);
  if (regs.h.al != 0)
    return (int)(regs.x.ax & 0x00ff);
  return (int)regs.x.ax;
*/
} /* _curseskey */

/****************************************************************/
/* _Curseskeytst() returns 1 if a keyboard character is avail-	*/
/* able, 0 otherwise.						*/
/****************************************************************/

bool _curseskeytst()
{
  return _kbhit();
/*
  regs.h.ah = 0x01;
  int86(0x16, &regs, &regs);
  return ((bool)((regs.x.cflag & 0x40) ? 1 : 0));
*/
} /*_curseskeytst */

/****************************************************************/
/* _Cursesgcb() returns 1 if MSDOS BREAK CHECK is on, else 0.	*/
/****************************************************************/

int _cursesgcb()
{
/*
  regs.h.ah = 0x33;
  regs.h.al = 0x00;
  int86(0x21, &regs, &regs);
  return (int)regs.h.dl;
*/
  return 0;
} /* _cursesgcb */

/****************************************************************/
/* _Cursesscb() sets MSDOS BREAK CHECK according to 'setting'.	*/
/****************************************************************/

void _cursesscb(setting)
int setting;
{
/*
  regs.h.ah = 0x33;
  regs.h.al = 0x00;
  regs.h.dl = (unsigned char)(setting ? 1 : 0);
  int86(0x21, &regs, &regs);
*/
} /* _cursesscb */
