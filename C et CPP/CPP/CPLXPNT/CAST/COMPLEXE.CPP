// cplx.cpp
// Implantation de la classe complexe
// PV 12/02/1994

#include <iostream.h>
#include "complexe.h"          
#include "point.h"
            
static int nbc = 0;          

complexe::complexe(double r, double i)
{ nc = ++nbc;
  reel = r;
  imag = i;
  cout << "Constructeur complexe«(double,double) " << *this << '\n';
}           

complexe::complexe(complexe& c0)
{ nc = ++nbc;
  reel = c0.reel;
  imag = c0.imag;
      
  cout << "Constructeur complexe«complexe " << *this << "«" << c0 << '\n';
}

complexe::~complexe()	 
{ cout << "~complexe " << *this << '\n';
}                    
    
ostream& operator<<(ostream& os, const complexe& c)
{
  os << 'c' << c.nc << '(' << c.reel << '+' << c.imag << "i)";
  return os;
}    


complexe& complexe::operator=(const complexe& c)
{
  cout << "complexe::operator=(complexe) " << *this << "«" << c << '\n';
  this->reel = c.reel;
  this->imag = c.imag;
  return *this;
}