// tgerme.ec
// Test du module germe.ec

#include <stdio.h>
#include <esqlc.h>

char szNomApp[] = "tgerme";

main()
{
  int	iGerme;
  char	szGerme[50];

  $database ercem;
  CTRLSQL;

  ger_iLitGermes(0);
  while ((iGerme=ger_iLitGermes(1))>=0)
  { ger_LitLibGerme(iGerme, 'F', szGerme, sizeof(szGerme));
	printf("Germe %d: %s\n", iGerme, szGerme);
  }

}
