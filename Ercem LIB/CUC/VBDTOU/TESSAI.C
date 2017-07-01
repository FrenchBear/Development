// tessai.c
// Test du convertisseur automatique
// P.VIOLENT 9/7/94

#include <stdio.h>
#include <curses.h>
#include <clib.ref>

#include <biberc.h>
#include "cuc.h"

#include "essai.h"


void main()
{
  InitEcran();
  NoDelInterrupt();
  DoFormEssai();
  FinEcran();
  
  exit(0);
}

