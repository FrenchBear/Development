#include <iostream.h>
#include <stdio.h>

void PlantePointeur()
{
  char *p = (char *)0xB8000000;
  *p = 'A';
}

void PlanteDivision()
{
  int i;

  for (i=-10 ; i<10 ; i++)
  {
	if (0==i) throw 1;
	double inv = 1.0/i;
	cout << "inv(" << i << "): " << inv << endl;
  }
}


void PlantePile()
{
  char p[1000];

  PlantePile();
}


void Proc()
{
  cout << "Début Proc !\n";

  try
  {
    PlantePile();
  }
  catch(int i)
  {
    cout << "Catch proc " << i << endl;
  }

  cout << "Fin Proc !\n";
}

typedef __int64 int64;

int main()
{
  cout << "Début main !\n";

  int i;
  int64 il;
  for (i=0 ; i<64 ; i++)
  {
    il = ((int64)1)<<i;;
    printf("%2d: %I64d\n", i, il);
  }

  try
  {
	Proc();
  }
  catch(...)
  {
    cout << "Catch main ...\n";
  }

  cout << "Fin main !\n";
  return 0;
}
