
/* ecran.h
*/

#define CO_NOIR   0
#define CO_BLEU   1
#define CO_VERT   2
#define CO_CYAN   3
#define CO_ROUGE  4
#define CO_VIOLET 5
#define CO_JAUNE  6
#define CO_BLANC  7

#define AT_NORMAL	0
#define AT_BRILLANT	1
#define AT_SOULIGNE	2
#define AT_CLIGNOTANT	3
#define AT_INVERSE	4

#define MO_VIDEOTEX	0
#define MO_MIXTE	1

#define PO_G0	  0
#define PO_G1	  1
#define PO_G2_1   2
#define PO_ACCENT 3
#define PO_G0US   4
#define PO_G0FR   5

#define ST_FIN		1
#define ST_CONNEXION	2
#define ST_CONNECTE	3

typedef struct
{ int lcurs, ccurs;
  int ccar, cfond;
  int inverse;
  int brillant, clig;
  int echellex, echelley;
  int insmode;
  int police;
} CONTEXTE;
