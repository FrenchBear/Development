// cucgctl.c
// Routines d'accŠs g‚n‚rique aux contr“les par pointeur et type

#include "cuc.h"
#include "cucpriv.h"
#include "import.h"

//======================================================================

void CUC_ControlDestruct(void *pCTL, int iType)
{
  switch(iType)
  {
	case CUCT_HSCROLLBAR:     CUC_HScrollBarDestruct(pCTL);		break;
	case CUCT_VSCROLLBAR:     CUC_VScrollBarDestruct(pCTL);		break;
	case CUCT_LABEL:          CUC_LabelDestruct(pCTL);			break;
	case CUCT_TEXTEDIT:       CUC_TextEditDestruct(pCTL);		break;
	case CUCT_FRAME:          CUC_FrameDestruct(pCTL);			break;
	case CUCT_OPTIONBUTTON:   CUC_OptionButtonDestruct(pCTL);	break;
	case CUCT_CHECKBOX:       CUC_CheckBoxDestruct(pCTL);		break;
	case CUCT_LIST:           CUC_ListDestruct(pCTL);			break;
	case CUCT_FILELISTBOX:    CUC_FileListBoxDestruct(pCTL);	break;
	case CUCT_DIRLISTBOX:     CUC_DirListBoxDestruct(pCTL);		break;
	case CUCT_COMMANDBUTTON:  CUC_CommandButtonDestruct(pCTL);	break;
	case CUCT_COMBOBOX:       CUC_ComboBoxDestruct(pCTL);		break;
	case CUCT_OUTLINE:        CUC_OutlineDestruct(pCTL);		break;
	default:
	  aprintf("CUC Form", "|CUC_ControlDestruct:|Ne sait pas comment traiter|un contr“le de type %d", iType);
  }
}

//======================================================================

int CUC_ControlRefresh(void *pCTL, int iType)
{
  switch(iType)
  {
	case CUCT_HSCROLLBAR:       return CUC_HScrollBarRefresh(pCTL);
	case CUCT_VSCROLLBAR:       return CUC_VScrollBarRefresh(pCTL);
	case CUCT_LABEL:            return CUC_LabelRefresh(pCTL);
	case CUCT_TEXTEDIT:         return CUC_TextEditRefresh(pCTL);
	case CUCT_FRAME:            return CUC_FrameRefresh(pCTL);
	case CUCT_OPTIONBUTTON:     return CUC_OptionButtonRefresh(pCTL);
	case CUCT_CHECKBOX:         return CUC_CheckBoxRefresh(pCTL);
	case CUCT_LIST:             return CUC_ListRefresh(pCTL);
	case CUCT_FILELISTBOX:      return CUC_FileListBoxRefresh(pCTL);
	case CUCT_DIRLISTBOX:       return CUC_DirListBoxRefresh(pCTL);
	case CUCT_COMMANDBUTTON:    return CUC_CommandButtonRefresh(pCTL);
	case CUCT_COMBOBOX:         return CUC_ComboBoxRefresh(pCTL);
	case CUCT_OUTLINE:          return CUC_OutlineRefresh(pCTL);
	default:
	  aprintf("CUC Form", "|CUC_ControlRefresh:|Ne sait pas comment traiter|un contr“le de type %d", iType);
  }
  return -1;
}


int CUC_ControlSetPropNum(void *pCTL, int iType, int iProp, int iVal)
{
  switch(iType)
  {
	case CUCT_HSCROLLBAR:       return CUC_HScrollBarSetPropNum(pCTL, iProp, iVal);
	case CUCT_VSCROLLBAR:       return CUC_VScrollBarSetPropNum(pCTL, iProp, iVal);
	case CUCT_LABEL:            return CUC_LabelSetPropNum(pCTL, iProp, iVal);
	case CUCT_TEXTEDIT:         return CUC_TextEditSetPropNum(pCTL, iProp, iVal);
	case CUCT_FRAME:            return CUC_FrameSetPropNum(pCTL, iProp, iVal);
	case CUCT_OPTIONBUTTON:     return CUC_OptionButtonSetPropNum(pCTL, iProp, iVal);
	case CUCT_CHECKBOX:         return CUC_CheckBoxSetPropNum(pCTL, iProp, iVal);
	case CUCT_LIST:             return CUC_ListSetPropNum(pCTL, iProp, iVal);
	case CUCT_FILELISTBOX:      return CUC_FileListBoxSetPropNum(pCTL, iProp, iVal);
	case CUCT_DIRLISTBOX:       return CUC_DirListBoxSetPropNum(pCTL, iProp, iVal);
	case CUCT_COMMANDBUTTON:    return CUC_CommandButtonSetPropNum(pCTL, iProp, iVal);
	case CUCT_COMBOBOX:         return CUC_ComboBoxSetPropNum(pCTL, iProp, iVal);
	case CUCT_OUTLINE:          return CUC_OutlineSetPropNum(pCTL, iProp, iVal);
	default:
	  aprintf("CUC Form", "|CUC_ControlSetPropNum:|Ne sait pas comment traiter|un contr“le de type %d", iType);
  }
  return -1;
}

