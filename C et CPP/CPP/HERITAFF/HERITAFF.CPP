// heritaff.cpp
// Héritage de l'opérateur d'affectation
// 19/02/94 PV

#include <iostream.h>

class point
{
		int x,y;
	public:
		point(int abs=0, int ord=0)
		{
			x = abs;
			y = ord;
			cout << "++ point     " << x << ' ' << y << " adr=" << this << '\n';
		}

		point(point& p)
		{
			x = p.x;
			y = p.y;
			cout << "CR point     " << x << ' ' << y << " adr=" << this << '\n';
		}
		
		point& operator=(point& p)
		{
		  x = p.x;             
		  y = p.y;
			cout << "op= point    " << this << "=" << &p << ' ' << x << ' ' << y << '\n';
			return *this;
		}

		~point()
		{
			cout << "-- point     " << x << ' ' << y << " adr=" << this << '\n';
		}

		friend ostream& operator<<(ostream& os, point& p)
		{
			os << "x=" << p.x << " y=" << p.y;
			return os;
		}
};


class pointcol: public point
{
		char coul;
	public:
		pointcol(int abs=0, int ord=0, int cl=1): point(abs,ord)
		{
			coul = cl;
			cout << "++ pointcol  " << int(coul) << "   adr=" << this << '\n';
		}

		pointcol(pointcol& p): point(p)
		{
			coul = p.coul;
			cout << "CR pointcol  " << int(coul) << "   adr=" << this << '\n';
			cout << "Avant\n";
			point((point&)p);
			cout << "Après\n";
		}

		~pointcol()
		{
			cout << "-- pointcol  " << int(coul) << "   adr=" << this << '\n';
		}

#ifdef toto
		pointcol& operator=(pointcol& p)
		{
      point::operator=(p);
			coul = p.coul;
			cout << "op= pointcol " << this << "=" << &p << ' ' << int(coul) << '\n';
			return *this;
		}      
#endif

		friend ostream& operator<<(ostream& os, pointcol& p)
		{
			os << (point&)p << " coul=" << int(p.coul);
			return os;
		}
};


void main()
{                        
  cout << "Création des originaux\n";
  point    a(1,2);
	pointcol b(3,4,5);

	cout << "Création des doubles\n";
	point a2;
	pointcol b2;
	                                 
	cout << "Affectation point = point\n";
	a2 = a;
	cout << "a: " << a << '\n';
	cout << "a2:" << a2 << '\n';
	
  cout << "Affectation point = pointcol\n";
	a2 = b;
	cout << "a2:" << a2 << '\n';
  cout << "b: " << b << '\n';     
  
  cout << "Affectation pointcol = pointcol\n";
	b2 = b;
	cout << "b: " << b << '\n';
  cout << "b2:" << b2 << '\n';     
  
  cout << "Fin.\n";
}