VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "TypePrestation"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Gère les types de prestations des consultants"
' Classe TypePrestation
' Gère les types de prestations des consultants
'  5/05/1998 PV

Option Explicit

Public tp_type As Integer       ' N° du type de prestation
Public tp_libelle As String     ' 
Public timestamp As Date


Function Copie() As TypePrestation
  Dim k As New TypePrestation
  With k
    .tp_type  = tp_type
    .tp_libelle = tp_libelle
    .timestamp = timestamp
  End With
  Set Copie = k
End Function

