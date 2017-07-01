// cucpp.h
// Interface de la classe CUC en C++
//  6/6/94 PV
// 20/6/94 PV	const

#ifndef _INC_CUCPP
#define _INC_CUCPP

#include <cuc.h>
#include <cucpriv.h>

class CUCControl
{
  public:
// Fonctions virtuelles de positionnnement de propri‚t‚s
    virtual int  SetPropNum(int , int )						{ return 0; }
    virtual int  SetPropPtr(int , const void *)				{ return 0; }
    virtual int  SetPropStr(int , const char *)				{ return 0; }
    virtual int  SetPropStrInd(int , int , const char *)	{ return 0; }
    
// Fonctions virtuelles de lecture de propri‚t‚s
    virtual int  iGetPropNum(int ) const					{ return 0; }
    virtual void *pGetPropPtr(int ) const					{ return 0; }
    virtual char *szGetPropStr(int , char *, int ) const	{ return 0; }
    virtual char *szGetPropStrInd(int , int , char *, int ) const { return 0; }
    
// Fonction virtuelle de traitement des ‚v‚nements
    virtual void DoEvent(int , int )						{ }

  public:                       
// M‚thodes virtuelles
    virtual void Move(int , int )							{ }
    virtual void Resize(int , int )							{ }
    virtual void Refresh()									{ }
    
// Positionnement de propri‚t‚s g‚n‚riques     	
    void SetVisible(int iVisible=1)							{ SetPropNum(CUCP_VISIBLE, iVisible); }
    void SetEnabled(int iEnabled=1)							{ SetPropNum(CUCP_ENABLED, iEnabled); }
    void SetLeft(int iLeft)									{ SetPropNum(CUCP_LEFT, iLeft); }
    void SetTop(int iTop)									{ SetPropNum(CUCP_TOP, iTop); }
    void SetWidth(int iWidth)								{ SetPropNum(CUCP_WIDTH, iWidth); }
    void SetHeight(int iHeight)								{ SetPropNum(CUCP_HEIGHT, iHeight); }
    void SetMin(int iMin)									{ SetPropNum(CUCP_MIN, iMin); }
    void SetMax(int iMax)									{ SetPropNum(CUCP_MAX, iMax); }
    void SetMinMax(int iMin, int iMax)						{ SetPropNum(CUCP_MIN, iMin); SetPropNum(CUCP_MAX, iMax); }
    void SetCSize(int iCSize=1)								{ SetPropNum(CUCP_CSIZE, iCSize); }
    void SetSmallChange(int iSmallCh)						{ SetPropNum(CUCP_SMALLCHANGE, iSmallCh); }
    void SetLargeChange(int iLargeCh)						{ SetPropNum(CUCP_LARGECHANGE, iLargeCh); }
    void SetValue(int iValue)								{ SetPropNum(CUCP_VALUE, iValue); }
    void SetParent(const void *pArg)						{ SetPropPtr(CUCP_PARENT, pArg); }
    void SetIdBack(const void *pArg)						{ SetPropPtr(CUCP_IDBACK, pArg); }
    void SetTabStop(int iValue=1)							{ SetPropNum(CUCP_TABSTOP, iValue); }
    void SetTag(const char *szTag)							{ SetPropStr(CUCP_TAG, szTag); }
    void SetAlignment(int iAlig=0)							{ SetPropNum(CUCP_ALIGNMENT, iAlig); }
    void SetBorderStyle(int iBS=1)							{ SetPropNum(CUCP_BORDERSTYLE, iBS); }
    void SetAutoSize(int iAutoSize=1)						{ SetPropNum(CUCP_AUTOSIZE, iAutoSize); }
    void SetCaption(const char *szCaption)					{ SetPropStr(CUCP_CAPTION, szCaption); }
    void SetTriState(int iTriState=1)						{ SetPropNum(CUCP_TRISTATE, iTriState); }
    void SetDefault(int iDefault)							{ SetPropNum(CUCP_DEFAULT, iDefault); }
    void SetCancel(int iCancel)								{ SetPropNum(CUCP_CANCEL, iCancel); }
    void SetColumns(int iColumns)							{ SetPropNum(CUCP_COLUMNS, iColumns); }
    void SetAutoRefresh(int iAutoRef)						{ SetPropNum(CUCP_AUTOREFRESH, iAutoRef); }
    void SetSorted(int iSorted=1)							{ SetPropNum(CUCP_SORTED, iSorted); }
    void SetListIndex(int iListIndex)						{ SetPropNum(CUCP_LISTINDEX, iListIndex); }
    void SetList(int iInd, const char *szItem)				{ SetPropStrInd(CUCP_LIST, iInd, szItem); }
    void SetMultiline(int iMultiLine=1)						{ SetPropNum(CUCP_MULTILINE, iMultiLine); }
    void SetScrollBars(int iScrollBars)						{ SetPropNum(CUCP_SCROLLBARS, iScrollBars); }
    void SetText(const char *szText)						{ SetPropStr(CUCP_TEXT, szText); }
    void SetSelLength(int iSelLength)						{ SetPropNum(CUCP_SELLENGTH, iSelLength); }
    void SetSelStart(int iSelStart)							{ SetPropNum(CUCP_SELSTART, iSelStart); }
    void SetSelText(const char *szText)						{ SetPropStr(CUCP_SELTEXT, szText); }
    void SetPattern(const char *szPattern)					{ SetPropStr(CUCP_PATTERN, szPattern); }
    void SetPath(const char *szPath)						{ SetPropStr(CUCP_PATH, szPath); }
    void SetDrive(const char *szDrive)						{ SetPropStr(CUCP_DRIVE, szDrive); }
    void SetChecked(int iChecked)							{ SetPropNum(CUCP_CHECKED, iChecked); }
    void SetSeparator(int iSeparator)						{ SetPropNum(CUCP_SEPARATOR, iSeparator); }
    void SetInsMode(int iInsMode=1)							{ SetPropNum(CUCP_INSMODE, iInsMode); }
    void SetMaxLength(int iMaxLength)						{ SetPropNum(CUCP_MAXLENGTH, iMaxLength); }
    void SetTabSize(int iTabSize)							{ SetPropNum(CUCP_TABSIZE, iTabSize); }

// Lecture de propri‚t‚s g‚n‚riques                    	
    int  iGetVisible() const								{ return iGetPropNum(CUCP_VISIBLE); }
    int  iGetEnabled() const								{ return iGetPropNum(CUCP_ENABLED); }
    int  iGetFocus() const									{ return iGetPropNum(CUCP_FOCUS); }
    int  iGetLeft() const									{ return iGetPropNum(CUCP_LEFT); }
    int  iGetTop() const									{ return iGetPropNum(CUCP_TOP); }
    int  iGetWidth() const									{ return iGetPropNum(CUCP_WIDTH); }
    int  iGetHeight() const									{ return iGetPropNum(CUCP_HEIGHT); }
    int  iGetMin() const									{ return iGetPropNum(CUCP_MIN); }
    int  iGetMax() const									{ return iGetPropNum(CUCP_MAX); }
    int  iGetCSize() const									{ return iGetPropNum(CUCP_CSIZE); }
    int  iGetSmallChange() const							{ return iGetPropNum(CUCP_SMALLCHANGE); }
    int  iGetLargeChange() const							{ return iGetPropNum(CUCP_LARGECHANGE); }
    int  iGetValue() const									{ return iGetPropNum(CUCP_VALUE); }
    void *pGetParent() const								{ return pGetPropPtr(CUCP_PARENT); }
    void *pGetIdBack() const								{ return pGetPropPtr(CUCP_IDBACK); }
    int  iGetTabStop() const								{ return iGetPropNum(CUCP_TABSTOP); }
    char *szGetType(char *szB, int iLB) const				{ return szGetPropStr(CUCP_TYPE, szB, iLB); }
    char *szGetTag(char *szB, int iLB) const				{ return szGetPropStr(CUCP_TAG, szB, iLB); }
    int  iGetAlignment() const								{ return iGetPropNum(CUCP_ALIGNMENT); }
    int  iGetBorderStyle() const							{ return iGetPropNum(CUCP_BORDERSTYLE); }
    int  iGetAutoSize() const								{ return iGetPropNum(CUCP_AUTOSIZE); }
    char *szGetCaption(char *szB, int iLB) const			{ return szGetPropStr(CUCP_CAPTION, szB, iLB); }
    int  iGetTriState() const								{ return iGetPropNum(CUCP_TRISTATE); }
    int  iGetDefault() const								{ return iGetPropNum(CUCP_DEFAULT); }
    int  iGetCancel() const									{ return iGetPropNum(CUCP_CANCEL); }
    int  iGetColumns() const								{ return iGetPropNum(CUCP_COLUMNS); }
    int  iGetAutoRefresh() const							{ return iGetPropNum(CUCP_AUTOREFRESH); }
    int  iGetSorted() const									{ return iGetPropNum(CUCP_SORTED); }
    int  iGetListCount() const								{ return iGetPropNum(CUCP_LISTCOUNT); }
    int  iGetListIndex() const								{ return iGetPropNum(CUCP_LISTINDEX); }
    char *szGetList(int iInd, char *szB, int iLB) const 	{ return szGetPropStrInd(CUCP_LIST, iInd, szB, iLB); }
    int  iGetMultiline() const								{ return iGetPropNum(CUCP_MULTILINE); }
    int  iGetScrollBars() const								{ return iGetPropNum(CUCP_SCROLLBARS); }
    char *szGetText(char *szB, int iLB) const				{ return szGetPropStr(CUCP_TEXT, szB, iLB); }
    int  iGetSelLength() const								{ return iGetPropNum(CUCP_SELLENGTH); }
    int  iGetSelStart() const								{ return iGetPropNum(CUCP_SELSTART); }
    char *szGetSelText(char *szB, int iLB) const			{ return szGetPropStr(CUCP_SELTEXT, szB, iLB); }
    char *szGetPattern(char *szB, int iLB) const			{ return szGetPropStr(CUCP_PATTERN, szB, iLB); }
    char *szGetPath(char *szB, int iLB) const				{ return szGetPropStr(CUCP_PATH, szB, iLB); }
    char *szGetDrive(char *szB, int iLB) const				{ return szGetPropStr(CUCP_DRIVE, szB, iLB); }
    int  iGetChecked() const								{ return iGetPropNum(CUCP_CHECKED); }
    int  iGetSeparator() const								{ return iGetPropNum(CUCP_SEPARATOR); }
    int  iGetInsMode() const								{ return iGetPropNum(CUCP_INSMODE); }
    int  iGetMaxLength() const								{ return iGetPropNum(CUCP_MAXLENGTH); }
    int  iGetTabSize() const								{ return iGetPropNum(CUCP_TABSIZE); }

// Ev‚nements g‚n‚riques                                	
    void Key(int iKey)										{ DoEvent(CUCE_KEY, iKey); }
    void GotFocus()											{ DoEvent(CUCE_GOTFOCUS, 0); }
    void LostFocus()										{ DoEvent(CUCE_LOSTFOCUS, 0); }
};



