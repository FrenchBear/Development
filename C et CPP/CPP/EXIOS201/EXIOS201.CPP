#include <iostream.h>
#include <iomanip.h>

ostream& fb( ostream& os, int l )
{
  while (l-->0)
    os << ' ';
  return os;
}

OMANIP(int) fillblank(int l)
{
  return OMANIP(int) (fb,l);
}

void main()
{
  cout << "Et voici 10 espaces" << fillblank(10) << ".\n";
}
