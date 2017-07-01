/* cucdlb.c 
** Impl‚mentation du contr“le DirListBox de la bibliothŠque CUC
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

static char szNomClasse[] = "CUC DirListBox";
static char szNomType[]   = "DLB";

// Cette d‚finition n'est connue que pour les fonctions de ce fichier
struct CUC_DirListBox
{
  char	szType[4];			// Pour des contr“les internes (DLB)
  WINDOW *wDisp;
  int	(*iRaiseEvent)(void *, int , int );	// Messages en retour
  char  szDrive[LGPATH+1];	// unit‚
  char  szPath[LGPATH+1]; 	// chemin des fichiers
  int 	TabSize;			// taille des espaces de d‚calage 
  struct CUC_List *pLST;	// liste de répertoires
};

/*====================================================================*/
static int iRechercheRep(struct CUC_DirListBox *pDLB)
{
#ifdef UNIX
  DIR *dirp; 
  struct dirent *dp;
  struct stat s;
#endif
  char szRepTotal[LGPATH];
  char szNomFic[LGPATH];
  char szDecal[LGPATH+10];
  char buffer[LGPATH];
  char szPath[LGPATH];
  char szTab[10];
  int i,j=0,a=0,n;
  int lDrive,lPath, lRep;
  
  strcpy(szPath, pDLB->szPath);
  lPath = szPath!=NULL?(int)strlen(szPath):0;
  if (lPath && szPath[lPath-1]!='/') { strcat(szPath, "/"); lPath++; }

  lDrive = pDLB->szDrive!=NULL?(int)strlen(pDLB->szDrive):0;
  //tri de la liste 
  CUC_ListSetPropNum(pDLB->pLST,CUCP_SORTED,1);  

  if (lDrive && (pDLB->szDrive[lDrive-1]!='/') && (szPath[0]!='/'))
	sprintf(szRepTotal,"%s/%s",pDLB->szDrive,szPath);
  else 
  { // Soit drive, soit path se terminent par '/'
	if ((pDLB->szDrive[lDrive-1]) != (szPath[0]))
	  sprintf(szRepTotal,"%s%s",pDLB->szDrive,szPath);
	else 
	 sprintf(szRepTotal,"%s%s",pDLB->szDrive,szPath+1);
  }

  lRep = szRepTotal!=NULL?(int)strlen(szRepTotal):0;

  // On determine le niveau n du path (szPath se termine par '/')
  n = 1;
  for (j=1;j<lPath;j++) if (szPath[j]=='/') n++;

#ifdef UNIX
  if ( (dirp = opendir(szRepTotal)) == NULL ) return -1;
  while( (dp = readdir(dirp)) != NULL)
  {
	sprintf(szNomFic,"%s%s",szRepTotal, dp->d_name);
	stat(szNomFic,&s);
	if (s.st_mode&S_IFDIR) 
	{
	  for (j=0;j<n;j++) szTab[j]='\t';
	  szTab[j] = 0;
	  if ( dp->d_name!=NULL && (dp->d_name[0]!='.') )
	  {
		sprintf(szDecal,"%s%s",szTab,dp->d_name);
		CUC_ListAddItem(pDLB->pLST,szDecal,-1);    
	  } 
	}	
  }
  closedir(dirp);
#else
  szNomFic[0] = szNomFic[0];
#endif

  // fin tri des r‚pertoires
  CUC_ListSetPropNum(pDLB->pLST,CUCP_SORTED,0);  

  // On rajoute le drive
  n = 0; a=0;
  if (pDLB->szDrive!=NULL)
	CUC_ListAddItem(pDLB->pLST, pDLB->szDrive, n++);

  // On rajoute le path
  for (i=(szPath[0]=='/'?1:0); i<lPath; i++)
  {
	if (szPath[i] && szPath[i]!='/') buffer[a++] = szPath[i];
	else
	{
	  buffer[a] = 0;
	  for (j=0;j<n;j++) szTab[j]='\t';
	  szTab[j] = 0;
	  sprintf(szDecal,"%s%s",szTab,buffer);
	  CUC_ListAddItem(pDLB->pLST,szDecal,n++);
	  a=0;
	}
  }
  // On se positionne sur le dernier r‚pertoire ouvert
  CUC_ListSetPropNum(pDLB->pLST, CUCP_LISTINDEX, n-1);
  return 0;
}