class CUCHScrollBar: public CUCControl
{
  private:
    struct CUC_HScrollBar *pHSB;
    
  public:
// constructeur et destructeur
    CUCHScrollBar(WINDOW *wDisp, int (*iBack)(CUCHScrollBar *, int, int), int iTop=0, int iLeft=0, int iHeight=1, int iWidth=3); 
    ~CUCHScrollBar()										{ CUC_HScrollBarDestruct(pHSB); }

// Fonctions virtuelles de positionnnement de propri‚t‚s
    virtual int  SetPropNum(int iProp, int iVal)			{ return CUC_HScrollBarSetPropNum(pHSB, iProp, iVal); }
    virtual int  SetPropPtr(int iProp, const void *pArg)	{ return CUC_HScrollBarSetPropPtr(pHSB, iProp, pArg); }
    virtual int  SetPropStr(int iProp, const char *szArg)	{ return CUC_HScrollBarSetPropStr(pHSB, iProp, szArg); }
    
// Fonctions virtuelles de lecture de propri‚t‚s
    virtual int	 iGetPropNum(int iProp) const				{ return CUC_HScrollBarGetPropNum(pHSB, iProp); }
    virtual void *pGetPropPtr(int iProp) const				{ return CUC_HScrollBarGetPropPtr(pHSB, iProp); }
    virtual char *szGetPropStr(int iProp, char *szB, int iLB) const { return CUC_HScrollBarGetPropStr(pHSB, iProp, szB, iLB); }

// Fonction g‚n‚rique de traitement des ‚v‚nements (virtuelle)
    void DoEvent(int iEvt, int iArg)						{ CUC_HScrollBarDoEvent(pHSB, iEvt, iArg); }
    
// M‚thodes g‚n‚riques (virtuelles)
    void Move(int iTop, int iLeft)							{ CUC_HScrollBarMove(pHSB, iTop, iLeft); }
    void Resize(int iHeight, int iWidth)					{ CUC_HScrollBarMove(pHSB, iHeight, iWidth); }
    void Refresh()											{ CUC_HScrollBarRefresh(pHSB); }
};



