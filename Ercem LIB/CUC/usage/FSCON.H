// fscon.h
// Interface de la feuille de saisie des conclusions

struct DataScon				// Struct d'E/S pour la grille
{
  int	iConclusion;
  int	iCPrin;
  int	iConclInfo;			// Conclusion calcul‚e
  int	iCPInfo;
  char	szConclusion[65];
} dScon;					// dialogue de saisie de conclusion

