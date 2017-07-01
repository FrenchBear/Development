// VTermView.cpp : implementation of the CVTermView class
// 30/04/96 PV
// 01/07/96 1.1.3 Passage de tiWidth de global en auto pour le problème de réaffichage quand deux fenêtres n'ont pas la même taille
// 30/07/96 1.1.4 Pas de sélection de rectangles à coordonnées négatives !!!
//  1/11/96 1.2.0 Codage 8 bits ANSI
// 29/11/98 1.4.0 Gestion de l'attribut AT_POLICEOEM
// 29/11/99 1.4.3 OnEditCopyPaste (Copy+Paste simultané)
// 31/10/00 2.0.0 taille d'écran émulé paramétrée

#include "stdafx.h"
#include "VTerm.h"
#include "VTermSock.h"
#include "VTermDoc.h"
#include "VTermView.h"
#include "StatsWindow.h"

#include "VTermGlobal.h"
#include "resource.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

#define TEXTOUT_OPTIMISE

/////////////////////////////////////////////////////////////////////////////
// CVTermView

IMPLEMENT_DYNCREATE(CVTermView, CView)

BEGIN_MESSAGE_MAP(CVTermView, CView)
	ON_WM_CONTEXTMENU()
	//{{AFX_MSG_MAP(CVTermView)
	ON_WM_SIZE()
	ON_WM_CHAR()
	ON_WM_SETFOCUS()
	ON_WM_KILLFOCUS()
	ON_WM_KEYDOWN()
	ON_COMMAND(ID_STATS, OnStats)
	ON_WM_PAINT()
	ON_WM_SYSKEYDOWN()
	ON_COMMAND(ID_EDIT_COPY, OnEditCopy)
	ON_COMMAND(ID_EDIT_PASTE, OnEditPaste)
	ON_WM_LBUTTONDOWN()
	ON_WM_LBUTTONUP()
	ON_WM_MOUSEMOVE()
	ON_COMMAND(ID_EDIT_COPY_RECT, OnEditCopyRect)
	ON_WM_DESTROY()
	ON_COMMAND(ID_EDIT_COPY_PASTE, OnEditCopyPaste)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CVTermView construction/destruction

CVTermView::CVTermView()
{
  int i;
  int l,c;
  static int iCompteur;

  m_iNumeroVue = ++iCompteur;

  for (i=0 ; i<16 ; i++)
	m_tpFont[i] = NULL;

  m_szFont[0] = 0;
  m_bCaretActif = FALSE;
  m_bmpCaret = NULL;
  m_bSelectionDessinee = FALSE;

  m_iTOOCurrentFont = -1;
  m_cTOOCurrentCCar = 127;
  m_cTOOCurrentCFond = 127;

  // Initialisation des statistiques
  m_bBufferEnCours = FALSE;
  for (i=0 ; i<=132 ; i++)
	m_iBufferStats[i] = 0;
  m_iNbOnUpdate = 0;
  m_iNbOnUpdateCellule = 0;
  m_iNbInvalidateRect = 0;
  m_iNbOnDraw = 0;
  m_iNbDessineCellule = 0;
  m_iNbTextOut = 0;

#ifdef FTRACE
  m_stTrace.open("trace.TextOut direct.txt");
#endif

  m_bOUO = FALSE;
  for (l=0 ; l<43 ; l++)
	for (c=0 ; c<132 ; c++)
	  m_ActualScreen[l][c].attribut = 255;	  // Inexistant pour empêcher l'optimisation au tout début

  m_iSuiviUpdate = 0;

  // On détermine si l'affichage utilise une palette ou non
  CDC DC;
  DC.CreateCompatibleDC(NULL);
  bAvecPalette = DC.GetDeviceCaps(RASTERCAPS)&RC_PALETTE;
}

CVTermView::~CVTermView()
{
  // On libère les ressources allouées pour terminer proprement
  DetruitPolices();
  if (m_bmpCaret!=NULL)
	delete m_bmpCaret;

#ifdef FTRACE
  m_stTrace.close();
#endif
}

/////////////////////////////////////////////////////////////////////////////
// CVTermView drawing

void CVTermView::TOOFlush(CDC* pDC)
{
#ifdef TEXTOUT_OPTIMISE
  if (m_bBufferEnCours)
  {
	int tiWidth[132];
	for (int i=0 ; i<132 ; i++)
	  tiWidth[i] = m_cx;
	pDC->ExtTextOut(m_iBufferCol*m_cx, m_iBufferLig*m_cy, 0, NULL, m_sBuffer, m_iBufferLen, tiWidth);
	m_iNbTextOut++;
	m_bBufferEnCours = FALSE;
	m_iBufferStats[m_iBufferLen]++;
  }
#endif
}