class CUCVScrollBar: public CUCControl
{
  private:
    struct CUC_VScrollBar *pVSB;
    
  public:
// constructeur et destructeur
    CUCVScrollBar(WINDOW *wDisp, int (*iBack)(CUCVScrollBar *, int, int), int iTop=0, int iLeft=0, int iHeight=1, int iWidth=3); 
    ~CUCVScrollBar()										{ CUC_VScrollBarDestruct(pVSB); }

// Fonctions virtuelles de positionnnement de propri‚t‚s
    virtual int  SetPropNum(int iProp, int iVal)			{ return CUC_VScrollBarSetPropNum(pVSB, iProp, iVal); }
    virtual int  SetPropPtr(int iProp, const void *pArg)	{ return CUC_VScrollBarSetPropPtr(pVSB, iProp, pArg); }
    virtual int  SetPropStr(int iProp, const char *szArg)	{ return CUC_VScrollBarSetPropStr(pVSB, iProp, szArg); }
    
// Fonctions virtuelles de lecture de propri‚t‚s
    virtual int	 iGetPropNum(int iProp) const				{ return CUC_VScrollBarGetPropNum(pVSB, iProp); }
    virtual void *pGetPropPtr(int iProp) const				{ return CUC_VScrollBarGetPropPtr(pVSB, iProp); }
    virtual char *szGetPropStr(int iProp, char *szB, int iLB) const	{ return CUC_VScrollBarGetPropStr(pVSB, iProp, szB, iLB); }

// Fonction g‚n‚rique de traitement des ‚v‚nements (virtuelle)
    void DoEvent(int iEvt, int iArg)						{ CUC_VScrollBarDoEvent(pVSB, iEvt, iArg); }

// M‚thodes g‚n‚riques (virtuelles)
    void Move(int iTop, int iLeft)							{ CUC_VScrollBarMove(pVSB, iTop, iLeft); }
    void Resize(int iHeight, int iWidth)					{ CUC_VScrollBarMove(pVSB, iHeight, iWidth); }
    void Refresh()											{ CUC_VScrollBarRefresh(pVSB); }
};




