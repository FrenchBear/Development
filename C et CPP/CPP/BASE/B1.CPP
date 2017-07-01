// b1.cpp
// Appel de constructeurs en cas de classe dérivée
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
			cout << "++ point     " << x << ' ' << y << '\n';
		}
		
		point(point& p)
		{
			x = p.x;
			y = p.y;
			cout << "CR point     " << x << ' ' << y << '\n';
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
		}		
};


void main()
{
	pointcol a(2,3,4);
	pointcol b = a;
}