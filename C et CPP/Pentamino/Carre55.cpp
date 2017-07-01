// Carre55.cpp: implementation of the Carre55 class
// Représente une grille 5x5 et implantes des transformations de base (rotation/symétrie)
// 26/12/98 PV

#include "stdafx.h"
#include "Carre55.h"


// Transformations
// 0: Identité
// 1: 90°  sens horaire
// 2: 180°
// 3: 270° sens horaire
// 4: miroir Hz
// 5: miroir Hz + 90°  sens horaire
// 6: miroir Hz + 180°
// 7: miroir Hz + 270° sens horaire

// Transformation de ligne  
int Carre55::TL(int iT, int l, int c)
{
  switch(iT)
  {
	case 1:  return c;
	case 2:  return l<lmax ? lmax-1-l : l;
	case 3:  return c<cmax ? cmax-1-c : c;
	case 4:  return l;
	case 5:  return c<cmax ? cmax-1-c : c;
	case 6:  return l<lmax ? lmax-1-l : c;
	case 7:  return c;
  }
  return l;	// cas 0
}

// Transformation de colonne
int Carre55::TC(int iT, int l, int c)
{
  switch(iT)
  {
	case 1:  return l<lmax ? lmax-1-l : l;
	case 2:  return c<cmax ? cmax-1-c : c;
	case 3:  return l;
	case 4:  return c<cmax ? cmax-1-c : c;
	case 5:  return l<lmax ? lmax-1-l : l;
	case 6:  return c;
	case 7:  return l;
  }
  return c;	// cas 0
}


Carre55 Carre55::Transformation(int iT)
{
  Carre55 ct;
  int		l, c;

  for (l=0 ; l<lmax ; l++)
	for (c=0 ; c<cmax ; c++)
	  ct.tMotif[TL(iT,l,c)][TC(iT,l,c)] = tMotif[l][c];

  if (iT & 1)
  {
	ct.lmax = cmax;
	ct.cmax = lmax;
  }
  else
  {
	ct.lmax = lmax;
	ct.cmax = cmax;
  }

  ct.MkOffset();

  return ct;
}


void Carre55::Dessin()
{
  int l,c;

  for (l=0 ; l<5 ; l++)
  {
	for (c=0 ; c<5 ; c++)
	  printf("%s", tMotif[l][c] ? "\xdb\xdb" : "\xfa\xfa");
	printf("\n");
  }	
  printf("Offset: %d\n", iOffsetCol);
}
