VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Milieu"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' Classe Milieu
' Gère un enregistrement de base de données de type milieu (gélose, …)
' 20/08/1998 PV


Option Explicit

Public mil_indice As Integer
Public mil_abrege As String
Public mil_libelle As String


Function Copie() As Milieu
  Dim k As New Milieu
  With k
    .mil_indice = mil_indice
    .mil_abrege = mil_abrege
    .mil_libelle = mil_libelle
  End With
  Set Copie = k
End Function

