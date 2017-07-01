// ConnexionRecente.cpp
// Gestion d'une liste de connexions récentes
// 20/06/96 PV
// 26/06/96	Comparaison indifférente maj/min pour l'historique
// 30/10/00 Retourne le nom de la connexion récente/mise à jour des menus en minuscules


#include "stdafx.h"
#include "VTerm.h"


ConnexionRecente::ConnexionRecente()
{
  m_iNbRecent = 0;
  m_strOriginal = "Connexions récentes";
}


void ConnexionRecente::AddRecent(CString sHost)
{
  int i;
  BOOL bNouveau = FALSE;

  for (i=0 ; i<MAXRECENT && i<m_iNbRecent ; i++)
	if (m_tsRecent[i].CompareNoCase(sHost)==0)
	  break;
  if (i==m_iNbRecent)
	bNouveau = TRUE;

  while (i>0)
  {
  	if (i<MAXRECENT)
	  m_tsRecent[i] = m_tsRecent[i-1];
	i--;
  }
  m_tsRecent[0] = sHost;
  m_tsRecent[0].MakeLower();
  if (bNouveau && m_iNbRecent<MAXRECENT)
	m_iNbRecent++;
}


int ConnexionRecente::Count()
{
  return m_iNbRecent;
}


CString ConnexionRecente::sGetRecent(int iRang)
{
  ASSERT(iRang>=0 && iRang<m_iNbRecent);
  return m_tsRecent[iRang];
}


void ConnexionRecente::UpdateMenu(CCmdUI* pCmdUI)
{
  if (pCmdUI->m_pMenu == NULL)
    return;
  CMenu* pMenu = pCmdUI->m_pMenu;

  if (m_tsRecent[0].IsEmpty())
  {
	// no MRU files
	pCmdUI->SetText(m_strOriginal);
	pCmdUI->Enable(FALSE);

	for (int iMRU = 1; iMRU < MAXRECENT; iMRU++)
		pCmdUI->m_pMenu->DeleteMenu(pCmdUI->m_nID + iMRU, MF_BYCOMMAND);

	return;
  }

  for (int iMRU = 0; iMRU < MAXRECENT; iMRU++)
	  pCmdUI->m_pMenu->DeleteMenu(pCmdUI->m_nID + iMRU, MF_BYCOMMAND);

  for (iMRU = 0; iMRU < MAXRECENT; iMRU++)
  {
	if (!m_tsRecent[iMRU].IsEmpty())
	  pCmdUI->m_pMenu->InsertMenu(pCmdUI->m_nIndex++,
		  MF_STRING | MF_BYPOSITION, pCmdUI->m_nID++, m_tsRecent[iMRU]);
  }

  // update end menu count
  pCmdUI->m_nIndex--; // point to last menu added
  pCmdUI->m_nIndexMax = pCmdUI->m_pMenu->GetMenuItemCount();

  pCmdUI->m_bEnableChanged = TRUE;    // all the added items are enabled
}

void ConnexionRecente::Clear()
{
  int i;

  for (i=0 ; i<m_iNbRecent ; i++)
	m_tsRecent[0].Empty();
  m_iNbRecent = 0;
}
