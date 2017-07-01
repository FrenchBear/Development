// sgbdset.h : interface of the CSgbdSet class
//
/////////////////////////////////////////////////////////////////////////////

class CSgbdSet : public CRecordset
{
DECLARE_DYNAMIC(CSgbdSet)

public:
	CSgbdSet(CDatabase* pDatabase = NULL);

// Field/Param Data
	//{{AFX_FIELD(CSgbdSet, CRecordset)
	long	m_No;
	CString	m_Nom;
	CString	m_Prenom;
	CString	m_Adresse_1;
	CString	m_Adresse_2;
	CString	m_Adresse_3;
	CString	m_Code_Pays;
	CString	m_Telephone;
	BYTE	m_Nb_reponses;
	BOOL	m_A_repondre;
	CString	m_Attributs;
	CString	m_Commentaire;
	CString	m_Profession;
	CString	m_Nom_document;
	//}}AFX_FIELD

// Implementation
protected:
	virtual CString GetDefaultConnect();	// Default connection string
	virtual CString GetDefaultSQL(); 	// default SQL for Recordset
	virtual void DoFieldExchange(CFieldExchange* pFX);	// RFX support
};
