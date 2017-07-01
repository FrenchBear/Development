// cpp dest.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"


class X
{
private:
  int m_i;

public:
  X(int i)
  {
	m_i = i;
	printf("X(%d)\n", i);
  }

  ~X()
  {
	printf("~X(%d)\n", m_i);
  }
};


void f()
{
   X x1(1);
   X x2(2);
   X x3(3);

   //x1.~X(), x2.~X(), and x3.~X() called in that order
}

void main()
{
  f();
  getchar();
}

