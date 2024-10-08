// vspell.c
// Proc�dures de v�rification d'orthographe
// PV 15/05/04

#include <stdio.h>
#include <fcntl.h>                  // O_RDWR
#include <stdlib.h>                 // malloc
#include <string.h>                 // strdup

#ifndef UNIX
#include <io.h>                     // open
#include <direct.h>                 // chdir
#else
#include <clib.ref>
#define O_BINARY     0              // N'existe pas sous Unix
#endif

#define uchar   unsigned char
#define ushort  unsigned short

#include "vspell.h"                 // Interface et prototypes de ce module
#include "paires.h"                 // Optimisation des paires de caract�res
#include "casse.h"                  // Conversions maj-min sur caract�res PC-8

// Chemins d'acc�s des dictionnaires
#ifdef UNIX
char szPathPrincipal[] = "/usr/lib/vspell/francais.dic";
char szPathAjouts[]    = "/usr/lib/vspell/ajouts.dic";
#else
char szPathPrincipal[] = "d:/D�veloppement/vspell/francais.dic";
char szPathAjouts[]    = "d:/D�veloppement/vspell/ajouts.dic";
#endif


#define MAXBLOCS 10000U             // Environ 9900 blocs dans la version actuelle
static ushort nbBlocs;              // Nb de blocs lus et stock�s dans tb

static struct sTB
{
  uchar       *sBloc;
  ushort      lgBloc;
} tBloc[MAXBLOCS];                  // Tableau de stockage des blocs en m�moire


#define       MAXAJOUTS 5000U
static uchar  *tszAjouts[MAXAJOUTS];
static ushort nbAjouts;             // Nb de mots ajout�s
static int    bAjoutsDirty;         // Le dico des ajouts doit �tre r�-�crit � la fin

long          VS_nbMotsVerifies;    // A des fins de statistiques
long          VS_nbRecherches;      // Mais non r�-entrant...


// Fonction � rappeler en cas de mot non trouv�
static int (*VS_iBack)(int iMessage, uchar *szMot, unsigned uPos, unsigned uLen);



// �quivalent de strcmp sur pointeurs de char *, pour qsort, bsearch...
int strpcmp(const void *p1, const void *p2)
{
  return strcmp(*(char **)p1, *(char **)p2);
}


// Fonction d'ajout d'un mot dans le dictionnaire des ajouts
void VS_AjouteMot(uchar *szMot)
{
  if (nbAjouts==MAXAJOUTS)
  { printf("VS_AjouteMot: Nb maximum de mots (%u) atteint dans le dictionnaire uilisateur\n", MAXAJOUTS);
    return;                          // Demande d'ajout ignor�e
  }
  
  tszAjouts[nbAjouts] = strdup(szMot);
  if (tszAjouts[nbAjouts]==NULL)
  { printf("VS_AjouteMot: Echec au strdup(\"%s\")\n", szMot);
    return;                          // Demande d'ajout ignor�e
  }
  nbAjouts++;
  
  if (bAjoutsDirty>=0)               // On n'est pas en lecture initiale
  { ushort uPos;
  
    bAjoutsDirty = 1;                // Dico � sauvegarder � la fin
    
    // Tri par insertion du nouveau mot, de fa�on � ce que la liste des
    // ajouts soit toujours tri�e
    uPos = nbAjouts-1;
    while (uPos>0)
      if (strcmp(tszAjouts[uPos-1], tszAjouts[uPos])>0)
      { char *temp;
        temp = tszAjouts[uPos-1];
        tszAjouts[uPos-1] = tszAjouts[uPos];
        tszAjouts[uPos] = temp;
        uPos--;
      }
      else
        break;
  }
}


#define LitDico(pStock, nbCar)  fread(pStock, 1, nbCar, fDic)

 
// Initialisation: lecture du dictionnaire principal et du dictionnaire
// des ajouts en m�moire
int VS_iInit()
{
  ushort lgBloc;
  FILE   *fDic;
  FILE   *fAjouts;

  fDic = fopen(szPathPrincipal, "rb");

  if (fDic==NULL)
  { fprintf(stderr, "VS_iInit: Echec � l'ouverture du dictionnaire principal ");
    perror(szPathPrincipal);
    return -1;
  }
  if (setvbuf(fDic, NULL, _IOFBF, 32000))   // Buffer de leture plus g�n�reux
  { perror("VS_iInit: Echec au setvbuf");
    exit(1);
  }
  
  nbBlocs = 0;
  for(;;)
  {
    LitDico((uchar *)&lgBloc, 2);
    if (lgBloc==0) break;                  
    
    if (nbBlocs>=MAXBLOCS)
    { printf("iVS_init: Nb maximum de blocs atteint (%u)\n", MAXBLOCS);
      return -1;
    }
    
    tBloc[nbBlocs].lgBloc = lgBloc;
    tBloc[nbBlocs].sBloc = malloc(lgBloc-2);
    if (tBloc[nbBlocs].sBloc==NULL)
    { printf("iVS_init: Echec au malloc(%u) lors de la lecture du bloc %u\n", lgBloc-2, nbBlocs+1);
      return -1;
    }
    LitDico(tBloc[nbBlocs].sBloc, lgBloc-2);
    nbBlocs++;  
  }

  fclose(fDic);
  
  nbAjouts = 0;
  fAjouts = fopen(szPathAjouts, "r");
  if (fAjouts!=NULL)
  { char szBuffer[100];
    bAjoutsDirty = -1;
    while (fgets(szBuffer, 100, fAjouts)!=NULL)
    { szBuffer[strlen(szBuffer)-1] = 0;
      if (szBuffer[0]==0) continue;
      VS_AjouteMot(szBuffer);
    }
    fclose(fAjouts);
    qsort(tszAjouts, nbAjouts, sizeof(tszAjouts[0]), strpcmp);
    bAjoutsDirty = 0;
  }
  
  VS_nbMotsVerifies = 0;
  VS_nbRecherches = 0;
  return 0;
}



