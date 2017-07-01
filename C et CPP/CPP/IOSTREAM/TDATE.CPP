
#include <iostream.h>
#include <iomanip.h>

class Date
{ public:
    Date(int j0, int m0, int a0);       // constructeur
    friend ostream& operator<<(ostream& s, const Date &da);
    friend istream& operator>>(istream& s, Date &da);

  private:
    int j,m,a;
} ;

Date::Date(int j0, int m0, int a0)
{ j = j0; 
  m = m0; 
  a = a0; 
}

ostream &operator<<(ostream &s, const Date &da)
{
  s.fill('0');
  s << setw(2) << da.j << '/' 
    << setw(2) << da.m << '/' 
    << da.a;
  s.fill(' ');
  return s;
}

istream &operator>>(istream &s, Date &da)
{
  da = Date(26,2,65);
  return s;
}

void main()
{
  Date da(20, 1, 1994);
  cout << "Date 1: " << da << endl;

  cin >> da;
  cout << "Date 2: " << da << endl;
}
