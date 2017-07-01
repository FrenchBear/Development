// nio.cpp
// Essais de surcharge d'op‚rateur, 
// manipulateurs avec et sans paramŠtres
// PV 21/01/94, 23/01/94

#include <stdio.h>

class Ecran
{
  public:
    Ecran();
    Ecran& operator<<(char *msg);
    Ecran& operator<<(int i);
    Ecran& operator<<(char c);
    Ecran& operator<<( Ecran& (*f)(Ecran& e) );

  private:
    int gras;
};
         
         
Ecran::Ecran()
{
  gras = 0;
}
         
         
Ecran& Ecran::operator<<(char *msg)
{
  printf("%s", msg);
  return *this;
}
    
Ecran& Ecran::operator<<(int i)
{
  printf("%d", i);
  return *this;
}
    
Ecran& Ecran::operator<<(char c)
{
  printf("%c", c);
  return *this;
}

Ecran& Ecran::operator<<( Ecran& (*f)(Ecran& e) )
{
  return (*f)(*this);
}


Ecran e;
  
Ecran& space(Ecran &ec)
{
  return ec << ' ';
}                             

int source_serie;

class Ecran_int
{
  public:
    Ecran_int(Ecran& (*f)(Ecran &,int), int n)
    { 
#ifdef TEST
      serie = ++source_serie;
      printf("<Constructeur Ecran_int %d>", serie);
#endif
      _f = f;
      _n = n;
    }

    ~Ecran_int()
    {
#ifdef TEST
      printf("<Destructeur ~Ecran_int %d>", serie);
#endif
    }

    friend Ecran& operator<<(Ecran& e, const Ecran_int& ei)
    {
#ifdef TEST
      printf("<Op‚rateur<<(Ecran_int) %d>", ei.serie);
#endif
      return (*ei._f)(e, ei._n);      
    }
    
  private:
    Ecran& (*_f)(Ecran&,int);
    int _n;
#ifdef TEST
    int serie;
#endif
};

Ecran& nsp(Ecran &ec, int nb)
{
  while (nb--)
    ec << ' ';
  return ec;
}

Ecran_int space(int n)
{
  return Ecran_int(nsp, n);
}

void main()
{
  printf("Début du main\n");
  e << "Hello" << space << "world" << space(5) << '!' << '\n';
  printf("Fin du main\n");
}
