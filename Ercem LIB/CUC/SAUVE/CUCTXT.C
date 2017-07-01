/* cuctxt.c
** Impl‚mentation du contr“le TextEdit de la bibliothŠque CUC
** 07/06/94 FG
** 27/10/94 FG	Correction bugs aff scrollbars, word wrap
**  5/12/94 FG	Propri‚t‚ CUCP_LENGTH
**
** Les fonctions et variables non d‚clar‚es dans l'interface
** doivent imp‚rativement ˆtre d‚clar‚es et static
*/

#include <stdio.h>
#include <curses.h>
#include <memory.h>
#include <ctype.h>

#include <clib.ref>
#include <biberc.h>

#include "cuc.h"
#include "cucpriv.h"
#include "import.h"

/*
#define TEST
*/

#define HSCROLL	1
#define VSCROLL	2


static char szNomClasse[] = "CUC TextEdit";
static char szNomType[]   = "TXT";
static UC	*szSelText = NULL;
static int	iSupprCar = 0;
static int	iLastCar, iLastPos=0;

// Cette d‚finition n'est connue que pour les fonctions de ce fichier
struct CUC_TextEdit
{
  char	szType[4];		// Pour des contr“les internes (TXT)

  int	iEnabled;		// Vrai si le contr“le doit r‚agir
  int	iVisible;		// Vrai si le contr“le est affich‚
  int	iHasFocus;		// Vrai si le contr“le a le focus

  WINDOW *wDisp;		// Fenˆtre (curses) d'affichage du contr“le
  void	*IdBack;		// Identificateur de retour
  char	*szTag;			// Tag du contr“le
  void	*Parent;		// Pointeur sur un contr“le parent
  int	(*iRaiseEvent)(void *, int , int );	// Messages en retour

  int	iTop;			// Nø de ligne … l'‚cran, base 0
  int	iLeft;			// Nø de colonne … l'‚cran, base 0
  int	iWidth;			// Largeur du contr“le en colonnes
  int	iHeight;		// Hauteur du contr“le en lignes

  int	iTabStop;		// Arrˆt sur tabulation
  int	iTabSize;		// Valeur en nb d'espaces de la tab
  int	iAlignment;		// 0: gauche, 1: droite, 2: centr‚
  int 	iMultiLine;		// si vrai, retour … la ligne possible
  int	iScrollBars;	// 0: aucune, 1: horizontale, 2: verticale, 3:
  int	iStdAttrib;		// Attribut Standard du contr“le
  int	iAutoSize;		// taille ajust‚e … szText
  int	iBorderStyle;	// 0: non encadr‚, 1: encadr‚ simple, 2: double
						// !! encadr‚ si iHeight >= 3
  UC	*szText;		// Texte du contr“le

  int	iSelLength;		// longueur s‚lection dans la zone TextEdit
  int	iSelStart;		// Indice 1er car s‚lection
  int	iMaxLength;		// Nb car max du contr“le, 0 si infini
  int	iInsMode;		// Mode insertion

  int	iEol;			// EOL Char
  int	iEof;			// EOF Char

  // ParamŠtres priv‚s au contr“le
  int	iPosX;			// Position curseur ‚cran
  int	iPosY;			//
  int	iPosDebutLigne;	// Position 1er caractŠre ligne courante
  int	iPosFinLigne;	// Position dernier caractŠre ligne courante
  int	iPos0;			// Position 1er caractŠre dans szText
  int	iPos;			// Position caractŠre courant dans szText
  int	iOldPos;		// Position pr‚c‚dente dans szText
  int	iCol;			// Position colonne
  int	iColMax;		// Nb colonnes Max
  int	iLig;			// Position ligne
  int	iLigMax;		// Nb lignes Max
  int	iTailleDispo;	// Taille actuellement allou‚e pour szText
  int	ilTxt;			// Longueur du texte

  struct CUC_VScrollBar *pVSB;	// Barre de d‚filement verticale
  int	iVSB;			// Pr‚sence barre de d‚filement verticale
  struct CUC_HScrollBar *pHSB;	// Barre de d‚filement horizontale
  int	iHSB;			// Pr‚sence barre de d‚filement horizontale
};



/*====================================================================*/
// Efface completement le contr“le de l'‚cran (affiche des espaces)
// Ne gŠre pas le r‚affichage des ‚l‚ments qui pourraient se
// trouver derriŠre (en dessous)
static void Efface(struct CUC_TextEdit *pTXT)
{
  int i, j;

  if (iOkWDisp(pTXT->wDisp, szNomClasse, "Efface")<0) return;
  
  for (i=0 ; i<pTXT->iHeight ; i++)
    for (j=0 ; j<pTXT->iWidth ; j++)
      cmvwaddch(pTXT->wDisp, pTXT->iTop+i, pTXT->iLeft+j, ' ');
}

//====================================================================
// Affiche la barre de d‚filement verticale
static void AfficheVSB(struct CUC_TextEdit *pTXT)
{
  CUC_VScrollBarSetPropNum(pTXT->pVSB, CUCP_VISIBLE, FALSE);
  CUC_VScrollBarSetPropNum(pTXT->pVSB, CUCP_LEFT, pTXT->iLeft+pTXT->iWidth-1);
  CUC_VScrollBarSetPropNum(pTXT->pVSB, CUCP_TOP, pTXT->iTop+1);
  // CUC_VScrollBarSetPropNum(pTXT->pVSB, CUCP_WIDTH, 1);
  CUC_VScrollBarSetPropNum(pTXT->pVSB, CUCP_HEIGHT, pTXT->iHeight-2);
  CUC_VScrollBarSetPropNum(pTXT->pVSB, CUCP_MAX, pTXT->iLigMax/(pTXT->iHeight-2));
  CUC_VScrollBarSetPropNum(pTXT->pVSB, CUCP_VALUE, pTXT->iLig/(pTXT->iHeight-2));
  CUC_VScrollBarSetPropNum(pTXT->pVSB, CUCP_CSIZE, 1);
  CUC_VScrollBarSetPropNum(pTXT->pVSB, CUCP_VISIBLE, TRUE);
}

//====================================================================
// Affiche la barre de d‚filement horizontale
static void AfficheHSB(struct CUC_TextEdit *pTXT)
{
  CUC_HScrollBarSetPropNum(pTXT->pHSB, CUCP_VISIBLE, FALSE);
  CUC_HScrollBarSetPropNum(pTXT->pHSB, CUCP_LEFT, pTXT->iLeft+1);
  CUC_HScrollBarSetPropNum(pTXT->pHSB, CUCP_TOP, pTXT->iTop+pTXT->iHeight-1);
  // CUC_HScrollBarSetPropNum(pTXT->pHSB, CUCP_HEIGHT, 1);
  CUC_HScrollBarSetPropNum(pTXT->pHSB, CUCP_WIDTH, pTXT->iWidth-2);
  CUC_HScrollBarSetPropNum(pTXT->pHSB, CUCP_MAX, pTXT->iColMax/(pTXT->iWidth-2));
  CUC_HScrollBarSetPropNum(pTXT->pHSB, CUCP_VALUE, pTXT->iCol/(pTXT->iWidth-2));
  CUC_HScrollBarSetPropNum(pTXT->pHSB, CUCP_CSIZE, 1);
  CUC_HScrollBarSetPropNum(pTXT->pHSB, CUCP_VISIBLE, TRUE);
}

//====================================================================
static void AfficheCurseur(struct CUC_TextEdit *pTXT)
{
  if (iOkWDisp(pTXT->wDisp, szNomClasse, "AfficheCurseur")<0) return;
  
  wmove(pTXT->wDisp, pTXT->iPosY, pTXT->iPosX);
}



//====================================================================
// Retourne la position du fin de la ligne … partir de iPos
static int iPosFinLigne(struct CUC_TextEdit *pTXT, int iPos)
{
  int iL;
  int i, i0;
  int iB, iBw;
  UC *p;
  int l;

  p = pTXT->szText;
  //l = p!=NULL?strlen(p):0;
  l = pTXT->ilTxt;

  iB = pTXT->iBorderStyle?1:0;
  if(pTXT->iHeight==2*iB || pTXT->iWidth ==2*iB) return(iPos);

  iBw = pTXT->iBorderStyle&&pTXT->iHeight==1?1:0;
  if(iBw) iB=0;

  if(pTXT->iMultiLine && !(pTXT->iScrollBars & HSCROLL))
  { // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	// cas 1: On est en multi-lignes
	// pas de scrollbar horizontale -> Word Wrap
	  int i0x=-1;
	  iL=0; i0=iPos;
	  for(i=iPos; i<=l; i++)
	  { // if(p[i]=='\t') i0 += pTXT->iTabSize-1;
		if(i==pTXT->iPos)
		{ i0x = i;
		  pTXT->iPosX = (i-i0) + pTXT->iLeft + iB + iBw;
		}
		if((i-i0) >= pTXT->iWidth-2*(iB+iBw) || p[i]=='\n')
		{ iL++;
		  if((i-i0) >= pTXT->iWidth-2*(iB+iBw))
		  {
			// si on est arrˆt‚ sur un ' ' ou un '\n' !!!!
			if(p[i]==' ' || p[i]=='\n') i--;
			for(i; i>iPos; i--)
			{ // Le mot est sur la ligne d'aprŠs
			  if(p[i]==' ' || p[i]=='\n') break;
			}
			//if(i<=iPos)
			  //for(i; i<=l; i++)
				//if(p[i]==' ' || p[i]=='\n') break;
		  }
		  i++;
		  i0 = i;
		  //if(p[i-1]=='\t') i0 += pTXT->iTabSize-1;
		}
		if(iL>=1) return(i-1);
	  }
  }
  else if(!pTXT->iMultiLine)
  { // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	// cas 2: Champ de saisie simple monoligne 
	// Texte sans word wrap->on tronque la ligne
	return(iPos);
  }
  else
  { // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	// cas 3: Texte sans word wrap multiline avec ScrollBar horizontale
	return(iPos);
  }
}



//====================================================================
// Retourne la position du d‚but de iNbLigne aprŠs iPos
// Pour avoir la position de la ligne nø iL :
// iPos = iPosDebutNbLigne(pTXT, 0, iLigne)
static int iPosDebutNbLigne(struct CUC_TextEdit *pTXT, int iPos, int iNbLigne)
{
  int iL;
  int i0;
  int iB, iBw;
  UC *p;
  int l;

  p = pTXT->szText;
  //l = p!=NULL?strlen(p):0;
  l = pTXT->ilTxt;

  iB = pTXT->iBorderStyle?1:0;
  if(pTXT->iHeight==2*iB || pTXT->iWidth ==2*iB) return(iPos);

  iBw = pTXT->iBorderStyle&&pTXT->iHeight==1?1:0;
  if(iBw) iB=0;

  if(pTXT->iMultiLine && !(pTXT->iScrollBars & HSCROLL))
  { // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	// cas 1: On est en multi-lignes
	// pas de scrollbar horizontale -> Word Wrap

	  int i0x=-1;
	  iL = 0; i0 = iPos;
	  while(i0<pTXT->ilTxt)
	  {
		if(iL>=iNbLigne) return(i0);
		i0 = iPosFinLigne(pTXT, i0);
//aprintf("iposdebl", "iPosFinLigne %d = %d", iL, i0);
		i0++;
		iL++;
	  }
	  return(i0);
  }
  else if(!pTXT->iMultiLine)
  { // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	// cas 2: Champ de saisie simple monoligne 
	// Texte sans word wrap->on tronque la ligne
	return(iPos);
  }
  else
  { // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	// cas 3: Texte sans word wrap multiline avec ScrollBar horizontale
	return(iPos);
  }
}





