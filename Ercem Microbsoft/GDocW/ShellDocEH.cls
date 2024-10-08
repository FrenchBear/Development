VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ShellDocEH"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' DocumentR�elEH
' Gestion des EHs
' 04/02/1999 PV

Option Explicit

Implements ShellDoc

Public Function ShellDoc_bCr�ation(d As Document, sNRef As String) As Boolean
End Function

Public Function ShellDoc_bSuppression(d As Document) As Boolean
End Function

Public Sub ShellDoc_Visualisation(d As Document)
  Dim e As EHDefGrille
  Dim iGrille As Integer, iSc�nario As Integer
  
  HourGlass "show"

  iGrille = Val(d.doc_refdoc)
  iSc�nario = Val(Mid(d.doc_refdoc, InStr(d.doc_refdoc, "/") + 1))
  Set e = LitGrille(iGrille, iSc�nario)
  If e Is Nothing Then
    MsgBox "�chec � la lecture de la grille " & iGrille & "/" & iSc�nario
    Exit Sub
  End If
  
  Dim v As New EHVisite
  InitUneVisite d, e, v
  
  bLitVisite d, e, v
  
  HourGlass "hide"
  
  frmClasseEH.Visualisation d, e, v
End Sub

Public Function ShellDoc_bSaisie(d As Document, ByRef sNTitre As String, ByRef iOperContr�le As Integer, ByVal sNRef As String, ByVal bRestreint As Boolean) As Boolean
End Function

Public Function ShellDoc_bPr�pareImpression(d As Document, sImprimante As String, bD�tail As Boolean) As Boolean
End Function

Public Function ShellDoc_bFinImpression(d As Document) As Boolean
End Function

Public Function ShellDoc_bImprimeRelecture(d As Document, bSimulation As Boolean) As Boolean
End Function

Public Function ShellDoc_bImprimeD�finitif(d As Document, iNbEx As Integer, bSimulation As Boolean) As Boolean
End Function

Public Function ShellDoc_bImprime(d As Document, iType As Integer, bForc� As Boolean, iNbEx As Integer) As Boolean
End Function

