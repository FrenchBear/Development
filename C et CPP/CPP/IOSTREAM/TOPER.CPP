
#include <iostream.h>
#include <iomanip.h>

ostream &right(ostream &s)
{
  s << resetiosflags(ios::left) << setiosflags(ios::right);
  return s;
}

void main()
{
  cout << setw(20) << right << 1234 << endl;
}
