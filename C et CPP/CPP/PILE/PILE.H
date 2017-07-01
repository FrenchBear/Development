// pile.h
// interface d'une structure pile d'entiers
// PV février 94

class pile_entier
{
    int *tiVal;
    int iTaille;
    int iSommet;
  
  public:
    pile_entier(int);
    pile_entier(pile_entier&);
    ~pile_entier();
    void empile(int);
    int depile();
    int pleine();
    int vide();
    void affiche() const;
    
    pile_entier& operator<(int);
    pile_entier& operator>(int &);
    
    friend ostream& operator<<(ostream& os, pile_entier& p);
};

