VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Paramètre"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' Classe Paramètre
' Gère les Paramètres
' 4/1/2001 PV

Option Explicit

Public ger_indice As Integer    ' N° de Paramètre
Public ger_libelle As String    ' Nom du Paramètre
Public ger_abrege As String     ' Nom du Paramètre


Function Copie() As Paramètre
  Dim k As New Paramètre
  With k
    .ger_indice = ger_indice
    .ger_libelle = ger_libelle
    .ger_abrege = ger_abrege
  End With
  Set Copie = k
End Function


