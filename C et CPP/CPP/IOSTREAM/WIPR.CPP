
#include <iostream.h>
#include <iomanip.h>

ostream &wipr(ostream &s, int w, int p)
{
  s << setw(w) << setprecision(p);
  return s;
}

ostream &right(ostream &s)
{
  s << resetiosflags(ios::left) << setiosflags(ios::right);
  return s;
}

void main()
{
  cout << setiosflags(ios::fixed)
       << 123.43 << endl
       << setw(10) << 123.43 << endl
       << setw(10) << setprecision(1) << 123.43 << endl
       << 123.43 << endl
       << setw(10) << right << 123.43 << endl;
}
