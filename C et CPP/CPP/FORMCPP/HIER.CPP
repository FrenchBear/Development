// Essai de hiérarchie

#include <stdio.h>

class point
{
protected:		// Membres accessibles aux classes dérivées
  int x;
  int y;
  
public:
  point (int x0=0, int y0=0)
  { printf("Construction d'un point à partir de 2 entiers (%d,%d) à l'adresse %p\n", x0, y0, this);
    x = x0;
    y = y0;
  }
  
  ~point()
  { printf("Destruction du point à l'adresse %p\n", this);
  }
  
  void affiche()
  { printf("Coucou, je suis un point aux coordonnées (%d,%d) à l'adresse %p\n", x, y, this);
  }
  
  inline int abcisse()  { return x; }
  inline int ordonnee() { return y; }
  inline void affecte(int x0, int y0) { x=x0; y=y0; }
  
  virtual void sauve()
  { printf("Sauve point (%d,%d)\n", x, y);
    printf("Ecriture dans le flot de sauvegarde de 2 entiers %d et %d\n", x, y);
  }
  
};


// Fonction utilitaire qui va avec la classe point
void archivage(point &p)
{
  printf("Début de la sauvegarde: on ouvre le fichier\n");
  p.sauve();
  printf("Fin de la sauvegarde: on ferme le fichier\n");
}


//========================================================================

// Une classe qui utilise la classe point
// Utilisation emboîtée
class cercle
{
  int   rayon;
  point centre;
  
public:
  
  cercle(int x0=0, int y0=0, int r0=1)
  {
    // On a déjà appelé le constructeur par défaut pour le centre
    printf("Création d'un cercle à partir de 3 entiers (%d,%d,%d) à l'adresse %p\n", x0, y0, r0);
    centre.affecte(x0,y0);
    rayon = r0;
  }
  
  ~cercle()
  { printf("Destruction du cercle à l'adresse %p\n", this);
  }
  
  
  void affichecercle()
  { printf("Coucou, je suis un cercle de rayon %d aux coordonnées (%d,%d) à l'adresse %p\n", rayon, centre.abcisse(), centre.ordonnee(), this);
  }
  
  // On sous-traite l'affichage du centre cercle à la méthode point
  void affichepoint()
  { centre.affiche();
  }
};


//========================================================================

// Dérivation d'un point:
// Un point en couleur
// = un point et de la couleur en plus

class pointcouleur: public point
{
  int coul;
  
public:
  pointcouleur(int x0=0, int y0=0, int c0=0)
  : point(x0,y0)  // La partie point sait s'initialiser -> on fait appel a constructeur
  {
    printf("Création d'un point en couleur à partir de 3 entiers (%d,%d,%d) à l'adresse %p\n", x0, y0, c0);
    coul = c0;
  }
  
  ~pointcouleur()
  { printf("Destruction du point en couleur à l'adresse %p\n", this);
  }
  
  
  void afficheencouleur()
  { printf("Coucou, je suis un point de couleur %d aux coordonnées (%d,%d) à l'adresse %p\n", coul, this->abcisse(), this->ordonnee(), this);
  }
  
  virtual void sauve()
  { printf("Sauve pointcouleur (%d,%d,%d)\n", x, y, coul);
    point::sauve();		// On appelle "manuellement" la fonction sauve de la classe point
    printf("Ecriture dans le flot de sauvegarde de 1 entier %d\n", coul);
  }
};



int main()
{
  point p(2,3);
  cercle c(1,1,2);
  
  printf("=================================\n");
  
  p.affiche();
  c.affichecercle();
  c.affichepoint();
  
  printf("=================================\n");

  pointcouleur pc(3,2,15);
  pc.afficheencouleur();
  pc.affiche();

  printf("=================================\n");
  
  archivage(pc);
  
  return 0;
}

