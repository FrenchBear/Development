/* cucflb.c
** Impl‚mentation du contr“le FileListBox de la bibliothŠque CUC
** 23/06/94 Christophe R.
** 26/12/94 PV	strncpy2
**
** Les fonctions et variables non d‚clar‚es dans l'interface
** doivent imp‚rativement ˆtre d‚clar‚es et static
*/

#include <stdio.h>
#include <curses.h>

#ifdef UNIX
#include <dirent.h>
#include <sys/stat.h>
#else
#endif

#include <clib.ref>
#include <biberc.h>

#include "cuc.h"
#include "cucpriv.h"
#include "import.h"

static char szNomClasse[] = "CUC FileListBox";
static char szNomType[]   = "FLB";

// Cette d‚finition n'est connue que pour les fonctions de ce fichier
struct CUC_FileListBox
{
  char	szType[4];				// Pour des contr“les internes (FLB)
  
  WINDOW *wDisp;
  int	(*iRaiseEvent)(void *, int , int );	// Messages en retour
  char  szDrive[LGPATH+1];		// unit‚
  char  szPath[LGPATH+1];		// chemin des fichiers
  char  szPattern[LGPATTERN+1];	// code de terminaison d'un fichier
  struct CUC_List *pLST;		// liste des fichiers
};

/*====================================================================*/
static int iRechercheFich(struct CUC_FileListBox *pFLB)
{ 
#ifdef UNIX
  DIR *dirp;
  struct dirent *dp;
  struct stat s;
#endif  
  char szRepTotal[LGPATH];
  char szNomFic[LGPATH];
  int lPath,lDrive,lRep; 

  if(pFLB->szPattern==NULL) return -1;

  lPath = pFLB->szPath!=NULL?(int)strlen(pFLB->szPath):0;
  lDrive = pFLB->szDrive!=NULL?(int)strlen(pFLB->szDrive):0;
  
  if(lDrive && (pFLB->szDrive[lDrive-1]!='/') && 
	 (pFLB->szPath[0]!='/'))  
	   sprintf(szRepTotal,"%s/%s",pFLB->szDrive,pFLB->szPath);
  else 
	if(lDrive && (pFLB->szDrive[lDrive-1]) != (pFLB->szPath[0]))
	   sprintf(szRepTotal,"%s%s",pFLB->szDrive,pFLB->szPath);
	else 
	   sprintf(szRepTotal,"%s%s",pFLB->szDrive,pFLB->szPath+1);
 
  lRep = szRepTotal!=NULL?(int)strlen(szRepTotal):0;

#ifdef UNIX
  if( (dirp = opendir(szRepTotal)) != NULL )
  {
	while( (dp = readdir(dirp)) != NULL)
	{
	  if(lRep && szRepTotal[lRep-1]!='/')
		sprintf(szNomFic,"%s/%s",szRepTotal, dp->d_name);
	  else
		sprintf(szNomFic,"%s%s",szRepTotal, dp->d_name);
	  
	  stat(szNomFic,&s);
	  if( !(s.st_mode&S_IFDIR) && !strpat(dp->d_name,pFLB->szPattern))
		CUC_ListAddItem(pFLB->pLST,dp->d_name,-1);
	}
	closedir(dirp);
	return 0;
  }
  else return -1;
#else
  szNomFic[0] = szNomFic[0];		// Evite un warning...
#endif
}

/*====================================================================*/
// Cr‚ation de la FileListbox 

struct CUC_FileListBox *CUC_FileListBoxCreate(WINDOW *w, int (*iRaiseEvent)(void *, int , int ))
{
  struct  CUC_FileListBox *pFLB;

  pFLB = (struct  CUC_FileListBox *)malloc(sizeof(struct CUC_FileListBox));

  if (pFLB==NULL)
  { aprintf("CUC: CUC_FileListBoxCreate", "Echec au malloc !");
    return NULL;
  }
  
  /* Initialisation avec des valeurs quelconques mais plausibles
  ** Ces valeurs ne sont pas sp‚cifi‚es dans le cahier des charges
  ** Un programme NE DOIT PAS en tenir compte
  */
  pFLB->wDisp = w;
  pFLB->iRaiseEvent = iRaiseEvent;
  strcpy(pFLB->szType, szNomType);		// Choix conventionnel
  pFLB->szPattern[0] = 0;
  pFLB->szPath[0] = 0;
  pFLB->szDrive[0] = 0;
  pFLB->pLST = CUC_ListCreate(w, iRaiseEvent);
  CUC_ListSetPropNum(pFLB->pLST, CUCP_SORTED, TRUE);
  CUC_ListSetPropNum(pFLB->pLST, CUCP_AUTOREFRESH, TRUE);
  
  return pFLB;
}

/*====================================================================*/
// Destruction d'une FileListBox   

