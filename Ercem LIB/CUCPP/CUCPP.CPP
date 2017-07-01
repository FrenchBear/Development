// cucpp.cpp
// Implantation des contr“les CUC en C++
// Fonctions trop volumnineuses pour ˆtre plac‚es dans cucpp.h (constructeurs)
// PV 6/6/94
// 10/12/94	Ajout de quelques contrôles

#include "cucpp.h"


// HScrollBar
CUCHScrollBar::CUCHScrollBar(WINDOW *wDisp, int (*iBack)(CUCHScrollBar *, int, int), int iTop, int iLeft, int iHeight, int iWidth)
{                                          
  pHSB = CUC_HScrollBarCreate(wDisp, (int (*)(void *, int, int))iBack);
  CUC_HScrollBarSetPropNum(pHSB, CUCP_LEFT,   iLeft);
  CUC_HScrollBarSetPropNum(pHSB, CUCP_TOP,    iTop);
  CUC_HScrollBarSetPropNum(pHSB, CUCP_WIDTH,  iWidth);
  CUC_HScrollBarSetPropNum(pHSB, CUCP_HEIGHT, iHeight);

  CUC_HScrollBarSetPropPtr(pHSB, CUCP_IDBACK, this);
}


// VScrollBar
CUCVScrollBar::CUCVScrollBar(WINDOW *wDisp, int (*iBack)(CUCVScrollBar *, int, int), int iTop, int iLeft, int iHeight, int iWidth)
{                                          
  pVSB = CUC_VScrollBarCreate(wDisp, (int (*)(void *, int, int))iBack);
  CUC_VScrollBarSetPropNum(pVSB, CUCP_LEFT,   iLeft);
  CUC_VScrollBarSetPropNum(pVSB, CUCP_TOP,    iTop);
  CUC_VScrollBarSetPropNum(pVSB, CUCP_WIDTH,  iWidth);
  CUC_VScrollBarSetPropNum(pVSB, CUCP_HEIGHT, iHeight);

  CUC_VScrollBarSetPropPtr(pVSB, CUCP_IDBACK, this);
}


// List
CUCList::CUCList(WINDOW *wDisp, int (*iBack)(CUCList *, int, int), int iTop, int iLeft, int iHeight, int iWidth)
{                                          
  pLST = CUC_ListCreate(wDisp, (int (*)(void *, int, int))iBack);
  CUC_ListSetPropNum(pLST, CUCP_LEFT,   iLeft);
  CUC_ListSetPropNum(pLST, CUCP_TOP,    iTop);
  CUC_ListSetPropNum(pLST, CUCP_WIDTH,  iWidth);
  CUC_ListSetPropNum(pLST, CUCP_HEIGHT, iHeight);

  CUC_ListSetPropPtr(pLST, CUCP_IDBACK, this);
}


// CheckBox
CUCCheckBox::CUCCheckBox(WINDOW *wDisp, int (*iBack)(CUCCheckBox *, int, int), int iTop, int iLeft, int iHeight, int iWidth, char *szCaption)
{                                          
  pCHB = CUC_CheckBoxCreate(wDisp, (int (*)(void *, int, int))iBack);
  CUC_CheckBoxSetPropNum(pCHB, CUCP_LEFT,   iLeft);
  CUC_CheckBoxSetPropNum(pCHB, CUCP_TOP,    iTop);
  CUC_CheckBoxSetPropNum(pCHB, CUCP_WIDTH,  iWidth);
  CUC_CheckBoxSetPropNum(pCHB, CUCP_HEIGHT, iHeight);

  CUC_CheckBoxSetPropStr(pCHB, CUCP_CAPTION, szCaption);

  CUC_CheckBoxSetPropPtr(pCHB, CUCP_IDBACK, this);
}


