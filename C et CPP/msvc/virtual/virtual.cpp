#include <iostream.h>

// Base class definition.
class V {
   public:
      int d_V_1;             // data member 1
      int d_V_2;             // data member 2

      virtual void vf_V_1() {cout << "V::vf_V_1\n"; }  // virtual function 1
      virtual void vf_V_2() {cout << "V::vf_V_2\n"; }  // virtual function 2
};

// First intermediate class definition.
class A: public virtual V {
   public:
      int d_A_1;             // new data member 1
      int d_A_2;             // new data member 2

      virtual void vf_V_1() {cout << "A::vf_V_1\n"; }  // overriding virtual function
      virtual void vf_A_1() {cout << "A::vf_A_1\n"; }  // new virtual function 1
};

// Second intermediate class definition.
class B: public virtual V {
   public:
      int d_B_1;             // new data member 1
      int d_B_2;             // new data member 2

      virtual void vf_V_2() {cout << "B::vf_V_2\n"; }  // overriding virtual function
      virtual void vf_B_1() {cout << "B::vf_B_1\n"; }  // new virtual function 1
};

// Derived class definition.
class C: public A, public B {
   public:
      int d_C_1;             // new data member 1
      int d_C_2;             // new data member 2

      virtual void vf_A_1() {cout << "C::vf_A_1\n"; }    // override of A virtual function
      virtual void vf_B_1() {cout << "C::vf_B_1\n"; }    // override of B virtual function
};

int main()
{
  C c;

  c.vf_A_1();
  c.vf_B_1();
  c.vf_V_1();
  c.vf_V_2();

  return 0;
}
