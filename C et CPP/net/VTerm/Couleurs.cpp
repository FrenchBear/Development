// Couleurs.cpp : implementation file
//

#include "stdafx.h"
#include "VTerm.h"
#include "Couleurs.h"
#include "VTermGlobal.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif


static COLORREF tcolCouleursDialog[16];
static CColorButton *tbc[16];


CColorButton::CColorButton()
{
  m_Color = 0;
}


void CColorButton::SetColor(COLORREF color)
{
  m_Color = color;
}

void CColorButton::DrawItem(LPDRAWITEMSTRUCT lpDIS)
{
  CDC* pDC = CDC::FromHandle(lpDIS->hDC);
  COLORREF cr = (bAvecPalette?0x02000000:0) | m_Color;
  CPalette* pOldCPal;

  if (bAvecPalette)
  {
	pOldCPal = pDC->SelectPalette(pCPal, FALSE);
	pDC->RealizePalette();
  }

  if (lpDIS->itemAction & ODA_DRAWENTIRE)
  {
	  // Paint the color item in the color requested
	  CBrush br(cr);
	  pDC->FillRect(&lpDIS->rcItem, &br);
  }

  if ((lpDIS->itemState & ODS_SELECTED) &&
	  (lpDIS->itemAction & (ODA_SELECT | ODA_DRAWENTIRE)))
  {
	  // item has been selected - hilite frame
	  COLORREF crHilite = RGB(255-GetRValue(cr),
					  255-GetGValue(cr), 255-GetBValue(cr));
	  CBrush br(crHilite);
	  pDC->FrameRect(&lpDIS->rcItem, &br);
  }

  if (!(lpDIS->itemState & ODS_SELECTED) &&
	  (lpDIS->itemAction & ODA_SELECT))
  {
	  // Item has been de-selected -- remove frame
	  CBrush br(cr);
	  pDC->FrameRect(&lpDIS->rcItem, &br);
  }

  if (bAvecPalette)
    pDC->SelectPalette(pOldCPal, FALSE);
}


/////////////////////////////////////////////////////////////////////////////
// CCouleurs dialog

CCouleurs::CCouleurs(CWnd* pParent /*=NULL*/)
	: CDialog(CCouleurs::IDD, pParent)
{
	//{{AFX_DATA_INIT(CCouleurs)
	//}}AFX_DATA_INIT
}


void CCouleurs::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CCouleurs)
	DDX_Control(pDX, IDC_BCBLEU, m_bcBleu);
	DDX_Control(pDX, IDC_BCNOIR, m_bcNoir);
	DDX_Control(pDX, IDC_BCVERT, m_bcVert);
	DDX_Control(pDX, IDC_BCCYAN, m_bcCyan);
	DDX_Control(pDX, IDC_BCROUGE, m_bcRouge);
	DDX_Control(pDX, IDC_BCMAGENTA, m_bcMagenta);
	DDX_Control(pDX, IDC_BCJAUNE, m_bcJaune);
	DDX_Control(pDX, IDC_BCBLANC, m_bcBlanc);
	DDX_Control(pDX, IDC_BCNOIR_BRILLANT, m_bcNoirBrillant);
	DDX_Control(pDX, IDC_BCBLEU_BRILLANT, m_bcBleuBrillant);
	DDX_Control(pDX, IDC_BCVERT_BRILLANT, m_bcVertBrillant);
	DDX_Control(pDX, IDC_BCCYAN_BRILLANT, m_bcCyanBrillant);
	DDX_Control(pDX, IDC_BCROUGE_BRILLANT, m_bcRougeBrillant);
	DDX_Control(pDX, IDC_BCMAGENTA_BRILLANT, m_bcMagentaBrillant);
	DDX_Control(pDX, IDC_BCJAUNE_BRILLANT, m_bcJauneBrillant);
	DDX_Control(pDX, IDC_BCBLANC_BRILLANT, m_bcBlancBrillant);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CCouleurs, CDialog)
	//{{AFX_MSG_MAP(CCouleurs)
	ON_BN_CLICKED(IDC_RESTAURER, OnRestaurer)
	ON_BN_CLICKED(IDC_BCBLANC, OnBCBlanc)
	ON_BN_CLICKED(IDC_BCBLANC_BRILLANT, OnBCBlancBrillant)
	ON_BN_CLICKED(IDC_BCBLEU, OnBCBleu)
	ON_BN_CLICKED(IDC_BCBLEU_BRILLANT, OnBCBleuBrillant)
	ON_BN_CLICKED(IDC_BCCYAN, OnBCCyan)
	ON_BN_CLICKED(IDC_BCCYAN_BRILLANT, OnBCCyanBrillant)
	ON_BN_CLICKED(IDC_BCJAUNE, OnBCJaune)
	ON_BN_CLICKED(IDC_BCJAUNE_BRILLANT, OnBCJauneBrillant)
	ON_BN_CLICKED(IDC_BCMAGENTA, OnBCMagenta)
	ON_BN_CLICKED(IDC_BCMAGENTA_BRILLANT, OnBCMagentaBrillant)
	ON_BN_CLICKED(IDC_BCNOIR, OnBCNoir)
	ON_BN_CLICKED(IDC_BCNOIR_BRILLANT, OnBCNoirBrillant)
	ON_BN_CLICKED(IDC_BCROUGE, OnBCRouge)
	ON_BN_CLICKED(IDC_BCROUGE_BRILLANT, OnBCRougeBrillant)
	ON_BN_CLICKED(IDC_BCVERT, OnBCVert)
	ON_BN_CLICKED(IDC_BCVERT_BRILLANT, OnBCVertBrillant)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CCouleurs message handlers

