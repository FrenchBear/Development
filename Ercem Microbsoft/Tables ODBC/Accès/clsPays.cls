VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Pays"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Gère les Pays"
' Classe Pays
' Gère les Pays Ercem/LBF
' 12/03/1999 PV

Option Explicit

Public pay_pays As Integer      ' N° de pays
Public pay_libelle As String    ' Nom du pays
Public timestamp As Date


Function Copie() As Pays
  Dim k As New Pays
  With k
    .pay_pays = pay_pays
    .pay_libelle = pay_libelle
  End With
  Set Copie = k
End Function

