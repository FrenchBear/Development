VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Param�tre"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' Classe Param�tre
' G�re les Param�tres
' 4/1/2001 PV

Option Explicit

Public ger_indice As Integer    ' N� de Param�tre
Public ger_libelle As String    ' Nom du Param�tre
Public ger_abrege As String     ' Nom du Param�tre


Function Copie() As Param�tre
  Dim k As New Param�tre
  With k
    .ger_indice = ger_indice
    .ger_libelle = ger_libelle
    .ger_abrege = ger_abrege
  End With
  Set Copie = k
End Function


