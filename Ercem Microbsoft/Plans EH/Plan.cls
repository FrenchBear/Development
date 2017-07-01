VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Plan"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' classe plan
' Implante un objet plan
' 26/04/1998 PV

Option Explicit

Public pla_plan As String
Public pla_titre As String
Public pla_comment As String
Public pla_fichier As String
Public pla_portrait As String


Function Copie() As Plan
  Dim p As New Plan
  With p
    .pla_plan = pla_plan
    .pla_titre = pla_titre
    .pla_comment = pla_comment
    .pla_fichier = pla_fichier
    .pla_portrait = pla_portrait
  End With
  Set Copie = p
End Function