//====================================================================
// Redessine le texte du contr“le
static void AfficheTexte(struct CUC_TextEdit *pTXT)
{
  int i, iL=0, k, l;
  UC szLigne[81];
  UC szLigne2[81];
  UC *p;
  int iNbMots=0;
  int iB, iBw;
  int iSelStart, iSelLength;
  int affSel;					// indicateur affichage s‚lection
  static int iDecal;
  int iValidDebutLigne = 0;

  if (iOkWDisp(pTXT->wDisp, szNomClasse, "AfficheTexte")<0) return;

  iB = pTXT->iBorderStyle?1:0;
  if(pTXT->iHeight==2*iB || pTXT->iWidth ==2*iB) return;

  iBw = pTXT->iBorderStyle&&pTXT->iHeight==1?1:0;
  if(iBw) iB=0;

  if(pTXT->iPos >= pTXT->iSelStart)
  { iSelLength = pTXT->iSelLength;
	iSelStart = pTXT->iSelStart;
  }
  else
  { iSelLength = -pTXT->iSelLength; 
	iSelStart = pTXT->iPos;
  }

  if (!pTXT->iEnabled) wattron(pTXT->wDisp, DIMINUE);
  if(pTXT->iStdAttrib) wattron(pTXT->wDisp, pTXT->iStdAttrib);

  if(pTXT->szText==NULL)
  {
	pTXT->iPosX = pTXT->iLeft+iB+iBw;
	pTXT->iPosY = pTXT->iTop+iB;

	cmvwaddch(pTXT->wDisp, pTXT->iPosY, pTXT->iPosX, pTXT->iEof);
	if (!pTXT->iEnabled) wattroff(pTXT->wDisp, DIMINUE);
	if(pTXT->iStdAttrib) wattroff(pTXT->wDisp, pTXT->iStdAttrib);
	return;
  }

  p = pTXT->szText;
  //l = p!=NULL?strlen(p):0;
  l = pTXT->ilTxt;
  if(iSelLength > l) iSelLength = l;
  if(pTXT->iLig<0) pTXT->iLig = 0;
  if(pTXT->iLigMax<0) pTXT->iLigMax = 0;
  if(pTXT->iCol<0) pTXT->iCol = 0;
  if(pTXT->iColMax<0) pTXT->iColMax = 0;
  if(pTXT->iPos>l) pTXT->iPos=l;

  iValidDebutLigne = 0;



  // ScrollBars 0: aucune, 1: horizontale, 2: verticale, 3: double

  //if(pTXT->iMultiLine && pTXT->iScrollBars!=3 && pTXT->iScrollBars!=1)
  if(pTXT->iMultiLine && !(pTXT->iScrollBars & HSCROLL))
  { // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	// cas 1: On est en multi-lignes
	// pas de scrollbar horizontale -> Word Wrap
	int iPos=0;
	int j=0;
	int c, i0;
	int iL0;

	// V‚rif Pos0
	pTXT->iPosX = -1;
	// On recalcule la position du d‚but de la derniŠre ligne iL
	iPosDebutNbLigne(pTXT, pTXT->iPos0, (pTXT->iHeight-2*iB)-1);
//aprintf("cuctxt","aprŠs v‚rif iPos0=%d iPos=%d iPosFinL=%d iPosDl=%d iL=%d posx=%d", pTXT->iPos0, pTXT->iPos, pTXT->iPosFinLigne, pTXT->iPosDebutLigne, iL, pTXT->iPosX);

	// On recalcule Pos0
	iL0 = pTXT->iLig - pTXT->iHeight+iB*2 + 1;
	if(iL0<0) iL0 = 0;
	if(pTXT->iPosX==-1)
	{ // On se d‚place d'une ligne vers le bas
	  pTXT->iPos0 = iPosFinLigne(pTXT, pTXT->iPos0)+1;
	  // On v‚rifie si le curseur fait partie du bloc
	  iPosDebutNbLigne(pTXT, pTXT->iPos0, iL0);
	}

	if(pTXT->iPosX==-1)
	{
//aprintf("cuctxt", "Recal iL0=%d iPos0=%d iLig=%d iHei=%d",iL0, pTXT->iPos0, pTXT->iLig, pTXT->iHeight);
	  pTXT->iPos0 = iPosDebutNbLigne(pTXT, 0, iL0);
//aprintf("cuctxt", "Recal iL0=%d iPos0=%d",iL0, pTXT->iPos0);
	}

	if(pTXT->iPos0<0 || pTXT->iPos0>l) pTXT->iPos0 = 0;
	affSel=0; iPos=0; iL=0;
	// Les valeurs de d‚but && fin de ligne sont d‚j… correctes
	//if(pTXT->iPosDebutLigne==pTXT->iPos) iValidDebutLigne = 1;
    for(i=pTXT->iPos0; i<=l; i++)
	{
      /* Lecture ligne par ligne */
	  p = pTXT->szText;
	  szLigne[0] = 0;
	  if(!iValidDebutLigne || pTXT->iPos==i) pTXT->iPosDebutLigne = i;
//aprintf("cuctxt", "il=%d iPosDebutLigne=%d iValid=%d i=%d iPos=%d iPos0=%d",
//iL, pTXT->iPosDebutLigne, iValidDebutLigne, i, pTXT->iPos, pTXT->iPos0);
	  for(k=0; k<pTXT->iWidth-2*(iB+iBw); k++)
	  {
		szLigne[k] = p[i+k];
		if(!p[i+k]||p[i+k]=='\n') break;
	  }
	  if(p[i+k]=='\n') szLigne[k+1] = 0;
	  else szLigne[k] = 0;
	  i0 = k;
	  if(szLigne[0] && (int)strlen(szLigne) == pTXT->iWidth-2*(iB+iBw))
		for(k; k>0; k--) if(szLigne[k]==' ') break;
	  if(k) { szLigne[k+1] = 0; i+=k; }
	  else for(i; i<=l; i++) if(p[i]==' ' || p[i]=='\n') break;
	  if(!k && i>1 && i<l && p[i]!='\n') iPos += i-i0+1;
	  if(!iValidDebutLigne || pTXT->iPosFinLigne<pTXT->iPosDebutLigne)
	  { pTXT->iPosFinLigne = pTXT->iPosDebutLigne + strlen(szLigne)-1;
		if(i==l) pTXT->iPosFinLigne = l;
	  }
      if( szLigne[0] && ((int)strlen(szLigne)+2*(iB+iBw)) > pTXT->iWidth)
		szLigne[pTXT->iWidth>2?pTXT->iWidth-2*(iB+iBw):pTXT->iWidth] =0;
      szLigne2[0] = 0;
      if(pTXT->iAlignment==1) /* Alignement … droite */
      {
		if(szLigne[0] && pTXT->iWidth>((int)strlen(szLigne)+2*(iB+iBw)))
		sprintf(szLigne2,"%*c",pTXT->iWidth-2*(iB+iBw)-(int)strlen(szLigne),' ');
      }
      else if(pTXT->iAlignment==2) /* centr‚ */
      {
		if(szLigne[0] && pTXT->iWidth>((int)strlen(szLigne)+2*(iB+iBw)))
		sprintf(szLigne2,"%*c",(pTXT->iWidth-2*(iB+iBw)-strlen(szLigne))/2,' ');
      }

      strcat(szLigne2,szLigne);
	  // Affichage de la ligne
	  affSel=0;
	  p = szLigne2;
	  for(j=0; j<=(int)strlen(p); j++)
	  {
		if(iPos+pTXT->iPos0==pTXT->iPos)
		{ // Recup pos curseur
		  pTXT->iPosX = j + pTXT->iLeft + iB +iBw;
		  pTXT->iPosY = pTXT->iTop + iB + iL;
		  // On valide la position de d‚but de ligne
// aprintf("cuctxt", "i=%d ipos0=%d idebl=%d ipos=%d", i, pTXT->iPos0, pTXT->iPosDebutLigne, pTXT->iPos);
		  iValidDebutLigne = 1;
		}
		if(p!=NULL) c = p[j]!='\n'?(int)p[j]:pTXT->iEol;
		else c = 0;
		// Affichage S‚lection
		if(pTXT->iHasFocus && !affSel && iSelLength && iPos+pTXT->iPos0>=iSelStart)
		{ if(pTXT->iStdAttrib) wattroff(pTXT->wDisp, pTXT->iStdAttrib);
		  wattron(pTXT->wDisp, SOULIGNE);
		  affSel=1;
		}
		if(affSel && iPos+pTXT->iPos0>=(iSelStart+iSelLength))
		{ wattroff(pTXT->wDisp, SOULIGNE);
		  if(pTXT->iStdAttrib) wattron(pTXT->wDisp, pTXT->iStdAttrib);
		}

		if(j<(pTXT->iWidth-2*(iB+iBw)))
		  if(c)
		  {
			cmvwaddch(pTXT->wDisp, pTXT->iTop+iB+iL, pTXT->iLeft+iB+iBw+j, c);
			iPos++;
		  }
		  else if(i>=l)
			cmvwaddch(pTXT->wDisp, pTXT->iTop+iB+iL, pTXT->iLeft+iB+iBw+j, pTXT->iEof);
		// if(p[j]=='\n') iL++; iPos=0;
		// if(iL>=(pTXT->iHeight-2*iB)) break;
	  }
      iL++;
      if((iL+2*iB)>=pTXT->iHeight) break;
    } // for
	//if(pTXT->iPosFinLigne==pTXT->iPosDebutLigne) pTXT->iPosFinLigne++;
  }
  else if(!pTXT->iMultiLine)
  { // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	// cas 2: Champ de saisie simple monoligne 
	// Texte sans word wrap->on tronque la ligne
    int c,iPos=0;
	if(pTXT->iPos<=l && pTXT->iPos-pTXT->iOldPos>0 && pTXT->iPosX >= (pTXT->iLeft+pTXT->iWidth-iB-iBw-1))
	  pTXT->iPos0 += pTXT->iWidth/3;
	if(pTXT->iPos-pTXT->iOldPos && pTXT->iPosX<=(pTXT->iLeft+iB+iBw))
	  pTXT->iPos0 -= pTXT->iWidth/3+1;

	if( (!pTXT->iOldPos && pTXT->iPos>=l) ||
		(pTXT->iPos-pTXT->iPos0) > (pTXT->iWidth-2*(iB+iBw)))
	  pTXT->iPos0 = l-pTXT->iWidth+2*(iB+iBw)+1;

	if(pTXT->iPos0>pTXT->iPos) pTXT->iPos0 = pTXT->iPos;
	if(pTXT->iPos0<0) pTXT->iPos0 = 0;

    pTXT->iPosY = pTXT->iTop + iB;
	//pTXT->iCol = pTXT->iPosX-pTXT->iLeft-iB-iBw;
	pTXT->iColMax = l;

	/* Affichage */
	affSel=0;
    for(i=pTXT->iPos0; i<=l; i++)
    {
	  // r‚cup position curseur
      if(i==pTXT->iPos) pTXT->iPosX = iPos + pTXT->iLeft + iB + iBw;
	  if(p!=NULL) c = p[i]!='\n'?(int)p[i]:pTXT->iEol;
	  else c = 0;
	  // Affichage S‚lection
      if(pTXT->iHasFocus && !affSel && iSelLength && i>=iSelStart)
	  { if(pTXT->iStdAttrib) wattroff(pTXT->wDisp, pTXT->iStdAttrib);
		wattron(pTXT->wDisp, SOULIGNE);
		affSel=1; 
	  }
      if(affSel && i>=(iSelStart+iSelLength))
	  { wattroff(pTXT->wDisp, SOULIGNE);
		if(pTXT->iStdAttrib) wattron(pTXT->wDisp, pTXT->iStdAttrib);
	  }

      if(iPos<(pTXT->iWidth-2*(iB+iBw)))
	  { if(c)
		{
		  cmvwaddch(pTXT->wDisp,pTXT->iTop+iB,pTXT->iLeft+iB+iBw+iPos,c);
		  if(c!='\t') iPos++;
		  else
			do
			{  cmvwaddch(pTXT->wDisp,pTXT->iTop+iB,pTXT->iLeft+iB+iBw+iPos,' ');
			   iPos++;
			}
			while (iPos%pTXT->iTabSize && iPos<(pTXT->iWidth-2*(iB+iBw)-1));
		}
		else cmvwaddch(pTXT->wDisp,pTXT->iTop+iB,pTXT->iLeft+iB+iBw+iPos,pTXT->iEof);
	  }
      else break;
    } // fin for
	//pTXT->iCol = pTXT->iPosX-pTXT->iLeft-iB-iBw;
//aprintf("cuctxt","pTXT->iPos0=%d pTXT->iPos=%d iPos=%d", pTXT->iPos0, pTXT->iPos, iPos);
  }
  else
  { // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	// cas 3: Texte sans word wrap multiline avec ScrollBar horizontale
    int c,iPos=0,iL=0, iNbCR=0;

	// V‚rif Pos0
	pTXT->iPosX = -1;
    for(i=pTXT->iPos0; i<=l; i++)
    { if(i==pTXT->iPos) pTXT->iPosX = iPos + pTXT->iLeft + iB + iBw;
	  if(pTXT->iColMax<iPos) pTXT->iColMax = iPos;
	  if(p[i]=='\t') iPos += pTXT->iTabSize; else iPos++;
	  // iPos++;
      if(p[i]=='\n') { iPos=0; iL++; }
      if(iL>=(pTXT->iHeight-2*iB)) break;
	}
	if(pTXT->iPosX==-1)
	{ // Le curseur est hors ‚cran -> recalibrer Pos0
	  // On remonte de iPos de iL lignes pour red‚terminer iPos0
	  for(i=pTXT->iPos; i>0; i--)
	  { if(p[i]=='\n') iL--;
		if(p[i]=='\t') i -= pTXT->iTabSize;
		if(iL<=0) break;
	  }
	  // Recalcul de iPosX
	  pTXT->iPos0 = i+1;
	  iPos = 0; iL=0;
	  for(i=pTXT->iPos0; i<=l; i++)
	  { if(i==pTXT->iPos) pTXT->iPosX = iPos + pTXT->iLeft + iB + iBw;
		if(p[i]=='\t') iPos += pTXT->iTabSize; else iPos++;
		// iPos++;
		if(p[i]=='\n') { iPos=0; iL++; }
		if(iL>=(pTXT->iHeight-2*iB) || pTXT->iPosX!=-1) break;
	  }
	}

	if(pTXT->iPosX==-1)
	{
	  while(pTXT->iPos0>=0 && pTXT->szText[pTXT->iPos0]!='\n') 
	  {
		if(p[pTXT->iPos0]=='\t') pTXT->iPos0 -= pTXT->iTabSize;
		else pTXT->iPos0--;
		// pTXT->iPos0--;
	  }
	  pTXT->iPos0++;
	  pTXT->iCol = iDecal = 0;
	}
	else
	{
	  if(pTXT->iPos0>pTXT->iPos) pTXT->iPos0 = pTXT->iPos;
	  if(pTXT->iPos0<0) pTXT->iPos0 = 0;
	  pTXT->iCol = pTXT->iPosX-pTXT->iLeft-iB + iBw;
	  if( (pTXT->iPosX-iDecal) > (pTXT->iLeft+pTXT->iWidth-2*(iB+iBw))||
		  (pTXT->iPosX-iDecal) < (pTXT->iLeft+iB+iBw) )
		iDecal=pTXT->iCol+2*(iB+iBw)-pTXT->iWidth+1;
	  if(iDecal<0) iDecal=0;
	}

	// Affichage
	affSel=0; iPos=0; iL=0;
    for(i=pTXT->iPos0; i<=l; i++)
    {
      if(i==pTXT->iPos)
	  { // Recup pos curseur
		pTXT->iPosX = iPos + pTXT->iLeft + iB +iBw - iDecal;
		pTXT->iPosY = pTXT->iTop + iB + iL;
	  }
	  if(p!=NULL) c = p[i]!='\n'?(int)p[i]:pTXT->iEol;
	  else c = 0;
	  // Affichage S‚lection
      if(pTXT->iHasFocus && !affSel && iSelLength && i>=iSelStart)
	  { if(pTXT->iStdAttrib) wattroff(pTXT->wDisp, pTXT->iStdAttrib);
		wattron(pTXT->wDisp, SOULIGNE);
		affSel=1;
	  }
      if(affSel && i>=(iSelStart+iSelLength))
	  { wattroff(pTXT->wDisp, SOULIGNE);
		if(pTXT->iStdAttrib) wattron(pTXT->wDisp, pTXT->iStdAttrib);
	  }

#ifdef TOTO
      if(iPos<(pTXT->iWidth-2*(iB+iBw)+iDecal) && iPos>=iDecal)
		if(c)
		  cmvwaddch(pTXT->wDisp, pTXT->iTop+iB+iL, pTXT->iLeft+iB+iBw+iPos-iDecal, c);
		else
		  cmvwaddch(pTXT->wDisp, pTXT->iTop+iB+iL, pTXT->iLeft+iB+iBw+iPos-iDecal, pTXT->iEof);
	  iPos++;
#endif

      if(iPos<(pTXT->iWidth-2*(iB+iBw)+iDecal) && iPos>=iDecal)
	  {
		if(c)
		{ if(c!='\t')
			cmvwaddch(pTXT->wDisp, pTXT->iTop+iB+iL, pTXT->iLeft+iB+iBw+iPos-iDecal, c);
		}
		else
		  cmvwaddch(pTXT->wDisp, pTXT->iTop+iB+iL, pTXT->iLeft+iB+iBw+iPos-iDecal, pTXT->iEof);
	  }
	  iPos++;
	  if(c=='\t' && iPos<(pTXT->iWidth-2*(iB+iBw)+iDecal-1))
		do
		{  cmvwaddch(pTXT->wDisp,pTXT->iTop+iB+iL,pTXT->iLeft+iB+iBw+iPos,' ');
		   // aprintf("","ipos=%d idecal=%d",iPos,iDecal);
		   iPos++;
		}
		while (iPos%pTXT->iTabSize && (iPos<(pTXT->iWidth-2*(iB+iBw)+iDecal)));

      if(p[i]=='\n') { iPos=0; iL++; }
      if(iL>=(pTXT->iHeight-2*iB)) break;
    }
  }

  pTXT->iCol = pTXT->iPosX-pTXT->iLeft-iB-iBw;
  if(affSel) wattroff(pTXT->wDisp, SOULIGNE);

#ifdef TEST
mvwprintw(pTXT->wDisp, 5, 60, "                    ");
mvwprintw(pTXT->wDisp, 6, 60, "                    ");
mvwprintw(pTXT->wDisp, 7, 60, "                    ");
mvwprintw(pTXT->wDisp, 8, 60, "                    ");
mvwprintw(pTXT->wDisp, 5, 60, "Pos0= %d Pos= %d",pTXT->iPos0,pTXT->iPos);
mvwprintw(pTXT->wDisp, 6, 60, "PosX= %d PosY= %d",pTXT->iPosX,pTXT->iPosY);
mvwprintw(pTXT->wDisp, 7, 60, "Lig = %d Col = %d",pTXT->iLig,pTXT->iCol);
mvwprintw(pTXT->wDisp, 8, 60, "DebL= %d FinL= %d",pTXT->iPosDebutLigne,pTXT->iPosFinLigne);
mvwprintw(pTXT->wDisp, 9, 60, "lTxt= %d l   = %d",pTXT->ilTxt, l);
mvwprintw(pTXT->wDisp,10, 60, "Decal = %d",iDecal);
#endif
  if (!pTXT->iEnabled) wattroff(pTXT->wDisp, DIMINUE);
  if(pTXT->iStdAttrib) wattroff(pTXT->wDisp, pTXT->iStdAttrib);
  if(pTXT->iOldPos!=pTXT->iPos) pTXT->iOldPos = pTXT->iPos;
}

