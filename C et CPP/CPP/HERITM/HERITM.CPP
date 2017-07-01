// heritm.cpp
// Héritage multiple
// 20/02/94 PV

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
			cout << "CR point     " << x << ' ' << y << " adr=" << this << " = " << &p << '\n';
		}
		
		point& operator=(point& p)
		{
		  x = p.x;             
		  y = p.y;
			cout << "op= point    " << this << " = " << &p << ' ' << x << ' ' << y << '\n';
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



class coul
{
		short couleur;
	public:
		coul(int cl)
		{
			couleur = cl;
			cout << "++ coul      " << int(couleur) << "   adr=" << this << '\n';
		}

		coul(coul& p)
		{
			couleur = p.couleur;
			cout << "CR coul      " << int(couleur) << "   adr=" << this << " = " << &p << '\n';
		}

		~coul()
		{
			cout << "-- coul      " << int(couleur) << "   adr=" << this << '\n';
		}

		coul& operator=(coul& p)
		{
			couleur = p.couleur;
			cout << "op= coul     " << this << " = " << &p << ' ' << int(couleur) << '\n';
			return *this;
		}      

		friend ostream& operator<<(ostream& os, coul& p)
		{
			os << "coul=" << int(p.couleur);
			return os;
		}
};



class pointcoul: public point, public coul
{
	public:
		pointcoul(int abs=0, int ord=0, int cl=1): point(abs,ord), coul(cl)
		{
			cout << "++ pointcoul     adr=" << this << '\n';
		}

		pointcoul(pointcoul& p): point(p), coul(p)
		{
			cout << "CR pointcoul     adr=" << this << " = " << &p << '\n';
		}

		~pointcoul()
		{
			cout << "-- pointcoul     adr=" << this << '\n';
		}

		pointcoul& operator=(pointcoul& p)
		{
			point::operator=(p);
			coul::operator=(p);
			cout << "op= pointcoul" << this << " = " << &p << '\n';
			return *this;
		}      

		friend ostream& operator<<(ostream& os, pointcoul& p)
		{
			return os << (point&)p << ' ' << (coul&)p;
		}
};


void main()
{               
	cout << "Création de p(3,9,2)\n";
	pointcoul p(3,9,2);       
	cout << "p: " << p << '\n';            

	cout << "Création de q(p)\n";
	pointcoul q(p);
	cout << "q: " << q << '\n';            

	cout << "Création de r\n";
	pointcoul r;              
	cout << "r: " << r << '\n';

	cout << "Affectation r = q\n";
	r = q;
	cout << "r: " << r << '\n';            

	cout << "Fin.\n";
}