class CUCList: public CUCControl
{
  private:
    struct CUC_List *pLST;
    
  public:
// constructeur et destructeur
    CUCList(WINDOW *wDisp, int (*iBack)(CUCList *, int, int), int iTop=0, int iLeft=0, int iHeight=1, int iWidth=3); 
    ~CUCList()												{ CUC_ListDestruct(pLST); }

// Fonctions virtuelles de positionnnement de propri‚t‚s
    virtual int  SetPropNum(int iProp, int iVal)			{ return CUC_ListSetPropNum(pLST, iProp, iVal); }
    virtual int  SetPropPtr(int iProp, const void *pArg)	{ return CUC_ListSetPropPtr(pLST, iProp, pArg); }
    virtual int  SetPropStr(int iProp, const char *szArg)	{ return CUC_ListSetPropStr(pLST, iProp, szArg); }
    virtual int  SetPropStrInd(int iProp, int iInd, const char *szArg){ return CUC_ListSetPropStrInd(pLST, iProp, iInd, szArg); }
    
// Lecture de propri‚t‚s g‚n‚riques
    virtual int	 iGetPropNum(int iProp) const				{ return CUC_ListGetPropNum(pLST, iProp); }
    virtual void *pGetPropPtr(int iProp) const				{ return CUC_ListGetPropPtr(pLST, iProp); }
    virtual char *szGetPropStr(int iProp, char *szB, int iLB) const { return CUC_ListGetPropStr(pLST, iProp, szB, iLB); }
    virtual char *szGetPropStrInd(int iProp, int iInd, char *szB, int iLB) const { return CUC_ListGetPropStrInd(pLST, iProp, iInd, szB, iLB); }

// Fonction g‚n‚rique de traitement des ‚v‚nements (virtuelle)
    void DoEvent(int iEvt, int iArg)						{ CUC_ListDoEvent(pLST, iEvt, iArg); }
    
// M‚thodes g‚n‚riques (virtuelles)
    void Move(int iTop, int iLeft)							{ CUC_ListMove(pLST, iTop, iLeft); }
    void Resize(int iHeight, int iWidth)					{ CUC_ListMove(pLST, iHeight, iWidth); }
    void Refresh()											{ CUC_ListRefresh(pLST); }
    
// M‚thodes propres au contrôle
    int  iAddItem(const char *szItem, int iPos = -1)		{ return CUC_ListAddItem(pLST, szItem, iPos); }
    int  iRemoveItem(int iPos = -1)							{ return CUC_ListRemoveItem(pLST, iPos); }
    void Clear()											{ CUC_ListClear(pLST); }
};



class CUCCheckBox: public CUCControl
{
  private:
    struct CUC_CheckBox *pCHB;
    
  public:
// constructeur et destructeur
    CUCCheckBox(WINDOW *wDisp, int (*iBack)(CUCCheckBox *, int, int), int iTop=0, int iLeft=0, int iHeight=1, int iWidth=3, char *szCaption="&CheckBox"); 
    ~CUCCheckBox()											{ CUC_CheckBoxDestruct(pCHB); }

// Fonctions virtuelles de positionnnement de propri‚t‚s
    virtual int  SetPropNum(int iProp, int iVal)			{ return CUC_CheckBoxSetPropNum(pCHB, iProp, iVal); }
    virtual int  SetPropPtr(int iProp, const void *pArg)	{ return CUC_CheckBoxSetPropPtr(pCHB, iProp, pArg); }
    virtual int  SetPropStr(int iProp, const char *szArg)	{ return CUC_CheckBoxSetPropStr(pCHB, iProp, szArg); }
    
// Lecture de propri‚t‚s g‚n‚riques
    virtual int	 iGetPropNum(int iProp) const				{ return CUC_CheckBoxGetPropNum(pCHB, iProp); }
    virtual void *pGetPropPtr(int iProp) const				{ return CUC_CheckBoxGetPropPtr(pCHB, iProp); }
    virtual char *szGetPropStr(int iProp, char *szB, int iLB) const { return CUC_CheckBoxGetPropStr(pCHB, iProp, szB, iLB); }

// Fonction g‚n‚rique de traitement des ‚v‚nements (virtuelle)
    void DoEvent(int iEvt, int iArg)						{ CUC_CheckBoxDoEvent(pCHB, iEvt, iArg); }
    
// M‚thodes g‚n‚riques (virtuelles)
    void Move(int iTop, int iLeft)							{ CUC_CheckBoxMove(pCHB, iTop, iLeft); }
    void Resize(int iHeight, int iWidth)					{ CUC_CheckBoxMove(pCHB, iHeight, iWidth); }
    void Refresh()											{ CUC_CheckBoxRefresh(pCHB); }
};




