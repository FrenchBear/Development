/****************************************************************/
/* Printw() and scanw() routines of the PCcurses package	*/
/*								*/
/****************************************************************/
/* This version of curses is based on ncurses, a curses version	*/
/* originally written by Pavel Curtis at Cornell University.	*/
/* I have made substantial changes to make it run on IBM PC's,	*/
/* and therefore consider myself free to make it public domain.	*/
/*		Bjorn Larsson (...mcvax!enea!infovax!bl)	*/
/****************************************************************/
/*		     IMPLEMENTATION NOTE			*/
/* These routines make a local copy of their parameter stack,	*/
/* assuming at most 5 'double' arguments were passed (== 40	*/
/* bytes == 20 int's == 10 long's == 10-20 pointers {depending	*/
/* on memory model}, etc). This means the invocation of the	*/
/* routines themselves requires at least 80 bytes of stack just	*/
/* for the parameters, and the sprintf() and sscanf() functions	*/
/* will require more. Therefore, this module should be compiled	*/
/* with stack checking on to avoid stack overflow errors.	*/
/****************************************************************/
/* 1.0:	Release:					870515	*/
/* 1.2:	Rcsid[] string for maintenance:			881002	*/
/* 1.3:	MSC -W3, Turbo'C' -w -w-pro checkes:		881005	*/
/****************************************************************/

#include "curses.h"
#include "curspriv.h"

char _curses_prntscan_rcsid[] = "@(#)prntscan.c v1.3 - 881005";

static	int	pblen();		/* gets length of buffer */
static	char	printscanbuf[513];	/* buffer used during I/O */

/****************************************************************/
/* Wprintw(win,fmt,args) does a printf() in window 'win'.	*/
/****************************************************************/

int	wprintw(win,fmt,A1,A2,A3,A4,A5)
  WINDOW	*win;
  char		*fmt;
  double	 A1,A2,A3,A4,A5;
  {
  sprintf(printscanbuf,fmt,A1,A2,A3,A4,A5);
  if (waddstr(win,printscanbuf) == ERR)
    return(ERR);
  return(pblen());
  } /* wprintw */

/****************************************************************/
/* Printw(fmt,args) does a printf() in stdscr.			*/
/****************************************************************/

int	printw(fmt,A1,A2,A3,A4,A5)
  char		*fmt;
  double	 A1,A2,A3,A4,A5;
  {
  sprintf(printscanbuf,fmt,A1,A2,A3,A4,A5);
  if(waddstr(stdscr,printscanbuf) == ERR)
    return(ERR);
  return(pblen());
  } /* printw */

/****************************************************************/
/* Mvprintw(fmt,args) moves the stdscr cursor to a new posi-	*/
/* tion, then does a printf() in stdscr.			*/
/****************************************************************/

int	mvprintw(y,x,fmt,A1,A2,A3,A4,A5)
  int		 y;
  int		 x;
  char		*fmt;
  double	 A1,A2,A3,A4,A5;
  {
  if (wmove(stdscr,y,x) == ERR)
    return(ERR);
  sprintf(printscanbuf,fmt,A1,A2,A3,A4,A5);
  if(waddstr(stdscr,printscanbuf) == ERR)
    return(ERR);
  return(pblen());
  } /* mvprintw */

/****************************************************************/
/* Mvwprintw(win,fmt,args) moves the window 'win's cursor to	*/
/* a new position, then does a printf() in window 'win'.	*/
/****************************************************************/

int	mvwprintw(win,y,x,fmt,A1,A2,A3,A4,A5)
  WINDOW	*win;
  int		 y;
  int		 x;
  char		*fmt;
  double	 A1,A2,A3,A4,A5;
  {
  if (wmove(win,y,x) == ERR)
    return(ERR);
  sprintf(printscanbuf,fmt,A1,A2,A3,A4,A5);
  if(waddstr(win,printscanbuf) == ERR)
    return(ERR);
  return(pblen());
  } /* mvwprintw */

/****************************************************************/
/* Wscanw(win,fmt,args) gets a string via window 'win', then	*/
/* scans the string using format 'fmt' to extract the values	*/
/* and put them in the variables pointed to the arguments.	*/
/****************************************************************/

int wscanw(win,fmt,A1,A2,A3,A4,A5)
  WINDOW	*win;
  char		*fmt;
  double	 A1,A2,A3,A4,A5;		/* really pointers */
  {
  wrefresh(win);				/* set cursor */
  if (wgetstr(win,printscanbuf) == ERR)		/* get string */
    return(ERR);
  return(sscanf(printscanbuf,fmt,A1,A2,A3,A4,A5));
  } /* wscanw */

/****************************************************************/
/* Scanw(fmt,args) gets a string via stdscr, then scans the	*/
/* string using format 'fmt' to extract the values and put them	*/
/* in the variables pointed to the arguments.			*/
/****************************************************************/

int scanw(fmt,A1,A2,A3,A4,A5)
  char		*fmt;
  double	 A1,A2,A3,A4,A5;		/* really pointers */
  {
  wrefresh(stdscr);				/* set cursor */
  if (wgetstr(stdscr,printscanbuf) == ERR)	/* get string */
    return(ERR);
  return(sscanf(printscanbuf,fmt,A1,A2,A3,A4,A5));
  } /* scanw */

/****************************************************************/
/* Mvscanw(y,x,fmt,args) moves stdscr's cursor to a new posi-	*/
/* tion, then gets a string via stdscr and scans the string	*/
/* using format 'fmt' to extract the values and put them in the	*/
/* variables pointed to the arguments.				*/
/****************************************************************/

int mvscanw(y,x,fmt,A1,A2,A3,A4,A5)
  int		 y;
  int		 x;
  char		*fmt;
  double	 A1,A2,A3,A4,A5;		/* really pointers */
  {
  if (wmove(stdscr,y,x) == ERR)
    return(ERR);
  wrefresh(stdscr);				/* set cursor */
  if (wgetstr(stdscr,printscanbuf) == ERR)	/* get string */
    return(ERR);
  return(sscanf(printscanbuf,fmt,A1,A2,A3,A4,A5));
  } /* mvscanw */

/****************************************************************/
/* Mvwscanw(win,y,x,fmt,args) moves window 'win's cursor to a	*/
/* new position, then gets a string via 'win' and scans the	*/
/* string using format 'fmt' to extract the values and put them	*/
/* in the variables pointed to the arguments.			*/
/****************************************************************/

int mvwscanw(win,y,x,fmt,A1,A2,A3,A4,A5)
  WINDOW	*win;
  int		 y;
  int		 x;
  char		*fmt;
  double	 A1,A2,A3,A4,A5;		/* really pointers */
  {
  if (wmove(win,y,x) == ERR)
    return(ERR);
  wrefresh(win);				/* set cursor */
  if (wgetstr(win,printscanbuf) == ERR)		/* get string */
    return(ERR);
  return(sscanf(printscanbuf,fmt,A1,A2,A3,A4,A5));
  } /* mvwscanw */

/****************************************************************/
/* Pblen() returns the length of the string in printscanbuf.	*/
/****************************************************************/

static	int pblen()
  {
  char *p = printscanbuf;
  
  while(*p++);
  return(p-printscanbuf-1);
  } /* plben */
