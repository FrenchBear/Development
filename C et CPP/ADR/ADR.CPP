
#include <iostream.h>

class A
{
  public:
    void virtual sorad(char *);
  private:
    int a;
};

class B
{
  public:
    void virtual sorad(char *);
  private:
    int b;
};

class C: public A, public B
{
  public:
    void virtual sorad(char *);
  private:
    int c;
};

void A::sorad(char *szVar)
{
  cout << szVar << ".A::sorad: " << hex << this << '\n';
}

void B::sorad(char *szVar)
{
  cout << szVar << ".B::sorad: " << hex << this << '\n';
}

void C::sorad(char *szVar)
{
  cout << szVar << ".C::sorad: " << hex << this << '\n';
}

int main()
{
  C c;

  c.A::sorad("c");
  c.B::sorad("c");
  c.C::sorad("c");
  return 0;
}