// Dessin de la cellule de base, fonction élémentaire
void inline CVTermView::DessineCellule(CDC* pDC, Cellule cel, int iLig, int iCol)
{
  int	iNumFont;

  m_iNbDessineCellule++;
#ifdef FTRACE
//  m_stTrace << "DC " << l << "," << c << ": " << cel.caractere << "\n";
#endif

  if (iOptions & OPT_RENDUBRILLANT)
	if (cel.attribut & AT_BRILLANT)
	  cel.cCar |= 8;

  /*
  // Tentative de transposition encre brillante/fond normal en encre normale/fond brillant
  if (cel.cCar>=8 && cel.cFond<8)
  {
	cel.cCar &= ~8;
	cel.cFond |= 8;
  }
  */

  // C'est au moment de la mise à jour du terminal qu'il faut traiter l'attribut invisible,
  // pas au moment de l'affichage
  // Pas sûr: tester sous Unix si le dump de l'écran envoie au host les caractères invisibles
  if (cel.attribut & AT_INVISIBLE)
	cel.caractere = ' ';

  iNumFont = cel.attribut & 15;
  if (!(iOptions&OPT_ANSI)) iNumFont &= 7;	// On mode OEM, les polices 8..15 (avec bit OEM) sont identiques aux polices 0 à 7

  if (cel.cCar>=8 /*|| cel.cFond>=8*/) iNumFont |= AT_BRILLANT;
  if (!(iOptions & OPT_RENDUGRAS)) iNumFont &= ~AT_BRILLANT;

#ifdef TEXTOUT_OPTIMISE
  if (m_bBufferEnCours)
  {
	if (m_cBufferCCar==cel.cCar && m_cBufferCFond==cel.cFond && m_iBufferFont==iNumFont && iCol==m_iBufferCol+m_iBufferLen && iLig==m_iBufferLig)
	{
	  m_sBuffer[m_iBufferLen++] = cel.caractere;
	  if (!(cel==m_ActualScreen[iLig][iCol]))
	  {
		m_ActualScreen[iLig][iCol] = cel; // La mise à jour devrait être faite dans le Flush...
		m_iBufferLenDiff = m_iBufferLen;
	  }
	  return;
	}
    TOOFlush(pDC);
  }
#endif

  if (m_cTOOCurrentCCar!=cel.cCar)
	pDC->SetTextColor(tcolCouleurs[m_cTOOCurrentCCar = cel.cCar] | (bAvecPalette?0x02000000:0));
  if (m_cTOOCurrentCFond!=cel.cFond)
    pDC->SetBkColor(tcolCouleurs[m_cTOOCurrentCFond = cel.cFond] | (bAvecPalette?0x02000000:0));

  if (m_tpFont[iNumFont]==NULL)
  {
	CVTermDoc* pDoc = GetDocument();
	int iNbLig = pDoc->m_Term.m_iNbLignes;
	int iNbCol = pDoc->m_Term.m_iNbColonnes;

	m_tpFont[iNumFont] = new CFont;
	m_tpFont[iNumFont]->CreateFont(m_y/iNbLig, m_x/iNbCol, 0, 0,
	  (iNumFont&AT_BRILLANT)?FW_BOLD:FW_NORMAL, iNumFont&AT_CLIGNOTANT,
	  iNumFont&AT_SOULIGNE, 0, ((iOptions&OPT_ANSI) && iNumFont<8) ? ANSI_CHARSET : OEM_CHARSET,
	  OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS, DEFAULT_QUALITY, FIXED_PITCH, 
	  szFont);
  }

  if (m_iTOOCurrentFont!=iNumFont)
	pDC->SelectObject(m_tpFont[m_iTOOCurrentFont=iNumFont]);

#ifdef TEXTOUT_OPTIMISE
  m_bBufferEnCours = TRUE;
  m_cBufferCCar = cel.cCar;
  m_cBufferCFond = cel.cFond;
  m_iBufferFont = iNumFont;
  m_iBufferCol = iCol;
  m_iBufferLig = iLig;
  m_iBufferLen = 0;
  m_iBufferLenDiff = 0;
  m_sBuffer[m_iBufferLen++] = cel.caractere;
  if (!(cel==m_ActualScreen[iLig][iCol]))
  {
	m_ActualScreen[iLig][iCol] = cel;  // La mise à jour devrait être faite dans le Flush...
	m_iBufferLenDiff = m_iBufferLen;
  }
#else
  pDC->TextOut(c*m_cx, l*m_cy, (char *)&cel.caractere, 1);
  m_iNbTextOut = 0;
#endif
}


/////////////////////////////////////////////////////////////////////////////
// Dessin sur WM_PAINT


#ifdef FTRACE
// Assistance
ostream &operator <<(ostream &ofs, const LPRECT pr)
{
  ofs << "[" << pr->left << "," << pr->top << "]-[" << pr->right << "," << pr->bottom << "] = " 
	  << "(" << pr->top/g_cy << "," << pr->left/g_cx << ")-(" << (pr->bottom-1)/g_cy << "," << (pr->right-1)/g_cx << ") ";
  return ofs;
}
#endif


