VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CatEvénement"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' Classe CatEvénement
' Représente un événement de la table catevenement
' 15/04/1998 PV
' 12/04/1999 PV  cev_dependmilieu


Option Explicit

Public cev_evenement As String
Public cev_libelle As String
Public cev_dependmilieu As Boolean    ' Attention, str O/N dans la base
Public timestamp As Date


Function Copie() As CatEvénement
  Dim e As New CatEvénement
  With e
    .cev_evenement = cev_evenement
    .cev_libelle = cev_libelle
    .cev_dependmilieu = cev_dependmilieu
    .timestamp = timestamp
  End With
  Set Copie = e
End Function