class CUCOptionButton: public CUCControl
{
  private:
    struct CUC_OptionButton *pOPT;
    
  public:
// constructeur et destructeur
    CUCOptionButton(WINDOW *wDisp, int (*iBack)(CUCOptionButton *, int, int), int iTop=0, int iLeft=0, int iHeight=1, int iWidth=3, char *szOption = "&Option"); 
    ~CUCOptionButton()										{ CUC_OptionButtonDestruct(pOPT); }

// Fonctions virtuelles de positionnnement de propri‚t‚s
    virtual int  SetPropNum(int iProp, int iVal)			{ return CUC_OptionButtonSetPropNum(pOPT, iProp, iVal); }
    virtual int  SetPropPtr(int iProp, const void *pArg)	{ return CUC_OptionButtonSetPropPtr(pOPT, iProp, pArg); }
    virtual int  SetPropStr(int iProp, const char *szArg)	{ return CUC_OptionButtonSetPropStr(pOPT, iProp, szArg); }
    
// Lecture de propri‚t‚s g‚n‚riques
    virtual int	 iGetPropNum(int iProp) const				{ return CUC_OptionButtonGetPropNum(pOPT, iProp); }
    virtual void *pGetPropPtr(int iProp) const				{ return CUC_OptionButtonGetPropPtr(pOPT, iProp); }
    virtual char *szGetPropStr(int iProp, char *szB, int iLB) const { return CUC_OptionButtonGetPropStr(pOPT, iProp, szB, iLB); }

// Fonction g‚n‚rique de traitement des ‚v‚nements (virtuelle)
    void DoEvent(int iEvt, int iArg)						{ CUC_OptionButtonDoEvent(pOPT, iEvt, iArg); }
    
// M‚thodes g‚n‚riques (virtuelles)
    void Move(int iTop, int iLeft)							{ CUC_OptionButtonMove(pOPT, iTop, iLeft); }
    void Resize(int iHeight, int iWidth)					{ CUC_OptionButtonMove(pOPT, iHeight, iWidth); }
    void Refresh()											{ CUC_OptionButtonRefresh(pOPT); }
};



class CUCLabel: public CUCControl
{
  private:
    struct CUC_Label *pLBL;
    
  public:
// constructeur et destructeur
    CUCLabel(WINDOW *wDisp, int (*iBack)(CUCLabel *, int, int), int iTop=0, int iLeft=0, int iHeight=1, int iWidth=3, char *szCaption = "&Label"); 
    ~CUCLabel()												{ CUC_LabelDestruct(pLBL); }

// Fonctions virtuelles de positionnnement de propri‚t‚s
    virtual int  SetPropNum(int iProp, int iVal)			{ return CUC_LabelSetPropNum(pLBL, iProp, iVal); }
    virtual int  SetPropPtr(int iProp, const void *pArg)	{ return CUC_LabelSetPropPtr(pLBL, iProp, pArg); }
    virtual int  SetPropStr(int iProp, const char *szArg)	{ return CUC_LabelSetPropStr(pLBL, iProp, szArg); }
    
// Lecture de propri‚t‚s g‚n‚riques
    virtual int	 iGetPropNum(int iProp) const				{ return CUC_LabelGetPropNum(pLBL, iProp); }
    virtual void *pGetPropPtr(int iProp) const				{ return CUC_LabelGetPropPtr(pLBL, iProp); }
    virtual char *szGetPropStr(int iProp, char *szB, int iLB) const { return CUC_LabelGetPropStr(pLBL, iProp, szB, iLB); }

// Fonction g‚n‚rique de traitement des ‚v‚nements (virtuelle)
    void DoEvent(int iEvt, int iArg)						{ CUC_LabelDoEvent(pLBL, iEvt, iArg); }
    
// M‚thodes g‚n‚riques (virtuelles)
    void Move(int iTop, int iLeft)							{ CUC_LabelMove(pLBL, iTop, iLeft); }
    void Resize(int iHeight, int iWidth)					{ CUC_LabelMove(pLBL, iHeight, iWidth); }
    void Refresh()											{ CUC_LabelRefresh(pLBL); }
};



class CUCTextEdit: public CUCControl
{
  private:
    struct CUC_TextEdit *pTXT;
    
