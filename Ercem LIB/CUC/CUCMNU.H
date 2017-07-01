// cucmnu.h
// Interface du module de gestion des menus de la bibliothèque CUC
// 16/07/94	PV	Implantation des structures de données et de leur accès
//  4/12/94 PV	Implantation du codde opérationnel
// 21/01/91 PV	IdBack pour traiter les événements générés par les menus (DROPDOWN)

struct CUC_Menu;
struct CUC_MenuElement;

// Fonctions de cr‚ation et de destruction
struct CUC_Menu *CUC_MenuCreate(WINDOW *wDisp, int (*iBack)(void *, int , int ), void *IdBack);
struct CUC_Menu *CUC_MenuCreateAssist(struct FormMenu *tFM, WINDOW *wDisp, int (*iBack)(void *, int , int ), void *IdBack);
void   CUC_MenuDestruct(struct CUC_Menu *pMNU);

// Trace interne
void CUC_MenuDump(struct CUC_Menu *pMNU);

// Gestion des propri‚t‚s des menus
int CUC_MenuSetPropNum(struct CUC_Menu *pMNU, int iProp, int iVal);
int CUC_MenuSetPropStr(struct CUC_Menu *pMNU, int iProp, const char *szVal);
int CUC_MenuSetPropPtr(struct CUC_Menu *pMNU, int iProp, const void *pArg);
int CUC_MenuGetPropNum(struct CUC_Menu *pMNU, int iProp);
char *CUC_MenuGetPropStr(struct CUC_Menu *pMNU, int iProp, char *szBuffer, int iBufSize);
void *CUC_MenuGetPropPtr(struct CUC_Menu *pMNU, int iProp);

// Gestion des propri‚t‚s des ‚l‚ments
int CUC_MenuElementSetPropNum(struct CUC_MenuElement *pMEL, int iProp, int iVal);
int CUC_MenuElementSetPropStr(struct CUC_MenuElement *pMEL, int iProp, const char *szVal);
int CUC_MenuElementSetPropPtr(struct CUC_MenuElement *pMEL, int iProp, void *pArg);
int CUC_MenuElementGetPropNum(struct CUC_MenuElement *pMEL, int iProp);
char *CUC_MenuElementGetPropStr(struct CUC_MenuElement *pMEL, int iProp, char *szBuffer, int iBufSize);
void *CUC_MenuElementGetPropPtr(struct CUC_MenuElement *pMEL, int iProp);

// Manipulation du menu
struct CUC_MenuElement *CUC_MenuAddElement(struct CUC_Menu *pMNU, struct CUC_MenuElement *pmeMEL, int iId, char *szText, int iAccel, int iFlags);
void   CUC_MenuShow(struct CUC_Menu *pMNU);

// Exécution du menu
int CUC_MenuExec(struct CUC_Menu *pMNU, int iKey, WINDOW *wDisp);
int CUC_MenuIsOpenKey(struct CUC_Menu *pMNU, int iKey);
int CUC_MenuIsAccelKey(struct CUC_Menu *pMNU, int iKey);

// Accès aux éléments
struct CUC_MenuElement *CUC_MenuGetElementById(struct CUC_Menu *pMNU, int iId);