/*====================================================================*/
// Redessine complŠtement le contr“le
static void Affiche(struct CUC_TextEdit *pTXT)
{
  int i, j;

  if (iOkWDisp(pTXT->wDisp, szNomClasse, "Affiche")<0) return;
  
  if (!pTXT->iEnabled) wattron(pTXT->wDisp, DIMINUE);

  // On affiche l'attribut STDATTRIB
  if(pTXT->iStdAttrib)
  {
	wattron(pTXT->wDisp, pTXT->iStdAttrib);
	for (i=0 ; i<pTXT->iHeight ; i++)
	  for (j=0 ; j<pTXT->iWidth ; j++)
		cmvwaddch(pTXT->wDisp, pTXT->iTop+i, pTXT->iLeft+j, ' ');
	wattroff(pTXT->wDisp, pTXT->iStdAttrib);
  }


  if(pTXT->iHeight>1 && pTXT->iWidth>1 && pTXT->iBorderStyle)
  { // On affiche un cadre
    UC *pszG;

    pszG = pTXT->iBorderStyle==1?szBoxs:szBoxd;
	// Partie haute
    cmvwaddch(pTXT->wDisp, pTXT->iTop, pTXT->iLeft, pszG[0]);
    for (i=1; i<=pTXT->iWidth-2 ; i++ )
      cmvwaddch(pTXT->wDisp, pTXT->iTop, pTXT->iLeft+i, pszG[1]);
    cmvwaddch(pTXT->wDisp, pTXT->iTop, pTXT->iLeft+pTXT->iWidth-1, pszG[2]);

	// ScrollBars 0: aucune, 1: horizontale, 2: verticale, 3: double
	// Bords gauche
    for (i=1 ; i<pTXT->iHeight ; i++)
	  cmvwaddch(pTXT->wDisp, pTXT->iTop+i, pTXT->iLeft, pszG[3]);
	// Bords droite
	if(pTXT->iBorderStyle && !(pTXT->iScrollBars & VSCROLL) || pTXT->iHeight<=4)
	{
	  for (i=1 ; i<pTXT->iHeight ; i++)
		cmvwaddch(pTXT->wDisp, pTXT->iTop+i, pTXT->iLeft+pTXT->iWidth-1, pszG[4]);
	}

	// Partie basse
    cmvwaddch(pTXT->wDisp, pTXT->iTop+pTXT->iHeight-1, pTXT->iLeft, pszG[5]);
	if(pTXT->iBorderStyle && !(pTXT->iScrollBars & HSCROLL) || pTXT->iWidth<=4)
	{
	  for (i=1; i<=pTXT->iWidth-2 ; i++ )
		cmvwaddch(pTXT->wDisp, pTXT->iTop+pTXT->iHeight-1, pTXT->iLeft+i, pszG[6]);
	}


    cmvwaddch(pTXT->wDisp, pTXT->iTop+pTXT->iHeight-1, pTXT->iLeft+pTXT->iWidth-1, pszG[7]);
  }
  else if(pTXT->iBorderStyle==1)
  {
    cmvwaddch(pTXT->wDisp, pTXT->iTop, pTXT->iLeft, '[');
    cmvwaddch(pTXT->wDisp, pTXT->iTop, pTXT->iLeft+pTXT->iWidth-1, ']');
  }
  else if(pTXT->iBorderStyle==2)
  {
    cmvwaddch(pTXT->wDisp, pTXT->iTop, pTXT->iLeft, '<');
    cmvwaddch(pTXT->wDisp, pTXT->iTop, pTXT->iLeft+pTXT->iWidth-1, '>');
  }

  AfficheTexte(pTXT);
  if(pTXT->iBorderStyle && pTXT->iWidth > 1 && pTXT->iHeight > 1)
  {
	//if((pTXT->iScrollBars==1 || pTXT->iScrollBars==3) && pTXT->iWidth>4)
	if((pTXT->iScrollBars & HSCROLL) && pTXT->iWidth>4)
	  AfficheHSB(pTXT);
	//if((pTXT->iScrollBars==2 || pTXT->iScrollBars==3) &&pTXT->iHeight>4)
	if((pTXT->iScrollBars & VSCROLL) &&pTXT->iHeight>4)
	  AfficheVSB(pTXT);
  }
  if (!pTXT->iEnabled) wattroff(pTXT->wDisp, DIMINUE);
  AfficheCurseur(pTXT);
}

