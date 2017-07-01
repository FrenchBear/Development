// cucgctl.h
// Interface de l'accŠs g‚n‚rique aux contr“les
// 26/12/94 PV

// Propri‚t‚s num‚riques
int CUC_ControlSetPropNum(void *pCTL, int iType, int iProp, int iVal);
int CUC_ControlSetPropNumInd(void *pCTL, int iType, int iProp, int iInd, int iVal);
int CUC_ControlGetPropNum(void *pCTL, int iType, int iProp);
int CUC_ControlGetPropNumInd(void *pCTL, int iType, int iProp, int iInd);

// Propri‚t‚s chaŒne
int CUC_ControlSetPropStr(void *pCTL, int iType, int iProp, void *pArg);
int CUC_ControlSetPropStrInd(void *pCTL, int iType, int iProp, int iInd, void *pArg);
char *CUC_ControlGetPropStr(void *pCTL, int iType, int iProp, char *szBuffer, int iLen);
char *CUC_ControlGetPropStrInd(void *pCTL, int iType, int iProp, int iInd, char *szBuffer, int iLen);

// Propri‚t‚s PTR
int CUC_ControlSetPropPtr(void *pCTL, int iType, int iProp, void *pArg);

void CUC_ControlDestruct(void *pCTL, int iType);
int CUC_ControlRefresh(void *pCTL, int iType);

int CUC_ControlDoEvent(void *pCTL, int iType, int iEvent, int iArg);
int CUC_ControlAddItem(void *pCTL, int iType, char *szVal, int iPos);
int CUC_ControlAddItemIndent(void *pCTL, int iType, char *szVal, int iPos, int iIndent);
int CUC_ControlRemoveItem(void *pCTL, int iType, int iPos);
int CUC_ControlClear(void *pCTL, int iType);
int CUC_ControlCloseList(void *pCTL, int iType);
int CUC_ControlDisplayCursor(void *pCTL, int iType);
int CUC_ControlSetMinMax(void *pCTL, int iType, int iMin, int iMax, int iCSize);

