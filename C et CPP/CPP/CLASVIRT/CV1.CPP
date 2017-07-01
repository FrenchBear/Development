// cv1.cpp
// Test des classes virtuelles, en particulier l'ordre d'appel
// des constructeurs
// 20/02/94 PV

#include <iostream.h>


class E
{
	public:
		E(int e=0)  { cout << "++ E " << e << '\n'; }
		~E() { cout << "-- E\n"; }
};
 
class F: public E
{
	public:
		F(int f=0): E(f+4)  { cout << "++ F " << f << '\n'; }
		~F() { cout << "-- F\n"; }
};

class G: public virtual F
{
	public:
		G(int g=0): F(g-2)  { cout << "++ G " << g << '\n'; }
		~G() { cout << "-- G\n"; }
};
     
class H: public virtual F
{
	public:
		H(int h=0): F(h-1)  { cout << "++ H " << h << '\n'; }
		~H() { cout << "-- H\n"; }
};
 
class I: public G, public H
{
	public:
		I(int i=0): G(i+1), H(i+2), F(i+3) { cout << "++ I " << i << '\n'; }
		~I() { cout << "-- I\n"; }
};
 

 
void main()
{
  I i;
}