int CUC_ControlSetPropNumInd(void *pCTL, int iType, int iProp, int iInd, int iVal)
{
  switch(iType)
  {
	case CUCT_OUTLINE:     return CUC_OutlineSetPropNumInd(pCTL, iProp, iInd, iVal);
	default:
	  aprintf("CUC Form", "|CUC_ControlSetPropNumInd:|Ne sait pas comment traiter|un contr“le de type %d", iType);
  }
  return -1;
}



int CUC_ControlSetPropStr(void *pCTL, int iType, int iProp, void *pArg)
{
  switch(iType)
  {
	case CUCT_LABEL:            return CUC_LabelSetPropStr(pCTL, iProp, pArg);
	case CUCT_TEXTEDIT:         return CUC_TextEditSetPropStr(pCTL, iProp, pArg);
	case CUCT_FRAME:            return CUC_FrameSetPropStr(pCTL, iProp, pArg);
	case CUCT_OPTIONBUTTON:     return CUC_OptionButtonSetPropStr(pCTL, iProp, pArg);
	case CUCT_CHECKBOX:         return CUC_CheckBoxSetPropStr(pCTL, iProp, pArg);
	case CUCT_LIST:             return CUC_ListSetPropStr(pCTL, iProp, pArg);
	case CUCT_FILELISTBOX:      return CUC_FileListBoxSetPropStr(pCTL, iProp, pArg);
	case CUCT_DIRLISTBOX:       return CUC_DirListBoxSetPropStr(pCTL, iProp, pArg);
	case CUCT_COMMANDBUTTON:    return CUC_CommandButtonSetPropStr(pCTL, iProp, pArg);
	case CUCT_COMBOBOX:         return CUC_ComboBoxSetPropStr(pCTL, iProp, pArg);
	case CUCT_OUTLINE:          return CUC_OutlineSetPropStr(pCTL, iProp, pArg);
	default:
	  aprintf("CUC Form", "|CUC_ControlSetPropStr:|Ne sait pas comment traiter|un contr“le de type %d", iType);
  }
  return -1;
}


int CUC_ControlSetPropPtr(void *pCTL, int iType, int iProp, void *pArg)
{
  switch(iType)
  {
	case CUCT_HSCROLLBAR:       return CUC_HScrollBarSetPropPtr(pCTL, iProp, pArg);
	case CUCT_VSCROLLBAR:       return CUC_VScrollBarSetPropPtr(pCTL, iProp, pArg);
	case CUCT_LABEL:            return CUC_LabelSetPropPtr(pCTL, iProp, pArg);
	case CUCT_TEXTEDIT:         return CUC_TextEditSetPropPtr(pCTL, iProp, pArg);
	case CUCT_FRAME:            return CUC_FrameSetPropPtr(pCTL, iProp, pArg);
	case CUCT_OPTIONBUTTON:     return CUC_OptionButtonSetPropPtr(pCTL, iProp, pArg);
	case CUCT_CHECKBOX:         return CUC_CheckBoxSetPropPtr(pCTL, iProp, pArg);
	case CUCT_LIST:             return CUC_ListSetPropPtr(pCTL, iProp, pArg);
	case CUCT_FILELISTBOX:      return CUC_FileListBoxSetPropPtr(pCTL, iProp, pArg);
	case CUCT_DIRLISTBOX:       return CUC_DirListBoxSetPropPtr(pCTL, iProp, pArg);
	case CUCT_COMMANDBUTTON:    return CUC_CommandButtonSetPropPtr(pCTL, iProp, pArg);
	case CUCT_COMBOBOX:         return CUC_ComboBoxSetPropPtr(pCTL, iProp, pArg);
	case CUCT_OUTLINE:          return CUC_OutlineSetPropPtr(pCTL, iProp, pArg);
	default:
	  aprintf("CUC Form", "|CUC_ControlSetPropPtr:|Ne sait pas comment traiter|un contr“le de type %d", iType);
  }
  return -1;
}


