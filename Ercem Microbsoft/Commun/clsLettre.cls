VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Lettre"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' Classe lettre
' Gestion des lettres des utilisateurs
' 20/07/98 PV

Option Explicit

Public let_lettres As String    ' Deux lettres majuscules
Public let_systeme As String    ' Système informatique gérant ces lettres
Public let_pers As Integer      ' N° utilisateur de l'assistant
Public let_unite                ' Unité par défaut pour ces lettres, ou NULL
Public let_secret               ' Secrétaire suivant ces lettres (peut être NULL)
Public let_labo                 ' Code du labo par défaut, ou NULL

Function Copie() As Lettre
  Dim k As New Lettre
  With k
    .let_lettres = let_lettres
    .let_systeme = let_systeme
    .let_pers = let_pers
    .let_unite = let_unite
    .let_secret = let_secret
    .let_labo = let_labo
  End With
  Set Copie = k
End Function

Sub DiskWrite(iNumFic As Integer)
  Write #iNumFic, let_lettres
  Write #iNumFic, let_systeme
  Write #iNumFic, let_pers
  Write #iNumFic, let_unite
  Write #iNumFic, let_secret
  Write #iNumFic, let_labo
End Sub

Sub DiskRead(iNumFic As Integer)
  Input #iNumFic, let_lettres
  Input #iNumFic, let_systeme
  Input #iNumFic, let_pers
  Input #iNumFic, let_unite
  Input #iNumFic, let_secret
  Input #iNumFic, let_labo
End Sub