//====================================================================
// Cr‚ation du contr“le
// Cr‚ation de la barre de d‚filement verticale
static void CreateVSB(struct CUC_TextEdit *pTXT)
{
  pTXT->pVSB = CUC_VScrollBarCreate(pTXT->wDisp, NULL);  
  CUC_VScrollBarSetPropNum(pTXT->pVSB, CUCP_LEFT, pTXT->iLeft+pTXT->iWidth-1);
  CUC_VScrollBarSetPropNum(pTXT->pVSB, CUCP_TOP, pTXT->iTop+1);
  CUC_VScrollBarSetPropNum(pTXT->pVSB, CUCP_WIDTH, 1);
  if(pTXT->iHeight>2)
	CUC_VScrollBarSetPropNum(pTXT->pVSB, CUCP_HEIGHT, pTXT->iHeight-2);
  CUC_VScrollBarSetPropNum(pTXT->pVSB, CUCP_MIN, 0);
  CUC_VScrollBarSetPropNum(pTXT->pVSB, CUCP_MAX, 1);
  CUC_VScrollBarSetPropNum(pTXT->pVSB, CUCP_SMALLCHANGE, 1);
  CUC_VScrollBarSetPropNum(pTXT->pVSB, CUCP_VALUE, 0);
  CUC_VScrollBarSetPropNum(pTXT->pVSB, CUCP_CSIZE, 1);
  CUC_VScrollBarSetPropNum(pTXT->pVSB, CUCP_VISIBLE, FALSE);
  CUC_VScrollBarSetPropNum(pTXT->pVSB, CUCP_ENABLED, TRUE);
  pTXT->iVSB = 0;
}

//====================================================================
// Cr‚ation de la barre de d‚filement horizontale
static void CreateHSB(struct CUC_TextEdit *pTXT)
{
  pTXT->pHSB = CUC_HScrollBarCreate(pTXT->wDisp, NULL);  
  CUC_HScrollBarSetPropNum(pTXT->pHSB, CUCP_LEFT, pTXT->iLeft+1);
  CUC_HScrollBarSetPropNum(pTXT->pHSB, CUCP_TOP, pTXT->iTop+pTXT->iHeight-1);
  CUC_HScrollBarSetPropNum(pTXT->pHSB, CUCP_HEIGHT, 1);
  if (pTXT->iWidth>2)
    CUC_HScrollBarSetPropNum(pTXT->pHSB, CUCP_WIDTH, pTXT->iWidth-2);
  CUC_HScrollBarSetPropNum(pTXT->pHSB, CUCP_MIN, 0);
  CUC_HScrollBarSetPropNum(pTXT->pHSB, CUCP_MAX, 1);
  CUC_HScrollBarSetPropNum(pTXT->pHSB, CUCP_SMALLCHANGE, 1);
  CUC_HScrollBarSetPropNum(pTXT->pHSB, CUCP_VALUE, 0);
  CUC_HScrollBarSetPropNum(pTXT->pHSB, CUCP_CSIZE, 1);
  CUC_HScrollBarSetPropNum(pTXT->pHSB, CUCP_VISIBLE, FALSE);
  CUC_HScrollBarSetPropNum(pTXT->pHSB, CUCP_ENABLED, TRUE);
  pTXT->iHSB = 0;
}

//====================================================================
// Cr‚ation du contr“le TextEdit
struct CUC_TextEdit *CUC_TextEditCreate(WINDOW *w, int (*iRaiseEvent)(void *, int , int ))

{
  struct CUC_TextEdit *pTXT;

  pTXT = (struct CUC_TextEdit *)malloc(sizeof(struct CUC_TextEdit));

  if (pTXT==NULL)
  { aprintf("CUC: CUC_TextEditCreate", "Echec au malloc !");
    return NULL;
  }

  /* Initialisation avec des valeurs quelconques mais plausibles
  ** Ces valeurs ne sont pas sp‚cifi‚es dans le cahier des charges
  ** Un programme NE DOIT PAS en tenir compte
  */
  pTXT->wDisp = w;
  pTXT->iRaiseEvent = iRaiseEvent;
  pTXT->IdBack = pTXT;
  pTXT->iHasFocus = 0;
  pTXT->iTop = 0;
  pTXT->iLeft = 0;
  pTXT->iWidth = 10;
  pTXT->iHeight = 2;
  pTXT->szTag = 0;
  pTXT->iEnabled = 1;
  pTXT->iVisible = 0;			// Cr‚‚ invisible
  pTXT->Parent = NULL;
  pTXT->iTabStop = 1;
  strcpy(pTXT->szType, szNomType);	// Choix conventionnel
  pTXT->iAlignment = 0;
  pTXT->iMultiLine = 0;
  pTXT->iScrollBars = 0;
  pTXT->iAutoSize = 0;
  pTXT->iBorderStyle = 0;
  pTXT->iStdAttrib = 0;
  pTXT->szText = 0;
  pTXT->iTabSize = 8;
  pTXT->iSelLength = 0;
  pTXT->iSelStart = 0;
  pTXT->iInsMode = 1;
  pTXT->iMaxLength = 0;			// Longueur infinie

  if (strncmp(ttytype, "ansi", 4)==0)
	{ pTXT->iEof = 247; pTXT->iEol = 254; }
  else
	{ pTXT->iEof = 176+32+12; pTXT->iEol = 182; }

  pTXT->iPosX = 0;
  pTXT->iPosY = 0;
  pTXT->iPosDebutLigne = 0;
  pTXT->iPosFinLigne = 0;
  pTXT->iPos0 = 0;
  pTXT->iPos = 0;
  pTXT->iOldPos = 0;
  pTXT->iCol = 0;
  pTXT->iColMax = 0;
  pTXT->iLig = 0;
  pTXT->iLigMax = 0;
  pTXT->iTailleDispo = 0;
  pTXT->ilTxt = 0;

  pTXT->iHSB = 0;
  pTXT->iVSB = 0;

  return pTXT;
}

/*====================================================================*/
// Destruction du contr“le TextEdit

void CUC_TextEditDestruct(struct CUC_TextEdit *pTXT)
{
  if (iCtrlType(pTXT, "CUC_TextEditDestruct", szNomType)<0)
    return;
    
  // On d‚truit les ScrollBars
  if(pTXT->iHSB)
  {
	CUC_HScrollBarDestruct(pTXT->pHSB);
	pTXT->iHSB = 0;
  }
  if(pTXT->iVSB)
  {
	CUC_VScrollBarDestruct(pTXT->pVSB);
	pTXT->iVSB = 0;
  }

  if (pTXT->szTag!=NULL) free(pTXT->szTag);		// On d‚truit le tag...
  if (pTXT->szText!=NULL) free(pTXT->szText);	// puis le texte...
  pTXT->szType[0] = 0;							// (s‚curit‚)
  free((void *)pTXT);							// puis la structure
}



// ===================================================================
static int InsereCar(struct CUC_TextEdit *pTXT, int c)
{
  int l;			// 0 : Longueur infinie
  int lTxt;
  
  l = pTXT->iMaxLength?pTXT->iMaxLength:0;
  //lTxt = pTXT->szText!=NULL?(int)strlen(pTXT->szText):0;
  lTxt = pTXT->ilTxt;
  iLastCar = c;
  if( (lTxt+1)>=(pTXT->iTailleDispo))
  {
    if(!l)
    { // On r‚alloue un bloc supl‚mentaire de 50 octets
      if (pTXT->szText==NULL) 
	  {
		if((pTXT->szText=(UC *)malloc(50*sizeof(UC)))==NULL) return -1;
		else pTXT->szText[0] = 0;
	  }
      else
		pTXT->szText = (UC *)realloc(pTXT->szText, (pTXT->iTailleDispo + 50)*sizeof(UC));
      if(pTXT->szText==NULL) return(-1); 
	  else pTXT->iTailleDispo += 50;
    }
  }

  //if(pTXT->iInsMode && lTxt && pTXT->iTailleDispo)
  if(pTXT->iInsMode && (lTxt+1)<pTXT->iTailleDispo)
  {
//aprintf("cuctxt","ltxt=%d tailledispo=%d",lTxt, pTXT->iTailleDispo);
    //if( (lTxt+1)<(pTXT->iTailleDispo))
    //{ // On d‚cale le bloc d'un caractŠre
      memmove(pTXT->szText+pTXT->iPos+1, pTXT->szText+pTXT->iPos,
	      (lTxt-pTXT->iPos+1)*sizeof(UC));
	  lTxt = ++pTXT->ilTxt;
    //}
  }

  // On ‚crase le caractŠre courant
  if(pTXT->iTailleDispo)
  {
	//if(!pTXT->szText[pTXT->iPos]) pTXT->szText[pTXT->iPos+1] = 0;
	pTXT->szText[pTXT->iPos] = (UC)c;
	//pTXT->szText[pTXT->iPos+1] = 0;
	pTXT->szText[lTxt] = 0;
	if((pTXT->iPos+1)<pTXT->iTailleDispo)
	  pTXT->iPos++;
//ftime(&tf);
//duree = tf.time*1000+tf.millitm - (td.time*1000+td.millitm);
//aprintf("cuctxt", "Dur‚e 1 test: %g\n", duree/10000.0);
	return(0);
  }
  else return(-1);
}



// ===================================================================
static int DeleteCar(struct CUC_TextEdit *pTXT)
{
  int lTxt;
  
  if(pTXT->iPos<1) return(-1);
  //lTxt = pTXT->szText!=NULL?(int)strlen(pTXT->szText):0;
  lTxt = pTXT->ilTxt;

  if(pTXT->iPos>=1) iLastCar = pTXT->szText[pTXT->iPos-1];
  // On ‚crase le caractŠre qui pr‚cŠde le caractŠre courant
  memmove(pTXT->szText+pTXT->iPos-1, pTXT->szText+pTXT->iPos,
		  (lTxt-pTXT->iPos+1)*sizeof(char));
  pTXT->ilTxt--;
  if(pTXT->ilTxt<0) pTXT->ilTxt = 0;
  return(0);
}


// ===================================================================
static int SupprCar(struct CUC_TextEdit *pTXT)
{
  int lTxt;

  if(pTXT->iPos<0 || pTXT->szText==NULL || pTXT->ilTxt<=0 || pTXT->iPos>=pTXT->ilTxt) return(-1);
  //lTxt = pTXT->szText!=NULL?(int)strlen(pTXT->szText):0;
  lTxt = pTXT->ilTxt;

  if(pTXT->iPos>=0) iSupprCar = iLastCar = pTXT->szText[pTXT->iPos];
  // On ‚crase le caractŠre courant
  memmove(pTXT->szText+pTXT->iPos, pTXT->szText+pTXT->iPos+1,
		  (lTxt-pTXT->iPos+1)*sizeof(char));
  pTXT->szText[lTxt] = 0;
  pTXT->ilTxt--;
  if(pTXT->ilTxt<0) pTXT->ilTxt = 0;
  return(0);
}