int CUC_ControlGetPropNum(void *pCTL, int iType, int iProp)
{
  switch(iType)
  {
	case CUCT_HSCROLLBAR:       return CUC_HScrollBarGetPropNum(pCTL, iProp);
	case CUCT_VSCROLLBAR:       return CUC_VScrollBarGetPropNum(pCTL, iProp);
	case CUCT_LABEL:            return CUC_LabelGetPropNum(pCTL, iProp);
	case CUCT_TEXTEDIT:         return CUC_TextEditGetPropNum(pCTL, iProp);
	case CUCT_FRAME:            return CUC_FrameGetPropNum(pCTL, iProp);
	case CUCT_OPTIONBUTTON:     return CUC_OptionButtonGetPropNum(pCTL, iProp);
	case CUCT_CHECKBOX:         return CUC_CheckBoxGetPropNum(pCTL, iProp);
	case CUCT_LIST:             return CUC_ListGetPropNum(pCTL, iProp);
	case CUCT_FILELISTBOX:      return CUC_FileListBoxGetPropNum(pCTL, iProp);
	case CUCT_DIRLISTBOX:       return CUC_DirListBoxGetPropNum(pCTL, iProp);
	case CUCT_COMMANDBUTTON:    return CUC_CommandButtonGetPropNum(pCTL, iProp);
	case CUCT_COMBOBOX:         return CUC_ComboBoxGetPropNum(pCTL, iProp);
	case CUCT_OUTLINE:          return CUC_OutlineGetPropNum(pCTL, iProp);
	default:
	  aprintf("CUC Form", "|CUC_ControlGetPropNum:|Ne sait pas comment traiter|un contr“le de type %d", iType);
  }
  return -1;
}


int CUC_ControlGetPropNumInd(void *pCTL, int iType, int iProp, int iInd)
{
  switch(iType)
  {
	case CUCT_OUTLINE:     return CUC_OutlineGetPropNumInd(pCTL, iProp, iInd);
	default:
	  aprintf("CUC Form", "|CUC_ControlGetPropNumInd:|Ne sait pas comment traiter|un contr“le de type %d", iType);
  }
  return -1;
}


char *CUC_ControlGetPropStr(void *pCTL, int iType, int iProp, char *szBuffer, int iLen)
{
  switch(iType)
  {
	case CUCT_HSCROLLBAR:       return CUC_HScrollBarGetPropStr(pCTL, iProp, szBuffer, iLen);
	case CUCT_VSCROLLBAR:       return CUC_VScrollBarGetPropStr(pCTL, iProp, szBuffer, iLen);
	case CUCT_LABEL:            return CUC_LabelGetPropStr(pCTL, iProp, szBuffer, iLen);
	case CUCT_TEXTEDIT:         return CUC_TextEditGetPropStr(pCTL, iProp, szBuffer, iLen);
	case CUCT_FRAME:            return CUC_FrameGetPropStr(pCTL, iProp, szBuffer, iLen);
	case CUCT_OPTIONBUTTON:     return CUC_OptionButtonGetPropStr(pCTL, iProp, szBuffer, iLen);
	case CUCT_CHECKBOX:         return CUC_CheckBoxGetPropStr(pCTL, iProp, szBuffer, iLen);
	case CUCT_LIST:             return CUC_ListGetPropStr(pCTL, iProp, szBuffer, iLen);
	case CUCT_FILELISTBOX:      return CUC_FileListBoxGetPropStr(pCTL, iProp, szBuffer, iLen);
	case CUCT_DIRLISTBOX:       return CUC_DirListBoxGetPropStr(pCTL, iProp, szBuffer, iLen);
	case CUCT_COMMANDBUTTON:    return CUC_CommandButtonGetPropStr(pCTL, iProp, szBuffer, iLen);
	case CUCT_COMBOBOX:         return CUC_ComboBoxGetPropStr(pCTL, iProp, szBuffer, iLen);
	case CUCT_OUTLINE:          return CUC_OutlineGetPropStr(pCTL, iProp, szBuffer, iLen);
	default:
	  aprintf("CUC Form", "|CUC_ControlGetPropStr:|Ne sait pas comment traiter|un contr“le de type %d", iType);
  }
  return NULL;
}


