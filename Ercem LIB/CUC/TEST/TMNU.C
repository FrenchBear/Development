// tmnu.c
// Bibliothäque CUC - Test des menus
// P.VIOLENT 17/7/94

#include <stdio.h>
#include <curses.h>

#include <clib.ref>
#include <biberc.h>

#include "cuc.h"
#include "cucpriv.h"

#define ESSAI           50

#define IDM_FICHIER     (ESSAI+30)
#define IDC_NOUVEAU     (ESSAI+31)
#define IDC_OUVRIR      (ESSAI+32)
#define IDC_ENREG       (ESSAI+33)
#define IDC_ENREGSOUS   (ESSAI+34)
#define IDC_IMPRIMER    (ESSAI+35)
#define IDC_OPTIMP      (ESSAI+36)
#define IDC_QUITTER     (ESSAI+37)

#define IDM_EDITION     (ESSAI+40)
#define IDC_ANNULER     (ESSAI+41)
#define IDC_COUPER      (ESSAI+42)
#define IDC_COPIER      (ESSAI+43)
#define IDC_COLLER      (ESSAI+44)
#define IDC_EFFACER     (ESSAI+45)
#define IDC_COLORIAGE   (ESSAI+46)

#define IDC_COLORC      (ESSAI+47)
#define IDC_COLORCPP    (ESSAI+48)
#define IDC_COLORAUCUN  (ESSAI+49)
#define IDC_COLORPERSO  (ESSAI+50)

#define IDC_CP1         (ESSAI+51)
#define IDC_CP2         (ESSAI+52)
#define IDC_CP3         (ESSAI+53)
#define IDC_CP4         (ESSAI+54)

#define IDM_RECHERCHER  (ESSAI+55)
#define IDC_RECHERCHER  (ESSAI+56)
#define IDC_REMPLACER   (ESSAI+57)

#define IDM_AIDE        (ESSAI+60)
#define IDC_APROPOSDE   (ESSAI+61)
#define IDC_COMPTEUR    (ESSAI+62)


struct CUC_Menu      *pmMenu;

static int iNbOpenAide = 0;


int iMenuRaiseEvent(struct CUC_Menu *pMNU, int iEvt, int iArg)
{
//  aprintf("MenuRaiseEvent", "iEvt: %d|iArg: %d", iEvt, iArg);

  if (IDM_AIDE==iArg)
  {
	char szMenuItem[30];
	struct CUC_MenuElement *pme;

	iNbOpenAide++;
	sprintf(szMenuItem, "Nb d'ouvertures: %d", iNbOpenAide);

	pme = CUC_MenuGetElementById(pMNU, IDC_COMPTEUR);
	CUC_MenuElementSetPropStr(pme, CUCP_CAPTION, szMenuItem);
  }
  return 0;
}



// 1äre mÇthode: crÇation "manuelle" avec les routines CUC_Menuxxx
void CreeMenu()
{
  struct CUC_MenuElement *pmFichier, *pmEdition, *pmRech, *pmAide;

  pmMenu    = CUC_MenuCreate(stdscr, iMenuRaiseEvent);
  if (pmMenu==NULL) return;
  
  pmFichier = CUC_MenuAddElement(pmMenu,    NULL,       IDM_FICHIER,    "&Fichier",             0,          0);
			  CUC_MenuAddElement(pmMenu,    pmFichier,  IDC_NOUVEAU,    "&Nouveau",             0,          0);
			  CUC_MenuAddElement(pmMenu,    pmFichier,  IDC_OUVRIR,     "&Ouvrir...",           0,          0);
			  CUC_MenuAddElement(pmMenu,    pmFichier,  IDC_ENREG,      "&Enregistrer",         0,          0);
			  CUC_MenuAddElement(pmMenu,    pmFichier,  IDC_ENREGSOUS,  "En&registrer sous...", 0,          0);
			  CUC_MenuAddElement(pmMenu,    pmFichier,  0,              "",                     0,          CUCM_SEP);
			  CUC_MenuAddElement(pmMenu,    pmFichier,  IDC_IMPRIMER,   "&Imprimer",            KEY_CTRL_I, 0);
			  CUC_MenuAddElement(pmMenu,    pmFichier,  IDC_OPTIMP,     "&Options d'impression...",0,           0);
			  CUC_MenuAddElement(pmMenu,    pmFichier,  0,              "",                     0,          CUCM_SEP);
			  CUC_MenuAddElement(pmMenu,    pmFichier,  IDC_QUITTER,    "&Quitter",             KEY_F(4),   0);

  pmEdition = CUC_MenuAddElement(pmMenu,    NULL,       IDM_EDITION,    "&Edition",             0,          0);
			  CUC_MenuAddElement(pmMenu,    pmEdition,  IDC_ANNULER,    "&Annuler",             KEY_CTRL_Z, 0);
			  CUC_MenuAddElement(pmMenu,    pmEdition,  0,              "",                     0,          CUCM_SEP);
			  CUC_MenuAddElement(pmMenu,    pmEdition,  IDC_COUPER,     "&Couper",              KEY_CTRL_X, 0);
			  CUC_MenuAddElement(pmMenu,    pmEdition,  IDC_COPIER,     "Copi&er",              KEY_CTRL_C, 0);
			  CUC_MenuAddElement(pmMenu,    pmEdition,  IDC_COLLER,     "C&oller",              KEY_CTRL_V, 0);
			  CUC_MenuAddElement(pmMenu,    pmEdition,  IDC_EFFACER,    "Ef&facer",             KEY_DELETE, 0);

  pmRech =    CUC_MenuAddElement(pmMenu,    NULL,       IDM_RECHERCHER, "&Rechercher",          0,          0);
			  CUC_MenuAddElement(pmMenu,    pmRech,     IDC_RECHERCHER, "&Rechercher...",       KEY_CTRL_F, 0);
			  CUC_MenuAddElement(pmMenu,    pmRech,     IDC_REMPLACER,  "&Remplacer...",        0,          0);
  
  pmAide =    CUC_MenuAddElement(pmMenu,    NULL,       IDM_AIDE,       "&Aide",                0,          0);
			  CUC_MenuAddElement(pmMenu,    pmAide,     IDC_APROPOSDE,  "&A propos de...",      0,          0);

}


