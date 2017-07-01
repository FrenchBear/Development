
#include <iostream.h>

class complexe;                     

class point
{ 
		int x,y;
	public:   
		point(int abs=0, int ord=0) {x=abs; y=ord; }
		operator complexe();
};

class complexe
{
		double reel, imag;
	public:
		complexe(double r=0, double i=0) {reel=r; imag=i; }
};


point::operator complexe()
{
	return complexe(x,y);
}

void main()
{
	point a(2,5);
	complexe c;
	
	c = a;
}
  