
#include <iostream.h>        
#include <stdio.h>
#include <string.h>

class objet
{
    char szNom[10];
    int  iVal;
    static int iNbObjet;
    
  public:
    objet(char *nom, int i=0)
    { strcpy(szNom, nom);       
      iVal = i;
      cout << "Constructeur        " << *this << endl;
    }                                      
    
    objet()
    { szNom[0]='t';
      sprintf(szNom+1, "%d", ++iNbObjet);
      iVal = 0;
      cout << "Constructeur base   " << *this << endl;
    }        
    
    objet(const objet &o)
    { szNom[0]='t';
      sprintf(szNom+1, "%d", ++iNbObjet);
      iVal = o.iVal;                              
      cout << "Constructeur copie  " << o << " -> " << *this << endl;
    }
    
    objet& operator=(const objet &o)
    { cout << "Opérateur =         " << o << " -> " << *this << endl;
      iVal = o.iVal;
      return *this;
    }
    
    ~objet()
    { cout << "Destruction         " << *this << endl;
      szNom[0] = '~';
    }
    
    friend objet operator+(const objet& o1, const objet& o2);
    friend ostream& operator<<(ostream& os, const objet& ob);

};                     

int objet::iNbObjet = 0;

objet operator+(const objet& o1, const objet& o2)
{ objet somme("somme");
  cout << "Opérateur +         " << o1 << " + " << o2;
  somme.iVal = o1.iVal+o2.iVal;
  cout << " -> " << somme << endl;
  return somme;
}


ostream& operator<<(ostream &os, const objet& ob)
{
  os << ob.szNom << '(' << ob.iVal << ')';
  return os;
}



void main()
{    
  objet un("un",1);
  objet deux("deux",2);
  objet trois("trois",3);
  
  objet total("total");
  total = un + deux + trois;
  cout << "*** Fin de main\n";
}