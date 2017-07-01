// ConnexionRecente.h
// Classe de gestion d'une liste de connexions r�centes
// 20/06/96 PV
// 29/07/96	PV	M�thode Clear()
// 31/10/00 PV	MAXRECENT � 9


#define MAXRECENT 9

class ConnexionRecente
{
private:
  int m_iNbRecent;
  CString m_tsRecent[MAXRECENT];
  CString m_strOriginal;

public:
  ConnexionRecente();
  void AddRecent(CString sHost);
  int Count();
  CString sGetRecent(int iRang);
  void UpdateMenu(CCmdUI *pCmdUI);
  void Clear();						// Efface la liste
};

