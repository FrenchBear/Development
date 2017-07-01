/* menuder.h	d‚finitions de types et de constantes pour les
**		menus d‚roulants de MD
*/

#define VLIB_MD

typedef struct zmd_menu
{ char	 *texte;
  touche accel;
  int2	 attrib;
  int2	 type;
  union
  {
    long	    message;
    struct zmd_menu *ptr_menu;
    void	    (*ptr_fonc)(void);
  } u;
} MD_MENU;

typedef struct zmd_struct1
{ MD_MENU    *ptm;
  MD_MENU    *back;
  struct zmd_struct1 *pere;
  int2	     niveau,nbitem;
  int2	     ligne,colonne;
  int2	     largeur,hauteur;
  int2	     choix_rem;
} MD_STRUCT1;

#define MD_AT_STD	0
#define MD_AT_SEP	1
#define MD_AT_IMMED	2
#define MD_AT_NUAGE	3
#define MD_AT_TRAV	4
#define MD_AT_MESG	5

#define MD_TY_EXIT	1
#define MD_TY_SEP	2
#define MD_TY_MENU	3