/*====================================================================*/
// Cr‚ation de la DirListbox 

struct CUC_DirListBox *CUC_DirListBoxCreate(WINDOW *w, int (*iRaiseEvent)(void *, int , int ))
{
  struct  CUC_DirListBox *pDLB;

  pDLB = (struct  CUC_DirListBox *)malloc(sizeof(struct CUC_DirListBox));

  if (pDLB==NULL)
  { aprintf("CUC: CUC_DirListBoxCreate", "Echec au malloc !");
    return NULL;
  }
  
  /* Initialisation avec des valeurs quelconques mais plausibles
  ** Ces valeurs ne sont pas sp‚cifi‚es dans le cahier des charges
  ** Un programme NE DOIT PAS en tenir compte
  */
  pDLB->wDisp = w;
  pDLB->iRaiseEvent = iRaiseEvent;
  strcpy(pDLB->szType, szNomType);		// Choix conventionnel
  pDLB->szPath[0] = 0;
  pDLB->szDrive[0] = 0;
  pDLB->TabSize = 1;
  pDLB->pLST = CUC_ListCreate(w, iRaiseEvent);
  return pDLB;
}

/*====================================================================*/
// Destruction d'une DirListBox   

void CUC_DirListBoxDestruct(struct CUC_DirListBox *pDLB)
{
  if (iCtrlType(pDLB, "CUC_DirListBoxDestruct", szNomType)<0)
    return;
  CUC_ListDestruct(pDLB->pLST); 
  pDLB->szType[0] = 0;
  free((void *)pDLB);			// puis la structure
}


/*====================================================================*/
// Positionnement d'une propri‚t‚ num‚rique

int CUC_DirListBoxSetPropNum(struct CUC_DirListBox *pDLB, int iProp, int iArg)

{
  if (iCtrlType(pDLB->szType, "CUC_DirListBoxSetPropNum", szNomType)<0)
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
	  return(CUC_ListSetPropNum(pDLB->pLST,iProp,iArg));

    case CUCP_SORTED:
    case CUCP_AUTOREFRESH:
    default:
      ErrPropNonGeree(szNomClasse, "SetPropNum", iProp);
      return -1;
  }
}

/*====================================================================*/
// Positionnement d'une propri‚t‚ "void" 
int CUC_DirListBoxSetPropPtr(struct CUC_DirListBox *pDLB, int iProp,void *pArg)
{
   if (iCtrlType(pDLB, "CUC_DirListBoxSetPropPtr",szNomType)<0)
      return -1;

   return(CUC_ListSetPropPtr(pDLB->pLST,iProp,pArg));
}



/*====================================================================*/
// Positionnement d'une propri‚t‚ texte