// ===================================================================
static int InsereChaine(struct CUC_TextEdit *pTXT, char *szCh)
{
  int l;			// 0 : Longueur infinie
  int lTxt;
  int lCh, iPosStart, iSelLength;
  
  if(pTXT->iSelLength)
  { // On ‚crase la s‚lection courante
	if(pTXT->iSelStart>pTXT->iPos) iPosStart = pTXT->iPos;
	else iPosStart = pTXT->iSelStart;
  }
  else iPosStart = pTXT->iPos;

  if(szCh==NULL) return(-1);

  iSelLength = pTXT->iSelLength>=0?pTXT->iSelLength:0-pTXT->iSelLength;
  lCh = szCh!=NULL?(int)strlen(szCh):0;

  if(pTXT->iPos==iPosStart && iSelLength==lCh) return 0;

  l = pTXT->iMaxLength?pTXT->iMaxLength:0;
  //lTxt = pTXT->szText!=NULL?(int)strlen(pTXT->szText):0;
  lTxt = pTXT->ilTxt;

  if( pTXT->iTailleDispo <= (lTxt+lCh))
  {
    if(!l)
    { // On r‚alloue suffisamment de blocs supl‚mentaires de 50 octets
      if (pTXT->szText==NULL)
      { pTXT->szText = (UC *)malloc(50*sizeof(UC));
		if(pTXT->szText==NULL) return(-1);
		else { pTXT->iTailleDispo = 50; pTXT->szText[0] = 0; }
      }

      while( pTXT->iTailleDispo <= (lTxt+lCh))
      { pTXT->szText = (UC *)realloc(pTXT->szText, (pTXT->iTailleDispo + 50)*sizeof(UC));
		if(pTXT->szText==NULL) return(-1);
		else pTXT->iTailleDispo += 50;
      }
    }
  } // Fin alloc m‚m

  if( pTXT->iTailleDispo < (lTxt+lCh)) return(-1);	// Pb alloc m‚m

  if(iSelLength)
  { // On supprime la s‚lection 
// aprintf("txt","ipos=%d iposstart=%d iSelStart=%d isellength=%d lch=%d",pTXT->iPos,iPosStart, pTXT->iSelStart,iSelLength, lCh);
	if(pTXT->iPos <= lTxt)
	  memmove(pTXT->szText+iPosStart,
			  pTXT->szText+iPosStart+iSelLength,
			  (lTxt-iPosStart-iSelLength+1)*sizeof(UC));
	else { pTXT->szText[0] = 0; pTXT->iPos = pTXT->iPos0 = 0; }
	lTxt = pTXT->szText!=NULL?(int)strlen(pTXT->szText):0;
	pTXT->ilTxt = lTxt;
	pTXT->iPos = iPosStart;
  }
  // if(!pTXT->iSelLength && pTXT->iInsMode && (lTxt+lCh)<(pTXT->iTailleDispo))
  if(pTXT->iInsMode && (lTxt+lCh)<(pTXT->iTailleDispo))
  { // On d‚cale le bloc de la longueur de la chaine
	int i;
	for(i=0;i<lCh;i++) if(szCh[i]=='\n') pTXT->iLig++;
    if(pTXT->iPos<lTxt)
      memmove(pTXT->szText+pTXT->iPos+lCh, pTXT->szText+pTXT->iPos,
	      (lTxt-pTXT->iPos+1)*sizeof(UC));
  }
  else
  { // On calcule le nb de '\n' supprim‚s dans la s‚lection
	int i;
	for(i=iPosStart;i<lCh;i++) if(pTXT->szText[i]=='\n') pTXT->iLig--;
	for(i=0;i<lCh;i++) if(szCh[i]=='\n') pTXT->iLig++;
  }
  // On ‚crase la chaine courante et on incr‚mente iPos
  if(iPosStart<lTxt) memcpy(pTXT->szText+iPosStart, szCh, lCh);
  else strcat(pTXT->szText,szCh);
  if(!pTXT->iSelLength)
	{ if((pTXT->iPos+lCh)<pTXT->iTailleDispo) pTXT->iPos += lCh; }
  else pTXT->iPos = iPosStart + lCh;
  pTXT->ilTxt = pTXT->szText!=NULL?(int)strlen(pTXT->szText):0;
  return(0);
}



// ===================================================================
// N'est appel‚e que si s‚lection
static int SupprimeChaineSel(struct CUC_TextEdit *pTXT)
{
  int lTxt, iPosStart, lCh, iSelLength, i;

  if(!pTXT->iSelLength) return -1;

  if(pTXT->iSelStart>pTXT->iPos) iPosStart = pTXT->iPos;
  else iPosStart = pTXT->iSelStart;

  if(szSelText!=NULL) free(szSelText);
  iSelLength = pTXT->iSelLength>0?pTXT->iSelLength:0-pTXT->iSelLength;

  if(iSelLength)
  { 
    szSelText = (UC *)malloc((iSelLength+1)*sizeof(UC));
	if(szSelText==NULL) return -1; // PB alloc m‚m
	strncpy(szSelText,pTXT->szText+iPosStart,iSelLength);
	szSelText[iSelLength] = 0;
  }

  if(pTXT->iPos<0) return(-1);
  //lTxt = pTXT->szText!=NULL?(int)strlen(pTXT->szText):0;
  lTxt = pTXT->ilTxt;
  lCh = szSelText!=NULL?(int)strlen(szSelText):0;
  if(lCh>=lTxt) 
  {
	// pTXT->szText = NULL;
	pTXT->szText[0] = 0;
	pTXT->iPos0 = pTXT->iPos = 0;
	pTXT->ilTxt = 0;
	return(0);
  }

  // On ‚crase la chaine
  memmove(pTXT->szText+iPosStart, pTXT->szText+iPosStart+lCh,
		  (lTxt-iPosStart-lCh+1)*sizeof(UC));
  pTXT->iPos = iPosStart;
  lTxt = pTXT->szText!=NULL?(int)strlen(pTXT->szText):0;
  pTXT->ilTxt = lTxt;

  for(i=0;i<lCh;i++) if(szSelText[i]=='\n') pTXT->iLig--;
  return(0);
}





/*====================================================================*/
// Positionnement d'une propri‚t‚ num‚rique

int CUC_TextEditSetPropNum(struct CUC_TextEdit *pTXT, int iProp, int iArg)
{
  static char _f_[] = "CUC_TextEditSetPropNum";
  int lTxt;

  if (iCtrlType(pTXT, _f_, szNomType)<0)
    return -1;

  //lTxt = pTXT->szText!=NULL?(int)strlen(pTXT->szText):0;
  lTxt = pTXT->ilTxt;

  switch(iProp)
  {
    case CUCP_LEFT:
      if (pTXT->iLeft!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 79)<0)
		  return -1;
		if (pTXT->iVisible) Efface(pTXT);
		  pTXT->iLeft = iArg;
		if (pTXT->iVisible) Affiche(pTXT);
      }
      break;

    case CUCP_TOP:
      if (pTXT->iTop!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 25)<0)
		  return -1;
		if (pTXT->iVisible) Efface(pTXT);
		  pTXT->iTop = iArg;
		if (pTXT->iVisible) Affiche(pTXT);
      }
      break;

    case CUCP_WIDTH:
      if(pTXT->iAutoSize) return -1;
      if (pTXT->iWidth!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 80)<0)
		  return -1;
		if (pTXT->iVisible) Efface(pTXT);
		pTXT->iWidth = iArg;
		if(pTXT->iWidth>4 && pTXT->iHeight>1)
		//{ if(pTXT->iScrollBars&1 && !pTXT->iHSB) CreateHSB(pTXT); 
		{ if((pTXT->iScrollBars & HSCROLL) && !pTXT->iHSB) CreateHSB(pTXT); 
		  else if(pTXT->iHSB)
		  { CUC_HScrollBarDestruct(pTXT->pHSB); pTXT->iHSB = 0; }
		}
		if(pTXT->iWidth>1 && pTXT->iHeight>4)
		//{ if(pTXT->iScrollBars&2 && !pTXT->iVSB) CreateVSB(pTXT); 
		{ if((pTXT->iScrollBars & VSCROLL) && !pTXT->iVSB) CreateVSB(pTXT); 
		  else if(pTXT->iVSB)
		  { CUC_VScrollBarDestruct(pTXT->pVSB); pTXT->iVSB = 0; }
		}
		if (pTXT->iVisible) Affiche(pTXT);
      }
      break;

    case CUCP_HEIGHT:
      if(pTXT->iAutoSize) return -1;
      if (pTXT->iHeight!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 25)<0)
		  return -1;
		if (pTXT->iVisible) Efface(pTXT);
		pTXT->iHeight = iArg;
		if(pTXT->iWidth>1 && pTXT->iHeight>4)
		//{ if(pTXT->iScrollBars&2 && !pTXT->iVSB) CreateVSB(pTXT); 
		{ if((pTXT->iScrollBars & VSCROLL) && !pTXT->iVSB) CreateVSB(pTXT); 
		  else if(pTXT->iVSB)
		  { CUC_VScrollBarDestruct(pTXT->pVSB); pTXT->iVSB = 0; }
		}
		if(pTXT->iWidth>4 && pTXT->iHeight>1)
		//{ if(pTXT->iScrollBars&1 && !pTXT->iHSB) CreateHSB(pTXT); 
		{ if((pTXT->iScrollBars & HSCROLL) && !pTXT->iHSB) CreateHSB(pTXT); 
		  else if(pTXT->iHSB)
		  { CUC_HScrollBarDestruct(pTXT->pHSB); pTXT->iHSB = 0; }
		}
		if (pTXT->iVisible) Affiche(pTXT);
      }
      break;

    case CUCP_ALIGNMENT:
      if (pTXT->iAlignment!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 2)<0)
		  return -1;
		if (pTXT->iVisible) Efface(pTXT);
		pTXT->iAlignment = iArg;
		if (pTXT->iVisible) Affiche(pTXT);
      }
      break;

    case CUCP_MULTILINE:
      if (pTXT->iMultiLine!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 1)<0)
		  return -1;
		if (pTXT->iVisible) Efface(pTXT);
		pTXT->iMultiLine = iArg;
		if (pTXT->iVisible) Affiche(pTXT);
      }
      break;

    case CUCP_SCROLLBARS:
      if (pTXT->iScrollBars!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 3)<0)
		  return -1;
		if (pTXT->iVisible) Efface(pTXT);
		// ScrollBars 0: aucune, 1: horizontale, 2: verticale, 3: double
		if(pTXT->iWidth>4 && pTXT->iHeight>1)
		{
		  if(iArg & 1) CreateHSB(pTXT); 
		  //else if(pTXT->iScrollBars&1)
		  else if((pTXT->iScrollBars & HSCROLL) && pTXT->iHSB)
		  {
			CUC_HScrollBarDestruct(pTXT->pHSB);
			pTXT->iHSB = 0;
		  }
		}
		if(pTXT->iWidth>1 && pTXT->iHeight>4)
		{
		  if(iArg & 2) CreateVSB(pTXT);
		  //else if(pTXT->iScrollBars&2)
		  else if((pTXT->iScrollBars & VSCROLL) && pTXT->iVSB)
		  {
			CUC_VScrollBarDestruct(pTXT->pVSB);
			pTXT->iVSB = 0;
		  }
		}
		pTXT->iScrollBars = iArg;
		if (pTXT->iVisible) Affiche(pTXT);
      }
      break;

    case CUCP_AUTOSIZE:
      if (pTXT->iAutoSize!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 1)<0)
		  return -1;
		if (pTXT->iVisible) Efface(pTXT);
		pTXT->iAutoSize = iArg;
		if(pTXT->iAutoSize)
		{ int l=0, lMax=0, i, nbL=1;
		  for(i=0; i<lTxt; i++)
		  { l++;
			if(pTXT->szText[i] == '\n')
			{ if(l>lMax) lMax = l;
			  nbL++; l = 0;
			}
		  }
		  pTXT->iWidth = (lMax + (pTXT->iBorderStyle?2:0))<80?(lMax+(pTXT->iBorderStyle?2:0)):80;
		  pTXT->iHeight = (nbL + (pTXT->iBorderStyle?2:0))<25?(nbL+(pTXT->iBorderStyle?2:0)):25;
		}
		if (pTXT->iVisible) Affiche(pTXT);
      }
      break;

    case CUCP_BORDERSTYLE:
      if (pTXT->iBorderStyle!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 2)<0)
		  return -1;
		if (pTXT->iVisible) Efface(pTXT);
		pTXT->iBorderStyle = iArg;
		if (pTXT->iVisible) Affiche(pTXT);
      }
      break;

    case CUCP_STDATTRIB:
      if (pTXT->iStdAttrib!=iArg)
      { 
		pTXT->iStdAttrib = iArg;
		if (pTXT->iVisible) Affiche(pTXT);
      }
      break;

    case CUCP_SELLENGTH:
      if (pTXT->iSelLength!=iArg)
      { 
		if (pTXT->iVisible) Efface(pTXT);
		if(iArg>lTxt) iArg = lTxt;
		pTXT->iSelLength = iArg;
		pTXT->iPos = pTXT->iSelStart + iArg;
		if(pTXT->iPos>lTxt) pTXT->iPos = lTxt;
		pTXT->iPosX = 0;
		if (pTXT->iVisible) Affiche(pTXT);
      }
      break;

    case CUCP_SELSTART:
      if (pTXT->iSelStart!=iArg)
      { 
		if(pTXT->iVisible) Efface(pTXT);
		if(iArg>lTxt) iArg = lTxt;
		pTXT->iSelStart = iArg;
		if(iArg) pTXT->iPos0 = iArg-pTXT->iWidth; else pTXT->iPos0 = 0;
		if(pTXT->iPos0<0) pTXT->iPos0 = 0;
		pTXT->iPos = iArg;
		pTXT->iPosX = 0;
		if (pTXT->iVisible) Affiche(pTXT);
      }
      break;

    case CUCP_INSMODE:
      if (pTXT->iInsMode!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 1)<0)
		  return -1;
		if (pTXT->iVisible) Efface(pTXT);
		pTXT->iInsMode = iArg;
		if (pTXT->iVisible) Affiche(pTXT);
      }
      break;

    case CUCP_MAXLENGTH:
      if (pTXT->iMaxLength!=iArg)
      {
		char *szBuff=0;
		if (iArg<0) return -1;
		if (pTXT->iVisible) Efface(pTXT);
		pTXT->iMaxLength = iArg;
		// On r‚cupŠre l'ancien texte
		if(pTXT->iTailleDispo && pTXT->szText!=NULL)
		  pTXT->szText = (UC *)realloc(pTXT->szText, (iArg+1)*sizeof(UC));
		else
		{
		  pTXT->szText = (UC *)malloc((iArg+1)*sizeof(UC));
		  if( pTXT->szText != NULL)
		  {
			pTXT->szText[0] = 0;
			pTXT->ilTxt = 0;
		  }
		}
		if( pTXT->szText == NULL)
		  pTXT->iTailleDispo = 0;
		else
		  pTXT->iTailleDispo = iArg;
		// On ne modifie pas la taille dispo allou‚e si maxlength infini
		if (pTXT->iVisible) Affiche(pTXT);
      }
      break;

    case CUCP_TABSIZE:
      if (pTXT->iTabSize!=iArg)
      {
		if (pTXT->iVisible) Efface(pTXT);
		pTXT->iTabSize = iArg;
		if (pTXT->iVisible) Affiche(pTXT);
      }
      break;

    case CUCP_VISIBLE:
      if (pTXT->iVisible!=iArg)
      {
		if (pTXT->iVisible) Efface(pTXT);
		else Affiche(pTXT);
		pTXT->iVisible = iArg;
      }
      break;

    case CUCP_ENABLED:
      if (pTXT->iEnabled!=iArg)
      {
		pTXT->iEnabled = iArg;
		if (pTXT->iVisible) Affiche(pTXT);
      }
      break;

    case CUCP_EOLCHAR:
      if (pTXT->iEol!=iArg)
      { pTXT->iEol = iArg;
		if (pTXT->iVisible) Affiche(pTXT);
      }
      break;

    case CUCP_EOFCHAR:
      if (pTXT->iEof!=iArg)
      { pTXT->iEof = iArg;
		if (pTXT->iVisible) Affiche(pTXT);
      }
      break;

    case CUCP_PARENT:
      pTXT->Parent = (void *)iArg;
      break;

    case CUCP_TABSTOP:
      pTXT->iTabStop = iArg;
      break;

    case CUCP_FOCUS:
    case CUCP_LENGTH:
      ErrPropLectureSeule(szNomClasse, _f_, iProp);
      return -1;

    default:
      ErrPropNonGeree(szNomClasse, _f_, iProp);
      return -1;
  }

  return 0;	// Tout s'est bien pass‚
}



