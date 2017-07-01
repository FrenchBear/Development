#include <iostream.h>
#include <iomanip.h>

int main()
{
  int i,j;

  for (i=2 ; i<16 ; i++)
  {
    cout << setw(3) << (i<<4) << ": ";
    for (j=0 ; j<16 ; j++)
      cout << char((i<<4)+j) << ' ';
    cout << '\n';
  }

  return 0;
}