// Termine la s�ance de corrections
// Lib�re les ressources m�moire
// Met � jour le dictionnaire utilisateur le cas �ch�ant
void VS_Fin()
{
  ushort i;
  
  // On lib�re la m�moire occup�e par la table des blocs
  for (i=0 ; i<nbBlocs ; i++)
    free(tBloc[i].sBloc);
    
  if (bAjoutsDirty)
  { FILE *fAjouts;
    
    fAjouts = fopen(szPathAjouts, "w");    
    if (fAjouts==NULL)
    { fprintf(stderr, "VS_Fin: Echec � l'ouverture du dictionnaire des ajouts %s:", szPathAjouts);
      exit(1);
    }
      
    for (i=0 ; i<nbAjouts ; i++)
      fprintf(fAjouts, "%s\n", tszAjouts[i]);
    fclose(fAjouts);
  }
  
  // Ainsi que les ajouts
  for (i=0 ; i<nbAjouts ; i++)
    free(tszAjouts[i]);
}



// Recherche dans le dico principal
static int iChercheMotDP(ushort uBloc, uchar *szMot)
{
  ushort      lgBloc;
  uchar       lmc, lm;
  ushort      uSousBloc;
  ushort      i;
  uchar       j;
  uchar       *p, c;
  int         Ok;

  uBloc--;
  
  if (uBloc>=nbBlocs)
  { printf("iChercheMotDP(%u, \"%s\"): No de bloc incorrect !\n", uBloc, szMot);
    _asm int 3;     // appel du debugger
    exit(1);
  }
  
  lgBloc = tBloc[uBloc].lgBloc;
  i = 0;
  while (i<lgBloc)
  { 
    lmc = tBloc[uBloc].sBloc[i++];
    lm = lmc%32;
    uSousBloc = lmc/32;
    p = szMot;
    
    Ok = 1;
    for (j=0 ; j<lm ; j++)
    {
      if ((c=tBloc[uBloc].sBloc[i++])<155)
      { if (*p!=c) Ok = 0;
        if (*p) p++;
      }
      else
      { if (*p!=tP[c-155][0]) Ok = 0;
        if (*p) p++; else Ok = 0;
        if (*p!=tP[c-155][1]) Ok = 0;
        if (*p) p++;
      }
    }
    
    if (uSousBloc)
    { if (uSousBloc==7)
      { memcpy(&uSousBloc, tBloc[uBloc].sBloc+i, 2);
        i += 2;
      }
    }
    
    if (Ok)                     // Si la cl� correspond
      if (uSousBloc)            // On est sur un noeud
        return iChercheMotDP(uSousBloc, p);
      else                      // On est sur une feuille
        if (*p==0) return 1;    // La feuille correspond au mot complet : ok
  }
  return 0;
}


// Recherche dans le dictionnaire utilisateur
// Comme les mots sont tri�s, on utilise le bsearch
static int iChercheMotAjouts(uchar *szMot)
{
  return bsearch(&szMot, tszAjouts, nbAjouts, sizeof(tszAjouts[0]), strpcmp)!=NULL;
}


static int iChercheMot(ushort uBloc, uchar *szMot)
{
  VS_nbRecherches++;
  if (!iChercheMotDP(uBloc, szMot))
    return iChercheMotAjouts(szMot);
}


