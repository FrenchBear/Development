VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "M�thode2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' Classe M�thode2
' G�re les M�thodes
' 4/1/2001 PV
' 19/10/2001 PC : ajout des propri�t�es met_methode et met_germe

Option Explicit

Public met_libelle As String
Public met_methode As String
Public met_germe As Integer

Function Copie() As M�thode2
  Dim k As New M�thode2
  With k
    .met_libelle = met_libelle
    .met_methode = met_methode
    .met_germe = met_germe
  End With
  Set Copie = k
End Function

