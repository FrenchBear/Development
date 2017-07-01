
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
    
      cout << "Constructeur standard " << np << " (" << x << "," << y << ")\n";
    }           

    point(point& p0)
    { np = ++nbp;
      x = p0.x;
      y = p0.y;
      
      cout << "Constructeur copie " << np << "«" << p0.np << '\n';
    }
    
    ~point()	 
    { cout << "Destructeur " << np << "\n";
    }                    
    
    point& operator=(point& p0)
    {
      x = p0.x;
      y = p0.y;
      
      cout << "operator= " << np << "«" << p0.np << '\n';
      return *this; 
    }
};

void main()
{
  cout << "Début du main\n";
  point a(3,2);
  point b = point(3,2);
  point c(a);
  point d=a;
  point e;
  e = a;
  cout << "Fin du main\n";                 
}