  public:
// constructeur et destructeur
    CUCTextEdit(WINDOW *wDisp, int (*iBack)(CUCTextEdit *, int, int), int iTop=0, int iLeft=0, int iHeight=1, int iWidth=3); 
    ~CUCTextEdit()											{ CUC_TextEditDestruct(pTXT); }

// Fonctions virtuelles de positionnnement de propri‚t‚s
    virtual int  SetPropNum(int iProp, int iVal)			{ return CUC_TextEditSetPropNum(pTXT, iProp, iVal); }
    virtual int  SetPropPtr(int iProp, const void *pArg)	{ return CUC_TextEditSetPropPtr(pTXT, iProp, pArg); }
    virtual int  SetPropStr(int iProp, const char *szArg)	{ return CUC_TextEditSetPropStr(pTXT, iProp, szArg); }
    
// Lecture de propri‚t‚s g‚n‚riques
    virtual int	 iGetPropNum(int iProp) const				{ return CUC_TextEditGetPropNum(pTXT, iProp); }
    virtual void *pGetPropPtr(int iProp) const				{ return CUC_TextEditGetPropPtr(pTXT, iProp); }
    virtual char *szGetPropStr(int iProp, char *szB, int iLB) const { return CUC_TextEditGetPropStr(pTXT, iProp, szB, iLB); }

// Fonction g‚n‚rique de traitement des ‚v‚nements (virtuelle)
    void DoEvent(int iEvt, int iArg)						{ CUC_TextEditDoEvent(pTXT, iEvt, iArg); }
    
// M‚thodes g‚n‚riques (virtuelles)
    void Move(int iTop, int iLeft)							{ CUC_TextEditMove(pTXT, iTop, iLeft); }
    void Resize(int iHeight, int iWidth)					{ CUC_TextEditMove(pTXT, iHeight, iWidth); }
    void Refresh()											{ CUC_TextEditRefresh(pTXT); }
};


class CUCFrame: public CUCControl
{
  private:
    struct CUC_Frame *pFRA;
    
  public:
// constructeur et destructeur
    CUCFrame(WINDOW *wDisp, int (*iBack)(CUCFrame *, int, int), int iTop=0, int iLeft=0, int iHeight=1, int iWidth=3, char *szCaption="&Ok"); 
    ~CUCFrame()												{ CUC_FrameDestruct(pFRA); }

// Fonctions virtuelles de positionnnement de propri‚t‚s
    virtual int  SetPropNum(int iProp, int iVal)			{ return CUC_FrameSetPropNum(pFRA, iProp, iVal); }
    virtual int  SetPropPtr(int iProp, const void *pArg)	{ return CUC_FrameSetPropPtr(pFRA, iProp, pArg); }
    virtual int  SetPropStr(int iProp, const char *szArg)	{ return CUC_FrameSetPropStr(pFRA, iProp, szArg); }
    
// Lecture de propri‚t‚s g‚n‚riques
    virtual int	 iGetPropNum(int iProp) const				{ return CUC_FrameGetPropNum(pFRA, iProp); }
    virtual void *pGetPropPtr(int iProp) const				{ return CUC_FrameGetPropPtr(pFRA, iProp); }
    virtual char *szGetPropStr(int iProp, char *szB, int iLB) const { return CUC_FrameGetPropStr(pFRA, iProp, szB, iLB); }

// Fonction g‚n‚rique de traitement des ‚v‚nements (virtuelle)
    void DoEvent(int iEvt, int iArg)						{ CUC_FrameDoEvent(pFRA, iEvt, iArg); }
    
// M‚thodes g‚n‚riques (virtuelles)
    void Move(int iTop, int iLeft)							{ CUC_FrameMove(pFRA, iTop, iLeft); }
    void Resize(int iHeight, int iWidth)					{ CUC_FrameMove(pFRA, iHeight, iWidth); }
    void Refresh()											{ CUC_FrameRefresh(pFRA); }
};


class CUCCommandButton: public CUCControl
{
  private:
    struct CUC_CommandButton *pBTN;
    
  public:
// constructeur et destructeur
    CUCCommandButton(WINDOW *wDisp, int (*iBack)(CUCCommandButton *, int, int), int iTop=0, int iLeft=0, int iHeight=1, int iWidth=3, char *szCaption = "&Cadre"); 
    ~CUCCommandButton()										{ CUC_CommandButtonDestruct(pBTN); }

// Fonctions virtuelles de positionnnement de propri‚t‚s
    virtual int  SetPropNum(int iProp, int iVal)			{ return CUC_CommandButtonSetPropNum(pBTN, iProp, iVal); }
    virtual int  SetPropPtr(int iProp, const void *pArg)	{ return CUC_CommandButtonSetPropPtr(pBTN, iProp, pArg); }
    virtual int  SetPropStr(int iProp, const char *szArg)	{ return CUC_CommandButtonSetPropStr(pBTN, iProp, szArg); }
    
// Lecture de propri‚t‚s g‚n‚riques
    virtual int	 iGetPropNum(int iProp) const				{ return CUC_CommandButtonGetPropNum(pBTN, iProp); }
    virtual void *pGetPropPtr(int iProp) const				{ return CUC_CommandButtonGetPropPtr(pBTN, iProp); }
    virtual char *szGetPropStr(int iProp, char *szB, int iLB) const { return CUC_CommandButtonGetPropStr(pBTN, iProp, szB, iLB); }

// Fonction g‚n‚rique de traitement des ‚v‚nements (virtuelle)
    void DoEvent(int iEvt, int iArg)						{ CUC_CommandButtonDoEvent(pBTN, iEvt, iArg); }
    
// M‚thodes g‚n‚riques (virtuelles)
    void Move(int iTop, int iLeft)							{ CUC_CommandButtonMove(pBTN, iTop, iLeft); }
    void Resize(int iHeight, int iWidth)					{ CUC_CommandButtonMove(pBTN, iHeight, iWidth); }
    void Refresh()											{ CUC_CommandButtonRefresh(pBTN); }
};



