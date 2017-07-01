// convab1.cpp
// test des coversions d'une classe B vers une classe A
// 1ère méthode: utilisation d'un opérateur de cast dans la classe B
// 13/02/94 PV

#include <iostream.h>

class A
{
		int a;
	public:
		A(int i=0) {a=i; }

		friend ostream& operator<<(ostream& os, A& a);
};


class B
{
		int b;
	public:
		B(int i=0) {b=i; }
    operator A() {A atemp(b); return atemp; }


		friend ostream& operator<<(ostream& os, B& b);
};



ostream& operator<<(ostream& os, A& a)
{
  return os << a.a;
}


ostream& operator<<(ostream& os, B& b)
{
  return os << b.b;
}


void main()
{                
  A a(2);
  B b(5);
  
  cout << "Avant: a:" << a << "  b:" << b << '\n';  
  a = b;
  cout << "Après: a:" << a << "  b:" << b << '\n';  
}