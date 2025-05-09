// testpile.cpp
// test de la classe pile
// PV f�vrier 94

#include <iostream.h>
#include "pile.h"

void main()
{
  pile_entier p(5);

  p < 9 < 3 < 2 < 1;  
  cout << "Pile pleine ? " << p.pleine() << '\n';
  p.empile(0);
  cout << "Pile pleine ? " << p.pleine() << '\n';
  
  pile_entier q = p;
  
  cout << "D�pile -> " << p.depile() << '\n';
  cout << "D�pile -> " << p.depile() << '\n';
  cout << "D�pile -> " << p.depile() << '\n';
  cout << "D�pile -> " << p.depile() << '\n';
  cout << "D�pile -> " << p.depile() << '\n';
  
  cout << "Pile pleine ? " << p.pleine() << '\n';
  cout << "Pile vide ?   " << p.vide() << '\n';
  
  cout << "p: " << p << '\n';
  
  cout << "q: ";
  q.affiche();
  
  int i, j;
  q > i;
  cout << "D�pil� " << i << " de la pile q.\n";
  cout << "q: " << q << '\n';

  q > i > j;
  cout << "D�pil� " << i << ", puis " << j << " de la pile q.\n";
  cout << "q: " << q << '\n';
}
