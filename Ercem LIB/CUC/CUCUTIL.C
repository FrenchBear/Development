// cucutil.c
// Routines communes … la bibliothŠque CUC
// Juin 94
//  2/12/94 PV	Propri‚t‚s CUCP_LINE, CUCP_COLUMN, CUCP_STARTLINE, CUCP_STARTCOLUMN
//  5/12/94 PV	Propri‚t‚s CUCP_LENGTH, CUCP_LINES
// 26/12/94 PV	Propri‚t‚s du contr“le outline; EffaceRectangle
// 20/01/95 PV	CUCP_TABCHAR

#include <stdio.h>
#include <curses.h>

#include <clib.ref>
#include <biberc.h>

#include "cuc.h"
#include "cucpriv.h"
#include "import.h"

/*====================================================================*/
// test g‚n‚rique de v‚rification de borne inf et sup
// Routine pratique de contr“le de vraissemblance pour les valeurs des propri‚t‚s

int iCtrlBornes(const char *szNomClasse, int iProp, int iVal, int iMin, int iMax)
{
  if (iVal<iMin || iVal>iMax)
  {
    aprintf(szNomClasse, "La valeur %d est incorrecte|pour la propri‚t‚ %s (%d).||Doit ˆtre comprise entre %d et %d.|", iVal, szCUCPropName(iProp), iProp, iMin, iMax);
    return -1;
  }
  return 0;
}


/*====================================================================*/
// V‚rifie qu'un contr“le a bien le type voulu
// Retour -1 si pointeur invalide, 0 si Ok
// Pour l'instant, cette fonction affiche directement un message
// d'erreur. A terme, il faudra retourner proprement la situation
// d'erreur … l'appellant, … lui d'afficher ‚ventuellement un message.
// Toutes les fonctions de l'interface font appel … cette fonction
// avant d'utiliser le pointeur.

int iCtrlType(const void *p, const char *szFonc, const char *szTypeOk)
{
  if (p==NULL)
  { aprintf("CUC: iCtrlType", "%s: Pointeur d'objet NULL !", szFonc);
    return -1;
  }

  if (strcmp((char *)p, szTypeOk)!=0)
  { aprintf("CUC: iCtrlType", "%s:|Pointeur d'objet %x invalide !|Trouvé: %02x %02x %02x au lieu de %02x %02x %02x \"%s\"", szFonc, p, ((char *)p)[0], ((char *)p)[1], ((char *)p)[2], szTypeOk[0], szTypeOk[1], szTypeOk[2], szTypeOk);
#ifdef _DEBUG
    _asm int 3;
#endif
    return -1;
  }

  return 0;
}

/*====================================================================*/
// iOkWDisp v‚rifie qu'un WINDOW * est "l‚gal" avant affichage,
// pour ‚viter un "core dumped" difficile … d‚boguer
// Pour l'instant, ne teste que la valeur NULL. Il faudrait
// sans doute faire des tests plus pouss‚s.

int iOkWDisp(WINDOW *p, const char *szClasse, const char *szFonc)
{
  if (p==NULL)
  { aprintf(szClasse, "%s: Pointeur d'affichage invalide !", szFonc);
    return -1;
  }
  return 0;
}

/*====================================================================*/
// Retourne le nom d'une propri‚t‚ en clair
// Permet d'afficher le nom de la propri‚t‚ dans un message d'erreur
// plutot que son code num‚rique.