/*====================================================================*/
// Positionnement d'une propri‚t‚ "void *"

int CUC_TextEditSetPropPtr(struct CUC_TextEdit *pTXT, int iProp, void *pArg)
{
  if (iCtrlType(pTXT, "CUC_TextEditSetPropPtr", szNomType)<0)
    return -1;

  switch(iProp)
  {
    case CUCP_PARENT: pTXT->Parent = pArg; break;
    case CUCP_IDBACK: pTXT->IdBack = pArg; break;
	case CUCP_WDISP:
	  pTXT->wDisp = pArg;
	  //if((pTXT->iScrollBars&1) && pTXT->iWidth>4 && pTXT->iHeight>1)
	  if((pTXT->iScrollBars & HSCROLL) && pTXT->iWidth>4 && pTXT->iHeight>1)
		CUC_HScrollBarSetPropPtr(pTXT->pHSB, CUCP_WDISP, pArg);
	  //if((pTXT->iScrollBars&2) && pTXT->iWidth>1 && pTXT->iHeight>4)
	  if((pTXT->iScrollBars & VSCROLL) && pTXT->iWidth>1 && pTXT->iHeight>4)
		CUC_VScrollBarSetPropPtr(pTXT->pVSB, CUCP_WDISP, pArg);
	  break;

    default:
      ErrPropNonGeree(szNomClasse, "SetPropPtr", iProp);
      return -1;
  }

  return 0;	// Tout s'est bien pass‚
}

/*====================================================================*/
// Positionnement d'une propri‚t‚ TextEdit

int CUC_TextEditSetPropStr(struct CUC_TextEdit *pTXT, int iProp, const char *szVal)
{
  int lTxt;

  if (iCtrlType(pTXT, "CUC_TextEditSetPropStr", szNomType)<0)
    return -1;

  //lTxt = pTXT->szText!=NULL?(int)strlen(pTXT->szText):0;
  lTxt = pTXT->ilTxt;

  switch(iProp)
  {
    case CUCP_TAG:
      if (pTXT->szTag!=NULL) free(pTXT->szTag);
      if (szVal==NULL)
		pTXT->szTag = NULL;
      else
		pTXT->szTag = strdup(szVal);
      break;

    case CUCP_TEXT:
	  // Optimisations pour ‚viter le bouclage des ‚v‚nements (PV)
	  if((pTXT->szText==NULL || lTxt==0) && (szVal==NULL || strlen(szVal)==0))
		return 0;
	  if(pTXT->szText!=NULL && szVal!=NULL && strcmp(pTXT->szText, szVal)==0)
		return 0;

      if(pTXT->szText!=NULL && pTXT->iTailleDispo)
	  {
		if(pTXT->iMaxLength)
		  strncpy2(pTXT->szText, szVal, pTXT->iMaxLength+1);
		else if(!pTXT->iMaxLength && pTXT->iTailleDispo>=(int)strlen(szVal))
		  strncpy2(pTXT->szText, szVal, strlen(szVal)+1);
		else if(!pTXT->iMaxLength)
		{
		  if(pTXT->szText!=NULL)
			pTXT->szText = (UC *)realloc(pTXT->szText, sizeof(UC)*(strlen(szVal)+1));
		  else
			pTXT->szText = (UC *)malloc(sizeof(UC)*(strlen(szVal)+1));

		  pTXT->iTailleDispo = strlen(szVal);
		  if(pTXT->szText!=NULL) strcpy(pTXT->szText, szVal);
		}
	  }
      else if(!pTXT->iTailleDispo || pTXT->szText==NULL)
	  {
		if(pTXT->iMaxLength)
		{
		  pTXT->szText = (UC *)malloc(sizeof(UC)*(pTXT->iMaxLength+1));
		  pTXT->iTailleDispo = pTXT->iMaxLength;
		  strncpy2(pTXT->szText, szVal, pTXT->iMaxLength+1);
		}
		else
		{
		  pTXT->szText = strdup(szVal);
		  pTXT->iTailleDispo = pTXT->szText!=NULL?(int)strlen(pTXT->szText):0;
		}
	  }

	  lTxt = pTXT->szText!=NULL?(int)strlen(pTXT->szText):0;
	  pTXT->ilTxt = lTxt;

	  // On se positionne au d‚but du texte
	  pTXT->iPos0 = pTXT->iPos = pTXT->iSelStart = pTXT->iSelLength = 0;

      if (pTXT->iVisible) Efface(pTXT);
      if(pTXT->iAutoSize)
      { int l=0, lMax=0, i, nbL=1;
		for(i=0; i<lTxt; i++)
		{ l++;
		  if(pTXT->szText[i] == '\n')
		  { if(l>lMax) lMax = l;
			nbL++; l = 0;
		  }
		}
		pTXT->iWidth = (lMax + (pTXT->iBorderStyle?2:0))<80?(lMax+(pTXT->iBorderStyle?2:0)):80;
		pTXT->iHeight = (nbL + (pTXT->iBorderStyle?2:0))<25?(nbL+(pTXT->iBorderStyle?2:0)):25;
      }
      if (pTXT->iVisible) Affiche(pTXT);

      if (pTXT->iEnabled)
		if (pTXT->iRaiseEvent != NULL)
		  pTXT->iRaiseEvent(pTXT->IdBack, CUCE_CHANGE, 0);
      break;

    case CUCP_SELTEXT:
	  if(szVal==NULL || strlen(szVal)==0) return 0;
	  if (szVal!=NULL && strcmp(szSelText, szVal)==0) return 0;

	  if(pTXT->iVisible) Efface(pTXT);
      if (szSelText==NULL) szSelText = strdup(szVal);
	  else
	  {
		free(szSelText);
		szSelText = strdup(szVal);
	  }
	  if(szSelText!=NULL && !InsereChaine(pTXT, szSelText))
	  pTXT->iSelLength = 0;
	  if(pTXT->iVisible) Affiche(pTXT);
      break;

    case CUCP_TYPE:
      ErrPropLectureSeule(szNomClasse, "SetPropStr", iProp);
      return -1;

    default:
      ErrPropNonGeree(szNomClasse, "SetPropStr", iProp);
      return -1;
  }

  return 0;	// Tout s'est bien pass‚
}


/*====================================================================*/
// Lecture d'une propri‚t‚ num‚rique

int CUC_TextEditGetPropNum(struct CUC_TextEdit *pTXT, int iProp)
{
  if (iCtrlType(pTXT, "CUC_TextEditGetPropNum", szNomType)<0)
    return -1;

  switch(iProp)
  {
    case CUCP_LEFT:			return pTXT->iLeft;
    case CUCP_TOP:			return pTXT->iTop;
    case CUCP_WIDTH:		return pTXT->iWidth;
    case CUCP_HEIGHT:		return pTXT->iHeight;
    case CUCP_VISIBLE:		return pTXT->iVisible;
    case CUCP_ENABLED:		return pTXT->iEnabled;
    case CUCP_ALIGNMENT:	return pTXT->iAlignment;
    case CUCP_AUTOSIZE:		return pTXT->iAutoSize;
    case CUCP_BORDERSTYLE:	return pTXT->iBorderStyle;
	case CUCP_MULTILINE:	return pTXT->iMultiLine;
    case CUCP_SELSTART:		return pTXT->iSelStart;
    case CUCP_SELLENGTH:	return pTXT->iSelLength;
    case CUCP_INSMODE:		return pTXT->iInsMode;
    case CUCP_TABSIZE:		return pTXT->iTabSize;
	case CUCP_SCROLLBARS:	return pTXT->iScrollBars;
	case CUCP_MAXLENGTH:	return pTXT->iMaxLength;
    case CUCP_TABSTOP:		return pTXT->iTabStop;
    case CUCP_FOCUS:		return pTXT->iHasFocus;
    case CUCP_LENGTH:		return pTXT->szText==NULL ? 0 : strlen(pTXT->szText);
    default:
      ErrPropNonGeree(szNomClasse, "GetPropNum", iProp);
  }
  return 0;
}



/*====================================================================*/
// Lecture d'une propri‚t‚ void *

void *CUC_TextEditGetPropPtr(struct CUC_TextEdit *pTXT, int iProp)
{
  if (iCtrlType(pTXT, "CUC_TextEditGetPropPtr", szNomType)<0)
    return NULL;

  switch(iProp)
  {
    case CUCP_PARENT:	return pTXT->Parent;
    case CUCP_IDBACK:	return pTXT->IdBack;
	case CUCP_WDISP:  	return pTXT->wDisp;
    default:
      ErrPropNonGeree(szNomClasse, "GetPropPtr", iProp);
  }
  return 0;
}

/*====================================================================*/
// Lecture d'une propri‚t‚ TextEdit
// On ne retourne pas un pointeur sur un champ de donn‚e priv‚,
// mais on copie la chaine … une adresse fournie par l'appellant.
// Routine s‚curis‚e: on gŠre la taille du buffer, et on garantit
// que le buffer se termine par 0.
// Une propri‚t‚ … NULL de fa‡on interne est rtourn‚e comme chaŒne nulle.

