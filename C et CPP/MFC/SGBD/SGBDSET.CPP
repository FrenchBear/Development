// sgbdset.cpp : implementation of the CSgbdSet class
//

#include "stdafx.h"
#include "sgbd.h"
#include "sgbdset.h"

/////////////////////////////////////////////////////////////////////////////
// CSgbdSet implementation

IMPLEMENT_DYNAMIC(CSgbdSet, CRecordset)

CSgbdSet::CSgbdSet(CDatabase* pdb)
	: CRecordset(pdb)
{
	//{{AFX_FIELD_INIT(CSgbdSet)
	m_No = 0;
	m_Nom = "";
	m_Prenom = "";
	m_Adresse_1 = "";
	m_Adresse_2 = "";
	m_Adresse_3 = "";
	m_Code_Pays = "";
	m_Telephone = "";
	m_Nb_reponses = 0;
	m_A_repondre = FALSE;
	m_Attributs = "";
	m_Commentaire = "";
	m_Profession = "";
	m_Nom_document = "";
	m_nFields = 14;
	//}}AFX_FIELD_INIT
}

CString CSgbdSet::GetDefaultConnect()
{
	return "ODBC;DSN=Bases de données MS Access;";
}

CString CSgbdSet::GetDefaultSQL()
{
	return "RELATIONS";
}

void CSgbdSet::DoFieldExchange(CFieldExchange* pFX)
{
	//{{AFX_FIELD_MAP(CSgbdSet)
	pFX->SetFieldType(CFieldExchange::outputColumn);
	RFX_Long(pFX, "[N°]", m_No);
	RFX_Text(pFX, "Nom", m_Nom);
	RFX_Text(pFX, "[Prénom]", m_Prenom);
	RFX_Text(pFX, "[Adresse 1]", m_Adresse_1);
	RFX_Text(pFX, "[Adresse 2]", m_Adresse_2);
	RFX_Text(pFX, "[Adresse 3]", m_Adresse_3);
	RFX_Text(pFX, "[Code Pays]", m_Code_Pays);
	RFX_Text(pFX, "[Téléphone]", m_Telephone);
	RFX_Byte(pFX, "[Nb réponses]", m_Nb_reponses);
	RFX_Bool(pFX, "[A répondre]", m_A_repondre);
	RFX_Text(pFX, "Attributs", m_Attributs);
	RFX_Text(pFX, "Commentaire", m_Commentaire);
	RFX_Text(pFX, "Profession", m_Profession);
	RFX_Text(pFX, "[Nom document]", m_Nom_document);
	//}}AFX_FIELD_MAP
}
