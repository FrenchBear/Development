// convab3.cpp
// test des conversions d'une classe B vers une classe A
// 3ère méthode: utilisation d'un opérateur de cast dans la classe B
// contournement d'un bug du compilateur C++ de Microsoft...
// 13/02/94 PV

class A;

class B
{
		int b;
	public:
		B(int i=0) {b=i; }
	 operator A();
	 A BtoA();
};


class A
{
		int a;
	public:
		A(int i=0) {a=i; }

		friend B::operator A();    // Sans commentaire, erreur de compilation...
		friend A B::BtoA();
};


B::operator A()
{
	A a(b);
	return a;
}

A B::BtoA()
{
  A a;
  a.a = b;
  return a;
}

void main()
{                
  A a(2);
  B b(5);
  
  a = A(b);
  
}