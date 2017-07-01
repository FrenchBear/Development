// ostr.cpp
// Test de la sortie en chaine avec les flots du C++
// Ne pas oublier le manipulateur ends !!!
// 20/02/94 PV

#include <iostream.h>
#include <strstream.h>

#include <string.h>

void main()
{
  ostrstream s;
  s << 'b' << 32 << ends;
  
  cout << strlen(s.str()) << '\n';
}