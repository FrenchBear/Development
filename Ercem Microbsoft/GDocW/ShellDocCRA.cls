VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ShellDocCRA"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' DocumentRéelCRA
' Gestion des CRAs
' 04/02/1999 PV

Option Explicit

Implements ShellDoc

Public Function ShellDoc_bCréation(d As Document, sNRef As String) As Boolean
End Function

Public Function ShellDoc_bSuppression(d As Document) As Boolean
End Function

Public Sub ShellDoc_Visualisation(d As Document)
  MsgBox "Visualisation CRA " & d.pla_lettres & d.pla_iref & "." & d.doc_refdoc
End Sub

Public Function ShellDoc_bSaisie(d As Document, ByRef sNTitre As String, ByRef iOperContrôle As Integer, ByVal sNRef As String, ByVal bRestreint As Boolean) As Boolean
End Function

Public Function ShellDoc_bPrépareImpression(d As Document, sImprimante As String, bDétail As Boolean) As Boolean
End Function

Public Function ShellDoc_bFinImpression(d As Document) As Boolean
End Function

Public Function ShellDoc_bImprimeRelecture(d As Document, bSimulation As Boolean) As Boolean
End Function

Public Function ShellDoc_bImprimeDéfinitif(d As Document, iNbEx As Integer, bSimulation As Boolean) As Boolean
End Function

Public Function ShellDoc_bImprime(d As Document, iType As Integer, bForcé As Boolean, iNbEx As Integer) As Boolean
End Function

