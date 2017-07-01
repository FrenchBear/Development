#include <windows.h>
#include <iostream.h>

int main()
{
  int i;

  for (i=128 ; i<256 ; i++)
  {
	  char szBuffer[2];
	  szBuffer[0] = i;
	  szBuffer[1] = 0;
	  OemToChar(szBuffer, szBuffer);

	  cout << '"' << i << "\"=\"" << (int)(unsigned char)(szBuffer[0]) << "\"\n";
  }
  return 0;
}