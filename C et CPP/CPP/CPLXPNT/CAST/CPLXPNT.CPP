// test.cpp
// Essai de conversion de classe � classe
// 12/02/94 PV

#include <iostream.h>

#include "point.h"
#include "complexe.h"

void main()
{
  point p(2,4);
  complexe c;
                   
  cout << "*** avant\n";                   
  c = complexe(p);   
  cout << "*** apr�s\n";

  cout << "point p: " << p << '\n';                   
  cout << "complexe c: " << c << '\n';
}