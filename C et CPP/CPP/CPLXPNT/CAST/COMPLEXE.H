// cplx.h
// Interface de la classe complexe
// PV 12/02/1994

class point;

class complexe
{
    double reel,imag;
    int nc;

  public:
    complexe(double r=0, double i=0);
    complexe(complexe& c0);              
    complexe& operator=(const complexe&);
    ~complexe();

    friend ostream& operator<<(ostream& os, const complexe& c);
};     
