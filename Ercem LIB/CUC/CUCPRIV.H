/* cucpriv.h
** Interface priv‚e de la bibliothŠque CUC
** Ces d‚clarations sont utilis‚es de fa‡on interne par la bibliothŠque
** P.VIOLENT  5/07/94
** 26/12/94 PV	Outline; EffaceRectangle
*/

#ifndef _INC_CUCPRIV
#define _INC_CUCPRIV

#ifdef __cplusplus
extern "C" {
#endif 

// Interface des routines communes … la bibliothŠque CUC de cucutil.c

int	iCtrlBornes(const char *szNomControle, int iProp, int iVal, int iMin, int iMax);
int iCtrlType(const void *p, const char *szFonc, const char *szTypeOk);
int iOkWDisp(WINDOW *p, const char *szClasse, const char *szFonc);
char *szCUCPropName(int iProp);
void ErrPropNonGeree(const char *szClasse, const char *szFonction, int iProp);
void ErrPropLectureSeule(const char *szClasse, const char *szFonction, int iProp);
void cmvwaddch(WINDOW *w, int lig, int col, int car);
void cmvwaddstr(WINDOW *w, int lig, int col, const unsigned char *szCh);
void CUC_EffaceRectangle(WINDOW *wDisp, int iTop, int iLeft, int iHeight, int iWidth);


// D‚clarations sp‚cifiques … chaque contr“le
#include "cuchsb.h"			// HScrollBar
#include "cucvsb.h"			// VScrollBar
#include "cuclbl.h"			// Label
#include "cucchb.h"			// CheckBox
#include "cuclst.h"			// Liste
#include "cucopt.h"			// OptionButton
#include "cuctxt.h"			// TextEdit
#include "cucfra.h"			// Frame
#include "cucbtn.h"			// CommandButton
#include "cuccob.h"			// ComboBox
#include "cucflb.h"			// FileListBox
#include "cucdlb.h"			// DirListBox
#include "cucout.h"			// Outline
#include "cucwin.h"			// Window
#include "cucmnu.h"			// Menu


#ifdef __cplusplus
}
#endif 

#endif						// ifndef _INC_CUCPRIV