inline void CVTermView::OnDrawRect(CDC* pDC, RECT *pr, CVTermDoc* pDoc)
{
  int iLig, iCol;
  int iDLig, iFLig, iDCol, iFCol;
  int iNbLig = pDoc->m_Term.m_iNbLignes;
  int iNbCol = pDoc->m_Term.m_iNbColonnes;

  iDLig = pr->top/m_cy;
  iFLig = (pr->bottom-1)/m_cy;
  iDCol = pr->left/m_cx;
  iFCol = (pr->right-1)/m_cx;
  if (iFLig>=iNbLig) iFLig=iNbLig-1;
  if (iFCol>=iNbCol) iFCol=iNbCol-1;

  for (iLig=iDLig ; iLig<=iFLig ; iLig++)
	for (iCol=iDCol ; iCol<=iFCol ; iCol++)
  	  DessineCellule(pDC, pDoc->m_Term.m_celEcran[iLig][iCol], iLig, iCol);
  TOOFlush(pDC);
}

void CVTermView::OnDraw(CDC* pDC)
{
  CPalette* pOldCPal;

  m_iNbOnDraw++;

  if (bAvecPalette)
  {	
	if (pCPal==NULL)
	  GenerePalette(tcolCouleurs);
	pOldCPal = pDC->SelectPalette(pCPal, FALSE);
	pDC->RealizePalette();
  }

  CVTermDoc* pDoc = GetDocument();
  CRect rectClip;
  pDC->GetClipBox(&rectClip);	// Plus petit rectangle contenant la UpdateRegion
  char rgd[1000];
  LPRGNDATA lpr = (LPRGNDATA)&rgd;
  int i;

  if (m_hRgn)
    GetRegionData(m_hRgn, sizeof(rgd), lpr);

#ifdef FTRACE
  m_stTrace << "  " << lpr->rdh.nCount << " rect: ";
  m_stTrace << " Bound rect: ";
  m_stTrace << &CRect(lpr->rdh.rcBound);
  m_stTrace << " ";
  for (i=0 ; i<(int)(lpr->rdh.nCount) ; i++)
	m_stTrace << "rect " << i << ": " << (LPRECT)(&lpr->Buffer+i*sizeof(RECT)) << " ";
  m_stTrace << "\n";
#endif

  // On vient de récupérer un DC dont l'état courant n'est pas défini
  m_iTOOCurrentFont = -1;
  m_cTOOCurrentCCar = 127;	  // unsigned
  m_cTOOCurrentCFond = 127;

  if (m_hRgn==0 || lpr->rdh.nCount>4)
	OnDrawRect(pDC, &rectClip, pDoc);
  else
	for (i=0 ; i<(int)(lpr->rdh.nCount) ; i++)
	  OnDrawRect(pDC, (LPRECT)(&lpr->Buffer+i*sizeof(RECT)), pDoc);

  if (m_bCaretActif)
  {
    CVTermDoc* pDoc = GetDocument();
  	::SetCaretPos(m_cx*pDoc->m_Term.m_iColonne, m_cy*pDoc->m_Term.m_iLigne);
  }

  // Si nécessaire on restaure la palette d'origine
  if (bAvecPalette)
	pDC->SelectPalette(pOldCPal, FALSE);
}

// On principe pour les MFC il ne faut pas traiter l'événement Paint.
// Mais ça permet de récupérer la Update Region pour optimiser au maximum
// l'affichage. Depuis la fonction CView::OnDraw, l'appel a BeginPaint a été
// effectué, ce qui fait que la Update Region est vide...
void CVTermView::OnPaint() 
{
  int i;

  // Bizzare: il faut une région dans m_hRgn avant l'appel à GetUpdateRgn
  // dond on en crée une bidon, qu'on ne détruit pas...
  m_hRgn = CreateRectRgn(0,0,0,0);

  i = ::GetUpdateRgn(m_hWnd, m_hRgn, FALSE);
#ifdef FTRACE
  m_stTrace << "OnPaint: Region: ";
  switch(i)
  {
	case COMPLEXREGION: m_stTrace << "COMPLEXREGION: "; break;
	case ERROR:			m_stTrace << "ERROR"; break;
	case NULLREGION:	m_stTrace << "NULLREGION"; break;
	case SIMPLEREGION:  m_stTrace << "SIMPLEREGION: "; break;
  }
#endif
  if (i==ERROR || i==NULLREGION)
	m_hRgn = 0;

  // Equivalent de CView::OnPaint
  CPaintDC dc(this); // device context for painting
	
  OnPrepareDC(&dc);
  if (m_bSelectionDessinee)
	DessineSelection(&dc);
  OnDraw(&dc);
  if (m_bSelectionDessinee)
	DessineSelection(&dc);

  if (i!=ERROR && i!=NULLREGION)
	VERIFY(DeleteObject(m_hRgn));
}