BOOL CCouleurs::OnInitDialog() 
{
  int i;

  CDialog::OnInitDialog();

  tbc[0] = &m_bcNoir;
  tbc[0+8] = &m_bcNoirBrillant;
  tbc[1] = &m_bcBleu;
  tbc[1+8] = &m_bcBleuBrillant;
  tbc[2] = &m_bcVert;
  tbc[2+8] = &m_bcVertBrillant;
  tbc[3] = &m_bcCyan;
  tbc[3+8] = &m_bcCyanBrillant;
  tbc[4] = &m_bcRouge;
  tbc[4+8] = &m_bcRougeBrillant;
  tbc[5] = &m_bcMagenta;
  tbc[5+8] = &m_bcMagentaBrillant;
  tbc[6] = &m_bcJaune;
  tbc[6+8] = &m_bcJauneBrillant;
  tbc[7] = &m_bcBlanc;
  tbc[7+8] = &m_bcBlancBrillant;

  for (i=0 ; i<16 ; i++)
	tbc[i]->SetColor(tcolCouleursDialog[i] = tcolCouleurs[i]);

  return TRUE;
}

void CCouleurs::OnOK() 
{
  int i;

  for (i=0 ; i<16 ; i++)
	if (tcolCouleursDialog[i] != tcolCouleurs[i])
	{
	  tcolCouleurs[i] = tcolCouleursDialog[i];
	  bCouleursModifiees = TRUE;
	}
	
  if (bAvecPalette)
	GenerePalette(tcolCouleurs);
  CDialog::OnOK();
}

void CCouleurs::OnCancel() 
{
  if (bAvecPalette)
	GenerePalette(tcolCouleurs);

  CDialog::OnCancel();
}


void CCouleurs::OnRestaurer() 
{
  int i;

  for (i=0 ; i<16 ; i++)
	tbc[i]->SetColor(tcolCouleursDialog[i] = tcolCouleursDefaut[i]);
  if (bAvecPalette)
	GenerePalette(tcolCouleursDialog);

  // Rafraîchir les boutons
  Invalidate(FALSE);
}

void ChangeCouleur(int iIndiceCouleur)
{
  CColorDialog dlg(tcolCouleursDialog[iIndiceCouleur], CC_FULLOPEN);
  if (dlg.DoModal() == IDOK)
  {
	tbc[iIndiceCouleur]->SetColor(tcolCouleursDialog[iIndiceCouleur] = dlg.GetColor());
    if (bAvecPalette)
	  GenerePalette(tcolCouleursDialog);
  }
}

void CCouleurs::OnBCNoir()				{ ChangeCouleur(0); }
void CCouleurs::OnBCNoirBrillant()		{ ChangeCouleur(0+8); }
void CCouleurs::OnBCBleu()				{ ChangeCouleur(1); }
void CCouleurs::OnBCBleuBrillant()		{ ChangeCouleur(1+8); }
void CCouleurs::OnBCVert()				{ ChangeCouleur(2); }
void CCouleurs::OnBCVertBrillant()		{ ChangeCouleur(2+8); }
void CCouleurs::OnBCCyan()				{ ChangeCouleur(3); }
void CCouleurs::OnBCCyanBrillant()		{ ChangeCouleur(3+8); }
void CCouleurs::OnBCRouge()				{ ChangeCouleur(4); }
void CCouleurs::OnBCRougeBrillant()		{ ChangeCouleur(4+8); }
void CCouleurs::OnBCMagenta()			{ ChangeCouleur(5); }
void CCouleurs::OnBCMagentaBrillant()	{ ChangeCouleur(5+8); }
void CCouleurs::OnBCJaune()				{ ChangeCouleur(6); }
void CCouleurs::OnBCJauneBrillant()		{ ChangeCouleur(6+8); }
void CCouleurs::OnBCBlanc()				{ ChangeCouleur(7); }
void CCouleurs::OnBCBlancBrillant()		{ ChangeCouleur(7+8); }

