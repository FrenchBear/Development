// listch.cpp
// Classe abstraite: liste chaînée
// 20/02/94 PV

#include <iostream.h>


struct element
{
  element *suiv;
  void		*contenu;
};

class liste
{
		element *debut;
		element *courant;
	public:
		liste()
		{	debut = courant = NULL;
		}                        
		
		~liste()
		{ element *e, *f;
			for (e=debut ; e!=NULL ; e=f)
			{ f = e->suiv;
				delete e;
			}
		}
		
		void ajoute(void *c)
		{
			element *e = new element;
			e->contenu = c;
			e->suiv = debut;
			debut = e;
		}           
		
		void *premier()
		{
		  courant = debut;
		  return courant->contenu;
		}                        
		
		void *suivant()
		{
			if (courant!=NULL)
				courant = courant -> suiv;
		  return courant->contenu;
		}
		
		int fini()
		{
			return courant==NULL;
		}
};


void main()
{
	liste l;
	
	l.ajoute("Quatre");
	l.ajoute("Trois");
	l.ajoute("Deux");
	l.ajoute("Un");
	
	char *p;
	for (p=(char *)l.premier() ; !l.fini() ; p=(char *)l.suivant())
	  cout << p << '\n';
}