/////////////////////////////////////////////////////////////////////////////
// CVTermView diagnostics

#ifdef _DEBUG
void CVTermView::AssertValid() const
{
	CView::AssertValid();
}

void CVTermView::Dump(CDumpContext& dc) const
{
	CView::Dump(dc);
}

CVTermDoc* CVTermView::GetDocument() // non-debug version is inline
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CVTermDoc)));
	return (CVTermDoc*)m_pDocument;
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CVTermView message handlers

void CVTermView::OnSize(UINT nType, int cx, int cy) 
{
  CView::OnSize(nType, cx, cy);

  CVTermDoc* pDoc = GetDocument();
  int iNbLig = pDoc->m_Term.m_iNbLignes;
  int iNbCol = pDoc->m_Term.m_iNbColonnes;

  if (cx && (cx/iNbCol!=m_x/iNbCol || cy/iNbLig!=m_y/iNbLig))
  {
//char szMsg[200];
//sprintf(szMsg, "%d != %d  ||  %d != %d", cx/iNbCol,m_x/iNbCol,cy/iNbLig,m_y/iNbLig);
//::MessageBox(NULL, szMsg, "VTerm", MB_OK);

	// On mémorise la taille de la fenêtre
	m_x = cx;
	m_y = cy;

	// On détruit les polices précédemment créées
	ChoisitPoliceDeBase();
  }
}


// Dessin de la vue requis, ou synchro/flush demandé
// Le hint précise ce qu'il faut dessiner
void CVTermView::OnUpdate(CView* pSender, LPARAM lHint, CObject* pHint) 
{
  CVTermDoc* pDoc = GetDocument();
  int	iLig, iCol;
  int	iNbLig = pDoc->m_Term.m_iNbLignes;
  int	iNbCol = pDoc->m_Term.m_iNbColonnes;
  BOOL	bResize = FALSE;

  m_iNbOnUpdate++;

  if (pHint!=NULL)
  {
	ASSERT(pHint->IsKindOf(RUNTIME_CLASS(CHint)));
	CHint *pH = (CHint *)pHint;

	if (pH->bResize)
	{ bResize = TRUE;
	  pHint = NULL;
	  goto suite;
	}

	if (pH->iCurseurDeplace==2)	  // Synchro de la position du curseur et flush
	{
	  if (m_bCaretActif)
		::SetCaretPos(m_cx*pDoc->m_Term.m_iColonne, m_cy*pDoc->m_Term.m_iLigne);
	  OUOFlush();
	  // La mise à jour 'physique' de la fenêtre se fera au WM_PAINT
	  return;
	}

	if (pH->bZoneAReafficher || pH->iScroll)
	{
	  if (pH->bZoneAReafficher)
	  {
		ASSERT(pH->iReaffDLigne>=0 && pH->iReaffDLigne<iNbLig);
		ASSERT(pH->iReaffDColonne>=0 && pH->iReaffDColonne<iNbCol);
		ASSERT(pH->iReaffFLigne>=0 && pH->iReaffFLigne<iNbLig);
		ASSERT(pH->iReaffFColonne>=0 && pH->iReaffFColonne<iNbCol);
	  }

	  if (pH->bZoneAReafficher)
	  {
		if (pH->iReaffDLigne==pH->iReaffFLigne)
		{
		  // Si le bloc à réafficher ne fait qu'une ligne on utilise l'optimisation ODU
		  // c'est à dire accumulation de OnDraw et un seul InvalidateRect
		  for (iLig=pH->iReaffDLigne ; iLig<=pH->iReaffFLigne ; iLig++)
			for (iCol=pH->iReaffDColonne ; iCol<=pH->iReaffFColonne ; iCol++)
			  OnUpdateCellule(iLig, iCol);
		}
		else
		{
		  // Grand rectangle à afficher
		  OUOFlush();	// On vide le buffer éventuel
		  CRect rectAReafficher(pH->iReaffDColonne*m_cx, pH->iReaffDLigne*m_cy, (pH->iReaffFColonne+1)*m_cx, (pH->iReaffFLigne+1)*m_cy);
		  InvalidateRect(&rectAReafficher, FALSE);
		  m_iNbInvalidateRect++;
#ifdef FTRACE
		  m_stTrace << "OU: IR (" << pH->iReaffDLigne << "," << pH->iReaffDColonne << ")-(" << pH->iReaffFLigne << "," << pH->iReaffFColonne << ")\n";
#endif

		  // On met à jour l'écran sinon le scroll n'est jamais affiché
		  // Astuce pour faire un refresh une ligne sur deux lors du scroll...
		  static int iPass = 0;
		  if (iPass=1-iPass)
			UpdateWindow();		
		}
	  }
	}
  }

suite:
  if (pHint==NULL)		// pHint==NULL: tout à réafficher
  {
	if (bResize)
	  ChoisitPoliceDeBase();
	else
	{
	  if (szFont[strlen(szFont)-1]=='+')	// Passage ANSI <-> OEM
	  {
		szFont[strlen(szFont)-1] = 0;
		m_szFont[0] = 0;  // Force l'entrée dans le bloc suivant
	  }

	  if (strcmp(szFont, (char *)m_szFont))
	  {
		ChoisitPoliceDeBase();
		strcpy((char *)m_szFont, szFont);
	  }
	}
	
	// On invalide tout l'écran avec effacement puisque c'est peut-être consécutif à un changement de police
	OUOFlush();	// On vide le buffer éventuel
	Invalidate(TRUE);
  }
}


