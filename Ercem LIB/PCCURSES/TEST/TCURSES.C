
// tcurses.c
// Test de la bibliothèque pc-curses
// P.Violent, juin 94

#include <stdio.h>
#include <curses.h>

int main()
{ 
  int c;
  int l = 0;
  
  initscr();
  keypad(stdscr, TRUE);	/* renvoyer des tokens */
  noecho();
  crmode();
  nl();
  
  mvaddstr(22,0,"Appuyez sur une touche\r\nEspace pour terminer.");
  
  for(;;)
  {
    refresh();
    c = getch();
    if (c==' ') break;
    move(l,0);
    printw("%3d 0x%3x", c, c);
    l = (l+1)%20;
  }
  endwin();
  return 0;
}