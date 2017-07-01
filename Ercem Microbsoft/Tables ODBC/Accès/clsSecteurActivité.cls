VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "SecteurActivité"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Gère les secteurs d'activité des consultants"
' Classe SecteurActivité
' Gère les secteurs d'activité des consultants
'  5/05/1998 PV

Option Explicit

Public sa_secteur As Integer       ' N° du type de secteur
Public sa_libelle As String        '
Public timestamp As Date


Function Copie() As SecteurActivité
  Dim k As New SecteurActivité
  With k
    .sa_secteur = sa_secteur
    .sa_libelle = sa_libelle
    .timestamp = timestamp
  End With
  Set Copie = k
End Function