class CUCComboBox: public CUCControl
{
  private:
    struct CUC_ComboBox *pCBX;
    
  public:
// constructeur et destructeur
    CUCComboBox(WINDOW *wDisp, int (*iBack)(CUCComboBox *, int, int), int iTop=0, int iLeft=0, int iHeight=1, int iWidth=3); 
    ~CUCComboBox()											{ CUC_ComboBoxDestruct(pCBX); }

// Fonctions virtuelles de positionnnement de propri‚t‚s
    virtual int  SetPropNum(int iProp, int iVal)			{ return CUC_ComboBoxSetPropNum(pCBX, iProp, iVal); }
    virtual int  SetPropPtr(int iProp, const void *pArg)	{ return CUC_ComboBoxSetPropPtr(pCBX, iProp, pArg); }
    virtual int  SetPropStr(int iProp, const char *szArg)	{ return CUC_ComboBoxSetPropStr(pCBX, iProp, szArg); }
    
// Lecture de propri‚t‚s g‚n‚riques
    virtual int	 iGetPropNum(int iProp) const				{ return CUC_ComboBoxGetPropNum(pCBX, iProp); }
    virtual void *pGetPropPtr(int iProp) const				{ return CUC_ComboBoxGetPropPtr(pCBX, iProp); }
    virtual char *szGetPropStr(int iProp, char *szB, int iLB) const { return CUC_ComboBoxGetPropStr(pCBX, iProp, szB, iLB); }

// Fonction g‚n‚rique de traitement des ‚v‚nements (virtuelle)
    void DoEvent(int iEvt, int iArg)						{ CUC_ComboBoxDoEvent(pCBX, iEvt, iArg); }
    
// M‚thodes g‚n‚riques (virtuelles)
    void Move(int iTop, int iLeft)							{ CUC_ComboBoxMove(pCBX, iTop, iLeft); }
    void Resize(int iHeight, int iWidth)					{ CUC_ComboBoxMove(pCBX, iHeight, iWidth); }
    void Refresh()											{ CUC_ComboBoxRefresh(pCBX); }

// M‚thodes propres au contrôle
    int  iAddItem(const char *szItem, int iPos = -1)		{ return CUC_ComboBoxAddItem(pCBX, szItem, iPos); }
    int  iRemoveItem(int iPos = -1)							{ return CUC_ComboBoxRemoveItem(pCBX, iPos); }
    void Clear()											{ CUC_ComboBoxClear(pCBX); }
};


class CUCFileListBox: public CUCControl
{
  private:
    struct CUC_FileListBox *pFLB;
    
  public:
// constructeur et destructeur
    CUCFileListBox(WINDOW *wDisp, int (*iBack)(CUCFileListBox *, int, int), int iTop=0, int iLeft=0, int iHeight=1, int iWidth=3); 
    ~CUCFileListBox()												{ CUC_FileListBoxDestruct(pFLB); }

// Fonctions virtuelles de positionnnement de propri‚t‚s
    virtual int  SetPropNum(int iProp, int iVal)			{ return CUC_FileListBoxSetPropNum(pFLB, iProp, iVal); }
    virtual int  SetPropPtr(int iProp, const void *pArg)	{ return CUC_FileListBoxSetPropPtr(pFLB, iProp, pArg); }
    virtual int  SetPropStr(int iProp, const char *szArg)	{ return CUC_FileListBoxSetPropStr(pFLB, iProp, szArg); }
    virtual int  SetPropStrInd(int iProp, int iInd, const char *szArg){ return CUC_FileListBoxSetPropStrInd(pFLB, iProp, iInd, szArg); }
    
// Lecture de propri‚t‚s g‚n‚riques
    virtual int	 iGetPropNum(int iProp) const				{ return CUC_FileListBoxGetPropNum(pFLB, iProp); }
    virtual void *pGetPropPtr(int iProp) const				{ return CUC_FileListBoxGetPropPtr(pFLB, iProp); }
    virtual char *szGetPropStr(int iProp, char *szB, int iLB) const { return CUC_FileListBoxGetPropStr(pFLB, iProp, szB, iLB); }
    virtual char *szGetPropStrInd(int iProp, int iInd, char *szB, int iLB) const { return CUC_FileListBoxGetPropStrInd(pFLB, iProp, iInd, szB, iLB); }

// Fonction g‚n‚rique de traitement des ‚v‚nements (virtuelle)
    void DoEvent(int iEvt, int iArg)						{ CUC_FileListBoxDoEvent(pFLB, iEvt, iArg); }
    
// M‚thodes g‚n‚riques (virtuelles)
    void Move(int iTop, int iLeft)							{ CUC_FileListBoxMove(pFLB, iTop, iLeft); }
    void Resize(int iHeight, int iWidth)					{ CUC_FileListBoxMove(pFLB, iHeight, iWidth); }
    void Refresh()											{ CUC_FileListBoxRefresh(pFLB); }
};




