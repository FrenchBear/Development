// Carre55.h: interface for the Carre55 class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_CARRE55_H__2480A265_9CFB_11D2_8D8E_0060086AA0DA__INCLUDED_)
#define AFX_CARRE55_H__2480A265_9CFB_11D2_8D8E_0060086AA0DA__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class Carre55  
{
public:
  char	tMotif[5][5];
  int	lmax, cmax;		// Encombrement de la pièce
  int	iOffsetCol;		// Décalage de colonne pour occuper la cellule [0][0]


  Carre55()
  {
	int l, c;
	for (l=0 ; l<5 ; l++)
	  for (c=0 ; c<5 ; c++)
		tMotif[l][c] = 0;
	lmax = cmax = 0;
	iOffsetCol = 0;
  }

  Carre55(int i00, int i01, int i02, int i03, int i04,
	      int i10, int i11, int i12, int i13, int i14,
		  int i20, int i21, int i22, int i23, int i24)
  {
	tMotif[0][0] = i00; tMotif[0][1] = i01; tMotif[0][2] = i02; tMotif[0][3] = i03; tMotif[0][4] = i04;
	tMotif[1][0] = i10; tMotif[1][1] = i11; tMotif[1][2] = i12; tMotif[1][3] = i13; tMotif[1][4] = i14;
	tMotif[2][0] = i20; tMotif[2][1] = i21; tMotif[2][2] = i22; tMotif[2][3] = i23; tMotif[2][4] = i24;
	tMotif[3][0] = 0;   tMotif[3][1] = 0;   tMotif[3][2] = 0;   tMotif[3][3] = 0;   tMotif[3][4] = 0;
	tMotif[4][0] = 0;   tMotif[4][1] = 0;   tMotif[4][2] = 0;   tMotif[4][3] = 0;   tMotif[4][4] = 0;

	lmax = 3;
	if (i20+i21+i22+i23+i24==0) lmax = 2;
	if (i10+i11+i12+i13+i14==0) lmax = 1;

	cmax = 5;
	if (i04+i14+i24==0) cmax = 4;
	if (i03+i13+i23==0) cmax = 3;
	if (i02+i12+i22==0) cmax = 2;
	if (i01+i11+i21==0) cmax = 1;

	MkOffset();
  }


  // Détermine la propriété iOffsetCol, c'est à dire le nombre de colonnes qu'il
  // faut translater le dessin à gauche pour occuper la cellule [0][0]
  void MkOffset()
  {
	if (tMotif[0][0])
	  iOffsetCol = 0;
	else if (tMotif[0][1])
	  iOffsetCol = 1;
	else if (tMotif[0][2])
	  iOffsetCol = 2;
	else if (tMotif[0][3])
	  iOffsetCol = 3;
	else
	  iOffsetCol = 4;
  }


  // Opérateur de comparaison
  int operator == (const Carre55 &k)
  {
    return lmax==k.lmax && cmax==k.cmax &&
	  tMotif[0][0]==k.tMotif[0][0] && tMotif[0][1]==k.tMotif[0][1] && tMotif[0][2]==k.tMotif[0][2] && tMotif[0][3]==k.tMotif[0][3] && tMotif[0][4]==k.tMotif[0][4] &&
	  tMotif[1][0]==k.tMotif[1][0] && tMotif[1][1]==k.tMotif[1][1] && tMotif[1][2]==k.tMotif[1][2] && tMotif[1][3]==k.tMotif[1][3] && tMotif[1][4]==k.tMotif[1][4] &&
	  tMotif[2][0]==k.tMotif[2][0] && tMotif[2][1]==k.tMotif[2][1] && tMotif[2][2]==k.tMotif[2][2] && tMotif[2][3]==k.tMotif[2][3] && tMotif[2][4]==k.tMotif[2][4] &&
	  tMotif[3][0]==k.tMotif[3][0] && tMotif[3][1]==k.tMotif[3][1] && tMotif[3][2]==k.tMotif[3][2] && tMotif[3][3]==k.tMotif[3][3] && tMotif[3][4]==k.tMotif[3][4] &&
	  tMotif[4][0]==k.tMotif[4][0] && tMotif[4][1]==k.tMotif[4][1] && tMotif[4][2]==k.tMotif[4][2] && tMotif[4][3]==k.tMotif[4][3] && tMotif[4][4]==k.tMotif[4][4];
  }

  // Transformations
  int TL(int iT, int l, int c);
  int TC(int iT, int l, int c);
  Carre55 Transformation(int iT);

  void Dessin();
};

#endif // !defined(AFX_CARRE55_H__2480A265_9CFB_11D2_8D8E_0060086AA0DA__INCLUDED_)
