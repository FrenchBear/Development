// vspell.h
// interface de vspell.c
// PV mai 94

int  VS_iInit(void);
void VS_Fin(void);
void VS_Spell(uchar *szBuffer, unsigned uPos, int (*VS_iBack)(int iMessage, uchar *szMot, unsigned uPos, unsigned uLen));
void VS_AjouteMot(uchar *szMot);

#define VSM_MOT_INCONNU 1   // Pas trouvé dans le dico
#define VSM_NOM_PROPRE  2   // La 1ère lettre devrait être en majuscules

extern long VS_nbMotsVerifies;
extern long VS_nbRecherches;