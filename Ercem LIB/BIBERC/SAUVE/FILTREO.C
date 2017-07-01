
/* filtreo.c
** Remplace les o accent circonflexe par des o simples dans la chaŒne
** point‚e, ‚tant donn‚ qu'ils plantent cu...
**
** PV septembre 92
*/

char *szFiltreO(s)
char *s;
{
  unsigned char *p = s;
  unsigned char c;

  while (c = *p)
  { if (c==128+19) *p='o';
    p++;
  }

  return s;
}

