
#include <iostream.h>
#include <fstream.h>

void main()
{
  ifstream f;
  char szBuffer[100];

  f.open("F1");
  if (f.is_open())
  {
    while (f.good())
    {
      f.getline(szBuffer,100);
      cout << '<' << szBuffer << '>' << f.eof() << endl;
    }
    f.close();
  }
}
