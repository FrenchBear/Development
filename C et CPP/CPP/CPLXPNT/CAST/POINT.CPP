// point.cpp
// Définition de la classe point;

#include <iostream.h>
#include "point.h"
#include "complexe.h"

static int nbp;
       
point::point(int x0, int y0)
{ np = ++nbp;
  x=x0;
  y=y0;
  cout << "Constructeur point«(int,int) " << *this << '\n';
}           

point::point(point& p0)
{ np = ++nbp;
  x = p0.x;
  y = p0.y;
      
  cout << "Constructeur point«point " << *this << "«" << p0 << '\n';
}

point::~point()	 
{ cout << "~point " << *this << '\n';
}                    
    
ostream& operator<<(ostream& os, point& p)
{
  os << 'p' << p.np << '(' << p.x << ',' << p.y << ')';
  return os;
}    

point::operator complexe()
{
  complexe c(x,y);
  return c;
}