// vectb.cpp
// esais de dérivation d'une classe
// 20/02/94 PV

#include <iostream.h>

class vecteur
{
    int nelem;
    int *adr;
    
  public:
    vecteur(int n)
    {
      adr = new int[nelem=n];
      cout << "++ Constr vect de taille " << n << '\n';
    }
    
    ~vecteur()
    {
      cout << "-- Destr vect" << '\n';
      delete adr;
    }            
    
    int& operator[](int i)
    {
      return adr[i];
    }
};                                                                                          
                 
                 
class vectb: public vecteur
{
		int debut, fin;
		
	public:
		vectb(int d, int f): vecteur(f-d+1)
		{
			cout << "++ Constr vectb bornes " << d << ' ' << f << '\n';
			debut = d;
			fin = f;
		}
		
		int& operator[](int i)
		{
			return vecteur::operator[](i-debut);
		}
    
};                                                                                          


void main()
{
	const int MIN=15, MAX=24;
	vectb t(MIN,MAX);
  
	int i;
	for (i=MIN ; i<=MAX ; i++) t[i] = i;
	for (i=MIN ; i<=MAX ; i++)
		cout << t[i] << ' ';
	cout << '\n';
}