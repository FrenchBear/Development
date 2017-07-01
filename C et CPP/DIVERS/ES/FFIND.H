// ffind.h
// Interface de la feuille de recherche de l'éditeur simple
// 17/11/94 PV

struct DataFind				// Struct d'E/S pour la grille
{
  char	szFind[61];
  int	bDiffMajMin;
} dFind;

int bDoFormFind();
