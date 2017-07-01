VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Méthode"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' Classe Méthode
' Gère les Méthodes
' 4/1/2001 PV

Option Explicit

Public met_libelle As String


Function Copie() As Méthode
  Dim k As New Méthode
  With k
    .met_libelle = met_libelle
  End With
  Set Copie = k
End Function