void CVTermView::OnUpdateCellule(int iLig, int iCol)
{
  m_iNbOnUpdateCellule++;

  if (m_bOUO)
  {
	if (iLig==m_iOUOLig && iCol==m_iOUOCol+m_iOUOLen /*iCol>=m_iOUOCol-5 && iCol<=m_iOUOCol+m_iOUOLen+1*/)
	{
	  m_iOUOLen++;
	  return;
	}
	OUOFlush();
  }

  m_bOUO = TRUE;
  m_iOUOLig = iLig;
  m_iOUOCol = iCol;
  m_iOUOLen = 1;
}


void CVTermView::OUOFlush()
{
  // On force la mise à jour de l'affichage tous les changement de ligne du curseur
  // de façon à ce que la zone invalide ne dépasse pas une ligne de haut, ce qui
  // évite d'englober une portion trop importante
  int iFreqReaffich = m_bCaretActif ? 1 : 5;

  if (m_bOUO)
  {
	if (m_iLastLine!=m_iOUOLig)
	{
	  m_iLastLine = m_iOUOLig;
#ifdef FTRACE
	  m_stTrace << "OU: UW\n";
#endif
	  if ((m_iSuiviUpdate=(m_iSuiviUpdate+1)%iFreqReaffich)==0)
		UpdateWindow();		// On met à jour l'écran
	}

	CRect rectAReafficher(m_iOUOCol*m_cx, m_iOUOLig*m_cy, (m_iOUOCol+m_iOUOLen)*m_cx, (m_iOUOLig+1)*m_cy);
	InvalidateRect(&rectAReafficher, FALSE);
#ifdef FTRACE
	m_stTrace << "OUC: IR (" << m_iOUOLig << "," << m_iOUOCol << ")-(" << m_iOUOLig << "," << m_iOUOCol+m_iOUOLen-1 << ")\n";
#endif
	m_iNbInvalidateRect++;
	m_bOUO = FALSE;
  }
}

/////////////////////////////////////////////////////////////////////////////

void CVTermView::DetruitPolices()
{
  int i;

  for (i=0 ; i<16 ; i++)
	if (m_tpFont[i]!=NULL)
    {
	  delete m_tpFont[i];
	  m_tpFont[i] = NULL;
    }
  m_iTOOCurrentFont = -1;
}


// Suite à un redimensionnement de la fenêtre ou un changement de taille,
// choisit la plus grande police qui aille verticalement
void CVTermView::ChoisitPoliceDeBase()
{
  CVTermDoc* pDoc = GetDocument();
  TEXTMETRIC tm;
  CDC *pDC;
  CFont *pOldFont;

  // Optimisation: si la nouvelle taille correspond à la précédente, on ne fait rien !


  DetruitPolices();
  m_tpFont[0] = new CFont;

  if (m_bCaretActif)
	DestroyCaret();

  pDC = GetDC();

  int iNbLig = pDoc->m_Term.m_iNbLignes;
  int iNbCol = pDoc->m_Term.m_iNbColonnes;

  // On récupère les caractéristiques de la plus grande police qui aille verticalement dans cette fenêtre
  m_tpFont[0]->CreateFont(m_y/iNbLig, m_x/iNbCol, 0, 0,
	FW_NORMAL, 0, 0, 0, (iOptions&OPT_ANSI) ? ANSI_CHARSET : OEM_CHARSET,
	OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS, DEFAULT_QUALITY, FIXED_PITCH, 
	szFont);

  pOldFont = pDC->SelectObject(m_tpFont[0]);
  pDC->GetTextMetrics(&tm);
  m_cx = tm.tmAveCharWidth;
  m_cy = tm.tmHeight;
  m_iTOOCurrentFont = -1;
  pDC->SelectObject(pOldFont);

  GenereCaret(pDC);

  ReleaseDC(pDC);

  // On déplace le caret si nécessaire
  // On doit le détruire et le recréer puisque sa taille change
  if (m_bCaretActif)
  {
	if (m_bmpCaret==NULL)
	  ::CreateCaret(m_hWnd, NULL, m_cx, m_cy);
	else
	  CreateCaret(m_bmpCaret);
	::SetCaretPos(m_cx*pDoc->m_Term.m_iColonne, m_cy*pDoc->m_Term.m_iLigne);
    ShowCaret();
  }
}