char *CUC_TextEditGetPropStr(struct CUC_TextEdit *pTXT, int iProp, char *szBuffer, int iLBuf)
{
  if (iCtrlType(pTXT, "CUC_TextEditGetPropStr", szNomType)<0)
    return NULL;

  switch(iProp)
  {
    case CUCP_TAG:
      if (pTXT->szTag==NULL) szBuffer[0] = 0;
      else
      { strncpy(szBuffer, pTXT->szTag, iLBuf);
		szBuffer[iLBuf-1] = 0;
      }
      break;

    case CUCP_TYPE:
      strncpy(szBuffer, pTXT->szType, iLBuf);
      szBuffer[iLBuf-1] = 0;
      break;

    case CUCP_TEXT:
      if (pTXT->szText==NULL) szBuffer[0] = 0;
      else
      { strncpy(szBuffer, pTXT->szText, iLBuf);
		szBuffer[iLBuf-1] = 0;
      }
      break;

    case CUCP_SELTEXT:
      if (szSelText==NULL) szBuffer[0] = 0;
      else
      { strncpy(szBuffer, szSelText, iLBuf);
		szBuffer[iLBuf-1] = 0;
      }
      break;

    default:
      ErrPropNonGeree(szNomClasse, "GetPropStr", iProp);
  }

  return szBuffer;
}




// ===================================================================
static int AnnulerAction(struct CUC_TextEdit *pTXT, int iKey)
{
  static int iKeyAnnule=0;
  int lTxt;

  //lTxt = pTXT->szText!=NULL?(int)strlen(pTXT->szText):0;
  lTxt = pTXT->ilTxt;
  switch(iKey)
  {
    case KEY_BACKSPACE:
    case KEY_BACK:
	  pTXT->iPos = iLastPos;
      if(!iSupprCar && szSelText!=NULL) InsereChaine(pTXT, szSelText);
	  else InsereCar(pTXT, iLastCar);
	  iSupprCar=0;

	  /*
	  pTXT->iPos = iLastPos;
	  InsereCar(pTXT, iLastCar);
	  */
      break;

    case KEY_CTRL_C:
      break;

    case KEY_CTRL_V:
	  pTXT->iPos = iLastPos;
      if(szSelText!=NULL) 
	  {
		pTXT->iPos = iLastPos;
		pTXT->iSelLength = 0-strlen(szSelText);
		pTXT->iSelStart = iLastPos - strlen(szSelText);
		SupprimeChaineSel(pTXT);
		pTXT->iSelLength = 0;
		pTXT->iSelStart = pTXT->iPos;
	  }
      else SupprCar(pTXT);
      break;

    case KEY_DELETE:
    case KEY_CTRL_X:
      // reColler
	  pTXT->iPos = iLastPos;
      if(!iSupprCar && szSelText!=NULL) InsereChaine(pTXT, szSelText);
	  else InsereCar(pTXT, iLastCar);
	  iSupprCar=0;
      break;

    case KEY_CTRL_Z:
	  //aprintf("CUC TextEdit","Annuler Annuler|Pas implant‚ !!!");
      break;

    default:
	  if( (iKey>=32 && iKey<=255 && iKey!=127) || iKey=='\n' || iKey=='\t')
	  {
		pTXT->iPos = iLastPos;
		if(pTXT->iPos>0) pTXT->iPos--;
		SupprCar(pTXT);
	  }
  }
  return(0);
}



/*====================================================================*/
// DoEventKey: traite l'‚v‚nement CUCE_KEY

static void DoEventKey(struct CUC_TextEdit *pTXT, int iKey)
{
  int iChange=0;
  int iB;						// BorderStyle
  static int iSel=0;			// indicateur de s‚lection
  static int iLastKey=0;	// Touche pr‚c‚dente
  static int iLastAct=0;	// DerniŠre action
  int iSelLength, iSelStart, lTxt;

  iB = pTXT->iBorderStyle?1:0;
  iSelLength=pTXT->iSelLength>0?pTXT->iSelLength:0-pTXT->iSelLength;
  iSelStart =pTXT->iSelLength>0?pTXT->iSelStart:pTXT->iPos;
  //lTxt = pTXT->szText!=NULL?(int)strlen(pTXT->szText):0;
  lTxt = pTXT->ilTxt;

  switch(iKey)
  {
    case KEY_LEFT:
      if(!iSel) pTXT->iSelLength = 0;
      if(pTXT->iPos<=0 && pTXT->iPosX==(pTXT->iLeft+iB) &&
		 pTXT->iPosY==(pTXT->iTop+iB)    )
		AfficheCurseur(pTXT);
      else
      { iChange=1;
		if(pTXT->iPos>0) pTXT->iPos--;
		//if(pTXT->szText[pTXT->iPos]=='\n') pTXT->iLig--;
		if(pTXT->iPos < pTXT->iPosDebutLigne)
		  pTXT->iLig--;
      }

      if(pTXT->iMultiLine)
	  {
		if( pTXT->iPos<lTxt && pTXT->szText[pTXT->iPos] == '\n' &&
			pTXT->iPosY <= (pTXT->iTop+iB) &&
			pTXT->iPosX <= (pTXT->iLeft + iB) )
		{ // On revient d'une ligne (on passe 2 '\n')
		  int iNbCR=0;
		  while(pTXT->iPos0>=0 && iNbCR<2)
		  {
			pTXT->iPos0--;
			if(pTXT->szText[pTXT->iPos0]=='\n') iNbCR++;
		  }
		  pTXT->iPos0++;
		}
	  }
      break;

    case KEY_RIGHT:
      if(!iSel) pTXT->iSelLength = 0;
      if(pTXT->iPos>=pTXT->iTailleDispo &&
		 pTXT->iPosX==(pTXT->iWidth+pTXT->iLeft-iB) &&
		 pTXT->iPosY==(pTXT->iHeight+pTXT->iTop-iB)   )
	  {
		AfficheCurseur(pTXT);
	  }
      else
	  { iChange=1;
		if(pTXT->iPos<lTxt && (!pTXT->iMaxLength || (pTXT->iPos+1)<pTXT->iMaxLength) )
		{
		  pTXT->iPos++;
		  if(pTXT->iPos > pTXT->iPosFinLigne)
			pTXT->iLig++;
		}
      }

      if(pTXT->iMultiLine)
	  { if( pTXT->iPos && pTXT->szText[pTXT->iPos-1] == '\n' &&
			pTXT->iPosY >= (pTXT->iTop+pTXT->iHeight-iB-1) &&
			pTXT->iPosX >= (pTXT->iLeft + iB) )
		{ // On saute une ligne
		  if(pTXT->iPos0<lTxt) pTXT->iPos0++;
		  while(pTXT->iPos0<lTxt && pTXT->szText[pTXT->iPos0-1]!='\n')
			pTXT->iPos0++;
		}
	  }
      break;

    case KEY_UP:
      if(pTXT->iMultiLine && pTXT->iLig>0)
	  { int iNbCR=0;
		if(!iSel) pTXT->iSelLength = 0;
		if(!(pTXT->iScrollBars & HSCROLL))
		{ // word wrap
		  int iCol;
		  int ilLigne;

		  //if(pTXT->iLig>0)
		  //{
			iCol = pTXT->iPos-pTXT->iPosDebutLigne;
			pTXT->iPos = iPosDebutNbLigne(pTXT, 0, pTXT->iLig-1);
			ilLigne = iPosFinLigne(pTXT, pTXT->iPos) - pTXT->iPos;
			if(ilLigne<0) ilLigne = 1;
			if(iCol <= (ilLigne-1)) pTXT->iPos += iCol;
			else pTXT->iPos += ilLigne; // xxx -1

			pTXT->iLig--;
		  //}
		}
		else
		{
		  while(pTXT->iPos>=0 && iNbCR<2)
		  { pTXT->iPos--;
			if(pTXT->iPos>0 && pTXT->szText[pTXT->iPos]=='\n') iNbCR++;
		  }
		  if(pTXT->szText[pTXT->iPos]=='\n') pTXT->iLig--;
		  pTXT->iPos++;
		  if(pTXT->iPos==0) pTXT->iLig=0;

		  if(	pTXT->iPosY <= (pTXT->iTop+iB) )
		  { iNbCR=0;
			while(pTXT->iPos0>=0 && iNbCR<2)
			{ pTXT->iPos0--;
			  if(pTXT->iPos0>0 && pTXT->szText[pTXT->iPos0]=='\n')
				iNbCR++;
			}
			pTXT->iPos0++;
		  }
		}
		iChange=1;
      }
      break;

    case KEY_DOWN:
      if(pTXT->iMultiLine && pTXT->iPos<lTxt)
	  { if(!iSel) pTXT->iSelLength = 0;
		if(!(pTXT->iScrollBars & HSCROLL))
		{ // word wrap
		  //int i, j;
		  int iCol;
		  int ilLigne;

		  iCol = pTXT->iPos-pTXT->iPosDebutLigne;
		  //pTXT->iPos = iPosDebutNbLigne(pTXT, 0, pTXT->iLig+1);
		  pTXT->iPos = pTXT->iPosFinLigne+1;
		  ilLigne = iPosFinLigne(pTXT, pTXT->iPos) - pTXT->iPos;
		  if(ilLigne<0) ilLigne = 1;
		  if(pTXT->iPos<=pTXT->ilTxt) pTXT->iLig++;
		  if(iCol<ilLigne) pTXT->iPos += iCol;
		  else pTXT->iPos += ilLigne;
		}
		else
		{
		  if(pTXT->iPos<=lTxt) pTXT->iPos++;
		  while(pTXT->iPos<=lTxt && pTXT->szText[pTXT->iPos-1]!='\n')
			pTXT->iPos++;
		  if(pTXT->iPos>0 && pTXT->iPos<=lTxt && 
			 pTXT->szText[pTXT->iPos-1]=='\n') 
			pTXT->iLig++;

		  if(	pTXT->iPosY >= (pTXT->iTop+pTXT->iHeight-iB-1) )
		  { if(pTXT->iPos0<lTxt) pTXT->iPos0++;
			while(pTXT->iPos0<lTxt && pTXT->szText[pTXT->iPos0-1]!='\n')
			  pTXT->iPos0++;
		  }
		}
		iChange = 1;
      }
      break;

    case KEY_PGUP:
      if(!pTXT->iPos) AfficheCurseur(pTXT);
	  else
	  {
		if(pTXT->iMultiLine)
		{ int iNbCR=0;
		  if(!iSel) pTXT->iSelLength = 0;
		  if(!(pTXT->iScrollBars & HSCROLL))
		  { // word wrap
			//int i, j;
			int iCol;
			int ilLigne;

			if(pTXT->iLig > pTXT->iHeight)
			{
			  iCol = pTXT->iPos-pTXT->iPosDebutLigne;
			  pTXT->iPos = pTXT->iPos0 = iPosDebutNbLigne(pTXT, 0, pTXT->iLig-pTXT->iHeight);
			  while(iNbCR<(pTXT->iHeight-3))
			  {
				iNbCR++;
				// On progresse de 1 ligne … la fois
				pTXT->iPos = iPosFinLigne(pTXT, pTXT->iPos);
				pTXT->iPos++;
				if(pTXT->iPos>=lTxt) break;
				pTXT->iLig --;
			  }
			  pTXT->iLig += 2;
			  ilLigne = iPosFinLigne(pTXT, pTXT->iPos) - pTXT->iPos;
			  if(iCol<ilLigne) pTXT->iPos += iCol;
			  else pTXT->iPos += ilLigne;
			}
		  }
		  else
		  {
			while(pTXT->iPos>=0 && iNbCR<=pTXT->iHeight)
			{ pTXT->iPos--;
			  if(pTXT->iPos>0 && pTXT->szText[pTXT->iPos]=='\n') iNbCR++;
			}
			if(pTXT->szText[pTXT->iPos]=='\n') pTXT->iLig--;
			pTXT->iPos++;
			if(pTXT->iPos==0) pTXT->iLig=0;

			iNbCR=0;
			while(pTXT->iPos0>=0 && iNbCR<pTXT->iHeight)
			{ pTXT->iPos0--;
			  if(pTXT->iPos0>=0 && pTXT->szText[pTXT->iPos0]=='\n')
				iNbCR++;
			}
			pTXT->iPos0++;
			iNbCR --;
			pTXT->iLig -= iNbCR;
			if(pTXT->iPos0<=1) pTXT->iLig = 0;
		  }
		  iChange=1;
		}
	  }
      break;

    case KEY_PGDN:
      if(pTXT->iPos>=lTxt) AfficheCurseur(pTXT);
	  else
	  {
		if(pTXT->iMultiLine)
		{ int iNbCR=0;
		  if(!iSel) pTXT->iSelLength = 0;
		  if(!(pTXT->iScrollBars & HSCROLL))
		  { // word wrap
			//int i, j;
			int iCol;
			int ilLigne;

			iCol = pTXT->iPos-pTXT->iPosDebutLigne;
			while(iNbCR<pTXT->iHeight)
			{
			  iNbCR++;
			  // On progresse de 1 ligne … la fois
			  pTXT->iPos = iPosFinLigne(pTXT, pTXT->iPos);
			  pTXT->iPos++;
			  if(pTXT->iPos>=lTxt) break;
			  pTXT->iLig ++;
//aprintf("cuctxt","iNbCR=%d iPos=%d", iNbCR, pTXT->iPos);
			}
			pTXT->iPos0 = iPosDebutNbLigne(pTXT, pTXT->iPos0, iNbCR);
			ilLigne = iPosFinLigne(pTXT, pTXT->iPos) - pTXT->iPos;
			if(iCol<ilLigne) pTXT->iPos += iCol;
			else pTXT->iPos += ilLigne;
		  }
		  else
		  {
			while(pTXT->iPos<=lTxt && iNbCR<pTXT->iHeight)
			{
			  if(pTXT->iPos<=lTxt && pTXT->szText[pTXT->iPos-1]=='\n')
				iNbCR++;
			  pTXT->iPos++;
			}
			if(pTXT->iPos>lTxt) { iNbCR--; pTXT->iPos=lTxt; }
			pTXT->iLig += iNbCR;
			iNbCR=0;
			while(pTXT->iPos0<lTxt && iNbCR<pTXT->iHeight)
			{
			  if(pTXT->iPos0<lTxt && pTXT->szText[pTXT->iPos0-1]=='\n')
				iNbCR++;
			  pTXT->iPos0++;
			}
		  }
		  iChange = 1;
		}
	  }
      break;

    case KEY_HOME:
      if(!iSel) pTXT->iSelLength = 0;
	  iChange=1;
	  if(!pTXT->iMultiLine || iLastKey==KEY_HOME)
		pTXT->iPos0 = pTXT->iPos = pTXT->iLig = pTXT->iCol = 0;
	  else if(!(pTXT->iScrollBars & HSCROLL))
	  { // word wrap
		pTXT->iPos = pTXT->iPosDebutLigne;
	  }
	  else
	  {
		while(pTXT->iPos>0 && pTXT->szText[pTXT->iPos-1]!='\n') 
		  pTXT->iPos--;
	  }
      break;

    case KEY_END:
      if(!iSel) pTXT->iSelLength = 0;
	  iChange=1;
	  if(iLastKey==KEY_END)
	  { pTXT->iPos0 = pTXT->iPos = lTxt;
		pTXT->iLig = pTXT->iLigMax;
		pTXT->iCol = 0;
		//while(pTXT->iPos>0 && pTXT->szText[pTXT->iPos-1]!='\n') 
		 // pTXT->iPos--;
		while(pTXT->iPos0>0 && pTXT->szText[pTXT->iPos0-1]!='\n') 
		  pTXT->iPos0--;
	  }
	  else
	  { if(!pTXT->iMultiLine)
		{ pTXT->iPos = lTxt;
		  pTXT->iPos0 = pTXT->iPos-pTXT->iWidth+(pTXT->iBorderStyle?2:0)+1;
		  if(pTXT->iPos0<0) pTXT->iPos0 = 0;
		}
		else if(!(pTXT->iScrollBars & HSCROLL))
		{ // word wrap
		  pTXT->iPos = pTXT->iPosFinLigne;
		}
		else
		{ while(pTXT->iPos<lTxt && pTXT->szText[pTXT->iPos]!='\n') 
			pTXT->iPos++;
		}
	  }
      break;

    case KEY_INSERT:
      pTXT->iInsMode ^= 1;
      if(pTXT->iRaiseEvent != NULL)
		pTXT->iRaiseEvent(pTXT->IdBack, CUCE_INSMODECHANGE, pTXT->iInsMode);
      break;

    case KEY_BACKSPACE:
    case KEY_BACK:
	  //if(pTXT->iPos>0 && pTXT->szText[pTXT->iPos-1]=='\n')
	  //{
	//	pTXT->iLig--;
	//	pTXT->iLigMax--;
	 // }
      if(pTXT->iSelLength && !SupprimeChaineSel(pTXT)) iChange=1;
      else if(!DeleteCar(pTXT)) 
	  {
		iChange=1;
		if(pTXT->iPos>0) pTXT->iPos--;
		if(pTXT->iPos < pTXT->iPosDebutLigne)
		{ pTXT->iLig--;
		  pTXT->iLigMax--;
		}
      }
      iSel = 0; pTXT->iSelLength = 0;
      break;

    case KEY_F(8):
      // D‚but / fin s‚lection 
	  if(iSel) {iChange = 1; iSel=pTXT->iSelLength=0; }
	  else { iSel = 1; pTXT->iSelStart = pTXT->iPos; }
      break;

    case KEY_ESCAPE:
      // Escape : fin s‚lection ou annule s‚lection
      if(!iSel) { iChange = 1; pTXT->iSelLength = 0; }
	  else
	  {
		pTXT->iSelLength = pTXT->iPos-pTXT->iSelStart;
	  }
      iSel = 0;
      break;

    case KEY_CTRL_C:
      // Copier
      if(szSelText!=NULL) free(szSelText);
      if(iSelLength)
      {
		szSelText = (UC *)malloc((iSelLength+1)*sizeof(UC));
		if(szSelText==NULL) break;
		strncpy(szSelText,pTXT->szText+iSelStart,iSelLength);
		szSelText[iSelLength] = 0;
      }
      iSel = 0;
      break;

    case KEY_CTRL_V:
      // Coller
	  if(szSelText!=NULL && !InsereChaine(pTXT, szSelText)) iChange=1;
	  iSel = 0;
      if(!iSel) pTXT->iSelLength = 0;
      break;

    case KEY_DELETE:
    case KEY_CTRL_X:
      // Supprimer
	  if(pTXT->szText==NULL) break;
      if(pTXT->iSelLength && !SupprimeChaineSel(pTXT)) iChange=1;
      else if(!SupprCar(pTXT) || !pTXT->iInsMode) iChange=1;
      iSel = 0; pTXT->iSelLength = 0;
      break;

    case KEY_CTRL_Z:
      // Annuler
	  if(iLastAct) { AnnulerAction(pTXT,iLastAct); iChange = 1; }
	  AfficheCurseur(pTXT);
      break;

    default:
	  if( (iKey>=32 && iKey<=255 && iKey!=127) || iKey=='\n' || iKey=='\t')
	  {
		if(!pTXT->iMultiLine && iKey=='\n') beep();
		else
		{
		  if(pTXT->iSelLength && !SupprimeChaineSel(pTXT))
			{ iSel = 0; pTXT->iSelLength = 0; }
		  if(!InsereCar(pTXT, iKey))
		  { if(iKey=='\n' ||
			  (iKey!=' ' &&
			   (pTXT->iPos - pTXT->iPosDebutLigne) >= (pTXT->iWidth-2*iB)))
			  pTXT->iLig++;
			iChange=1;
		  }
		}
	  }
#ifdef TEST
	  else mvwprintw(pTXT->wDisp, 4, 5, "Car...%d",iKey);
#endif
      break;
  }

  if(iSel) pTXT->iSelLength = pTXT->iPos - pTXT->iSelStart;
  else pTXT->iSelStart = pTXT->iPos;
  if(pTXT->iLigMax<pTXT->iLig) pTXT->iLigMax = pTXT->iLig;

  if (iChange && pTXT->iVisible)
  {
    Efface(pTXT);
    Affiche(pTXT);
  }
  //else AfficheCurseur(pTXT);

  if(iKey!=KEY_LEFT && iKey!=KEY_RIGHT && iKey!=KEY_UP &&
	 iKey!=KEY_DOWN && iKey!=KEY_PGUP && iKey!=KEY_PGDN &&
	 iKey!=KEY_HOME && iKey!=KEY_END && iKey!=KEY_INSERT &&
	 iKey!=KEY_F(8) && iKey!=KEY_ESCAPE)
  {
	iLastAct = iKey;
	iLastPos = pTXT->iPos;
	if (iChange && pTXT->iRaiseEvent!=NULL)
	  pTXT->iRaiseEvent(pTXT->IdBack, CUCE_CHANGE, 0);
  }
  iLastKey = iKey;
}