char *szCUCPropName(int iProp)
{
  static char szPropInconnue[35];
  
  switch(iProp)
  {
    case CUCP_LEFT:			return "Left";
    case CUCP_TOP:			return "Top";
    case CUCP_WIDTH:		return "Width";
    case CUCP_HEIGHT:		return "Height";
    case CUCP_MIN:			return "Min";
    case CUCP_MAX:			return "Max";
    case CUCP_SMALLCHANGE:	return "SmallChange";
    case CUCP_LARGECHANGE:	return "LargeChange";
    case CUCP_VALUE:		return "Value";
    case CUCP_CSIZE:		return "CSize";
    case CUCP_VISIBLE:		return "Visible";
    case CUCP_ENABLED:		return "Enabled";
    case CUCP_PARENT:		return "Parent";
    case CUCP_TABSTOP:		return "TabStop";
    case CUCP_TYPE:			return "Type";
    case CUCP_TAG:			return "Tag";
    case CUCP_FOCUS:		return "Focus";
    case CUCP_ALIGNMENT:	return "Alignment";
    case CUCP_BORDERSTYLE:	return "BorderStyle";
    case CUCP_AUTOSIZE:		return "AutoSize";
    case CUCP_CAPTION:		return "Caption";
    case CUCP_TRISTATE:		return "TriState";
    case CUCP_DEFAULT:		return "Default";
    case CUCP_CANCEL:		return "Cancel";
    case CUCP_COLUMNS:		return "Columns";
    case CUCP_AUTOREFRESH:	return "AutoRefresh";
    case CUCP_SORTED:		return "Sorted";
    case CUCP_LISTCOUNT:	return "ListCount";
    case CUCP_LISTINDEX:	return "ListIndex";
    case CUCP_LIST:			return "List";
    case CUCP_MULTILINE:	return "MultiLine";
    case CUCP_SCROLLBARS:	return "ScrollBars";
    case CUCP_TEXT:			return "Text";
    case CUCP_SELLENGTH:	return "SelLength";
    case CUCP_SELSTART:		return "SelStart";
    case CUCP_SELTEXT:		return "SelText";
    case CUCP_PATTERN:		return "Pattern";
    case CUCP_PATH:			return "Path";
    case CUCP_DRIVE:		return "Drive";
    case CUCP_CHECKED:		return "Checked";
    case CUCP_SEPARATOR:	return "Separator";
    case CUCP_INSMODE:		return "InsMode";
    case CUCP_MAXLENGTH:	return "MaxLength";
    case CUCP_TABSIZE:		return "TabSize";
    case CUCP_IDBACK:		return "IdBack";
    case CUCP_ACCELERATOR:	return "Accelerator";
    case CUCP_STYLE:		return "Style";
    case CUCP_WDISP:		return "wDisp";
    case CUCP_FLAGS:		return "Flags";
    case CUCP_EOLCHAR:		return "EOLChar";
    case CUCP_EOFCHAR:		return "EOFChar";
    case CUCP_LISTWIDTH:	return "ListWidth";
    case CUCP_FILENAME:		return "Filename";
    case CUCP_FULLPATH:		return "FullPath";
    case CUCP_STDATTRIB:	return "StdAttrib";
    case CUCP_LINE:			return "Line";
    case CUCP_COLUMN:		return "Column";
    case CUCP_STARTLINE:	return "StartLine";
    case CUCP_STARTCOLUMN:	return "StartColumn";
    case CUCP_LENGTH:		return "Length";
    case CUCP_LINES:		return "Lines";
	case CUCP_PATHSEPARATOR:return "PathSeparator";
	case CUCP_HASSUBITEMS:	return "HasSubItems";
	case CUCP_ISITEMVISIBLE:return "IsItemVisible";
	case CUCP_INDENT:		return "Indent";
	case CUCP_EXPAND:		return "Expand";
	case CUCP_AFFCOUNT:		return "AffCount";
	case CUCP_AFFINDEX:		return "AffIndex";
	case CUCP_TABCHAR:		return "TabChar";

    default:				sprintf(szPropInconnue, "(Propri‚t‚ %d inconnue)", iProp);
    						return szPropInconnue;
  }
}

/*====================================================================*/
// Affiche un message d'erreur standard pour les propri‚t‚s non
// g‚r‚es et les propri‚t‚s en lecture seule.

void ErrPropNonGeree(const char *szClasse, const char *szFonction, int iProp)
{
  aprintf(szClasse, "|%s: propri‚t‚ %s (%d)|non g‚r‚e !|", szFonction, szCUCPropName(iProp), iProp);
}

void ErrPropLectureSeule(const char *szClasse, const char *szFonction, int iProp)
{
  aprintf(szClasse, "|%s: propri‚t‚ %d %s|en lecture seule !|", szFonction, iProp, szCUCPropName(iProp));
}

/*====================================================================*/
// Affichage d'un caractŠre sur la fenetre courante avec clipping,
// puisque les curses ne gŠrent pas ‡a...

void cmvwaddch(WINDOW *w, int lig, int col, int car)
{
  int maxx, maxy;
  
  getmaxyx(w, maxy, maxx);
  if (lig>=0 && col>=0 && lig<=maxy-1 && col<=maxx-1)
    mvwaddch(w, lig, col, (unsigned char)car);
}

/*====================================================================*/
// Affichage d'une chaine sur la fenetre courante avec clipping

void cmvwaddstr(WINDOW *w, int lig, int col, const unsigned char *szCh)
{
  int i;

  for(i=0 ; szCh[i] ; i++)
    cmvwaddch(w, lig, col+i, szCh[i]);
}

/*====================================================================*/
// Effacement d'un rectangle d'affichage

void CUC_EffaceRectangle(WINDOW *wDisp, int iTop, int iLeft, int iHeight, int iWidth)
{
  int i, j;

  for (i=0 ; i<iHeight ; i++)
    for (j=0 ; j<iWidth ; j++)
      cmvwaddch(wDisp, iTop+i, iLeft+j, ' ');
}