// On génère un curseur approprié
// Empiriquement, c'est une brosse RGB(0,0,255) qui donne le meilleur
// contraste sur les écrans à palette 256 couleurs.
// En mode sans palette, on utilise le curseur inversé normal.
void CVTermView::GenereCaret(CDC *pDC)
{
  if (bAvecPalette)
  {
	CDC MemDC;
	MemDC.CreateCompatibleDC(NULL);

	if (m_bmpCaret!=NULL)
	  delete m_bmpCaret;
	m_bmpCaret = new CBitmap;
	m_bmpCaret->CreateCompatibleBitmap(pDC, m_cx, m_cy);
	CBitmap *pOldBitmap = MemDC.SelectObject(m_bmpCaret);

	CBrush Brush(RGB(0,0,255));
	CBrush *pOldBrush = (CBrush *)MemDC.SelectObject(&Brush);
	MemDC.PatBlt(0, 0, m_cx, m_cy, PATCOPY);

	MemDC.SelectObject(pOldBitmap);
	MemDC.SelectObject(pOldBrush);
  }
} 


/////////////////////////////////////////////////////////////////////////////////////////
// Traitement du focus
// On assure création/destruction du caret

void CVTermView::OnSetFocus(CWnd* pOldWnd) 
{
	CVTermDoc* pDoc = GetDocument();

	CView::OnSetFocus(pOldWnd);

	// On fait appel aux fonctions du SDK
	// Je n'ai pas trouvé comment créer un caret qui ne fasse pas appel à une bitmap dans les MFC...
	if (m_bmpCaret==NULL)
	  ::CreateCaret(m_hWnd, NULL, m_cx, m_cy);
	else
	  CreateCaret(m_bmpCaret);
    ::SetCaretPos(m_cx*pDoc->m_Term.m_iColonne, m_cy*pDoc->m_Term.m_iLigne);
    ::ShowCaret(m_hWnd);
	m_bCaretActif = TRUE;
}

void CVTermView::OnKillFocus(CWnd* pNewWnd) 
{
	CView::OnKillFocus(pNewWnd);
	
	DestroyCaret();
	m_bCaretActif = FALSE;
}


/////////////////////////////////////////////////////////////////////////////////////////
// Traitement des événements clavier
// On fait décoder par la classe Terminal (fonctions szDecodeClavierChar et szDecodeClavierKeyDown)
// et si nécéssaire on appelle EnvoieCaractère de la classe document pour transmission
// au host

void CVTermView::OnChar(UINT nChar, UINT nRepCnt, UINT nFlags) 
{
  char *s;
  CVTermDoc* pDoc = GetDocument();

  if ((nFlags&0x3fff)==83 && (iOptions & OPT_POINTPN)==0)	// Transposition du . du pavé numérique
	s = ",";
  else
	s = pDoc->m_Term.szDecodeClavierChar(nChar);

  if (s!=NULL)
	while (nRepCnt--)
	  pDoc->EnvoieChaineHost(s, strlen(s));
//{
//char z[20];
//sprintf(z, "(%d) ", nFlags);
//pDoc->EnvoieChaineHost(z, strlen(z));
//}
  CView::OnChar(nChar, nRepCnt, nFlags);
}

void CVTermView::OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags) 
{
  char *s;
  CVTermDoc* pDoc = GetDocument();
  UINT nShift = (GetKeyState(VK_SHIFT)<0   ? 1 : 0) +
                (GetKeyState(VK_CONTROL)<0 ? 2 : 0) +
                (GetKeyState(VK_MENU)<0    ? 4 : 0) ;

/*
char szMsg[200];
sprintf(szMsg, "CVTermView::OnKeyDown()\nnChar: %d\nnShift: %d", nChar, nShift);
::MessageBox(NULL, szMsg, "VTerm", MB_OK);
*/
  s = pDoc->m_Term.szDecodeClavierKeyDown(nChar, nShift);
  if (s!=NULL)
	while (nRepCnt--)
	  pDoc->EnvoieChaineHost(s, strlen(s));
  CView::OnKeyDown(nChar, nRepCnt, nFlags);
}

void CVTermView::OnSysKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags) 
{
//  ::MessageBox(NULL, "CVTermView::OnSysKeyDown()", "VTerm", MB_OK);
  if (nChar==VK_F10)
  {
	char *s;
	CVTermDoc* pDoc = GetDocument();
	UINT nShift = (GetKeyState(VK_SHIFT)<0   ? 1 : 0) +
				  (GetKeyState(VK_CONTROL)<0 ? 2 : 0) +
				  (GetKeyState(VK_MENU)<0    ? 4 : 0) ;
	s = pDoc->m_Term.szDecodeClavierKeyDown(nChar, nShift);
	if (s!=NULL)
	  while (nRepCnt--)
		pDoc->EnvoieChaineHost(s, strlen(s));
  }
  else
	CView::OnSysKeyDown(nChar, nRepCnt, nFlags);
}