// OptionButton
CUCOptionButton::CUCOptionButton(WINDOW *wDisp, int (*iBack)(CUCOptionButton *, int, int), int iTop, int iLeft, int iHeight, int iWidth, char *szCaption)
{                                          
  pOPT = CUC_OptionButtonCreate(wDisp, (int (*)(void *, int, int))iBack);
  CUC_OptionButtonSetPropNum(pOPT, CUCP_LEFT,   iLeft);
  CUC_OptionButtonSetPropNum(pOPT, CUCP_TOP,    iTop);
  CUC_OptionButtonSetPropNum(pOPT, CUCP_WIDTH,  iWidth);
  CUC_OptionButtonSetPropNum(pOPT, CUCP_HEIGHT, iHeight);

  CUC_OptionButtonSetPropStr(pOPT, CUCP_CAPTION, szCaption);

  CUC_OptionButtonSetPropPtr(pOPT, CUCP_IDBACK, this);
}


// Label
CUCLabel::CUCLabel(WINDOW *wDisp, int (*iBack)(CUCLabel *, int, int), int iTop, int iLeft, int iHeight, int iWidth, char *szCaption)
{                                          
  pLBL = CUC_LabelCreate(wDisp, (int (*)(void *, int, int))iBack);
  CUC_LabelSetPropNum(pLBL, CUCP_LEFT,   iLeft);
  CUC_LabelSetPropNum(pLBL, CUCP_TOP,    iTop);
  CUC_LabelSetPropNum(pLBL, CUCP_WIDTH,  iWidth);
  CUC_LabelSetPropNum(pLBL, CUCP_HEIGHT, iHeight);

  CUC_LabelSetPropStr(pLBL, CUCP_CAPTION, szCaption);

  CUC_LabelSetPropPtr(pLBL, CUCP_IDBACK, this);
}


// TextEdit
CUCTextEdit::CUCTextEdit(WINDOW *wDisp, int (*iBack)(CUCTextEdit *, int, int), int iTop, int iLeft, int iHeight, int iWidth)
{                                          
  pTXT = CUC_TextEditCreate(wDisp, (int (*)(void *, int, int))iBack);
  CUC_TextEditSetPropNum(pTXT, CUCP_LEFT,   iLeft);
  CUC_TextEditSetPropNum(pTXT, CUCP_TOP,    iTop);
  CUC_TextEditSetPropNum(pTXT, CUCP_WIDTH,  iWidth);
  CUC_TextEditSetPropNum(pTXT, CUCP_HEIGHT, iHeight);

  CUC_TextEditSetPropNum(pTXT, CUCP_BORDERSTYLE, 1);

  CUC_TextEditSetPropPtr(pTXT, CUCP_IDBACK, this);
}


// Frame
CUCFrame::CUCFrame(WINDOW *wDisp, int (*iBack)(CUCFrame *, int, int), int iTop, int iLeft, int iHeight, int iWidth, char *szCaption)
{                                          
  pFRA = CUC_FrameCreate(wDisp, (int (*)(void *, int, int))iBack);
  CUC_FrameSetPropNum(pFRA, CUCP_LEFT,   iLeft);
  CUC_FrameSetPropNum(pFRA, CUCP_TOP,    iTop);
  CUC_FrameSetPropNum(pFRA, CUCP_WIDTH,  iWidth);
  CUC_FrameSetPropNum(pFRA, CUCP_HEIGHT, iHeight);
  CUC_FrameSetPropNum(pFRA, CUCP_BORDERSTYLE, 1);
  CUC_FrameSetPropStr(pFRA, CUCP_CAPTION, szCaption);
  CUC_FrameSetPropPtr(pFRA, CUCP_IDBACK, this);
}