//====================================================================
// Fonction principale de traitement des ‚v‚nements par le contr“le

int CUC_TextEditDoEvent(struct CUC_TextEdit *pTXT, int iEvent, int iArg)
{

  if (iCtrlType(pTXT, "CUC_TextEditDoEvent", szNomType)<0)
    return -1;

  switch(iEvent)
  {
    case CUCE_KEY:
      if (pTXT->iVisible && pTXT->iEnabled)
		DoEventKey(pTXT, iArg);
      break;

    case CUCE_GOTFOCUS:
      if (pTXT->iVisible && pTXT->iEnabled)
      { pTXT->iHasFocus = 1;
		Affiche(pTXT);
      }
      break;

    case CUCE_LOSTFOCUS:
      if (pTXT->iVisible && pTXT->iEnabled)
      { pTXT->iHasFocus = 0;
		Affiche(pTXT);
      }
      break;

    case CUCE_DUMP:
      {
aprintf("", "Pos0= %d Pos= %d|PosX= %d PosY= %d|Lig = %d Col = %d|DebL= %d FinL= %d|lTxt= %d"
  ,pTXT->iPos0,pTXT->iPos
  ,pTXT->iPosX,pTXT->iPosY
  ,pTXT->iLig,pTXT->iCol
  ,pTXT->iPosDebutLigne,pTXT->iPosFinLigne
  ,pTXT->ilTxt);
      }
      break;

    default:
      aprintf("CUC: CUC_TextEditDoEvent", "Ev‚nement %d inconnu !", iEvent);
      break;
  }

  return 0;
}

/*====================================================================*/
// M‚thode Move: d‚placement combin‚ du contr“le sur X et Y

int CUC_TextEditMove(struct CUC_TextEdit *pTXT, int iTop, int iLeft)
{
  if (iCtrlType(pTXT, "CUC_TextEditMove", szNomType)<0)
    return -1;

  if (pTXT->iLeft!=iLeft || pTXT->iTop!=iTop)
  { 
    if (pTXT->iVisible) Efface(pTXT);
    pTXT->iLeft = iLeft;
    pTXT->iTop = iTop;
    if (pTXT->iVisible) Affiche(pTXT);
  }
  return 0;
}

/*====================================================================*/
// M‚thode Resize: Changement de taille combin‚ largeur/hauteur

int CUC_TextEditResize(struct CUC_TextEdit *pTXT, int iHeight, int iWidth)
{
  if (iCtrlType(pTXT, "CUC_TextEditResize", szNomType)<0)
    return -1;

  if (pTXT->iWidth!=iWidth || pTXT->iHeight!=iHeight)
  { 
    if (pTXT->iVisible) Efface(pTXT);
    pTXT->iWidth = iWidth;
    pTXT->iHeight = iHeight;
    if (pTXT->iVisible) Affiche(pTXT);
  }
  return 0;
}

/*====================================================================*/
// M‚thode Refresh: le contr“le se redessine

int CUC_TextEditRefresh(struct CUC_TextEdit *pTXT)
{
  if (iCtrlType(pTXT, "CUC_TextEditResize", szNomType)<0)
    return -1;

  Efface(pTXT);
  Affiche(pTXT);
}



//====================================================================
// M‚thode DisplayCursor : R‚affiche le curseur dans le contr“le
int CUC_TextEditDisplayCursor(struct CUC_TextEdit *pTXT)
{
  if (iCtrlType(pTXT, "CUC_TextEditDisplayCursor", szNomType)<0)
	return -1;

  AfficheCurseur(pTXT);
  return 0;
}


//====================================================================
// Méthode freeClipBoard
// Libère la mémoire utilisée par le presse-papiers
// Permet de suivre en détail la consommation de mémoire
// PV 14/7

void CUC_TextEditFreeClipBoard()
{
  if (szSelText!=NULL)
  { free(szSelText);
    szSelText = NULL;
  }
}
