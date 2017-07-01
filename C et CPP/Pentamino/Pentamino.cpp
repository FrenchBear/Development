// pentamino.cpp
// Résolution de problèmes de pentaminos (pavage)
// 26/12/1998 PV

#include "stdafx.h"
#include <time.h>
#include <memory.h>

const int MAXLIG=12;
const int MAXCOL=5;
const int MAXPIECE=12;

#include "Carre55.h"
#include "Piece.h"

int iNbSol = 0;
int iNbAppelPavage = 0;


// Plan de jeu
typedef char Jeu[MAXLIG][MAXCOL];

// Tableau de pointeurs sur les pentaminos à utiliser pour le problème
Piece *tP[MAXPIECE];


#pragma inline_recursion(on)
#pragma inline_depth(12)

void __inline Pavage(int lstart, int cstart, Jeu &jeu, int iMasquePieces)
{
  int l, c;
  int bTrouve = FALSE;

  iNbAppelPavage++;

  // On cherche une case vide à couvrir, de gauche à droite, de haut en bas
  for (l=0 ; l<MAXLIG; l++)
  {
	for (c=0 ; c<MAXCOL ; c++)
	{
	  if (l==0 && c==0)	  // Accélération, on part de la dernière case vide trouvée
	  { l = lstart;
		c = cstart;
	  }

	  if (jeu[l][c]==0)
	  { bTrouve = TRUE;
		break;
	  }
	}
	if (bTrouve)
	  break;
  }

  // Si on n'en a pas trouvé, c'est que le pavage est terminé !
  if (l==MAXLIG && c==MAXCOL)
  {
	iNbSol++;
	printf("Solution %d\n", iNbSol);
/*
	for (l=0 ; l<MAXLIG; l++)
	{
	  for (c=0 ; c<MAXCOL ; c++)
		printf("%2d", tP[jeu[l][c]-1]->hNumPiece);
	  printf("\n");
	}

	FILE *f = fopen("Solution pentamino.txt", "a");
	fprintf(f, "Solution %d trouvée:\n", iNbSol);
	for (l=0 ; l<MAXLIG; l++)
	{
	  for (c=0 ; c<MAXCOL ; c++)
		fprintf(f, "%2d", tP[jeu[l][c]-1]->hNumPiece);
	  fprintf(f, "\n");
	}
	fclose(f);
*/
	return;
  }

  // On cherche parmi toutes les pieces qui restent une pièce pour couvrir la case vide
  int i, j;
  for (i=0 ; i<MAXPIECE ; i++)
	if (iMasquePieces & (1<<i))
	  for (j=0 ; j<tP[i]->iNbt ; j++)	// Pour chacune des transformations
	  {
		Carre55 &ca = tP[i]->c[j];
		int l2, c2;
		int bCollision;

		int bContinue=FALSE;
		if (c+ca.cmax-ca.iOffsetCol>MAXCOL || // Trop large
		    l+ca.lmax>MAXLIG ||				  // Trop haut
		    c<ca.iOffsetCol)				  // Doit être décalée trop à gauche
		  continue;

		bCollision = FALSE;
		for (l2=0 ; l2<ca.lmax ; l2++)
		{
		  for (c2=0 ; c2<ca.cmax ; c2++)
			if (ca.tMotif[l2][c2] && jeu[l+l2][c+c2-ca.iOffsetCol])  // Case déjà occupée
			{ bCollision = TRUE;
			  break;
			}
		  if (bCollision)
			break;
		}

		if (!bCollision)
		{
		  // Pièce valable ! On la place
		  Jeu jeu2;
		  memcpy(jeu2, jeu, sizeof(Jeu));

		  for (l2=0 ; l2<ca.lmax ; l2++)
			for (c2=0 ; c2<ca.cmax ; c2++)
			  if (ca.tMotif[l2][c2]) jeu2[l+l2][c+c2-ca.iOffsetCol] = i+1;

		  // On continue avec les pièces qui restent
		  Pavage(l, c, jeu2, iMasquePieces & ~(1<<i));
		}
	  }
}


int main(int argc, char* argv[])
{
  // Préparation des pièces
  Piece P1(1,  'I', 1,1,1,1,1,0,0,0,0,0,0,0,0,0,0);
  Piece P2(2,  'L', 1,1,1,1,0,0,0,0,1,0,0,0,0,0,0);
  Piece P3(3,  'Y', 1,1,1,1,0,0,0,1,0,0,0,0,0,0,0);
  Piece P4(4,  'N', 1,1,1,0,0,0,0,1,1,0,0,0,0,0,0);
  Piece P5(5,  'V', 1,1,1,0,0,1,0,0,0,0,1,0,0,0,0);
  Piece P6(6,  'P', 1,1,1,0,0,1,1,0,0,0,0,0,0,0,0);
  Piece P7(7,  'U', 1,1,1,0,0,1,0,1,0,0,0,0,0,0,0);
  Piece P8(8,  'Z', 1,1,0,0,0,0,1,0,0,0,0,1,1,0,0);
  Piece P9(9,  'F', 1,1,0,0,0,0,1,1,0,0,0,1,0,0,0);
  Piece P10(10,'T', 1,1,1,0,0,0,1,0,0,0,0,1,0,0,0);
  Piece P11(11,'W', 1,1,0,0,0,0,1,1,0,0,0,0,1,0,0);
  Piece P12(12,'X', 0,1,0,0,0,1,1,1,0,0,0,1,0,0,0);

/*
  P1.Dessin();
  P2.Dessin();
  P3.Dessin();
  P4.Dessin();
  P5.Dessin();
  P6.Dessin();
  P7.Dessin();
  P8.Dessin();
  P9.Dessin();
  P10.Dessin();
  P11.Dessin();
  P12.Dessin();
  getchar();
*/

  if (MAXLIG*MAXCOL!=5*MAXPIECE)
  {	printf("Constantes MAXLIG/MAXCOL/MAXPIECE incohérentes !\n");
	return 1;
  }
  
  // Plan à paver
  Jeu j;
  int l,c;
  for (l=0 ; l<MAXLIG ; l++)
	for (c=0 ; c<MAXCOL ; c++)
	  j[l][c] = 0;

  // Pieces a utiliser
  tP[0] = &P2;
  tP[1] = &P3;
  tP[2] = &P6;
  tP[3] = &P11;
  tP[4] = &P8;
  tP[5] = &P4;
  tP[6] = &P5;
  tP[7] = &P10;
  tP[8] = &P9;
  tP[9] = &P1;
  tP[10] = &P7;
  tP[11] = &P12;

  // De façon à éliminer les solutions symétriques, on n'autorise que 2 transformations
  // pour la première pièce qui en compte 8
  int i;
  for (i=0 ; i<MAXPIECE ; i++)
	if (tP[i]->iNbt==8)
	{ tP[i]->iNbt = 2;
	  break;
	}
  if (i==MAXPIECE)
	printf("Attention, les solutions identiques par rotation/symétrie ne sont pas éliminées\n");

  unlink("Solution pentamino.txt");	  // On efface le fichier des solutions

  time_t t0 = time(0L);
  Pavage(0, 0, j, (1<<MAXPIECE)-1);
  time_t t1 = time(0L);

  printf("%ds pour %d solutions\n", t1-t0, iNbSol);
  printf("%d appels à Pavage\n", iNbAppelPavage);
  getchar();

  return 0;
}

