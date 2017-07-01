// thsbpp.cpp
// Test du controle CUCHScrollBar en C++
// PV 6/6/94

#include "cucpp.h"

// Trois barres de d‚filement...
CUCHScrollBar *b[3];

int B0Change(CUCHScrollBar *, int , int );
int B1Change(CUCHScrollBar *, int , int );
int B2Change(CUCHScrollBar *, int , int );

int main()
{
  InitEcran();
  
  mvaddstr(0,0,"BibliothŠque CUC - Test du contr“le HScrollBar en C++");
  mvaddstr(2,0,"Utilisez les flŠches, page suivante, page pr‚c‚dente, origine, fin\npour modifier la valeur du curseur.\nQ pour quitter.");
  
  b[0] = new CUCHScrollBar(stdscr, B0Change, 6,5,1,40);
  b[1] = new CUCHScrollBar(stdscr, B1Change, 8,5,2,40);
  b[2] = new CUCHScrollBar(stdscr, B2Change, 11,5,3,40);

  b[0]->SetMinMax(0,20);
  b[0]->SetSmallChange(1);
  b[0]->SetLargeChange(5);
  b[0]->SetCSize(1);
  b[0]->SetValue(0);
  b[0]->SetEnabled();
  b[0]->SetVisible();

  b[1]->SetMinMax(1,9);
  b[1]->SetSmallChange(1);
  b[1]->SetLargeChange(5);
  b[1]->SetCSize(2);
  b[1]->SetValue(3);
  b[1]->SetEnabled();
  b[1]->SetVisible();
    
  b[2]->SetMinMax(0,30);
  b[2]->SetSmallChange(1);
  b[2]->SetLargeChange(5);
  b[2]->SetCSize(3);
  b[2]->SetValue(30);
  b[2]->SetEnabled();
  b[2]->SetVisible();

  int iActif = 0;
  b[iActif]->GotFocus();
  
  for(;;)
  {
    int c = getch2();
    if (c=='q' || c=='Q') break;

    if (c==KEY_TAB)
    { 
      b[iActif]->LostFocus();
      iActif = (iActif+1)%3;
      b[iActif]->GotFocus();
      continue;
    }
    
    b[iActif]->Key(c);
  }

  FinEcran();
  return 0;
}

int B0Change(CUCHScrollBar *pHSB, int iEvt, int iArg)
{
  int v = pHSB->iGetValue();
  move(6,0);
  printw("%3d", v);
  b[1]->SetLeft(5+v);
  return 0;
}

int B1Change(CUCHScrollBar *pHSB, int iEvt, int iArg)
{
  int v = pHSB->iGetValue();
  move(8,0);
  printw("%3d", v);
  b[2]->SetHeight(v);
  return 0;
}

int B2Change(CUCHScrollBar *pHSB, int iEvt, int iArg)
{
  int v = pHSB->iGetValue();
  move(11,0);
  printw("%3d", v);
  b[0]->SetWidth(v+10);
  return 0;
}
