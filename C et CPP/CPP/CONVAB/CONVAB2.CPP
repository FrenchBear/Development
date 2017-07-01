// convab2.cpp
// test des coversions d'une classe B vers une classe A
// 2ème méthode: utilisation d'un constructeur dans la classe A à partir d'un objet B
// 13/02/94 PV

#include <iostream.h>

class B;

class A
{
		int a;
	public:
		A(int i=0) {a=i; }
		A(B&);
		
		friend ostream& operator<<(ostream& os, A& a);
};                                              

class B
{
		int b;
	public:
		B(int i=0) {b=i; }
		friend A::A(B&);

		friend ostream& operator<<(ostream& os, B& b);
};


A::A(B& b)
{
  a=b.b;
}

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