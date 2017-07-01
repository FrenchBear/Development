// fopt.h
// Interface de la feuille des options de l'‚diteur simple
// 20/01/95 PV

struct DataOpt              // Struct d'E/S pour la grille
{
  int   bAffEOL;            // Affichage des fins de ligne
  int   bAffTab;            // Affichage des tabulations
  int   bWordWrap;          // Retour … la ligne automatique
  int   bVScroll;           // Barre de d‚filement verticale
  int   bAffLC;             // Affichage d'une ligne d'‚tat
  int   iTabSize;           // Taille d'une tabulation
} dOpt;

int bDoFormOptions();
