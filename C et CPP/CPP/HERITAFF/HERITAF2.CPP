// heritaff.cpp
// Héritage de l'opérateur d'affectation
// 19/02/94 PV

#include <iostream.h>

class point
{
		int x,y;
	public:
		point(int abs=0, int ord=0) { x = abs; y = ord; }

		point operator=(point p)
		{
			x = p.x;
		  y = p.y;
			cout << "Oper = point\n";
			return *this;
		}

};


class pointcol: public point
{
		char coul;
	public:
		pointcol(int abs=0, int ord=0, int cl=1): point(abs,ord)
		{	coul = cl; }

};


void main()
{                        
	point    a,b;
	pointcol c,d;

	cout << "Affectation point = point\n";
	a = b;

  cout << "Affectation pointcol = pointcol\n";
	c = d;
}