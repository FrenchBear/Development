
#include <iostream.h>
#include <math.h>

class complexe
{
  private:
    double x,y;
    
  public:
  
    complexe(double r=0, double i=0)
    {
      x = r;
      y = i;
    }         
    
    friend double abs(complexe c);

  
    friend complexe& operator +(complexe &a, complexe &b)
    {
      complexe r;
      r.x = a.x + b.x;
      r.y = a.y+b.y;
      return r;
    }             
    
    friend ostream& operator <<(ostream &os, complexe &c)
    {                
      os << c.x << "+" << c.y << 'i';
      return os;
    }
};           


int abs(int x)
{
  return x<0 ? -x : x;
}

double abs(complexe c)
{
  return sqrt(c.x*c.x+c.y*c.y);
}



main()
{
  cout << "Debut du programme\n";
  
  complexe a(1);
  complexe b(3,2);
  complexe c;
  double module;
      
  c = a + b;
  
  cout << "a=" << a << '\n';
  cout << "b=" << b << '\n';
  cout << "c=" << c << '\n';
  module = abs(c);
  cout << "|c|=" << module << '\n';
}
  