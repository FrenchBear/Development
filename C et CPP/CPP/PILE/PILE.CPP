// pile.cpp
// Classe pile, avec allocation dynamique de mémoire
// PV 5/2/94

#pragma message("Debut de " __FILE__)

#include <iostream.h>
#include "pile.h"

pile_entier::pile_entier(int n)
{
  if (n<1) n = 1;
  iTaille = n; 
  iSommet = 0;
  tiVal = new int[n];
}                           

pile_entier::pile_entier(pile_entier& p)
{
  iTaille = p.iTaille;
  iSommet = p.iSommet;
  tiVal = new int[iTaille];
  for (int i=0 ; i<iSommet ; i++)
    tiVal[i] = p.tiVal[i];
}

pile_entier::~pile_entier()
{
  delete tiVal;
}

void pile_entier::empile(int v)
{     
  cout << "empile " << v << '\n';
  if (iSommet<iTaille)
    tiVal[iSommet++] = v;
}

int pile_entier::depile()
{
  if (iSommet>0)
    return tiVal[--iSommet];
  return 0;
}

int pile_entier::pleine()
{
  return iSommet==iTaille;
}
          
int pile_entier::vide()
{
  return iSommet==0;
}                  

void pile_entier::affiche() const
{
  for (int i=0 ; i<iTaille ; i++)
  {
    if (i<iSommet)
      cout << tiVal[i];
    else
      cout << '-';
    cout << ' ';
  }
  cout << '\n';
}


pile_entier& pile_entier::operator<(int i)
{
  this->empile(i);
  return *this;
}                 


pile_entier& pile_entier::operator>(int& i)
{
  i = this->depile();
  return *this;
}



ostream& operator<<(ostream& os, pile_entier& p)
{
  for (int i=0 ; i<p.iTaille ; i++)
  {
    if (i<p.iSommet)
      cout << p.tiVal[i];
    else
      cout << '-';
    cout << ' ';
  }             
  return os;
}



#pragma message("Fin de " __FILE__)