int CUC_DirListBoxSetPropStr(struct CUC_DirListBox *pDLB, int iProp, const char *szVal)
{
  if (iCtrlType(pDLB, "CUC_DirListBoxSetPropStr", szNomType)<0)
    return -1;

  switch(iProp)
  {
    case CUCP_TAG:
      CUC_ListSetPropStr(pDLB->pLST,CUCP_TAG,szVal);
	  break;
    
	case CUCP_PATH:
	 if (strcmp(pDLB->szPath,szVal) )
	 { strncpy2(pDLB->szPath,szVal,LGPATH);
	   CUC_DirListBoxRefresh(pDLB);
	 }
	 break;

    case CUCP_DRIVE:
	  if (strcmp(pDLB->szDrive, szVal) )
	  { strncpy2(pDLB->szDrive, szVal, LGPATH);
		CUC_DirListBoxRefresh(pDLB);
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
// Lecture d'une propri‚t‚ num‚rique

int CUC_DirListBoxGetPropNum(struct CUC_DirListBox *pDLB, int iProp)
{
  if (iCtrlType(pDLB, "CUC_DirListBoxGetPropNum", szNomType)<0)
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
		return(CUC_ListGetPropNum(pDLB->pLST,iProp));

    case CUCP_SORTED:
    case CUCP_AUTOREFRESH:
    default:
      ErrPropNonGeree(szNomClasse, "SetPropNum", iProp);
      return -1;
  }
}

/*====================================================================*/
// Lecture d'une propri‚t‚ void *

void *CUC_DirListBoxGetPropPtr(struct CUC_DirListBox *pDLB, int iProp)
{
  if (iCtrlType(pDLB, "CUC_DirListBoxGetPropPtr", szNomType)<0)
    return NULL;

      CUC_ListGetPropPtr(pDLB->pLST,iProp);
  
  return 0;
}

/*====================================================================*/
// Lecture d'une propri‚t‚ texte
// On ne retourne pas un pointeur sur un champ de donn‚e priv‚,
// mais on copie la chaine … une adresse fournie par l'appellant.
// Routine s‚curis‚e: on gŠre la taille du buffer, et on garantit
// que le buffer se termine par 0.
// Une propri‚t‚ … NULL de fa‡on interne est retourn‚e comme chaŒne nulle.

char *CUC_DirListBoxGetPropStr(struct CUC_DirListBox *pDLB, int iProp, char *szBuffer, int iLBuf)
{
  if (iCtrlType(pDLB, "CUC_DirListBoxGetPropStr", szNomType)<0)
    return NULL;

  switch(iProp)
  {
    
	case CUCP_PATH:  
      if (pDLB->szPath==NULL)
		szBuffer[0] = 0;
      else
        strncpy2(szBuffer, pDLB->szPath, iLBuf);
	  break;
    
	case CUCP_FULLPATH:  
      if (pDLB->szPath==NULL)
		szBuffer[0] = 0;
      else
      { int lDrive = pDLB->szDrive!=NULL?(int)strlen(pDLB->szDrive):0;
		int lPath = pDLB->szPath!=NULL?(int)strlen(pDLB->szPath):0;
		strcpy(szBuffer, pDLB->szDrive);
		lDrive = pDLB->szDrive!=NULL?(int)strlen(pDLB->szDrive):0;
		if (lDrive && pDLB->szDrive[lDrive-1]!='/' && 
		   pDLB->szPath[0]!='/')
		strcat(szBuffer,"/");
		strcat(szBuffer, pDLB->szPath);
		if (lPath && pDLB->szDrive[lPath-1]!='/') strcat(szBuffer,"/");
		szBuffer[iLBuf-1] = 0;
      }
	   break;
    
	case CUCP_DRIVE:  
      if (pDLB->szDrive==NULL)
		szBuffer[0] = 0;
      else
        strncpy2(szBuffer, pDLB->szDrive, iLBuf);
	  break;
	
	case CUCP_TAG:
      CUC_ListGetPropStr(pDLB->pLST,CUCP_TAG,szBuffer,iLBuf);
	  break;

    case CUCP_TYPE:
      strncpy2(szBuffer, pDLB->szType, iLBuf);
      break;

    default:
      ErrPropNonGeree(szNomClasse, "GetPropStr", iProp);
  }

  return szBuffer;
}



/*====================================================================*/
// Lecture d'une propri‚t‚ texte ind‚x‚e pour la DirListBox
// The index number sequence is based on the directories and 
// subdirectories present when the control is created at run time.
// The currently expanded directory is represented using the index -1.
// Directories above the currently expanded directory are represented by
// negative indexes with higher absolute values.  For example, -2 is the
// parent directory of the currently expanded directory and -3 is the 
// directory above that.  Directories below the currently expanded 
// directory range from 0 to ListCount -1.
// The List property works in conjunction with the ListCount and 
// ListIndex properties.
// When the List index is outside the range of actual entries in the 
// list box, an empty string is returned.

char *CUC_DirListBoxGetPropStrInd(struct CUC_DirListBox *pDLB, int iProp, int iIndice, char *szBuffer, int iLBuf)
{
  char *buff;
  int i, j=0, ind, niv;
  char buffer[LGPATH];
  int lPath;

  if (iCtrlType(pDLB, "CUC_DirListBoxGetPropStrInd", szNomType)<0)
    return NULL;

  switch(iProp)
  {
	case CUCP_LIST:
	  if (iIndice==-1)
	  {
		strcpy(szBuffer, pDLB->szPath);
		szBuffer[iLBuf-1] = 0;
	  }
	  else
	  {
		if ( (buff = (char *)malloc(iLBuf*sizeof(char)))==NULL)
		  return NULL;

		szBuffer[0] = 0;

		lPath = pDLB->szPath!=NULL?(int)strlen(pDLB->szPath):0;
		niv = 1;
		for (j=1;j<lPath;j++) if (pDLB->szPath[j]=='/') niv++;
		if (lPath && pDLB->szPath[lPath-1]!='/') niv++;
		j = 0;
		if (pDLB->szPath[0]=='/') strcpy(szBuffer,"/");

		ind=1;
		if (iIndice<0)
		{
		  if (ind<=niv+1+iIndice)
		  {
			for (ind=1;ind<niv+1+iIndice;ind++)
			{
			  if (CUC_ListGetPropStrInd(pDLB->pLST,CUCP_LIST,ind,buff,LGPATH )!=NULL);
			  { // On enlŠve les '\t' 
				for (i=0; buff[i]; i++)
				  if (buff[i]!='\t') 
					buffer[j++] = buff[i];
				buffer[j] = 0;
				strcat(szBuffer, buffer);
				strcat(szBuffer,"/");
				j = 0;
			  }
			}
		  }
		  else szBuffer[0] = 0;
		}
		else
		{
		  int indMax = CUC_ListGetPropNum(pDLB->pLST, CUCP_LISTCOUNT);
		  if (niv+iIndice<indMax)
		  {
			strncpy2(szBuffer, pDLB->szPath, iLBuf);
			if (lPath && pDLB->szPath[lPath-1]!='/') strcat(szBuffer,"/");
			if (CUC_ListGetPropStrInd(pDLB->pLST,CUCP_LIST,niv+iIndice,buff,LGPATH )!=NULL);
			{ // On enlŠve les '\t' 
			  for (i=0; buff[i]; i++)
				if (buff[i]!='\t') 
				  buffer[j++] = buff[i];
			  buffer[j] = 0;
			  strcat(szBuffer, buffer);
			}
		  }
		  else szBuffer[0] = 0;
		}
	  }
	  break;
    
    default:
      ErrPropNonGeree(szNomClasse, "CUC_DirListBoxGetPropStrInd", iProp);
  }

  if (szBuffer[0]) 
  {
	if (szBuffer[(int)strlen(szBuffer)-1] != '/') strcat(szBuffer,"/");
	return szBuffer;
  }
  else return NULL;
}


/*====================================================================*/
static char *PathName(struct CUC_DirListBox *pDLB,char *dirName,int lDirName)
{
  char *buff;
  int i, j=0, ind, niv;
  char buffer[LGPATH];
  char nomRep[LGPATH];
  

	if ( (buff = (char *)malloc(lDirName*sizeof(char)))==NULL)
	  return NULL;

	dirName[0] = 0;

	// On r‚cupŠre l'‚l‚ment courant
	if (CUC_ListGetPropNum(pDLB->pLST,CUCP_LISTINDEX))
	{
	  if (CUC_ListGetPropStr(pDLB->pLST,CUCP_TEXT, buff, lDirName)!=NULL)
	  { // On enlŠve les '\t' 
		for (i=1; buff[i]; i++) if (buff[i]!='\t') nomRep[j++] = buff[i];
		nomRep[j] = 0;
		// niveau de dirname = i-j 
		niv = i-j;
		j = 0;
		if (pDLB->szPath[0]=='/') strcpy(dirName,"/");

		for (ind=1;ind<niv;ind++)
		{
		  if (CUC_ListGetPropStrInd(pDLB->pLST,CUCP_LIST,ind,buff,LGPATH )!=NULL);
		  { // On enlŠve les '\t' 
			for (i=0; buff[i]; i++)
			  if (buff[i]!='\t') 
				buffer[j++] = buff[i];
			buffer[j] = 0;
		  }
		  /*
		  if (!ind)
		  { // on r‚cupŠre le drive
			if (buffer!=NULL)
			{ int lbuff=buffer!=NULL?(int)strlen(buffer):0;
			  strcpy(dirName,buffer);
			  if (buffer[lbuff-1]!='/') strcat(dirName,"/");
			}
			else if (pDLB->szPath[0]=='/') strcpy(dirName,"/");
		  }
		  else
		  */
		  {
			strcat(dirName, buffer);
			strcat(dirName,"/");
		  }
		  j = 0;
		}
		strcat(dirName,nomRep);
		return dirName;
	  }
	}
	else
	{ // On est sur le drive
	  if (pDLB->szPath[0]=='/') { strcpy(dirName,"/"); return dirName; }
	}
  return NULL;
}




//====================================================================
// Fonction principale de traitement des ‚v‚nements par le contr“le
int CUC_DirListBoxDoEvent(struct CUC_DirListBox *pDLB, int iEvent, int iArg)
{

  if (iCtrlType(pDLB, "CUC_DirListBoxDoEvent", szNomType)<0)
    return -1;

  if (iEvent==CUCE_KEY && iArg=='\n')
  {
	char buffer[LGPATH];
	if (PathName(pDLB,buffer,LGPATH)!=NULL)
	strncpy2(pDLB->szPath, buffer, LGPATH);
	CUC_DirListBoxRefresh(pDLB);
	return 0;
  }
  else return(CUC_ListDoEvent(pDLB->pLST,iEvent,iArg));
}

/*====================================================================*/
// M‚thode Move: d‚placement combin‚ du contr“le sur X et Y

int CUC_DirListBoxMove(struct CUC_DirListBox *pDLB, int iTop, int iLeft)
{
  if (iCtrlType(pDLB, "CUC_DirListBoxMove", szNomType)<0)
    return -1;

  CUC_ListMove(pDLB->pLST,iTop,iLeft);
  
  return 0; 
}

/*====================================================================*/
// M‚thode Resize: Changement de taille combin‚ largeur/hauteur

int CUC_DirListBoxResize(struct CUC_DirListBox *pDLB, int iHeight, int iWidth)
{
  if (iCtrlType(pDLB, "CUC_DirListBoxResize", szNomType)<0)
    return -1;

  CUC_ListResize(pDLB->pLST,iHeight,iWidth);
  
  return 0;
}

/*====================================================================*/
// M‚thode Refresh: le contr“le se redessine

int CUC_DirListBoxRefresh(struct CUC_DirListBox *pDLB)
{
  if (iCtrlType(pDLB, "CUC_DirListBoxResize", szNomType)<0)
    return -1;
  CUC_ListClear(pDLB->pLST); 
  if (!iRechercheRep(pDLB)) CUC_ListRefresh(pDLB->pLST); 
}





//====================================================================
// M‚thode DisplayCursor : R‚affiche le curseur dans le contr“le
int CUC_DirListBoxDisplayCursor(struct CUC_DirListBox *pDLB)
{
  if (iCtrlType(pDLB, "CUC_DirListBoxDisplayCursor", szNomType)<0)
    return -1;

  return(CUC_ListDisplayCursor(pDLB->pLST));
}
