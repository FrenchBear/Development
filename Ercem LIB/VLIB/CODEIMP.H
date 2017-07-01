
/*  CODEIMP.H
**
**  D‚finition de diverses s‚quences de commande pour imprimantes
**  compatible avec l'imprimante graphique d'ibm.
**
**  W.Chaxel, P.Violent
**
**  Modif 18.V.88 pour MSC 5.0 (codes hexa ‚tendus proteg‚s par un \)
*/

#define IMPDBLARGREM	 "\x1bW1"
#define IMPFINDBLARGREM  "\x1bW0"
#define IMPCONDENSE	 "\x0f"
#define IMPFINCONDENSE	 "\x12"
#define IMPLFTO6LPI	 "\x1b\2"
#define IMPLFTO8LPI	 "\x1b\0"
#define IMPNOUVELLEPAGE  "\x0c"
#define IMPSOULIGNE	 "\x1b-1"
#define IMPFINSOULIGNE	 "\x1b-0"
#define IMPGRAS 	 "\x1b\E"
#define IMPFINGRAS	 "\x1b\F"
#define IMP2PASSES	 "\x1bG"
#define IMPFIN2PASSES	 "\x1bH"