// Retour -1 si demande d'interruption
// 0 si ok pour continuer
static int iVerif1Mot(uchar *szMot, int iPos, int iLen)
{
  char  szMotOrig[50];
  int   iTrouve;
  int   i;
  
  if (strlen(szMot)==1)
    return 0;
  if (iEstMaj(szMot[0]) && iEstMaj(szMot[1]))           // 2 1�res lettres en maj: on ignore
    return 0;
  
  // Les mots contenant des chiffres sont ignor�s.
  // Impossible d'utiliser strcspn, n'identifie pas les mots commen�ant par des chiffres !
  for (i=strlen(szMot) ; i-- ; )
    if (szMot[i]>='0' && szMot[i]<='9')
      return 0;

  VS_nbMotsVerifies++;
  strcpy(szMotOrig, szMot);
  
  iTrouve = iChercheMot(nbBlocs, szMot);

  // Si la recherche directe n'a pas abouti, on essaie d'inverser maj/min pour la
  // 1�re lettre.
  // Dans le cas d'une majuscule ayant plusieurs formes minuscules accentu�es, on
  // les essaie toutes tant qu'on n'a pas trouv�.
  if (iTrouve==0)
  {      
    if (iEstMaj(szMot[0]))
    { 
      switch(szMot[0])
      {
    case 'A':
      szMot[0] = cMin(szMot[0]);
      iTrouve = iChercheMot(nbBlocs, szMot);
      if (iTrouve==0)                               // Acre
      { szMot[0] = a_CIRCONFLEXE;
        iTrouve = iChercheMot(nbBlocs, szMot);
      }
      // Tous les mots comen�ant par a_GRAVE sont des mots compos�s (�-propos)
      break;
    
    case E_AIGU:
      szMot[0] = e_AIGU;
      iTrouve = iChercheMot(nbBlocs, szMot);
      break;
    
    case 'E':
      szMot[0] = cMin(szMot[0]);
      iTrouve = iChercheMot(nbBlocs, szMot);
      if (iTrouve==0)                               // Ecole
      { szMot[0] = e_AIGU;
        iTrouve = iChercheMot(nbBlocs, szMot);
      }
      if (iTrouve==0)                               // Etre
      { szMot[0] = e_CIRCONFLEXE;
        iTrouve = iChercheMot(nbBlocs, szMot);
      }
      if (iTrouve==0)                               // Ere
      { szMot[0] = e_GRAVE;
        iTrouve = iChercheMot(nbBlocs, szMot);
      }
      break;
      
    case 'I':
      szMot[0] = cMin(szMot[0]);
      iTrouve = iChercheMot(nbBlocs, szMot);
      if (iTrouve==0)                               // Ile
      { szMot[0] = i_CIRCONFLEXE;
        iTrouve = iChercheMot(nbBlocs, szMot);
      }
      break;
    
    case 'O':
      szMot[0] = cMin(szMot[0]);
      iTrouve = iChercheMot(nbBlocs, szMot);
      if (iTrouve==0)                               // Oter
      { szMot[0] = o_CIRCONFLEXE;
        iTrouve = iChercheMot(nbBlocs, szMot);
      }
      break;
    
    case 'C':
      szMot[0] = cMin(szMot[0]);
      iTrouve = iChercheMot(nbBlocs, szMot);
      if (iTrouve==0)                               // Ca
      { szMot[0] = c_CEDILLE;
        iTrouve = iChercheMot(nbBlocs, szMot);
      }
      break;
      
    default:
      szMot[0] = cMin(szMot[0]);
      iTrouve = iChercheMot(nbBlocs, szMot);
      break;
      }
    }
    // Si le mot minuscule n'existe pas, on cherche si l'othographe majuscule existe.
    else
    { szMot[0] = toupper(szMot[0]);
      iTrouve = iChercheMot(nbBlocs, szMot);
    
      // On pr�vient qu'on l'a trouv�, mais avec une majuscule pour commencer
      if (iTrouve)
        return VS_iBack(VSM_NOM_PROPRE, szMotOrig, iPos, iLen);
    }
  }
  
  // Si malgr� �a le mot n'existe pas, on pr�vient la fonction de rappel
  if (!iTrouve)
    return VS_iBack(VSM_MOT_INCONNU, szMotOrig, iPos, iLen);
    
  return 0;
}


static int isSep(uchar c)
{
  return strchr(" \t\n\r.,;:!?-&+*/=\\\"'()[]{}<>%��^$#@_`~�", c)!=NULL;
}                                         


// Fonction principale de v�rification
void VS_Spell(uchar *szBuffer, unsigned uPos, int (*iBack)(int, uchar *, unsigned, unsigned))
{
  uchar    szMot[50], c;
  unsigned iMot, iBuf, p;
  
  VS_iBack = iBack;

  // D�coupage en mots
  iBuf = 0;
  
  for (;;)
  {
    c = szBuffer[iBuf++];
    while (c && isSep(c))
    {
      if (c==123)       // accolade ouvrante: on ignore jusqu'� la fermeture
      { do
          c = szBuffer[iBuf++];
        while (c && c!=125); 
        if (c)
      c = szBuffer[iBuf++];
      }
      else
    c = szBuffer[iBuf++];
    }
    if (c==0) break;
    
    iMot = 0;
    p = iBuf;
    while (c && !isSep(c))
    { szMot[iMot++] = c;
      c = szBuffer[iBuf++];
    }
    szMot[iMot++] = 0;
    
    if (iVerif1Mot(szMot, p-1, iMot)<0)
      return;
    
    if (c==0) break;
    iBuf--;               // Le s�parateur doit �tre "mang�" par le test
                          // du d�but � cause du test sur les accolades
  }
}
