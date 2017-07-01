// b2.cpp
// Appel de constructeurs en cas de classe dérivée
// 19/02/94 PV

#include <iostream.h>

class point
{
		int x,y;
	public:
		point(int abs, int ord)
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
			cout << "++ pointcol  " << int(coul) << '\n';
		}

		pointcol(pointcol& p): point(p)
		{
			coul = p.coul;
			cout << "CR pointcol  " << int(coul) << '\n';
			cout << "Avant\n";
			point((point&)p);
			cout << "Après\n";
		}

		friend ostream& operator<<(ostream& os, pointcol& p)
		{
			os << (point&)p << " coul=" << int(p.coul);
			return os;
		}
};


void main()
{                                                 
	pointcol a(2,3,4);

	cout << "========\n";
	pointcol b = a;
	cout << "========\n";

	cout << "a: " << a << '\n';
	cout << "b: " << b << '\n';
}