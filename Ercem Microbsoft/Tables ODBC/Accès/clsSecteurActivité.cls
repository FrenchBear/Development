VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "SecteurActivit�"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "G�re les secteurs d'activit� des consultants"
' Classe SecteurActivit�
' G�re les secteurs d'activit� des consultants
'  5/05/1998 PV

Option Explicit

Public sa_secteur As Integer       ' N� du type de secteur
Public sa_libelle As String        '
Public timestamp As Date


Function Copie() As SecteurActivit�
  Dim k As New SecteurActivit�
  With k
    .sa_secteur = sa_secteur
    .sa_libelle = sa_libelle
    .timestamp = timestamp
  End With
  Set Copie = k
End Function

