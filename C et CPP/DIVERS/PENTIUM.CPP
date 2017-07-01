#include <iostream.h>

const double a = 4195835.0;
const double b = 3145727.0;

main()
{
   cout << "Pentium test..." << endl;

   int i = (int) (a - (a/b) * b);

   if (i == 0)
      cout << "okay" << endl;
   else if (i == 256)
      cout << "we have a problem" << endl;
   else
      cout << "something unexpected happened" << endl;

   return 0;
}
