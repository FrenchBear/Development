VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "RubVentilation"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' classe RubVentilation
' Modélise une rubrique de ventilation
' 08/09/1999 PV
' 10/09/1999 PV sNumRuv

Option Explicit

Public ruv_numruv As Integer
Public ruv_libelle As String


Function Copie() As RubVentilation
  Dim k As New RubVentilation
  With k
    .ruv_numruv = ruv_numruv
    .ruv_libelle = ruv_libelle
  End With
  Set Copie = k
End Function


' Formate le n° d'unité sur 2 positions, les espaces à droite étant remplacés par 2 blancs
Function sNumRuv() As String
  If ruv_numruv < 10 Then
    sNumRuv = ruv_numruv & "  "
  Else
    sNumRuv = ruv_numruv
  End If
End Function
