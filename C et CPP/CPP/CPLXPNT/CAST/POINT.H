// point.h
// Interface de la classe point
// 12/02/94 PV          

class complexe;

class point
{
    int x,y;
    int np;

  public:
    point(int x0=0, int y0=0);
    point(point& p0);
    ~point();
    operator complexe();

    friend ostream& operator<<(ostream& os, point& p);
};     

