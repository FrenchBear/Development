
#include <stdio.h>


class complexe
{
private:
  int x;
  int y;

public:  
  complexe(int x0 = 0, int y0 = 0)
  {
    printf("Construction d'un complexe à partir de 2 entiers (%d,%d) à l'adresse %p\n", x0, y0, this);
    x = x0;
    y = y0;
  }
  
  complexe(complexe &c0)
  {
    printf("Construction d'un complexe à partir du complexe adresse %p (%d,%d) à l'adresse %p\n", &c0, c0.x, c0.y, this);
    x = c0.x;
    y = c0.y;
  }

  ~complexe()
  {
    printf("Destruction d'un complexe %p\n", this);
  }
  
  int carremodule()
  {
    return x*x + y*y;
  }
  
  int abcisse()  { return x; }
  int ordonnee() { return y; }
  
  friend complexe sommec(complexe &a, complexe &b);

  // Fonction membre
  complexe sommedyssimetrique(complexe &b)
  {
    complexe s;
    
    s.x = x + b.x;
    s.y = y + b.y;
    return s;
  }
  
  // Opérateur + (fonction membre)
  complexe operator +(complexe &b)
  {
    complexe s;
    
    s.x = x + b.x;
    s.y = y + b.y;
    return s;
  }

};


// Fonction amie
complexe sommec(complexe &a, complexe &b)
{
  complexe s;
  s.x = a.x + b.x;
  s.y = a.y + b.y;
  return s;
}


// Fonction banale
complexe sommecomplexe(complexe &a, complexe &b)
{
  complexe s(a.abcisse()+b.abcisse(), a.ordonnee()+b.ordonnee());
  return s;
}


int main()
{
  int m;
  complexe c1(4,2);
  complexe c2(-2,3);
  complexe c;

  m = c1.carremodule();
  printf("Le carré du module de c1 est %d\n", m);
  
  c = sommecomplexe(c1,c2);
  printf("c1+c2: (%d,%d)\n", c.abcisse(), c.ordonnee());
  
  c = sommec(c1,c2);
  printf("c1+c2: (%d,%d)\n", c.abcisse(), c.ordonnee());
  
  c = c1.sommedyssimetrique(c2);
  printf("c1+c2: (%d,%d)\n", c.abcisse(), c.ordonnee());
  
  c = c1+c2;
  printf("c1+c2: (%d,%d)\n", c.abcisse(), c.ordonnee());
  
  c = c1.operator +(c2);
  printf("c1+c2: (%d,%d)\n", c.abcisse(), c.ordonnee());

//  c = c1+7;
//  printf("c1+7: (%d,%d)\n", c.abcisse(), c.ordonnee());
  
  return 0;
}
