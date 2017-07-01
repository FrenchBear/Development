VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Critère"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' Classe Critère
' Gestion d'un type de données
' 4/09/97 PV

Option Explicit

' Propriétés
Public cri_critere As String
Public cri_version As Integer
Public cri_titre As String
Public cri_nbger As Integer

Private Type typLigne
  iGerme As Integer
  m As Double
  s As Double
End Type

Private tLigne(1 To 10) As typLigne


Function Copie() As Critère
  Dim k As New Critère
  With k
    .cri_critere = cri_critere
    .cri_version = cri_version
    .cri_titre = cri_titre
    .cri_nbger = cri_nbger
    
    Dim i As Integer
    For i = 1 To cri_nbger
      .SetGerme i, tLigne(i).iGerme, tLigne(i).m, tLigne(i).s
    Next
  End With
  Set Copie = k
End Function


Sub SetGerme(iIndice As Integer, iGerme As Integer, m As Double, s As Double)
  tLigne(iIndice).iGerme = iGerme
  tLigne(iIndice).m = m
  tLigne(iIndice).s = s
End Sub

Sub GetGerme(iIndice As Integer, iGerme As Integer, m As Double, s As Double)
  If iIndice < 1 Or iIndice > cri_nbger Then
    MsgBox "Indice de germe incorrect !"
    Stop
  End If
  
  iGerme = tLigne(iIndice).iGerme
  m = tLigne(iIndice).m
  s = tLigne(iIndice).s
End Sub

