// conv.cpp
// Test des conversions en C++
// PC 12/02/94

#include <iostream.h>                              

int nbp;

class point
{
    int x,y;
    int np;

  public:
    point(int x0=0, int y0=0)
    { np = ++nbp;
      x=x0;
      y=y0;
    
      cout << "Constructeur standard " << *this << '\n';
    }           

    point(point& p0)
    { np = ++nbp;
      x = p0.x;
      y = p0.y;
      
      cout << "Constructeur copie " << *this << "«" << p0 << '\n';
    }
    
    ~point()	 
    { cout << "Destructeur " << *this << '\n';
    }                    
    
    point& operator=(point& p0)
    {
      x = p0.x;
      y = p0.y;
      
      cout << "operator= " << *this << "«" << p0 << '\n';
      return *this; 
    }


    point& operator=(int i)
    {
      x = i;
      y = 0;
      
      cout << "operator= " << *this << "«" << i << '\n';
      return *this; 
    }
                            
                            
    operator int()
    {           
      cout << "operator int " << *this << " -> " << x << '\n';
      return x;
    }

                            
                            
    friend ostream& operator<<(ostream& os, point& p)
		{
		  os << 'p' << p.np << '(' << p.x << ',' << p.y << ')';
		  return os;
		}    
};     


void fct(point p)
{
  cout << "appel fct " << p << '\n';
}


void main()
{
  point a(3,2), b;
  int i;         
  
  b = 6;
  
  cout << "Point a: " << a << '\n';
  cout << "Point b: " << b << '\n';
  
  i = a+b;
  cout << "i=a+b: " << i << '\n';                         
  
  fct(4);
}             
