VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "RubFacturation"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' classe RubFacturation
' Modélise une rubrique de facturation
' 08/09/1999 PV

Option Explicit

Public ruf_numruf As Integer
Public ruf_libelle As String


Function Copie() As RubFacturation
  Dim k As New RubFacturation
  With k
    .ruf_numruf = ruf_numruf
    .ruf_libelle = ruf_libelle
  End With
  Set Copie = k
End Function