char *CUC_ControlGetPropStrInd(void *pCTL, int iType, int iProp, int iInd, char *szBuffer, int iLen)
{
  switch(iType)
  {
	case CUCT_LIST:        return CUC_ListGetPropStrInd(pCTL, iProp, iInd, szBuffer, iLen);
	case CUCT_FILELISTBOX: return CUC_FileListBoxGetPropStrInd(pCTL, iProp, iInd, szBuffer, iLen);
	case CUCT_DIRLISTBOX:  return CUC_DirListBoxGetPropStrInd(pCTL, iProp, iInd, szBuffer, iLen);
	case CUCT_COMBOBOX:    return CUC_ComboBoxGetPropStrInd(pCTL, iProp, iInd, szBuffer, iLen);
	case CUCT_OUTLINE:     return CUC_OutlineGetPropStrInd(pCTL, iProp, iInd, szBuffer, iLen);
	default:
	  aprintf("CUC Form", "|CUC_ControlGetPropStrInd:|Ne sait pas comment traiter|un contr“le de type %d", iType);
  }
  return NULL;
}


int CUC_ControlSetPropStrInd(void *pCTL, int iType, int iProp, int iInd, char *szBuffer)
{
  switch(iType)
  {
	case CUCT_LIST:      return CUC_ListSetPropStrInd(pCTL, iProp, iInd, szBuffer);
	case CUCT_COMBOBOX:  return CUC_ComboBoxSetPropStrInd(pCTL, iProp, iInd, szBuffer);
	case CUCT_OUTLINE:   return CUC_OutlineSetPropStrInd(pCTL, iProp, iInd, szBuffer);
	default:
	  aprintf("CUC Form", "|CUC_ControlSetPropStrInd:|Ne sait pas comment traiter|un contr“le de type %d", iType);
  }
  return -1;
}


int CUC_ControlDoEvent(void *pCTL, int iType, int iEvent, int iArg)
{
  switch(iType)
  {
	case CUCT_HSCROLLBAR:    return CUC_HScrollBarDoEvent(pCTL, iEvent, iArg);
	case CUCT_VSCROLLBAR:    return CUC_VScrollBarDoEvent(pCTL, iEvent, iArg);
	case CUCT_LABEL:         return CUC_LabelDoEvent(pCTL, iEvent, iArg);
	case CUCT_TEXTEDIT:      return CUC_TextEditDoEvent(pCTL, iEvent, iArg);
	case CUCT_FRAME:         return CUC_FrameDoEvent(pCTL, iEvent, iArg);
	case CUCT_OPTIONBUTTON:  return CUC_OptionButtonDoEvent(pCTL, iEvent, iArg);
	case CUCT_CHECKBOX:      return CUC_CheckBoxDoEvent(pCTL, iEvent, iArg);
	case CUCT_LIST:          return CUC_ListDoEvent(pCTL, iEvent, iArg);
	case CUCT_FILELISTBOX:   return CUC_FileListBoxDoEvent(pCTL, iEvent, iArg);
	case CUCT_DIRLISTBOX:    return CUC_DirListBoxDoEvent(pCTL, iEvent, iArg);
	case CUCT_COMMANDBUTTON: return CUC_CommandButtonDoEvent(pCTL, iEvent, iArg);
	case CUCT_COMBOBOX:      return CUC_ComboBoxDoEvent(pCTL, iEvent, iArg);
	case CUCT_OUTLINE:       return CUC_OutlineDoEvent(pCTL, iEvent, iArg);
	default:
	  aprintf("CUC Form", "|CUC_ControlDoEvent:|Ne sait pas comment traiter|un contr“le de type %d", iType);
  }
  return -1;
}


// Remplissage de listes et de ComboBox
int CUC_ControlAddItem(void *pCTL, int iType, char *szVal, int iPos)
{
  switch(iType)
  {
	case CUCT_LIST:      return CUC_ListAddItem(pCTL, szVal, iPos);
	case CUCT_COMBOBOX:  return CUC_ComboBoxAddItem(pCTL, szVal, iPos);
	case CUCT_OUTLINE:   return CUC_OutlineAddItem(pCTL, szVal, iPos);
	default:
	  aprintf("CUC Form", "|CUC_ControlAddItem:|Ne sait pas comment traiter|un contr“le de type %d", iType);
  }
  return -1;
}


