VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Site"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' Classe Site
' Gère les sites
' 13/01/2000 PV

Option Explicit

Public sit_numsite As Integer
Public sit_libelle As String


Function Copie() As Site
  Dim k As New Site
  With k
    .sit_numsite = sit_numsite
    .sit_libelle = sit_libelle
  End With
  Set Copie = k
End Function