// 2äme mÇthode, FormMenuCreate avec un tableau de struct FormMenu
struct FormMenu tEssaiMenus[] =
{
  IDM_FICHIER,    "&Fichier",               0,          0,        0,
  IDC_NOUVEAU,    "&Nouveau",               0,          0,        IDM_FICHIER,
  IDC_OUVRIR,     "&Ouvrir...",             0,          0,        IDM_FICHIER,
  IDC_ENREG,      "&Enregistrer",           0,          0,        IDM_FICHIER,
  IDC_ENREGSOUS,  "En&registrer sous...",   0,          0,        IDM_FICHIER,
  0,              "",                       0,          CUCM_SEP, IDM_FICHIER,
  IDC_IMPRIMER,   "&Imprimer",              KEY_CTRL_I, 0,        IDM_FICHIER,
  IDC_OPTIMP,     "&Options d'impression...",0,         0,        IDM_FICHIER,
  0,              "",                       0,          CUCM_SEP, IDM_FICHIER,
  IDC_QUITTER,    "&Quitter",               KEY_F(4),   0,        IDM_FICHIER,

  IDM_EDITION,    "&Edition",               0,          0,        0,
  IDC_ANNULER,    "&Annuler",               KEY_CTRL_Z, 0,        IDM_EDITION,
  0,              "",                       0,          CUCM_SEP, IDM_EDITION,
  IDC_COUPER,     "&Couper",                KEY_CTRL_X, 0,        IDM_EDITION,
  IDC_COPIER,     "Copi&er",                KEY_CTRL_C, 0,        IDM_EDITION,
  IDC_COLLER,     "&Coller",                KEY_CTRL_V, 0,        IDM_EDITION,
  IDC_EFFACER,    "Ef&facer",               KEY_DELETE, 0,        IDM_EDITION,
  0,              "",                       0,          CUCM_SEP, IDM_EDITION,
  IDC_COLORIAGE,  "Coloria&ge",             0,          0,        IDM_EDITION,
  
  IDC_COLORC,     "&C",                     0,          0,        IDC_COLORIAGE,
  IDC_COLORCPP,   "C&++",                   0,          0,        IDC_COLORIAGE,
  IDC_COLORAUCUN, "&Aucun",                 0,          0,        IDC_COLORIAGE,
  0,              "",                       0,          CUCM_SEP, IDC_COLORIAGE,
  IDC_COLORPERSO, "&PersonnalisÇ",          0,          0,        IDC_COLORIAGE,

  IDC_CP1,        "&1 Bleu",                0,          0,        IDC_COLORPERSO,
  IDC_CP2,        "&2 Vert",                0,          0,        IDC_COLORPERSO,
  IDC_CP3,        "&3 Rouge",               0,          0,        IDC_COLORPERSO,
  IDC_CP4,        "&4 BariolÇ et de mauvais goñt",  0,  0,        IDC_COLORPERSO,
  
  IDM_RECHERCHER, "&Rechercher",            0,          0,        0,
  IDC_RECHERCHER, "&Rechercher...",         KEY_CTRL_F, 0,        IDM_RECHERCHER,
  IDC_REMPLACER,  "&Remplacer...",          0,          0,        IDM_RECHERCHER,
  
  IDM_AIDE,       "&Aide",                  0,          0,        0,
  IDC_APROPOSDE,  "&A propos de...",        0,          0,        IDM_AIDE,
  IDC_COMPTEUR,   "",                       0,          0,        IDM_AIDE,
  -1
};


void CreeMenu2()
{
  pmMenu = CUC_MenuCreateAssist(tEssaiMenus, stdscr, iMenuRaiseEvent);
}


int main()
{
  int iRet;
  
  InitEcran();
  
  mvaddstr(0,0,"Bibliothäque CUC - Test des menus");
  mvaddstr(5,0,"Texte quelconque, pour voir si le rÇaffichage de la zone sous le menu\nse fait correctement.");
  
  CreeMenu2();
  CUC_MenuShow(pmMenu);
 // CUC_MenuDump(pmMenu); getchar();
  
  for(;;)
  {
	int c = getch2();
	int d;
	
	if (c=='q' || c=='Q' || c==KEY_CTRL_D)
	  break; 
 
	d = ALT(maj((char)c));   
	if (CUC_MenuIsOpenKey(pmMenu, d))
	{ iRet = CUC_MenuExec(pmMenu, d, stdscr);
	  move(10,0);
	  printw("Cmd: %5d", iRet);
	}
	else if ((iRet = CUC_MenuIsAccelKey(pmMenu, c))>0)
	{ move(10,0);
	  printw("Acc: %5d", iRet);
	}
	else
	{ move(10,0);
	  printw("???       ");
	}
	
  }
  
  FinEcran();
  return 0;
}
