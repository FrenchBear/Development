
#include <iostream.h>

class vecteur
{
    double tx[3];
    
  public:
    vecteur(double x0=0, double y0=0, double z0=0) {tx[0]=x0; tx[1]=y0; tx[2]=z0; }
    void affiche() {cout << "Vecteur: " << tx[0] << ' ' << tx[1] << ' ' << tx[2] << '\n'; }
};                                                                                          

class matrice
{
    double txy[3][3];
    
  public:
    matrice(double x00=0, double x01=0, double x02=0,
            double x10=0, double x11=0, double x12=0,
            double x20=0, double x21=0, double x22=0)
    { txy[0][0]=x00; txy[0][1]=x01; txy[0][2]=x02;
      txy[1][0]=x10; txy[1][1]=x11; txy[1][2]=x12;
      txy[2][0]=x20; txy[2][1]=x21; txy[2][2]=x22;
    }
    void affiche()
    { cout << "Matrice: " << txy[0][0] << ' ' << txy[0][1] << ' ' << txy[0][2] << '\n'
           << "         " << txy[1][0] << ' ' << txy[1][1] << ' ' << txy[1][2] << '\n'
           << "         " << txy[2][0] << ' ' << txy[2][1] << ' ' << txy[2][2] << '\n';
    }
};                                                                                          


void main()
{
  vecteur v(1,2,3);
  matrice m(1,2,3,4,5,6,7,8,9);
  
  v.affiche();                                                            
  m.affiche();
}