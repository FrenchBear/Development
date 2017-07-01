VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Secteur"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' secteur
' Modélise un enregistrement de la table secteur
'  7/07/1998 PV, version simple

Option Explicit

' Propriétés
Public bComplet As Boolean    ' Si faux, seuls les champs sec_numsec et sec_nom sont remplis

Public sec_numsec As Long
Public sec_nom As String



Function Copie() As Secteur
  Dim k As New Secteur
  With k
    .bComplet = bComplet
    .sec_numsec = sec_numsec
    .sec_nom = sec_nom
  End With
  If Not bComplet Then
    Set Copie = k
    Exit Function
  End If
    
  With k
'    .sec_numdrg = sec_numdrg
  End With
  Set Copie = k

End Function