void CUC_FileListBoxDestruct(struct CUC_FileListBox *pFLB)
{
  if (iCtrlType(pFLB, "CUC_FileListBoxDestruct", szNomType)<0)
    return;
    
  CUC_ListDestruct(pFLB->pLST); 
  pFLB->szType[0] = 0;
  free((void *)pFLB);			// puis la structure
}


/*====================================================================*/
// Positionnement d'une propri‚t‚ num‚rique

int CUC_FileListBoxSetPropNum(struct CUC_FileListBox *pFLB, int iProp, int iArg)

{
  if (iCtrlType(pFLB->szType, "CUC_FileListBoxSetPropNum", szNomType)<0)
    return -1;

  switch(iProp)
  {
    case CUCP_LEFT:
    case CUCP_TOP:
    case CUCP_WIDTH:
    case CUCP_HEIGHT:
    case CUCP_VISIBLE:
    case CUCP_ENABLED:
    case CUCP_TABSTOP:
    case CUCP_TABSIZE:
    case CUCP_COLUMNS:
    case CUCP_FOCUS:
    case CUCP_LISTINDEX:
    case CUCP_LISTCOUNT:
		  return(CUC_ListSetPropNum(pFLB->pLST,iProp,iArg));

    case CUCP_SORTED:
    case CUCP_AUTOREFRESH:
    default:
      ErrPropNonGeree(szNomClasse, "SetPropNum", iProp);
      return -1;
  }
}

/*====================================================================*/
// Positionnement d'une propri‚t‚ "void *"

int CUC_FileListBoxSetPropPtr(struct CUC_FileListBox *pFLB, int iProp,void *pArg)
{
   if(iCtrlType(pFLB, "CUC_FileListBoxSetPropPtr",szNomType)<0)
      return -1;
  return(CUC_ListSetPropPtr(pFLB->pLST,iProp,pArg));

}
/*====================================================================*/
// Positionnement d'une propri‚t‚ texte