/////////////////////////////////////////////////////////////////////////////////////////

void CVTermView::OnStats() 
{
  CStatsWindow wStat(this);
  wStat.DoModal();
}


/////////////////////////////////////////////////////////////////////////////////////////
// Presse-papiers

// On copie sans les espaces en fin de ligne

void CVTermView::EditCopy(BOOLEAN bCopieRectangle)
{
  CVTermDoc* pDoc = GetDocument();
  HGLOBAL hMem;
  char *pMem;
  int lig, col, pos;
  int iNbLig = pDoc->m_Term.m_iNbLignes;
  int iNbCol = pDoc->m_Term.m_iNbColonnes;

  if (!m_bSelectionDessinee)
  {
	m_iSSLig = 0;
	m_iSSCol = 0;
	m_iSELig = iNbLig-1;
	m_iSECol = iNbCol-1;
  }

  hMem = GlobalAlloc(GMEM_MOVEABLE|GMEM_DDESHARE, (m_iSELig-m_iSSLig+1)*(m_iSECol-m_iSSCol+3)+1);
  pMem = (char *)GlobalLock(hMem);

  OpenClipboard();
  EmptyClipboard();

  pos = 0;
  for (lig=m_iSSLig ; lig<=m_iSELig ; lig++)
  {
	int iColMax = m_iSECol;

	if (!bCopieRectangle)
	  while (iColMax>=m_iSSCol && iColMax>=0)
		if (pDoc->m_Term.m_celEcran[lig][iColMax].caractere==' ')
		  iColMax--;
		else
		  break;

	for (col=m_iSSCol ; col<=iColMax ; col++)
	  pMem[pos++] = pDoc->m_Term.m_celEcran[lig][col].caractere;
	// On n'ajoute pas \r\n pour les sélections d'une seule ligne
	if (m_iSSLig!=m_iSELig)
	{
	  pMem[pos++] = '\r';
	  pMem[pos++] = '\n';
	}
  }
  pMem[pos++] = '\0';
  GlobalUnlock(hMem);

  SetClipboardData((iOptions&OPT_ANSI) ? CF_TEXT : CF_OEMTEXT, hMem);
  CloseClipboard();

  if (m_bSelectionDessinee)
  {
	m_bSelectionDessinee = FALSE;
	DessineSelection(NULL);
  }
}


// On copie sans les espaces en fin de ligne
void CVTermView::OnEditCopy() 
{
  EditCopy(FALSE);
}

// On copie un rectangle avec les espaces en fin de ligne
void CVTermView::OnEditCopyRect() 
{
  EditCopy(TRUE);
}

void CVTermView::OnEditCopyPaste() 
{
  EditCopy(FALSE);
  OnEditPaste();
}



void CVTermView::OnEditPaste() 
{
  CVTermDoc* pDoc = GetDocument();
  HGLOBAL hMem;
  char *pMem;

  OpenClipboard();
  hMem = GetClipboardData((iOptions&OPT_ANSI) ? CF_TEXT : CF_OEMTEXT);
  if (hMem==NULL)
  {
	char szMsg[200];

	sprintf(szMsg, "Echec au GetClipboardData(CF_TEXT/CF_OEMTEXT)\nErr=%d", GetLastError());
	::MessageBox(NULL, szMsg, "VTerm", MB_OK);
	return;
  }
  pMem = (char *)GlobalLock(hMem);
  
  // On envoie au host
  pDoc->EnvoieChaineHost(pMem, strlen(pMem));

  GlobalUnlock(hMem);
  CloseClipboard();
}

//=====================================================================================
// Sélection

// Inverse le rectangle entourant la sélection
void CVTermView::DessineSelection(CDC* pDC)
{
  int iSSCol, iSSLig, iSECol, iSELig;
  CDC *pDCLocal;
  
  if (m_iSSLig>m_iSELig)
  {	iSSLig = m_iSELig; iSELig = m_iSSLig; }
  else
  {	iSSLig = m_iSSLig; iSELig = m_iSELig; }
  if (m_iSSCol>m_iSECol)
  {	iSSCol = m_iSECol; iSECol = m_iSSCol; }
  else
  {	iSSCol = m_iSSCol; iSECol = m_iSECol; }

  CRect Rect(iSSCol*m_cx, iSSLig*m_cy, (iSECol+1)*m_cx, (iSELig+1)*m_cy);
  if (pDC==NULL)
	pDCLocal = GetDC();
  else
	pDCLocal = pDC;

  int iOldROP2 = pDCLocal->SetROP2(R2_NOT);
  pDCLocal->SelectObject(GetStockObject(NULL_BRUSH));
  pDCLocal->Rectangle(&Rect);

  if (pDC==NULL)
	ReleaseDC(pDCLocal);
  else
	pDCLocal->SetROP2(iOldROP2);
}


