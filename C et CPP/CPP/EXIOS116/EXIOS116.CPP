#include <iostream.h>

void main()
{
  char line[100], ch=0, *cp;
  cout << " Entrez une ligne termin‚e par un 'x'\n>";
  cp = line;
  while (ch != 'x')
  {
    cin >> ch;
    if (!cin.good()) break;
    *cp++ = ch;
  }
  *cp = 0;
  cout << ' ' << line;

  cin.seekg(0L, ios::end);
  cout << "\n Essayez une deuxiŠme fois\n>";
  cp = line;
  ch = 0;
  while (ch!='x')
  {
    cin.get(ch);
    if (!cin.good()) break;
    *cp++ = ch;
  }
  *cp = 0;
  cout << ' ' << line;
}
