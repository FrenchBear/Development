VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "TypeAnomalie"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Gestion des types d'anomalies prédéfinies par section"
' classe TypeAnomalie
' Définit les anomalies prédéfinies par section
' 05/05/1998 PV
' 29/05/1998 PV stockage en BD; ta_type -> ta_code; copie

Option Explicit

Public ta_section As String
Public ta_code As Integer
Public ta_libelle As String


' Duplique un objet TypeAnomalie
Function Copie() As TypeAnomalie
Attribute Copie.VB_Description = "Duplique un objet TypeAnomalie"
  Dim t As New TypeAnomalie
  With t
    .ta_section = ta_section
    .ta_code = ta_code
    .ta_libelle = ta_libelle
  End With
  Set Copie = t
End Function