// CommandButton
CUCCommandButton::CUCCommandButton(WINDOW *wDisp, int (*iBack)(CUCCommandButton *, int, int), int iTop, int iLeft, int iHeight, int iWidth, char *szCaption)
{                                          
  pBTN = CUC_CommandButtonCreate(wDisp, (int (*)(void *, int, int))iBack);
  CUC_CommandButtonSetPropNum(pBTN, CUCP_LEFT,   iLeft);
  CUC_CommandButtonSetPropNum(pBTN, CUCP_TOP,    iTop);
  CUC_CommandButtonSetPropNum(pBTN, CUCP_WIDTH,  iWidth);
  CUC_CommandButtonSetPropNum(pBTN, CUCP_HEIGHT, iHeight);

  CUC_CommandButtonSetPropStr(pBTN, CUCP_CAPTION, szCaption);

  CUC_CommandButtonSetPropPtr(pBTN, CUCP_IDBACK, this);
}


// ComboBox
CUCComboBox::CUCComboBox(WINDOW *wDisp, int (*iBack)(CUCComboBox *, int, int), int iTop, int iLeft, int iHeight, int iWidth)
{                                          
  pCBX = CUC_ComboBoxCreate(wDisp, (int (*)(void *, int, int))iBack);
  CUC_ComboBoxSetPropNum(pCBX, CUCP_LEFT,   iLeft);
  CUC_ComboBoxSetPropNum(pCBX, CUCP_TOP,    iTop);
  CUC_ComboBoxSetPropNum(pCBX, CUCP_WIDTH,  iWidth);
  CUC_ComboBoxSetPropNum(pCBX, CUCP_HEIGHT, iHeight);

  CUC_ComboBoxSetPropPtr(pCBX, CUCP_IDBACK, this);
}


// FileListBox
CUCFileListBox::CUCFileListBox(WINDOW *wDisp, int (*iBack)(CUCFileListBox *, int, int), int iTop, int iLeft, int iHeight, int iWidth)
{                                          
  pFLB = CUC_FileListBoxCreate(wDisp, (int (*)(void *, int, int))iBack);
  CUC_FileListBoxSetPropNum(pFLB, CUCP_LEFT,   iLeft);
  CUC_FileListBoxSetPropNum(pFLB, CUCP_TOP,    iTop);
  CUC_FileListBoxSetPropNum(pFLB, CUCP_WIDTH,  iWidth);
  CUC_FileListBoxSetPropNum(pFLB, CUCP_HEIGHT, iHeight);

  CUC_FileListBoxSetPropPtr(pFLB, CUCP_IDBACK, this);
}


// DirListBox
CUCDirListBox::CUCDirListBox(WINDOW *wDisp, int (*iBack)(CUCDirListBox *, int, int), int iTop, int iLeft, int iHeight, int iWidth)
{                                          
  pDLB = CUC_DirListBoxCreate(wDisp, (int (*)(void *, int, int))iBack);
  CUC_DirListBoxSetPropNum(pDLB, CUCP_LEFT,   iLeft);
  CUC_DirListBoxSetPropNum(pDLB, CUCP_TOP,    iTop);
  CUC_DirListBoxSetPropNum(pDLB, CUCP_WIDTH,  iWidth);
  CUC_DirListBoxSetPropNum(pDLB, CUCP_HEIGHT, iHeight);

  CUC_DirListBoxSetPropPtr(pDLB, CUCP_IDBACK, this);
}


// Window
CUCWindow::CUCWindow(WINDOW *wDisp, int (*iBack)(CUCWindow *, int, int), int iTop, int iLeft, int iHeight, int iWidth, char *szCaption)
{                                          
  pWIN = CUC_WindowCreate(wDisp, (int (*)(void *, int, int))iBack);
  CUC_WindowSetPropNum(pWIN, CUCP_LEFT,   iLeft);
  CUC_WindowSetPropNum(pWIN, CUCP_TOP,    iTop);
  CUC_WindowSetPropNum(pWIN, CUCP_WIDTH,  iWidth);
  CUC_WindowSetPropNum(pWIN, CUCP_HEIGHT, iHeight);
  CUC_WindowSetPropStr(pWIN, CUCP_CAPTION, szCaption);

  CUC_WindowSetPropPtr(pWIN, CUCP_IDBACK, this);

  CUC_WindowSetPropNum(pWIN, CUCP_VISIBLE, 1);
}
