// frepl.h
// Interface de la feuille de remplacement de l'éditeur simple
// 17/11/94 PV

struct DataRepl				// Struct d'E/S pour la grille
{
  char	szFind[61];
  char	szRepl[61];
  int	bDiffMajMin;
} dRepl;

int iDoFormRepl();