class CUCDirListBox: public CUCControl
{
  private:
    struct CUC_DirListBox *pDLB;
    
  public:
// constructeur et destructeur
    CUCDirListBox(WINDOW *wDisp, int (*iBack)(CUCDirListBox *, int, int), int iTop=0, int iLeft=0, int iHeight=1, int iWidth=3); 
    ~CUCDirListBox()												{ CUC_DirListBoxDestruct(pDLB); }

// Fonctions virtuelles de positionnnement de propri‚t‚s
    virtual int  SetPropNum(int iProp, int iVal)			{ return CUC_DirListBoxSetPropNum(pDLB, iProp, iVal); }
    virtual int  SetPropPtr(int iProp, const void *pArg)	{ return CUC_DirListBoxSetPropPtr(pDLB, iProp, pArg); }
    virtual int  SetPropStr(int iProp, const char *szArg)	{ return CUC_DirListBoxSetPropStr(pDLB, iProp, szArg); }
    
// Lecture de propri‚t‚s g‚n‚riques
    virtual int	 iGetPropNum(int iProp) const				{ return CUC_DirListBoxGetPropNum(pDLB, iProp); }
    virtual void *pGetPropPtr(int iProp) const				{ return CUC_DirListBoxGetPropPtr(pDLB, iProp); }
    virtual char *szGetPropStr(int iProp, char *szB, int iLB) const { return CUC_DirListBoxGetPropStr(pDLB, iProp, szB, iLB); }
    virtual char *szGetPropStrInd(int iProp, int iInd, char *szB, int iLB) const { return CUC_DirListBoxGetPropStrInd(pDLB, iProp, iInd, szB, iLB); }

// Fonction g‚n‚rique de traitement des ‚v‚nements (virtuelle)
    void DoEvent(int iEvt, int iArg)						{ CUC_DirListBoxDoEvent(pDLB, iEvt, iArg); }
    
// M‚thodes g‚n‚riques (virtuelles)
    void Move(int iTop, int iLeft)							{ CUC_DirListBoxMove(pDLB, iTop, iLeft); }
    void Resize(int iHeight, int iWidth)					{ CUC_DirListBoxMove(pDLB, iHeight, iWidth); }
    void Refresh()											{ CUC_DirListBoxRefresh(pDLB); }
};



class CUCWindow: public CUCControl
{
  private:
    struct CUC_Window *pWIN;
    
  public:
// constructeur et destructeur
    CUCWindow(WINDOW *wDisp, int (*iBack)(CUCWindow *, int, int), int iTop=0, int iLeft=0, int iHeight=10, int iWidth=40, char *szCaption = "Feuille"); 
    ~CUCWindow()											{ CUC_WindowDestruct(pWIN); }

// Fonctions virtuelles de positionnnement de propri‚t‚s
    virtual int  SetPropNum(int iProp, int iVal)			{ return CUC_WindowSetPropNum(pWIN, iProp, iVal); }
    virtual int  SetPropPtr(int iProp, const void *pArg)	{ return CUC_WindowSetPropPtr(pWIN, iProp, pArg); }
    virtual int  SetPropStr(int iProp, const char *szArg)	{ return CUC_WindowSetPropStr(pWIN, iProp, szArg); }
    
// Lecture de propri‚t‚s g‚n‚riques
    virtual int	 iGetPropNum(int iProp) const				{ return CUC_WindowGetPropNum(pWIN, iProp); }
    virtual void *pGetPropPtr(int iProp) const				{ return CUC_WindowGetPropPtr(pWIN, iProp); }
    virtual char *szGetPropStr(int iProp, char *szB, int iLB) const { return CUC_WindowGetPropStr(pWIN, iProp, szB, iLB); }

// Fonction g‚n‚rique de traitement des ‚v‚nements (virtuelle)
    void DoEvent(int iEvt, int iArg)						{ CUC_WindowDoEvent(pWIN, iEvt, iArg); }
    
// M‚thodes g‚n‚riques (virtuelles)
    void Move(int iTop, int iLeft)							{ CUC_WindowMove(pWIN, iTop, iLeft); }
    void Resize(int iHeight, int iWidth)					{ CUC_WindowMove(pWIN, iHeight, iWidth); }
    void Refresh()											{ CUC_WindowRefresh(pWIN); }
};


#endif	// ifdef _INC_CUCPP