// Remplissage sp‚cifique au ctrl outline
int CUC_ControlAddItemIndent(void *pCTL, int iType, char *szVal, int iPos, int iIndent)
{
  switch(iType)
  {
	case CUCT_OUTLINE:   return CUC_OutlineAddItemIndent(pCTL, szVal, iPos, iIndent);
	default:
	  aprintf("CUC Form", "|CUC_ControlAddItemIndent:|Ne sait pas comment traiter|un contr“le de type %d", iType);
  }
  return -1;
}


// Suppression d'un ‚l‚ment de liste et de ComboBox
int CUC_ControlRemoveItem(void *pCTL, int iType, int iPos)
{
  switch(iType)
  {
	case CUCT_LIST:      return CUC_ListRemoveItem(pCTL, iPos);
	case CUCT_COMBOBOX:  return CUC_ComboBoxRemoveItem(pCTL, iPos);
	case CUCT_OUTLINE:   return CUC_OutlineRemoveItem(pCTL, iPos);
	default:
	  aprintf("CUC Form", "|CUC_ControlRemoveItem:|Ne sait pas comment traiter|un contr“le de type %d", iType);
  }
  return -1;
}


// Effacement de listes et de ComboBox
int CUC_ControlClear(void *pCTL, int iType)
{
  switch(iType)
  {
	case CUCT_LIST:      return CUC_ListClear(pCTL);
	case CUCT_COMBOBOX:  return CUC_ComboBoxClear(pCTL);
	case CUCT_OUTLINE:   return CUC_OutlineClear(pCTL);
	default:
	  aprintf("CUC Form", "|CUC_ControlClear:|Ne sait pas comment traiter|un contr“le de type %d", iType);
  }
  return -1;
}

// Fermeture de ComboBox
int CUC_ControlCloseList(void *pCTL, int iType)
{
  switch(iType)
  {
	case CUCT_COMBOBOX:         return CUC_ComboBoxCloseList(pCTL);
	default:
	  aprintf("CUC Form", "|CUC_ControlCloseList:|Ne sait pas comment traiter|un contr“le de type %d", iType);
  }
  return -1;
}


int CUC_ControlDisplayCursor(void *pCTL, int iType)
{
  switch(iType)
  {
	case CUCT_HSCROLLBAR:       return CUC_HScrollBarDisplayCursor(pCTL);
	case CUCT_VSCROLLBAR:       return CUC_VScrollBarDisplayCursor(pCTL);
	case CUCT_TEXTEDIT:         return CUC_TextEditDisplayCursor(pCTL);
	case CUCT_OPTIONBUTTON:     return CUC_OptionButtonDisplayCursor(pCTL);
	case CUCT_CHECKBOX:         return CUC_CheckBoxDisplayCursor(pCTL);
	case CUCT_LIST:             return CUC_ListDisplayCursor(pCTL);
	case CUCT_FILELISTBOX:      return CUC_FileListBoxDisplayCursor(pCTL);
	case CUCT_DIRLISTBOX:       return CUC_DirListBoxDisplayCursor(pCTL);
	case CUCT_COMMANDBUTTON:    return CUC_CommandButtonDisplayCursor(pCTL);
	case CUCT_COMBOBOX:         return CUC_ComboBoxDisplayCursor(pCTL);
	case CUCT_OUTLINE:          return CUC_OutlineDisplayCursor(pCTL);
	default:
	  aprintf("CUC Form", "|CUC_ControlDisplayCursor:|Ne sait pas comment traiter|un contr“le de type %d", iType);
  }
  return -1;
}


//======================================================================
// Initialisation de barres de d‚filement

int CUC_ControlSetMinMax(void *pCTL, int iType, int iMin, int iMax, int iCSize)
{
  switch(iType)
  {
	case CUCT_HSCROLLBAR:       
	  CUC_HScrollBarSetPropNum(pCTL, CUCP_MIN, iMin);
	  CUC_HScrollBarSetPropNum(pCTL, CUCP_MAX, iMax);
	  CUC_HScrollBarSetPropNum(pCTL, CUCP_CSIZE, iCSize);
	  return 0;
	case CUCT_VSCROLLBAR:       
	  CUC_VScrollBarSetPropNum(pCTL, CUCP_MIN, iMin);
	  CUC_VScrollBarSetPropNum(pCTL, CUCP_MAX, iMax);
	  CUC_VScrollBarSetPropNum(pCTL, CUCP_CSIZE, iCSize);
	  return 0;
	default:
	  aprintf("CUC Form", "|CUC_ControlSetMinMax:|Ne sait pas comment traiter|un contr“le de type %d", iType);
  }
  return -1;
}