int CUC_FileListBoxSetPropStr(struct CUC_FileListBox *pFLB, int iProp, const char *szVal)
{
  if (iCtrlType(pFLB, "CUC_FileListBoxSetPropStr", szNomType)<0)
    return -1;

  switch(iProp)
  {
    case CUCP_TAG:
      CUC_ListSetPropStr(pFLB->pLST,CUCP_TAG,szVal);
	  break;

    case CUCP_PATTERN:
	  if (pFLB->szPattern==NULL || strcmp(pFLB->szPattern,szVal) )
	  { strncpy2(pFLB->szPattern,szVal,LGPATTERN);
		CUC_FileListBoxRefresh(pFLB);
	  }
	  break;

    case CUCP_PATH:
	  if (pFLB->szPath==NULL || strcmp(pFLB->szPath,szVal) )
	  { strncpy2(pFLB->szPath, szVal, LGPATH);
		CUC_FileListBoxRefresh(pFLB);
	  }
	  break;

    case CUCP_DRIVE:
	  if (pFLB->szDrive==NULL || strcmp(pFLB->szDrive,szVal) )
	  { strncpy2(pFLB->szDrive,szVal,LGPATH);
		CUC_FileListBoxRefresh(pFLB);
	  }
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
// Positionnement d'une propri‚t‚ texte indic‚e

int CUC_FileListBoxSetPropStrInd(struct CUC_FileListBox *pFLB, int iProp, int iIndice, const char *szVal)
{
  if (iCtrlType(pFLB, "CUC_FileListBoxSetPropStrInd", szNomType)<0)
    return -1;
    
  return CUC_ListSetPropStrInd(pFLB->pLST, iProp, iIndice, szVal);
}

/*====================================================================*/
// Lecture d'une propri‚t‚ num‚rique

int CUC_FileListBoxGetPropNum(struct CUC_FileListBox *pFLB, int iProp)
{
  if (iCtrlType(pFLB, "CUC_FileListBoxGetPropNum", szNomType)<0)
    return -1;

  switch(iProp)
  {
    case CUCP_LEFT:
    case CUCP_TOP:
    case CUCP_WIDTH:
    case CUCP_HEIGHT:
    case CUCP_VISIBLE:
    case CUCP_ENABLED:
    case CUCP_TABSTOP:
    case CUCP_TABSIZE:
    case CUCP_COLUMNS:
    case CUCP_FOCUS:
    case CUCP_LISTINDEX:
    case CUCP_LISTCOUNT:
		return(CUC_ListGetPropNum(pFLB->pLST,iProp));

    case CUCP_SORTED:
    case CUCP_AUTOREFRESH:
    default:
      ErrPropNonGeree(szNomClasse, "SetPropNum", iProp);
      return -1;
  }
}

/*====================================================================*/
// Lecture d'une propri‚t‚ void *

void *CUC_FileListBoxGetPropPtr(struct CUC_FileListBox *pFLB, int iProp)
{
  if (iCtrlType(pFLB, "CUC_FileListBoxGetPropPtr", szNomType)<0)
    return NULL;

  return(CUC_ListGetPropPtr(pFLB->pLST,iProp));
}

/*====================================================================*/
// Lecture d'une propri‚t‚ texte
// On ne retourne pas un pointeur sur un champ de donn‚e priv‚,
// mais on copie la chaine … une adresse fournie par l'appellant.
// Routine s‚curis‚e: on gŠre la taille du buffer, et on garantit
// que le buffer se termine par 0.
// Une propri‚t‚ … NULL de fa‡on interne est retourn‚e comme chaŒne nulle.

char *CUC_FileListBoxGetPropStr(struct CUC_FileListBox *pFLB, int iProp, char *szBuffer, int iLBuf)
{
  if (iCtrlType(pFLB, "CUC_FileListBoxGetPropStr", szNomType)<0)
    return NULL;

  switch(iProp)
  {
    case CUCP_PATTERN:  
      if (pFLB->szPattern==NULL)
		szBuffer[0] = 0;
      else
        strncpy2(szBuffer, pFLB->szPattern, iLBuf);
	  break;
	
    case CUCP_PATH:  
      if (pFLB->szPath==NULL)
		szBuffer[0] = 0;
      else
        strncpy2(szBuffer, pFLB->szPath, iLBuf);
	  break;
    
	case CUCP_DRIVE:  
      if (pFLB->szDrive==NULL)
		szBuffer[0] = 0;
      else
        strncpy2(szBuffer, pFLB->szDrive, iLBuf);
	  break;
	
	case CUCP_TAG:
      CUC_ListGetPropStr(pFLB->pLST,CUCP_TAG,szBuffer,iLBuf);
	  break;

    case CUCP_TYPE:
      strncpy2(szBuffer, pFLB->szType, iLBuf);
      break;

    case CUCP_FILENAME:
	  CUC_ListGetPropStr(pFLB->pLST, CUCP_TEXT, szBuffer, iLBuf);
      break;

    default:
      ErrPropNonGeree(szNomClasse, "GetPropStr", iProp);
  }

  return szBuffer;
}

/*====================================================================*/
// Lecture d'une propri‚t‚ texte indic‚e

char *CUC_FileListBoxGetPropStrInd(struct CUC_FileListBox *pFLB, int iProp, int iIndice, char *szBuffer, int iLBuf)
{
  if (iCtrlType(pFLB, "CUC_FileListBoxGetPropStrInd", szNomType)<0)
    return NULL;
  
  return CUC_ListGetPropStrInd(pFLB->pLST, iProp, iIndice, szBuffer, iLBuf);
}

/*====================================================================*/
// Fonction principale de traitement des ‚v‚nements par le contr“le

int CUC_FileListBoxDoEvent(struct CUC_FileListBox *pFLB, int iEvent, int iArg)
{

  if (iCtrlType(pFLB, "CUC_FileListBoxDoEvent", szNomType)<0)
    return -1;

  return(CUC_ListDoEvent(pFLB->pLST,iEvent,iArg));
}

/*====================================================================*/
// M‚thode Move: d‚placement combin‚ du contr“le sur X et Y

int CUC_FileListBoxMove(struct CUC_FileListBox *pFLB, int iTop, int iLeft)
{
  if (iCtrlType(pFLB, "CUC_FileListBoxMove", szNomType)<0)
    return -1;

  return(CUC_ListMove(pFLB->pLST,iTop,iLeft));
}

/*====================================================================*/
// M‚thode Resize: Changement de taille combin‚ largeur/hauteur

int CUC_FileListBoxResize(struct CUC_FileListBox *pFLB, int iHeight, int iWidth)
{
  if (iCtrlType(pFLB, "CUC_FileListBoxResize", szNomType)<0)
    return -1;

  return(CUC_ListResize(pFLB->pLST,iHeight,iWidth));
}

/*====================================================================*/
// M‚thode Refresh: le contr“le se redessine

int CUC_FileListBoxRefresh(struct CUC_FileListBox *pFLB)
{
  if (iCtrlType(pFLB, "CUC_FileListBoxRefresh", szNomType)<0)
    return -1;
  CUC_ListClear(pFLB->pLST); 
  if(!iRechercheFich(pFLB)) CUC_ListRefresh(pFLB->pLST); 
}

//====================================================================
// M‚thode DisplayCursor : R‚affiche le curseur dans le contr“le
int CUC_FileListBoxDisplayCursor(struct CUC_FileListBox *pFLB)
{
  if (iCtrlType(pFLB, "CUC_FileListBoxRefresh", szNomType)<0)
    return -1;

  return(CUC_ListDisplayCursor(pFLB->pLST));
}
