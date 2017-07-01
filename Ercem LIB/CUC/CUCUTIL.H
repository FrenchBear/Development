// cucutil.h
// Interface des routines communes Ö la bibliothäque CUC

void aprintf(const char *szTitre, const char *szFormat, ...);
int iCtrlBornes(const char *szNomControle, int iProp, int iVal, int iMin, int iMax);
int iCtrlType(const void *p, const char *szFonc, const char *szTypeOk);
char *szCUCPropName(int iProp);
void ErrPropNonGeree(const char *szClasse, const char *szFonction, int iProp);
void ErrPropLectureSeule(const char *szClasse, const char *szFonction, int iProp);
void cmvwaddch(WINDOW *w, int lig, int col, int car);
void cmvwaddstr(WINDOW *w, int lig, int col, const unsigned char *szCh);
