// esstemp.c
// Essai d'utilisation des templates (avec le compilateur Borland)
// PV 19/02/94

#include <iostream.h>

template <class T>
T max(T x, T y) 
{ 
   return (x > y) ? x : y; 
};


template <class T>
class List 
{ 
    T *v; 
    int size;

public: 
    List(int); 
    T& operator[](int i) {return v[i];} 
};

template <class T> List<T>::List(int n)
{ 
   v = new T[n]; 
   size = n; 
}


class MaClasse
{
		int x;
	public:
		MaClasse(int i=0) {x=i; }

		int operator>(MaClasse& mc2)
		{
			return x>mc2.x;
    }

		friend ostream& operator<<(ostream& os, MaClasse& mc)
		{ return os << mc.x;
    }
};


void main()
{
	int i = 2;
	int j = 3;
	int k = max(i,j);
	cout << "k: " << k << '\n';

	MaClasse m1(10);
	MaClasse m2(20);
	MaClasse m3 = max(m1,m2);
	cout << "m3: " << m3 << '\n';

	List<int> x(8);
	List<MaClasse> y(10);
	x[3] = 7; 
	y[3] = m1;               // m de type Maclass
}