void CVTermView::OnLButtonDown(UINT nFlags, CPoint point) 
{
  CVTermDoc* pDoc = GetDocument();
  int iNbLig = pDoc->m_Term.m_iNbLignes;
  int iNbCol = pDoc->m_Term.m_iNbColonnes;

  if (m_bSelectionDessinee)
    DessineSelection(NULL);

  bModeSelection = TRUE;
  m_iSSLig = m_iSELig = point.y/m_cy;
  m_iSSCol = m_iSECol = point.x/m_cx;
  if (m_iSSLig>=iNbLig) m_iSSLig = m_iSELig = iNbLig-1;
  if (m_iSSCol>=iNbCol) m_iSSCol = m_iSECol = iNbCol-1;

  m_bSelectionDessinee = TRUE;
  DessineSelection(NULL);
  SetCapture();

  CView::OnLButtonDown(nFlags, point);
}

void CVTermView::OnMouseMove(UINT nFlags, CPoint point) 
{
  CVTermDoc* pDoc = GetDocument();
  int iNbLig = pDoc->m_Term.m_iNbLignes;
  int iNbCol = pDoc->m_Term.m_iNbColonnes;

  if (bModeSelection)
  {
	int iSELig2, iSECol2;
	iSELig2 = point.y/m_cy;
	iSECol2 = point.x/m_cx;
	if (iSELig2>=iNbLig) iSELig2 = iNbLig-1;
	if (iSECol2>=iNbCol) iSECol2 = iNbCol-1;
	if (iSELig2<0) iSELig2 = 0;
	if (iSECol2<0) iSECol2 = 0;
	if (iSELig2!=m_iSELig || iSECol2!=m_iSECol)
	{
	  DessineSelection(NULL);
	  m_iSELig = iSELig2;
	  m_iSECol = iSECol2;
	  DessineSelection(NULL);
	}
  }
  
  CView::OnMouseMove(nFlags, point);
}

#define swap(x,y) { int tmp=x; x=y; y=tmp; }

void CVTermView::OnLButtonUp(UINT nFlags, CPoint point) 
{
  if (bModeSelection)
  {

	CVTermDoc* pDoc = GetDocument();
	int iNbLig = pDoc->m_Term.m_iNbLignes;
	int iNbCol = pDoc->m_Term.m_iNbColonnes;

	bModeSelection = FALSE;
	ReleaseCapture();

	// On normalise la sélection
	if (m_iSSLig>m_iSELig) swap(m_iSSLig,m_iSELig);
	if (m_iSSCol>m_iSECol) swap(m_iSSCol,m_iSECol);

	// Tout l'écran de sélectionné ou 1 seul caractère = Annule la sélection
	if ((m_iSSLig==0 && m_iSSCol==0 && m_iSELig==iNbLig-1 && m_iSECol==iNbCol-1) || (m_iSSLig==m_iSELig && m_iSSCol==m_iSECol))
	{
	  m_bSelectionDessinee = FALSE;
	  DessineSelection(NULL);
	}
  }  
  CView::OnLButtonUp(nFlags, point);
}


void CVTermView::OnContextMenu(CWnd*, CPoint point)
{
	// CG: This function was added by the Pop-up Menu component

	CMenu menu;
	VERIFY(menu.LoadMenu(CG_IDR_POPUP_VTERM_VIEW));

	CMenu* pPopup = menu.GetSubMenu(0);
	ASSERT(pPopup != NULL);

	CWnd* pWndPopupOwner = this;
	while (pWndPopupOwner->GetStyle() & WS_CHILD)
		pWndPopupOwner = pWndPopupOwner->GetParent();

	pPopup->TrackPopupMenu(TPM_LEFTALIGN | TPM_RIGHTBUTTON, point.x, point.y,
		pWndPopupOwner);
}


BOOL CVTermView::PreTranslateMessage(MSG* pMsg)
{
	// CG: This block was added by the Pop-up Menu component
	{
		// Shift+F10: show pop-up menu.
		if ((((pMsg->message == WM_KEYDOWN || pMsg->message == WM_SYSKEYDOWN) && // If we hit a key and
			(pMsg->wParam == VK_F10) && (GetKeyState(VK_SHIFT) & ~1)) != 0) ||	// it's Shift+F10 OR
			(pMsg->message == WM_CONTEXTMENU))									// Natural keyboard key
		{
			CRect rect;
			GetClientRect(rect);
			ClientToScreen(rect);

			CPoint point = rect.TopLeft();
			point.Offset(5, 5);
			OnContextMenu(NULL, point);

			return TRUE;
		}
	}

	return CView::PreTranslateMessage(pMsg);
}

